********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Propensity Score and inverse weighting Analysis Women
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2022
* I follow Augustine and Raley's 2012 JMF paper
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97ps_`logdate'.log", t replace



* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* Controls: 				SEX race citizenship education_new2 
* Family/background: 		nsibling97 parenteduc2 momeduc2 intact ln_hhincome97 ln_hhnetwrth97 incomesource97 debt20  ave* (personality traits) 
* Controls at age 24: 		enrolled24_2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat2 empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_*  


// For propensity score I have to create a treatment and control group. 
// I already have this: livedwpar_bin



use "$temp/NLSY97_Final_sample_with_meanimpu", clear


recode 		empstatusage32 0=0 1/2=1, gen(emp32_bin) // I need this for teffects ipwra command

keep ID livedwpar_bin livedwpar_cat SEX race education_new2 enrolled24_2 maritalstat24_2 maritalstat32_2 children24_2 children32_2 empstatusage24_2 momeduc2 intact incarstat2 nsibling97 totalurban totalsouth BYEAR emp32_bin south logturban livingat24 ave* empdur1523 empdur2432 empdur2431 havedebt30_2 maritalstat30 maritalstat32 citizenship ln_hhnetwrth97 empstatusage32 occeduc_max SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 totaldurationinhh2432



tab 		livedwpar_bin, m
drop if 	livedwpar_bin == .
count		
keep if 	SEX == 1


* 1 - First: do a logit regression with selection factors and get the propensity scores [without parental wealth in childhood]

logit livedwpar_bin i.race i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.empdur1523 c.aveextra c.aveagree c.avecons c.aveemost c.aveopen, or

predict ps
drop if ps == .

		** Check the mean of the 
		** To calculate propensity score weight
			gen 	psweight = .
			replace psweight = (1/ps) if livedwpar_bin == 1
			replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			list 	ID livedwpar_bin psweight ps in 1/10


* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin



		*** Check for comparative example cases where ps > .80
		 browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps > .80
		
		*** Check for comoarative example cases where ps < .10
		browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps < .15
		
		*** Check for comoarative example cases where ps is in medium levels like .5
		browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps > .51 & ps < .59
		
		
		
* 4 - Fourh: Check to see if covariates are balanced. Augutine and Raley does not explicitly explain this so I follow:http://sites.utexas.edu/prc/files/IPWRA.pdf

		* Outcome 1: Employment Status
		teffects ipwra (emp32_bin i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, logit noconstant) (livedwpar_bin i.race i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen,logit noconstant), aequations ate

		tebalance summarize

		*foreach var of varlist SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact nsibling97 totalurban south totalurban aveextra aveagree avecons aveemost aveopen {
		 *tebalance density `var', saving("$temp\balance_`var'", replace)
		*}

		tebalance overid, nolog

	** Good! The covariates seems balanced 
		** Overidentification test for covariate balance
		** H0: Covariates are balanced
       *  chi2(16)     =  16.4445
       *  Prob > chi2  =   0.4224
		
		* Outcome 2: Occupational Standing
		teffects ipwra (occeduc_max i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2) (livedwpar_bin i.race i.education_new2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen,logit noconstant), aequations ate

		tebalance summarize

		*foreach var of varlist SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact  south nsibling97 totalurban aveextra aveagree avecons aveemost aveopen {
		 *tebalance density `var', saving("$temp\balance_`var'", replace)
		*}

		tebalance overid, nolog
		
		** Good! The covariates seems balanced
			** Overidentification test for covariate balance
			** H0: Covariates are balanced
			** chi2(23)     =  28.6554
			** Prob > chi2  =   0.1920

				
* 5 - Fifth: Predict outcome using unweighted, weighted ps and counterfactual ps		
* 6 - Sixth: Repeat above separately by men and women - Predict outcome using unweighted, weighted ps and counterfactual ps

********************************************************************************
******************************** Women *****************************************
********************************************************************************


 * Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat  , baseoutcome(0) rrr
		logit emp32_bin i.livedwpar_cat  , or
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightc], baseoutcome(0) rrr  	
		
	********** Add endogenous measures **********	
	
	** Unweighted 
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, baseoutcome(0) rrr  
	
		
	** Weighted
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=psweight], baseoutcome(0) rrr  		
		
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0) rrr  
		
		
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0) rrr  

		
		** Results: 
		esttab using "$results/NLSYPSA_women_empstat.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		
	
** Outcome 2: Occupational Status 
	
	** MODEL 1: Unweighted & Bivariate
		eststo: glm occeduc_max i.livedwpar_cat  
		
	** MODEL 2: Weighted & Bivariate 
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=psweight]		
		
	** MODEL 3: Weighted ATET & Bivariate  
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightt]			
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightc]		
		
		
	********** Add endogenous measures **********	
	
	** Unweighted   
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2
			
	** Weighted 
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=psweight]		
				
	** MODEL 4: Weighted ATET  
		eststo: glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightt]			
			
	** MODEL 6: Weighted ATEC 
		eststo: glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc]
		
		** Results: 
		esttab using "$results/NLSYPSA_women_occeduc.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)		
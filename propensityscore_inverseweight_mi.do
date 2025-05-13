********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Propensity Score and inverse weighting
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2022
* I follow Augustine and Raley's 2012 JMF paper
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97psmi_`logdate'.log", t replace



* DV1: 						empstatusage32 ---> BINARY version: emp32_bin
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* MAIN Controls: 			SEX race citizenship education_new
* Family/background: 		nsibling97 parenteduc2 momeduc2 intact ln_hhincome97 
*							ln_hhnetwrth97 incomesource97 debt20  ave* (personality traits) 
*							sum_mh_2000 (psychological wellbeing) asvabscore (cognitive skills)
* Controls at age 24: 		enrolled24_2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat2 empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_*  


// For propensity score I have to create a treatment and control group. 
// I already have this: livedwpar_bin



use 	"$temp/mi_datacreated", clear





tab 		livedwpar_bin, m
drop if 	livedwpar_bin == .
count		


* 1 - First: do a logit regression with selection factors and get the propensity scores [without parental wealth in childhood]

mi estimate, saving(myestimates, replace): logit livedwpar_bin i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) or

mi predict ps using myestimates
rename ps ps1
egen ps = rmin(ps1) + (ps1 - rmin(ps1)) / r(range(ps1)), label("var rescaled to range [0,1]")

drop if ps == .

		** Check the mean of the 
		** To calculate propensity score weight
			mi passive: gen 	psweight = .
			mi passive: replace psweight = (1/ps) if livedwpar_bin == 1
			mi passive:replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			list 	ID livedwpar_bin psweight ps in 1/10


* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin

* 4 - Fourh: Check to see if covariates are balanced. Augutine and Raley does not explicitly explain this so I follow:http://sites.utexas.edu/prc/files/IPWRA.pdf

		* Outcome 1: Employment Status

		recode 	empstatusage32 0=0 1/2=1, gen(emp32_bin)
		
		teffects ipwra (emp32_bin i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, logit noconstant) (livedwpar_bin i.SEX i.race i.education_new2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen,logit noconstant), aequations ate

		tebalance summarize

		foreach var of varlist SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact nsibling97 totalurban south totalurban aveextra aveagree avecons aveemost aveopen {
		 tebalance density `var', saving("$temp\balance_`var'", replace)
		}

		tebalance overid, nolog

	** Good! The covariates seems balanced 
		** Overidentification test for covariate balance
		** H0: Covariates are balanced
       *  chi2(16)     =  16.4445
       *  Prob > chi2  =   0.4224
		
		* Outcome 2: Occupational Standing
		teffects ipwra (occeduc_max i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2) (livedwpar_bin i.SEX i.race i.education_new2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen,logit noconstant), aequations ate

		tebalance summarize

		foreach var of varlist SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact  south nsibling97 totalurban aveextra aveagree avecons aveemost aveopen {
		 tebalance density `var', saving("$temp\balance_`var'", replace)
		}

		tebalance overid, nolog
		
		** Good! The covariates seems balanced
			** Overidentification test for covariate balance
			** H0: Covariates are balanced
			** chi2(23)     =  28.6554
			** Prob > chi2  =   0.1920

				
* 5 - Fifth: Predict outcome using unweighted, weighted ps and counterfactual ps

	** Unweighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat, baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat 
		
	** Weighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat [pweight=ps]		
		
	** Weighted ATET & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat [pweight=ps_weight]			
		
	** Weighted ATEC & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat [pweight=ps_weightc]		
		
		
	********** Add endogenous measures **********	
	
	** Unweighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2
		
		
	** Weighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps]		
		
		
	** Weighted ATET & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30 [pweight=ps_weightt]			
		
		
	** Weighted ATEC & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc]
		

		
* 6 - Sixth: Repeat above separately by men and women - Predict outcome using unweighted, weighted ps and counterfactual ps

********************************************************************************
********************************** Men *****************************************
********************************************************************************

	** MODEL 1: Unweighted & Bivariate
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat if SEX == 0, baseoutcome(0) rrr
		
		logit emp32_bin i.livedwpar_cat if SEX == 0, or
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 0
		
	** MODEL 2: Weighted & Bivariate
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat if SEX == 0 [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 0 [pweight=psweight]		
		
	** MODEL 3: Weighted ATET & Bivariate
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat if SEX == 0 [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 0 [pweight=ps_weightt]			
		
	** Model 5: Weighted ATEC & Bivariate
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat if SEX == 0 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 0 [pweight=ps_weightc]		
		
		
	********** Add endogenous measures **********	
	
	** Unweighted 
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2
		
		
	** Weighted
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=psweight]		
		
		
	** MODEL 4: Weighted ATET 
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 if SEX == 0 [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30 [pweight=ps_weightt]			
		
		
	** MODEL 6: Weighted ATEC 
		** Outcome 1: Employment Status 
		eststo: quietly mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2  if SEX == 0 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc]
		
		** Results: 
		esttab using "$results/NLSY32.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		
		


********************************************************************************
******************************** Women *****************************************
********************************************************************************

	** MODEL 1: Unweighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat if SEX == 1, baseoutcome(0) rrr
		
		// Looks like for women, coresiding in the parental household is not significant in their employment outcomes
	
		
		logit emp32_bin i.livedwpar_cat if SEX == 1, or
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 1
		
	** MODEL 2: Weighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat if SEX == 1 [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 1 [pweight=psweight]		
		
	** MODEL 3: Weighted ATET & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat if SEX == 1 [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 1 [pweight=ps_weightt]			
		
	** Model 5: Weighted ATEC & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat if SEX == 1 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat if SEX == 1 [pweight=ps_weightc]		
		
		
	********** Add endogenous measures **********	
	
	** Unweighted 
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2, baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2
		
		
	** Weighted
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps]		
		
		
	** MODEL 4: Weighted ATET 
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 if SEX == 1 [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30 [pweight=ps_weightt]			
		
		
	** MODEL 6: Weighted ATEC 
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2  if SEX == 1 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc]		
		
		
		
		
		
		
		
		
		
		
		
**# Just calculating the propensity score weights: https://www.youtube.com/watch?v=FeTWKAn4PzA
use "$temp/NLSY97_Final_sample_with_meanimpu", clear

recode 	empstatusage32 0=0 1/2=1, gen(emp32_bin)

keep ID livedwpar_bin livedwpar_cat SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact incarstat2 nsibling97 totalurban totalsouth BYEAR emp32_bin south logturban livingat24 ave* empdur1523 empdur2432 empdur2431 havedebt30 maritalstat30 maritalstat32 citizenship ln_hhnetwrth97 empstatusage32 occeduc_max

tab 		livedwpar_bin, m
drop if 	livedwpar_bin == .

** Step1: Check the data balance with t-tests or bivariate linear regression
		
		** A significant coefficient means that there is a significant difference between the treated and the controlled.

		** Alternative way to see if covariates are balanced is the Step1 of this procedure
		foreach var of varlist SEX maritalstat24_2 children24_2	south { 
			logit `var' i.livedwpar_bin
			}
					** Sex --> significant
					** Marital Status at age 24 --> significant
					** Children at age 24 --> significant
					** Ever lived in South --> insignifcant
		
		foreach var of varlist race education_new2 empstatusage24_2 momeduc2 intact {
			mlogit `var' i.livedwpar_bin
			}
					** Race --> significant black, hispanic but not for the other
					** Education --> significant at all levels
					** Employment Status at age 24 --> no employment insignificant, parttime significant
					** Mom's education --> less than hs, college degree significant, some college insignifcant
					** Intact --> other arrangements significant, single parent insignificant
					
					
		foreach var of varlist nsibling97 totalurban aveextra aveagree avecons aveemost aveopen {
			glm `var' i.livedwpar_bin
			}
					
					** Sibling number --> significant
					** Total years spent in urban --> significant
					** Extraversion --> significant
					** Agreeableness --> insignifcant
					** Conscientiousness --> significant
					** Emotional Stability --> signficant
					** Openness --> insignifcant
		
		** With propensity score weight
		foreach var of varlist SEX maritalstat24_2 children24_2	south { 
			logit `var' i.livedwpar_bin [pweight=psweight]
			}
			
		foreach var of varlist race education_new2 empstatusage24_2 momeduc2 intact {
			mlogit `var' i.livedwpar_bin [pweight=psweight]
			}
			
		foreach var of varlist nsibling97 totalurban aveextra aveagree avecons aveemost aveopen {
			glm `var' i.livedwpar_bin [pweight=psweight]
			}			
		
	


** Second calculate propensity scores BUNU KONTROL ET!
	logit livedwpar_bin i.SEX i.race i.education_new2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.		intact c.nsibling97 c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen, or

	predict ps
	drop if ps == .
	
			** To calculate propensity score weight
			gen 	psweight = .
			replace psweight = (1/ps) if livedwpar_bin == 1
			replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			list 	ID livedwpar_bin psweight ps in 1/10


		
		
		
	
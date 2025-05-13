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
log 		using "$logdir/NLSY97ps_`logdate'.log", t replace



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

logit livedwpar_bin i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) or

predict ps
drop if ps == .

		** Check the mean of the 
		** To calculate propensity score weight
			gen 	psweight = .
			replace psweight = (1/ps) if livedwpar_bin == 1
			replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			list 	ID livedwpar_bin psweight ps in 1/10
			sum 	psweight ps


* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin

* 4 - Fourh: Check to see if covariates are balanced. Augutine and Raley does not explicitly explain this so I follow:http://sites.utexas.edu/prc/files/IPWRA.pdf

		* Outcome 1: Employment Status

		recode 	empstatusage32 0=0 1/2=1, gen(emp32_bin)
		
		teffects ipwra (emp32_bin i.maritalstat32 i.children32 i.havedebt30 i.incarstat, logit noconstant) (livedwpar_bin i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000,logit noconstant), aequations ate

		tebalance summarize

		foreach var of varlist race education_new momeduc livingarrangement1997 citizenship nsibling97 enrolled24 maritalstat24 children24 empstatusage24  totalurban south totalurban aveextra aveagree avecons aveemost aveopen asvabscore genhlt24 sum_mh_2000{
		 tebalance density `var', saving("$temp\balance_`var'", replace)
		}

		tebalance overid, nolog

	** Good! The covariates seems balanced 
	*Overidentification test for covariate	balance
	*H0: Covariates are balanced

	*chi2(28)     =  23.6841
	*Prob > chi2  =   0.6981
	
		* Outcome 2: Occupational Standing
		teffects ipwra (occeduc_max i.maritalstat32 i.children32 i.havedebt30 i.incarstat) (livedwpar_bin i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000,logit noconstant), aequations ate

		tebalance summarize

		foreach var of varlist race education_new momeduc livingarrangement1997 citizenship nsibling97 enrolled24 maritalstat24 children24 empstatusage24  totalurban south totalurban aveextra aveagree avecons aveemost aveopen asvabscore genhlt24 sum_mh_2000 {
		 tebalance density `var', saving("$temp\balanceOccEdu_`var'", replace)
		}

		tebalance overid, nolog
		
		** Overidentification test for covariate balance
		** H0: Covariates are balanced
		** chi2(28)     =  26.4773
        ** Prob > chi2  =   0.5468


	
	* 5 - Fifth: Predict outcome using unweighted, weighted ps and counterfactual ps

	** Unweighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat3, baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat3
		
	** Weighted & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat3 [pweight=psweight], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat3 [pweight=ps]		
		
	** Weighted ATET & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat3 [pweight=ps_weightt], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat3 [pweight=ps_weightt]			
		
	** Weighted ATEC & Bivariate
		** Outcome 1: Employment Status 
		mlogit empstatusage32 i.livedwpar_cat3 [pweight=ps_weightc], baseoutcome(0) rrr  
		** Outcome 2: Occupational Status 
		glm occeduc_max i.livedwpar_cat3 [pweight=ps_weightc]
		


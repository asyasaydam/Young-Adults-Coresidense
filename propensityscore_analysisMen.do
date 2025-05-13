********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Propensity Score and inverse weighting analysis MEN
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
* IV: 						livedwpar_bin livedwpar_cat livedwpar_cat12 
* Background covariates: 	race education_new momeduc livingarrangement1997 nsibling97 empdur1523 enrolled24 maritalstat24 children24 empstatge24 totalurban south 
* Additonal after 24: 		incarstat maritalstat32  children32 empdur2531_fulltime havedebt30
  


// For propensity score I have to create a treatment and control group. 
// I already have this: livedwpar_bin

** Do this after imputation to see if they all work 

use "$temp/NLSY97_Final_sample_with_MI", clear

** For men
keep if 	SEX == 0

* 1 - First: do a logit regression with selection factors and get the propensity scores [without parental wealth in childhood]

logit livedwpar_bin i.race i.education_new  i.momeduc  i.livingarrangement1997 c.nsibling97 c.totalurban i.south c.empdur1523 i.enrolled24 i.maritalstat24 i.children24 i.empstatusage24 c.aveextra c.aveagree c.avecons c.aveemost c.aveopen, or


predict ps
drop if ps == .

		** Check the mean of the 
		** To calculate propensity score weight
			gen 	psweight = .
			replace psweight = (1/ps) if livedwpar_bin == 1
			replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			
			
		** Trim the propensity score weight following Frank et al. 2008 about but mostly Kelly's advice
           
		   replace psweight = 4 if psweight > 4

			
			list 	ID livedwpar_bin psweight ps in 1/10

	** Check the distribution of propensity scores
	hist ps
	
	* This distribution rather has a meaningful normal distribution but the weights below does not have. I am still not sure which one I should take into account more carefully
	
	
	** Check the distribution of propensity scores
	hist psweight
			

* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin

		*** Check for comparative example cases where ps > .80
		 browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps > .83
		
		*** Check for comoarative example cases where ps < .10
		browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps < .15
		
		*** Check for comoarative example cases where ps is in medium levels like .5
		browse ID livedwpar_bin livedwpar_cat totaldurationinhh2432 ps psweight ps_weightc ps_weightt if ps > .51 & ps < .59

* 4 - Fourh: Check to see if covariates are balanced. Augutine and Raley does not explicitly explain this so I follow:http://sites.utexas.edu/prc/files/IPWRA.pdf

		* Outcome 1: Employment Status
		teffects ipwra (emp32_bin i.incarstat2 c.empdur2531_fulltime i.maritalstat32_2 i.children32_2 i.havedebt30_2, logit noconstant) (livedwpar_bin i.race i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstatusage24_2 i.momeduc2 i.intact c.nsibling97 c.empdur1523_fulltime c.totalurban i.south c.totalurban c.aveextra c.aveagree c.avecons c.aveemost c.aveopen,logit noconstant), aequations ate

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
******************************** Men *****************************************
********************************************************************************

** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat  , baseoutcome(0) rrr
		logit emp32_bin i.livedwpar_cat  , or
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr 
	
	** MODEL 4: Weighted ATET + exogenous factors
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0) rrr 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightc], baseoutcome(0) rrr  		
		
	** MODEL 6: Weighted ATEC + exogenous factors
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0) rrr  

		
		** Results: 
		esttab using "$results/NLSYPSA_men_empstat.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		
	
** Outcome 2: Occupational Status 
	
	** MODEL 1: Unweighted & Bivariate
		eststo: glm occeduc_max i.livedwpar_cat  
		
	** MODEL 2: Weighted & Bivariate 
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=psweight]		
		
	** MODEL 3: Weighted ATET & Bivariate  
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightt]	
		
	** MODEL 4: Weighted ATET  + endogenous measures
		eststo: glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightt]			
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightc]			
				
	** MODEL 6: Weighted ATEC _ endogenous measures 
		eststo: glm occeduc_max i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 [pweight=ps_weightc]
		
		** Results: 
		esttab using "$results/NLSYPSA_men_occeduc.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		

		
		
********************************************************************************
********************************************************************************
*** Additional analysis for seeing other categorizations of living together ****
********************************************************************************
********************************************************************************

** Categorization 2

** None 
** 1 year
** 2 to 8 years
** All

** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat2  , baseoutcome(0) rrr
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat2   [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat2   [pweight=ps_weightt], baseoutcome(0) rrr  
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat2 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0) rrr  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat2   [pweight=ps_weightc], baseoutcome(0) rrr  	
				
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat2 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0) rrr  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat2.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		
		
		
** Categorization 3

** None 
** 1-2 year
** 3 to 8 years
** All



	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat3, baseoutcome(0) 
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat3   [pweight=psweight], baseoutcome(0)
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat3   [pweight=ps_weightt], baseoutcome(0)   
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat3 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0)  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat3   [pweight=ps_weightc], baseoutcome(0)  	
				
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat3 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0)   
	
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat3.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant) 
		
		
** Categorization 4

** None 
** 1-3 year
** 4 to 8 years
** All



	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat4, baseoutcome(0) 
	
	** MODEL 2: Weighted & Bivariate 		
		eststo: mlogit empstatusage32 i.livedwpar_cat4 [pweight=psweight], baseoutcome(0)   
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat4 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2  [pweight=ps_weightt], baseoutcome(0)  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat4   [pweight=ps_weightc], baseoutcome(0)  	
				
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat4 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0)   
	
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat4.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		
** Categorization 5

** None 
** 1-3 year
** 4 to 9 years
	

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat5, baseoutcome(0) 
	
	** MODEL 2: Weighted & Bivariate 		
		eststo: mlogit empstatusage32 i.livedwpar_cat5 [pweight=psweight], baseoutcome(0) 
		
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat5.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
	
	
	
	
** Categorization 6
tab livedwpar_cat6

** None 
** 1-4 year
** 5 to 9 years


	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat6, baseoutcome(0) 
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat6   [pweight=psweight], baseoutcome(0)
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat6  [pweight=ps_weightt], baseoutcome(0)   
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0)  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat6   [pweight=ps_weightc], baseoutcome(0)  	
				
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0)   
	
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat6.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
	
	
** Categorization 7

** None 
** 1-5 year
** 6 to 9 years

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat7, baseoutcome(0) 
	
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat7   [pweight=psweight], baseoutcome(0)
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat7  [pweight=ps_weightt], baseoutcome(0)   
		
	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat7 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt], baseoutcome(0)  
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat7   [pweight=ps_weightc], baseoutcome(0)  	
				
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat7 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc], baseoutcome(0)   
	
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat7.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		
** Categorization 8

** None 
** 1-6 year
** 7 to 9 years		

	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat8   [pweight=psweight], baseoutcome(0)

	** MODEL 3: Weighted with treated & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat8   [pweight=ps_weightt], baseoutcome(0)
		
		
		
** Categorization 9

** None 
** 1-7 years
** 8-9 years		

	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat9   [pweight=psweight], baseoutcome(0)	
		
** Categorization 10

** None 
** 1 years
** 2-5 years
** 6-9 years		

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat10, baseoutcome(0)
		
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat10   [pweight=psweight], baseoutcome(0)

** Categorization 11

** None 
** 1 years
** 2-4 years
** 5-9 years		

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat11, baseoutcome(0)
		
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat11   [pweight=psweight], baseoutcome(0)
		
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat11.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		


** Categorization 12

** None 
** 1 years
** 2-3 years
** 4-9 years		

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat12, baseoutcome(0)
		
	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat12   [pweight=psweight], baseoutcome(0)
		
	** Results: 
		esttab using "$results/NLSYPSA_men_empstatcat12.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)		
		
*********************** Occupational standing **********************************
********************************************************************************


** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat2 
		logit emp32_bin i.livedwpar_cat  , or
	
	** MODEL 2: Weighted & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat2   [pweight=psweight]   
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat2   [pweight=ps_weightt]   
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat2 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt]   
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat2   [pweight=ps_weightc]   	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat2 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]   
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat2.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		
		
		
** Outcome 2
** categorization 3

** None 
** 1-2 year
** 3 to 8 years
** All



	** MODEL 1: Unweighted & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat3  
		logit emp32_bin i.livedwpar_cat, or
	
	** MODEL 2: Weighted & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat3   [pweight=psweight] 
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat3   [pweight=ps_weightt]  
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat3 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt] 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat3   [pweight=ps_weightc] 	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat3 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat3.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		
		
** Outcome 2

** None 
** 1-3 year
** 4 to 8 years
** All



	** MODEL 1: Unweighted & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat4  
	
	** MODEL 2: Weighted & Bivariate 		eststo:   glm occeduc_max i.livedwpar_cat6   [pweight=ps_weightt]  
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt] 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat6   [pweight=ps_weightc] 	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat6.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
		eststo:   glm occeduc_max i.livedwpar_cat4   [pweight=psweight] 
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat4   [pweight=ps_weightt]  
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat4 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt] 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat4   [pweight=ps_weightc] 	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat4 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat4.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
	
	
	
** Outcome 2

** None 
** 1-4 year
** 5 to 9 years


	** MODEL 1: Unweighted & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat6  
	
	** MODEL 2: Weighted & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat6   [pweight=psweight] 
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat6  [pweight=ps_weightt]  
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt] 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat6   [pweight=ps_weightc] 	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat6 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat6.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)
	
	
** new categorization

** None 
** 1-5 year
** 6 to 9 years

	** MODEL 1: Unweighted & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat7  
	
	** MODEL 2: Weighted & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat7   [pweight=psweight] 
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo:   glm occeduc_max i.livedwpar_cat7  [pweight=ps_weightt]  
		
	** MODEL 4: Weighted ATET 
		eststo:   glm occeduc_max i.livedwpar_cat7 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2   [pweight=ps_weightt] 
		
	** Model 5: Weighted ATEC & Bivariate 
		eststo:   glm occeduc_max i.livedwpar_cat7   [pweight=ps_weightc] 	
				
	** MODEL 6: Weighted ATEC 
		eststo:   glm occeduc_max i.livedwpar_cat7 i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2    [pweight=ps_weightc]  
	
	** Results: 
		esttab using "$results/NLSYPSA_men_occeduccat7.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		************* Subgroup models models

**** College educated men
preserve
keep if education_new2 == 3 // keep those that are college educated. 


** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat , baseoutcome(0) rrr

	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr 

	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat  [pweight=ps_weightt], baseoutcome(0) rrr  
			
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat  [pweight=ps_weightc], baseoutcome(0) rrr  	
		
		
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat    [pweight=ps_weightc], baseoutcome(0) rrr  

		
		** Results: 
		esttab using "$results/NLSYPSA_men_empstatinteractionofcollege.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		restore
		
**** High school educated men
preserve
keep if education_new2 == 1 // keep those that are high school educated 


** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat , baseoutcome(0) rrr

	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr 

	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat  [pweight=ps_weightt], baseoutcome(0) rrr  
			
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat  [pweight=ps_weightc], baseoutcome(0) rrr  	
		
		
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat    [pweight=ps_weightc], baseoutcome(0) rrr  

		
		** Results: 
		esttab using "$results/NLSYPSA_men_empstatinteractionofHS.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		restore
		
**** Some college educated men
preserve
keep if education_new2 == 2 // keep those that are high school educated 


** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat , baseoutcome(0) rrr

	** MODEL 2: Weighted & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr 

	** MODEL 4: Weighted ATET 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat  [pweight=ps_weightt], baseoutcome(0) rrr  
			
	** Model 5: Weighted ATEC & Bivariate 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.momeduc2#i.livedwpar_cat  [pweight=ps_weightc], baseoutcome(0) rrr  	
		
		
	** MODEL 6: Weighted ATEC 
		eststo: mlogit empstatusage32 i.livedwpar_cat i.incarstat2 c.empdur2431 i.maritalstat32_2 i.children32_2 i.havedebt30_2 i.momeduc2#i.livedwpar_cat    [pweight=ps_weightc], baseoutcome(0) rrr  

		
		** Results: 
		esttab using "$results/NLSYPSA_men_empstatinteractionofSomecole.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

		restore
		
		
		
		
		*** restricting and then adding interaction terms make the cells very small
		** to see how small the cells get
count if education_new2 == 1 & momeduc2 == 3 & livedwpar_cat == 0
count if education_new2 == 1 & momeduc2 == 3 & livedwpar_cat == 1
count if education_new2 == 1 & momeduc2 == 3 & livedwpar_cat == 2
count if education_new2 == 1 & momeduc2 == 2 & livedwpar_cat == 0
count if education_new2 == 1 & momeduc2 == 2 & livedwpar_cat == 1
count if education_new2 == 1 & momeduc2 == 2 & livedwpar_cat == 2
count if education_new2 == 1 & momeduc2 == 1 & livedwpar_cat == 0
count if education_new2 == 1 & momeduc2 == 1 & livedwpar_cat == 1
count if education_new2 == 1 & momeduc2 == 1 & livedwpar_cat == 2
count if education_new2 == 1 & momeduc2 == 0 & livedwpar_cat == 0
count if education_new2 == 1 & momeduc2 == 0 & livedwpar_cat == 1
count if education_new2 == 1 & momeduc2 == 0 & livedwpar_cat == 2

count if education_new2 == 2 & momeduc2 == 3
count if education_new2 == 2 & momeduc2 == 2
count if education_new2 == 2 & momeduc2 == 1
count if education_new2 == 2 & momeduc2 == 0

count if education_new2 == 3 & momeduc2 == 3 & livedwpar_cat == 0
count if education_new2 == 3 & momeduc2 == 3 & livedwpar_cat == 1
count if education_new2 == 3 & momeduc2 == 3 & livedwpar_cat == 2
count if education_new2 == 3 & momeduc2 == 2 & livedwpar_cat == 0
count if education_new2 == 3 & momeduc2 == 2 & livedwpar_cat == 1
count if education_new2 == 3 & momeduc2 == 2 & livedwpar_cat == 2
count if education_new2 == 3 & momeduc2 == 1 & livedwpar_cat == 0
count if education_new2 == 3 & momeduc2 == 1 & livedwpar_cat == 1
count if education_new2 == 3 & momeduc2 == 1 & livedwpar_cat == 2
count if education_new2 == 3 & momeduc2 == 0 & livedwpar_cat == 0
count if education_new2 == 3 & momeduc2 == 0 & livedwpar_cat == 1
count if education_new2 == 3 & momeduc2 == 0 & livedwpar_cat == 2


count if education_new2 == 0 & momeduc2 == 3
count if education_new2 == 0 & momeduc2 == 2
count if education_new2 == 0 & momeduc2 == 1
count if education_new2 == 0 & momeduc2 == 0



********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Propensity Score Analysis with multiple imputation men 
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


*** Outcome 1: Employment Status 

	** MODEL 1: Unweighted & Bivariate
		mi estimate: mlogit empstatusage32 i.livedwpar_cat  , baseoutcome(0) rrr
		logit emp32_bin i.livedwpar_cat  , or
	
	** MODEL 2: Weighted & Bivariate 
		mi estimate: mlogit empstatusage32 i.livedwpar_cat   [pweight=psweight], baseoutcome(0) rrr  
		
	** MODEL 3: Weighted ATET & Bivariate
		mi estimate: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightt], baseoutcome(0) rrr 
	
	** MODEL 4: Weighted ATET + exogenous factors
		mi estimate: mlogit empstatusage32 i.livedwpar_cat i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30   [pweight=ps_weightt], baseoutcome(0) rrr 
		
	** Model 5: Weighted ATEC & Bivariate 
		mi estimate: mlogit empstatusage32 i.livedwpar_cat   [pweight=ps_weightc], baseoutcome(0) rrr  		
		
	** MODEL 6: Weighted ATEC + exogenous factors
		mi estimate: mlogit empstatusage32 i.livedwpar_cat i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30   [pweight=ps_weightc], baseoutcome(0) rrr  

		
		
*** Outcome 2: Occupational Standing 

	** MODEL 1: Unweighted & Bivariate
		mi estimate: glm occeduc_max i.livedwpar_cat 
	
	** MODEL 2: Weighted & Bivariate 
		mi estimate: glm occeduc_max i.livedwpar_cat   [pweight=psweight] 
		
	** MODEL 3: Weighted ATET & Bivariate
		mi estimate: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightt] 
	
	** MODEL 4: Weighted ATET + exogenous factors
		mi estimate: glm occeduc_max i.livedwpar_cat i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30   [pweight=ps_weightt]
		
	** Model 5: Weighted ATEC & Bivariate 
		mi estimate: glm occeduc_max i.livedwpar_cat   [pweight=ps_weightc]		
		
	** MODEL 6: Weighted ATEC + exogenous factors
		mi estimate: glm occeduc_max i.livedwpar_cat i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30   [pweight=ps_weightc]
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Analyses with case wise deletion on IV items - employment stat
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2023
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/Halfcompletecase_`logdate'.log", t replace
ssc install outreg2


use "$temp/predropempstatoccprest", clear
***** First impute for employment status ****
drop if empstatusage32 == . // 88 observations


mdesc education_new race citizenship  ///
	parenteduc parenteduc_bi hh_income97 ///
	aveagree aveemost aveopen avecons aveextra genhlt24 sum_mh_2000 asvabscore ///
	enrolled24 empstatusage24 children24 unionstatus24 ///
	livingat18 livingat19 livingat20 livingat21 livingat22 livingat23 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat children32  unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 //
	
	// When I line these up the most missing ones are living at 24, 25, 26, 29, 23, 28, 27

drop if livingat24 == .


mdesc livingat25 livingat26 livingat27 livingat28 livingat29 //
	
	// When I line these up the most missing ones are asvabscore, livingat29, qrt_hhinc~97, 28, 27, 26, 21, 22, 20, 25, 23

drop if livingat29 == .
drop if livingat26 == .
drop if livingat25 == .
drop if livingat27 == .
drop if livingat28 == .

count 
*1952


mdesc education_new  ///
	hh_income97 ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 children24 unionstatus24 ///
	havedebt30 incarstat children32 unionstatus32 //

replace incarstat = 0 if incarstat == .
****** *******


	set maxiter 20
	mi set wide
	mi register imputed hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore havedebt30 enrolled24 children24 children32 empstatusage24 unionstatus32 unionstatus24  

	
mi impute chained ////
(truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra ///
(truncreg,  ll(1) ul(5)) genhlt24 ///
(truncreg,  ll(0) ul(100000)) asvabscore ///
(truncreg, ll(-48100) ul(246474)) hh_income97 ///
(logit) havedebt30 enrolled24 children24 children32 unionstatus32 unionstatus24 ///
(mlogit) parenteduc empstatusage24 = ///
BYEAR education_new citizenship incarstat empstatusage32 livingarrangement1997 race south totalurban enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 schooltype97 sum_mh_2000, add(100) rseed(1234) noisily augment 




	save "$temp/mi_emp_IV.dta", replace
	save "$temp/mi_emp_IV", replace

	
***********************************************
******* Create duration variables *************
***********************************************
// For 6 years, between 24-29
	use  "$temp/mi_emp_IV", clear
	
	gen total_duration = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
	drop totaldurationinhh2429
	rename total_duration totaldurationinhh2429
	
	 *** categorization of the variable ***
	/*gen 	livedwpar_cat3 = .
	replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3 livedwpar_cat3*/
	

	*** categorization of the variable following a reviewer again ***
	mi passive: gen 	livedwpar_cat4 = .
	mi passive: replace livedwpar_cat4 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat4 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat4 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat4 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat4 = 4 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4 livedwpar_cat4 

	
	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	
	save "$temp/mi_emp_IVimp", replace
	

	
****** Analysis ******
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/Halfcompletecase_`logdate'.log", t replace
ssc install outreg2


	
	use "$temp/mi_emp_IVimp", clear
	
		*** Chisquare test
	tab livedwpar_cat4 empstatusage32, chi2
	
	******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		
	******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4 i.race i.education_new i.parenteduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

	******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4 i.race i.education_new i.parenteduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	
	
	esttab using "$results/halfcontrolsEMPSTAT.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)

		
		

		
		
		
		
***************************************		
*** Outcome 2: Occupational Standing
***************************************

use "$temp/predropempstatoccprest", clear

***** First impute for employment status ****
drop if occprest_max == . // 277 obs

drop if livingat24 == .


mdesc livingat25 livingat26 livingat27 livingat28 livingat29 //
	
	// When I line these up the most missing ones are asvabscore, livingat29, qrt_hhinc~97, 28, 27, 26, 21, 22, 20, 25, 23

drop if livingat29 == .
drop if livingat26 == .
drop if livingat25 == .
drop if livingat27 == .
drop if livingat28 == .

count 
*1927


mdesc education_new  ///
	hh_income97 ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 children24 unionstatus24 ///
	havedebt30 incarstat children32 unionstatus32 //

replace incarstat = 0 if incarstat == .
****** *******


	set maxiter 20
	mi set wide
	mi register imputed hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore havedebt30 enrolled24 children24 children32 empstatusage24 unionstatus32 unionstatus24  

	
mi impute chained ////
(truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra ///
(truncreg,  ll(1) ul(5)) genhlt24 ///
(truncreg,  ll(0) ul(100000)) asvabscore ///
(truncreg, ll(-48100) ul(246474)) hh_income97 ///
(logit) havedebt30 enrolled24 children24 children32 unionstatus32 unionstatus24 ///
(mlogit) parenteduc empstatusage24 = ///
BYEAR education_new citizenship incarstat occprest_max livingarrangement1997 race south totalurban enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 schooltype97 sum_mh_2000, add(100) rseed(1234) noisily augment 




	save "$temp/mi_occ_IV.dta", replace
	save "$temp/mi_occ_IV", replace
	
	***********************************************
******* Create duration variables *************
***********************************************
// For 6 years, between 24-29
	use  "$temp/mi_occ_IV", clear
	
	gen total_duration = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
	drop totaldurationinhh2429
	rename total_duration totaldurationinhh2429
	
	 *** categorization of the variable ***
	/*gen 	livedwpar_cat3 = .
	replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3 livedwpar_cat3*/
	
	
	gen total_duration = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
	drop totaldurationinhh2429
	rename total_duration totaldurationinhh2429
	
	 *** categorization of the variable ***
	/*gen 	livedwpar_cat3 = .
	replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3 livedwpar_cat3*/
	

	*** categorization of the variable following a reviewer again ***
	mi passive: gen 	livedwpar_cat4 = .
	mi passive: replace livedwpar_cat4 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat4 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat4 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat4 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat4 = 4 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4 livedwpar_cat4 

	
	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97
	
	
	
	save "$temp/mi_occ_IVimp", replace
	use "$temp/mi_occ_IVimp", clear
	
	mi set wide
	
	
	*** Outcome 2: Occupational Standing

		******* Model 1 Bivariate ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4 i.race i.education_new i.parenteduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4 i.race i.education_new i.parenteduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	
		esttab using "$results/halfcontrolsOCCPREST.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)
		
		
	log close
		

	
******************************************************************************
*****************************************
* IMPUTATION for occupational standing *
*****************************************
******************************************************************************
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97imputeoccprest_`logdate'.log", t replace


use "$temp/predropempstatoccprest", clear

***** First impute for employment status ****
drop if occprest_max == . 
save "$temp/predropempstatoccprest-occprest", replace
count
drop if education_new == .

*replace education_new = 2 if education_new == . 

keep SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 ID BYEAR ///
	education_new race citizenship livingarrangement1997 ///
	parenteduc parenteduc_bi ///
	aveagree aveemost aveopen avecons aveextra genhlt24 sum_mh_2000 asvabscore ///
	schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 ///
	south totalurban nsibling97 ///
	enrolled24 empstatusage24 children24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat children32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 empstatge32 ///
	totaldurationinhh2429 education hh_income97 ///
	citizenship hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 childrenhh24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat24 incarstat32 childrenhh32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 ////


******* REDO below *******
	set maxiter 20
	mi set wide
	mi register imputed hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore havedebt30 enrolled24 children24 children32 childrenhh24 childrenhh32 empstatusage24 unionstatus32 unionstatus24 livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 

	
mi impute chained ////
(truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra ///
(truncreg,  ll(1) ul(5)) genhlt24 ///
(truncreg,  ll(0) ul(100000)) asvabscore ///
(truncreg, ll(-48100) ul(246474)) hh_income97 ///
(logit) havedebt30 enrolled24 children24 children32 childrenhh24 childrenhh32 ///
livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
(mlogit) parenteduc empstatusage24 unionstatus32 unionstatus24 = ///
BYEAR education_new sum_mh_2000 occprest_max citizenship  livingarrangement1997 incarstat24 incarstat32 race south totalurban enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 schooltype97, add(100) rseed(1234) noisily augment 



	save "$temp/mi_occpres", replace
	
	

ssc install outreg2

use "$temp/mi_occpres", clear

mi set wide

***********************************************
******* Create duration variables *************
***********************************************
// For 6 years, between 24-29
	**Here I take the average of multiply imputed data sets to have a 1 single variable for living at age variables. 
	
	
forvalues x= 24/29 {
	egen avg_livingat`x' = rowmean(_1_livingat`x' - _100_livingat`x')
	gen livingat_`x' = round(avg_livingat`x')
}

	gen total_duration2 = livingat_24 + livingat_25 + livingat_26 + livingat_27 + livingat_28 + livingat_29
	drop totaldurationinhh2429
	rename total_duration2 totaldurationinhh2429

	
*** categorization of the variable following a reviewer again ***
	mi passive: gen 	livedwpar_cat4 = .
	mi passive: replace livedwpar_cat4 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat4 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat4 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat4 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat4 = 4 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4 livedwpar_cat4

*** categorization of the variable following a reviewer again - after R&R ***
	mi passive: gen 	livedwpar_cat3 = .
	mi passive: replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years" 
	label 	val livedwpar_cat3 livedwpar_cat3
	
	

	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	*label drop qrt_hhincome97
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	*mi estimate: proportion qrt_hhincome97
	*mi estimate: proportion med_hhincome97
	*mi estimate: proportion livedwpar_cat3
	*mi estimate: proportion unionstatus24
	
	
	
	mi passive: gen duration = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
* I muted this, this is related to "duration" make sure to add that.
	gen 	livedwpar_cat4_comp = .
	replace livedwpar_cat4_comp = 0 if duration == 0
	replace livedwpar_cat4_comp = 1 if duration == 1
	replace livedwpar_cat4_comp = 2 if duration == 2 | duration == 3 
	replace livedwpar_cat4_comp = 3 if duration == 4 | duration == 5 
	replace livedwpar_cat4_comp = 4 if duration == 6 
	label 	define livedwpar_cat4_comp 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4_comp livedwpar_cat4_comp



		save "$temp/mi_datacreated100impOcc", replace
		
		log close


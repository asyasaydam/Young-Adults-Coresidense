********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Imputation for hhincome and citizenship
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97imputelog_`logdate'.log", t replace

* DV1: 						empstatusage32 ---> BINARY version: emp32_bin
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* MAIN Controls: 			SEX race citizenship education_new
* Family/background: 		nsibling97 parenteduc momeduc livingarrangement1997
*							ln_hhnetwrth97 incomesource97 ln_hhincome97 ln_debt20 ln_hhntwrthatage20
*							ave* (personality traits) 
*							sum_mh_2002 (psychological wellbeing) asvabscore (cognitive skills-1999)
*							genhlth97 
* Controls at age 24: 		enrolled24 maritalstat24 children24 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_* 
** additional variables to use in multiple imputation: schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97

// Before imputation you can test for MCAR, MAR or MNAR

use "$temp/predropempstatoccprest", clear


***** First impute for employment status ****
drop if empstatusage32 == . //
*drop if occprest_max == . // 


save "$temp/predropempstatoccprest-emp", replace


mdesc citizenship hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 children24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat24 incarstat32 children32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 //
	
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

	replace education_new = 2 if education_new == . 

******* MI *******
	misstable sum citizenship hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore incarstat havedebt30 enrolled24 children24 children32 childrenhh24 childrenhh32 empstatusage24 unionstatus32 unionstatus24 livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 
	
	set maxiter 20
	mi set wide
	mi register imputed citizenship hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore havedebt30 enrolled24 children24 children32 childrenhh24 childrenhh32 empstatusage24 unionstatus32 unionstatus24 livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 

	
mi impute chained ////
(truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra ///
(truncreg,  ll(1) ul(5)) genhlt24 ///
(truncreg,  ll(0) ul(100000)) asvabscore ///
(truncreg, ll(-48100) ul(246474)) hh_income97 ///
(logit) havedebt30 enrolled24 children24 children32 childrenhh24 childrenhh32 ///
livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 citizenship ///
(mlogit) parenteduc empstatusage24 unionstatus32 unionstatus24 = ///
BYEAR education_new empstatusage32 livingarrangement1997 incarstat24 incarstat32 race south totalurban enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 schooltype97 sum_mh_2000, add(100) rseed(1234) noisily augment 

	*save "$temp/mi_empstat_10.dta", replace
	
***********************************************
******* Create duration variables *************
***********************************************
// For 10 data set
	
forvalues x= 24/29 {
	egen avg_livingat`x' = rowmean(_1_livingat`x' - _100_livingat`x')
	gen livingat_`x' = round(avg_livingat`x')

}
	gen total_duration2 = livingat_24 + livingat_25 + livingat_26 + livingat_27 + livingat_28 + livingat_29
	drop totaldurationinhh2429
	rename total_duration2 totaldurationinhh2429

	gen neverleft = .
	replace neverleft = 0 if livingat_24 == 0 |  livingat_25  == 0 |livingat_26 == 0 | livingat_27 == 0 |  livingat_28 == 0 | livingat_29 == 0
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 & livingat_28 == 1 & livingat_29 == 1
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 & livingat_28 == 1 
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 

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
	
*drop qrt_hhincome97
	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	mi estimate: proportion livedwpar_cat4
	*mi estimate: proportion livedwpar_cat5
	*mi estimate: proportion unionstatus24
	*mi estimate: proportion qrt_hhincome97

	*save "$temp/mi_datacreated10imp", replace
	
	
	


	save "$temp/mi_empstat", replace
	
	

ssc install outreg2

use "$temp/mi_empstat.dta", clear

mi set wide

***********************************************
******* Create duration variables *************
***********************************************
// For 6 years, between 24-29
	**Here I take the average of multiply imputed data sets to have a 1 single variable for living at age variables. 

	
forvalues x= 24/29 {
	egen avg_livingat`x' = rowmean(_1_livingat`x' - _100_livingat`x')
	gen livingat_`x' = round(avg_livingat`x')
	*gen livingat_`x' = .
	*replace livingat_`x' = 0 if avg_livingat`x' == 0
	*replace livingat_`x' = 1 if avg_livingat`x' > 0
}

	gen total_duration2 = livingat_24 + livingat_25 + livingat_26 + livingat_27 + livingat_28 + livingat_29
	drop totaldurationinhh2429
	rename total_duration2 totaldurationinhh2429

	gen neverleft = .
	replace neverleft = 0 if livingat_24 == 0 |  livingat_25  == 0 |livingat_26 == 0 | livingat_27 == 0 |  livingat_28 == 0 | livingat_29 == 0
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 & livingat_28 == 1 & livingat_29 == 1
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 & livingat_28 == 1 
	replace neverleft = 1 if livingat_24 == 1 &  livingat_25  == 1 & livingat_26 == 1 & livingat_27 == 1 
	

	
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
	
		*drop qrt_hhincome97
	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	mi estimate: proportion livedwpar_cat4
	*mi estimate: proportion livedwpar_cat5
	*mi estimate: proportion unionstatus24
	*mi estimate: proportion qrt_hhincome97

	save "$temp/mi_datacreated100imp", replace
		
		
/*
 *** categorization of the variable again ***
	mi passive: gen 	livedwpar_cat2 = .
	mi passive: replace livedwpar_cat2 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat2 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat2 = 2 if totaldurationinhh2429 > 1 & totaldurationinhh2429 < 6
	mi passive: replace livedwpar_cat2 = 3 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat2 0 "None" 1 "1 year" 2 "2 to 5 years" 3 "All"
	label 	val livedwpar_cat2 livedwpar_cat2	

	
	 *** categorization of the variable again ***
	mi passive: gen 	livedwpar_cat3_old = .
	mi passive: replace livedwpar_cat3_old = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat3_old = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat3_old = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat3_old = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livedwpar_cat3_old 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3_old livedwpar_cat3_old
	
	
	*** categorization of the variable again for complete case***
	gen 	livedwpar_cat3_comp = .
	replace livedwpar_cat3_comp = 0 if duration == 0
	replace livedwpar_cat3_comp = 1 if duration == 1
	replace livedwpar_cat3_comp = 2 if duration == 2 | duration == 3 
	replace livedwpar_cat3_comp = 3 if duration == 4 | duration == 5 | duration == 6 
	label 	define livedwpar_cat3_comp 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3_comp livedwpar_cat3_comp
	
	histogram duration, percent title("Duration of Parental Coresidence age 24-29, Complete Case (N=1990)", size(small)) xlabel(0(1)6) xtitle("Duration")  ytitle("Proportion %") ylabel(, angle(horizontal)) graphregion(color(white))

	
	*** categorization of the variable because I want to ***
	mi passive: gen 	livedwpar_cat5 = .
	mi passive: replace livedwpar_cat5 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat5 = 1 if totaldurationinhh2429 == 1 | totaldurationinhh2429 == 2
	mi passive: replace livedwpar_cat5 = 2 if totaldurationinhh2429 == 3 | totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat5 = 3 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat5 0 "None" 1 "1-2 year" 2 "3-5 years" 3 "6 years"
	label 	val livedwpar_cat5 livedwpar_cat5
	
		*** categorization of the variable again for complete case***
		/* I muted this, this is related to "duration" make sure to add that.
	gen 	livedwpar_cat4_comp = .
	replace livedwpar_cat4_comp = 0 if duration == 0
	replace livedwpar_cat4_comp = 1 if duration == 1
	replace livedwpar_cat4_comp = 2 if duration == 2 | duration == 3 
	replace livedwpar_cat4_comp = 3 if duration == 4 | duration == 5 
	replace livedwpar_cat4_comp = 4 if duration == 6 
	label 	define livedwpar_cat4_comp 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4_comp livedwpar_cat4_comp*/
*/	




	/*drop unionstatus24 unionstatus32
	mi passive: gen 		unionstatus24 = .
	mi passive: replace 	unionstatus24 = 0 if maritalstat24 == 0  & unionstat24 == 0
	mi passive: replace 	unionstatus24 = 1 if maritalstat24 == 0  & unionstat24 == 1
	mi passive: replace 	unionstatus24 = 2 if maritalstat24 == 1  & unionstat24 == 0
	mi passive: replace 	unionstatus24 = 3 if maritalstat24 == 1  & unionstat24 == 1
	mi passive: replace 	unionstatus24 = 4 if maritalstat24 == 2  & unionstat24 == 0
	mi passive: replace 	unionstatus24 = 5 if maritalstat24 == 2  & unionstat24 == 1
	*label 		define unionstatus24 0 "Single, Not Cohabiting" 1 "Single Cohabiting" 2 "Married, Not Cohabiting" 3 "Married, Cohabiting" 4 "Other, Not Cohabiting" 5 "Other, Cohabiting"
	*label		values unionstatus24 unionstatus24

	mi passive: gen 		unionstatus32 = .
	mi passive: replace 	unionstatus32 = 0 if maritalstat32 == 0  & unionstat32 == 0
	mi passive: replace 	unionstatus32 = 1 if maritalstat32 == 0  & unionstat32 == 1
	mi passive: replace 	unionstatus32 = 2 if maritalstat32 == 1  & unionstat32 == 0
	mi passive: replace 	unionstatus32 = 3 if maritalstat32 == 1  & unionstat32 == 1
	mi passive: replace 	unionstatus32 = 4 if maritalstat32 == 2  & unionstat32 == 0
	mi passive: replace 	unionstatus32 = 5 if maritalstat32 == 2  & unionstat32 == 1
	*label 		define unionstatus32 0 "Single, Not Cohabiting" 1 "Single Cohabiting" 2 "Married, Not Cohabiting" 3 "Married, Cohabiting" 4 "Other, Not Cohabiting" 5 "Other, Cohabiting"
	*label		values unionstatus32 unionstatus32*/
	
	
		
	
	/*
	
	*** categorization of the variable again for complete case***
	gen 	livedwpar_cat3_comp = .
	replace livedwpar_cat3_comp = 0 if duration == 0
	replace livedwpar_cat3_comp = 1 if duration == 1
	replace livedwpar_cat3_comp = 2 if duration == 2 | duration == 3 
	replace livedwpar_cat3_comp = 3 if duration == 4 | duration == 5 | duration == 6 
	label 	define livedwpar_cat3_comp 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3_comp livedwpar_cat3_comp
	
	
	
*drop livedwpar_bin
* label drop livedwpar_bin
*mi passive: gen livedwpar_bin = .
*mi passive: replace 	livedwpar_bin = 0 if totaldurationinhh2429 == 0
*mi passive: replace 	livedwpar_bin = 1 if totaldurationinhh2429 > 0 

*label 		define livedwpar_bin 0 "Never lived with parents after 24" 1 "Lived with parents after 24"
*label 		val livedwpar_bin livedwpar_bin

*** categorization of the 24-29 variable ***
	drop livedwpar_cat
	label drop livedwpar_cat

	mi passive: gen 	livedwpar_cat = .
	mi passive: replace livedwpar_cat = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat = 1 if totaldurationinhh2429 > 0 & totaldurationinhh2429 < 6
	mi passive: replace livedwpar_cat = 2 if totaldurationinhh2429 == 6
	*mi estimate: proportion 	livedwpar_cat [pw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat 0 "None" 1 "Some" 2 "All"
	label 	val livedwpar_cat livedwpar_cat


 *** categorization of the variable again ***
	/*mi passive: gen 	livedwpar_cat2 = .
	mi passive: replace livedwpar_cat2 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat2 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat2 = 2 if totaldurationinhh2429 > 1 & totaldurationinhh2429 < 6
	mi passive: replace livedwpar_cat2 = 3 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat2 0 "None" 1 "1 year" 2 "2 to 5 years" 3 "All"
	label 	val livedwpar_cat2 livedwpar_cat2	*/

	
	 *** categorization of the variable again ***
	mi passive: gen 	livedwpar_cat3 = .
	mi passive: replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livedwpar_cat3 livedwpar_cat3
	
	

	
		*** categorization of the variable because I want to ***
	mi passive: gen 	livedwpar_cat5 = .
	mi passive: replace livedwpar_cat5 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat5 = 1 if totaldurationinhh2429 == 1 | totaldurationinhh2429 == 2
	mi passive: replace livedwpar_cat5 = 2 if totaldurationinhh2429 == 3 | totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat5 = 3 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat5 0 "None" 1 "1-2 year" 2 "3-5 years" 3 "6 years"
	label 	val livedwpar_cat5 livedwpar_cat5
*/

	
	

	
	
	
	
	
	
	
	/*
	
**************
* IMPUTATION for occupational education*
**************
use "$temp/beforeanalysisdrop", clear

mdesc maritalstat32 children32 havedebt30 aveagree aveemost aveopen avecons aveextra sum_mh_2000 asvabscore havedebt30 livingat25 livingat26 livingat27 livingat28 livingat29 genhlt24

// variables not missing: genhlth97 livingat24 incarstat enrolled24 empstatusage24 children24 maritalstat24 livingarrangement1997 momeduc education_new totaldurationinhh2429 south totalurban

foreach var in maritalstat32 children32 havedebt30 aveagree aveemost aveopen avecons aveextra sum_mh_2000 asvabscore livingat25 livingat26 livingat27 livingat28 livingat29 genhlt24 {
	gen `var'_flag=0
	replace `var'_flag=1 if `var'==.
	tab `var'_flag,m
	}
	
// Using multiple imputation to address high levels of missing data on independent variables (19 variables)
mi set wide
mi misstable sum maritalstat32 children32 havedebt30 aveagree aveemost aveopen avecons aveextra sum_mh_2000 asvabscore havedebt30 genhlt24 livingat25 livingat26 livingat27 livingat28 livingat29
mi misstable patterns maritalstat32 children32 havedebt30 aveagree aveemost aveopen avecons aveextra sum_mh_2000 asvabscore havedebt30 genhlt24 livingat25 livingat26 livingat27 livingat28 livingat29

// Need to replace "." with a value for variables we do not want to impute - since none of the below has missing I skip this step 
/*foreach var in occeduc_max empstatusage32 SEX race nsibling97 south totalurban totaldurationinhh2432 incomesource97 schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97 BYEAR {
    replace `var'=99 if `var'==.
	tab `var',m
}*/

mi register imputed maritalstat32 children32 havedebt30 aveagree aveemost aveopen avecons aveextra sum_mh_2000 asvabscore livingat25 livingat26 livingat27 livingat28 livingat29 genhlt24 

 

mi impute chained (truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra (truncreg,  ll(1) ul(5)) genhlt24 (truncreg,  ll(5) ul(20)) sum_mh_2000 (truncreg,  ll(0) ul(100000)) asvabscore (logit) havedebt30 children32 (mlogit) maritalstat32 = occeduc_max empstatusage32 livingat24 incarstat enrolled24 empstatusage24 children24 maritalstat24 livingarrangement1997 momeduc education_new race citizenship totaldurationinhh2429 south totalurban schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 incomesource97, add(10) rseed(123) noisily augment


	save "$temp/MI", replace

	

	*check
	mi xeq 0/5: tab children32
	mi xeq 0/5: tab havedebt30
	
	*check if min and max of the variables match
	mi xeq 0/3: sum sum_mh_2000 
	mi xeq 0/2: sum genhlt24	
	mi xeq 0/3: sum asvabscore
	mi xeq 1/4: sum aveagree
	

******************************************
* IMPUTATION for living with 25-29
******************************************
	
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97imputelog2_`logdate'.log", t replace

	use "$temp/beforeanalysisdrop", clear
	mi set wide
	mi register imputed livingat18 livingat19 livingat20 livingat21 livingat22 livingat23 livingat25 livingat26 livingat27 livingat28 livingat29 
	
mi impute chained (logit) livingat18 livingat19 livingat20 livingat21 livingat22 livingat23 livingat25 livingat26 livingat27 livingat28 livingat29  = occeduc_max empstatusage32 incarstat enrolled24 empstatusage24 children24 maritalstat24 livingarrangement1997 momeduc education_new race citizenship south totalurban schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 incomesource97, add(5) rseed(123) noisily augment


	save "$temp/MI_alt", replace
	
	use "$temp/MI_alt", clear
	
	forvalues i=18/29 {
		mi estimate: proportion livingat`i' [pweight=SAMPLING_PANEL_WEIGHT_1997]
	}
	
	
	

	/*
	
	// Testing imputation - fix below covariates
	** for employment status
noisily mi estimate: mlogit empstatusage32 i.livedwpar_cat i.race i.education_new i.livingarrangement1997 c.totalurban i.south c.nsibling97 c.enrolled24 i.momeduc_flag i.havedebt30_flag i.aveextra_flag i.aveagree_flag i.avecons_flag i.aveemost_flag i.aveopen_flag i.incarstat_flag i.asvabscore_flag i.sum_mh_2000_flag i.sum_mh_2002_flag i.ln_debt20_flag i.ln_hhntwrthatage20_flag [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 

	// nothing is that significant now with all these additional variables bur the convergence was cancelled after adding the citizenship
	
	** for occupational standing
mi estimate: glm occeduc_max i.livedwpar_cat i.SEX i.race i.education_new i.livingarrangement1997 c.totalurban i.south c.nsibling97 c.enrolled24 i.citizenship_flag i.momeduc_flag i.havedebt30_flag i.aveextra_flag i.aveagree_flag i.avecons_flag i.aveemost_flag i.aveopen_flag i.incarstat_flag i.asvabscore_flag i.sum_mh_2000_flag i.sum_mh_2002_flag i.ln_debt20_flag i.ln_hhntwrthatage20_flag [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	// flagged incarceration and debt are significant
	
	// flagged incarceration status and having debt is significant! p is below 0.05. What does this mean? Incarceration status is not missing at random. What do I do?
		
	* observations 
	mi estimate: mean occeduc_max [pweight=SAMPLING_PANEL_WEIGHT_1997]
	mi estimate: proportion havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997] if SEX== 0
	mi estimate: proportion maritalstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997] if SEX== 0 , over(livedwpar_cat)
	
****
* Comparison of agreeableness between  
mi estimate: mean aveagree [pw= SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2432 == 0 & SEX ==0
mi estimate: mean aveagree [pw= SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2432 == 9 & SEX ==0
	
	

************************************************
* Propensity score inverse weighting after MI  *
************************************************
	use"$temp/MI", clear
	
	
	
	mi estimate, saving(mi_esticati): mlogit livedwpar_cat i.race i.SEX i.education_new i.momeduc i.livingarrangement1997 c.nsibling97 c.totalurban i.south c.empdur1523 i.enrolled24 i.maritalstat24 i.children24 i.empstatusage24 c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.sum_mh_2002 i.incomesource97 c.hhsize97 c.asvabscore c.ln_debt20 c.genhlth97 c.ln_hhntwrthatage20 [pw=SAMPLING_PANEL_WEIGHT_1997]
	mi predict p0 p1 using mi_esticati
	
	// why negative results? Can predict ps can have negative results? 

	mi xeq 0/5: sum psscore
	gen  logps = log(psscore) // this has a very odd distribution mostly because of zeros ending up being missing. 
	gen  sqps = psscore * psscore // this has an okay distribution compared to the logged one
	
	*mi passive: gen ps2 = ps * ps

	save "$temp/MI_PS", replace

		** To calculate propensity score weight
			mi passive: gen 	psweight = .
			mi passive: replace psweight = (1/(psscore)) if livedwpar_bin == 1
			mi passive: replace psweight = (1/(1-(psscore))) if livedwpar_bin == 0
			
			mi xeq 0/5: sum psweight 

	** Check the distribution of propensity scores
	hist ps
	
	* This distribution rather has a meaningful normal distribution but the weights below does not have. I am still not sure which one I should take into account more carefully
	
	
	** Check the distribution of propensity scores
	hist psweight
			

* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

mi passive: gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

mi passive: gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin

	
	
* 4 - Model weights to be used in al anlaysis // following Min Cha & Crosnoe article 2022

mi passive: gen ps_weight_w = (livedwpar_bin /ps) + [(1 - livedwpar_bin)/(1 - ps)]

	
			** Trim the propensity score weight following Frank et al. 2008 about but mostly Kelly's advice
			//The greatest concern with the weighting approach is that extreme weights could exert undue influence on the estimates. This is easily addressed by examining the distribution of weights and trimming extreme values. In our study, a box plot of the weights indicated five extreme values ranging from 28 to 68 (relative to the median of 1.14 and the upper quartile defined by 1.32). We trimmed the extreme weights to a value of 20, which was 1 greater than the next most extreme weight in
			
			** this is more like topcoding the ps weight
           
		   mi passive: gen		psweight_trim = psweight
		   mi passive: replace 	psweight_trim = 10 if psweight > 10

			
			list 	ID livedwpar_bin psweight ps in 1/10

	

// After completing imputation, need to replace "99" with "." to mark missing data
/*foreach var in varlist {
    replace `var'=. if `var' == 99
	tab `var', m
	}*/

	
// mi xeq function is for regular variables meaning that they are not imputed. for imputed variables you should use "passive" but apparently it can be problematic, here is more info https://www.ssc.wisc.edu/sscc/pubs/stata_mi_manage.htm#mixeq

*mi passive: generate 		loghhincome97=log(hhincome97)
*label variable loghhincome97 "HH income 97(logged)"

*mi passive: generate		loghhnetwrth97=log(hhnetwrth97)
*label variable loghhnetwrth97 "HH networth(logged)"
// but this generation did not resulted in complete


save "$temp/_multipleimputation", replace
















//// Previous analyses part that I did
/*	
************
* ANALYSES *
************
est clear

// Employment Status

	// Employment Status with continuous duration
	mi estimate: mlogit empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	//full time vs. no employment: total duration negative and sig, female neg sig, all educ sig and pos, enrolment at 24 pos and sig, married at 24 negative and sig, have children at 24 pos and sig, being part or full time employed at 24 pos and sig, incar negative and sig 
	//part time vs. no emply: female neg sig, some college and college dec sig and pos, married at 24 negative and sig, being part or full time employed at 24 pos and sig, total south neg and sig, incar negative and sig.
	
	
	// Employment Status with binary coresidence
	mi estimate: mlogit empstatusage32 i.livedwpar_bin i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.momeduc2 i.incarstat2 i.intact c.debt25 c.totalurban c.totalsouth c.nsibling97 c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	//full time vs. no employment: female neg sig, all educ sig and pos, enrolment at 24 pos and sig, married at 24 negative and sig, have children at 24 pos and sig, being part or full time employed at 24 pos and sig, incar negative and sig 
	//part time vs. no emply: female neg sig, some college and college dec sig and pos, married at 24 negative and sig, being employed at 24 pos and sig, total south neg and sig, incar negative and sig.
	
	// I am not sure if this binary variable is what I want as it compared those who never lived to those who lived bits, maybe returned or spent all of it in the parental household. the categoric one might be better, or I can create another variable where I compare those who continued to live all to the sum of who never lived or lived a little maybe. 

	// Employment with categorical coresidence
	eststo: quietly mi estimate, post: mlogit empstatusage32 i.livedwpar_cat i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.momeduc2 i.incarstat2 i.intact c.debt25 c.totalurban c.totalsouth c.nsibling97 c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	//full time vs. no employment: those who spent all their years (compared to some and never) is sig and neg, female neg sig, all educ sig and pos, enrolment at 24 pos and sig, married at 24 negative and sig, have children at 24 pos and sig, being part of full employed at 24 pos and sig, incar negative and sig 
	//part time vs. no emply: female neg sig, some college and college dec sig and pos, married at 24 negative and sig, being part or full employed at 24 pos and sig, total south neg and sig, incar negative and sig.
	

//  Occupational Score

	// Occupational Score with continuous duration
	mi estimate: reg occeduc_max c.totaldurationinhh2432 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	// total duration negative and sig, female pos sig, black neg and sig, born in the US neg and sig, some college and college dec sig and pos, enrolment at 24 pos and sig, married at 24 pos and sig, have children at 24 neg and sig, debt at 25 pos and sig (but very small), mom edcu some college and college pos and sig, incar negative and sig
	
	
	// Occupational Score with categorical duration
	eststo: quietly mi estimate, post: reg occeduc_max i.livedwpar_cat i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	// those who spent all their years (compared to some and never) sig and neg, female pos sig, black neg and sig, born in the US neg and sig, some college and college dec sig and pos, enrolment at 24 pos and sig, married at 24 pos and sig, have children at 24 neg and sig, debt at 25 pos and sig (but very small), mom edcu some college and college pos and sig, incar negative and sig
	
	// Occupational Score with binary duration
	mi estimate: reg occeduc_max i.livedwpar_cat i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	//  those who spent some time or all afte 24 (compared to never) neg and sig, female pos sig, black neg and sig, born in the US neg and sig, some college and college dec sig and pos, enrolment at 24 pos and sig, married at 24 pos and sig, have children at 24 neg and sig, full time empt at 24 is pos and sig, debt at 25 is pos and sig, moms edu some and college sig and pos, incar negative and sig
	
	
	
// Stratified analysis 
	
	// College sample & cat duration
	eststo: quietly mi estimate, post: reg occeduc_max i.livedwpar_cat i.SEX i.race i.citizenship i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3, vce(robust) // if you are a college educ person spending ALL years is neg and sig, female sig +, black negat sig, enrolled in 24 + sig, have children 24 neg sig, debt is + sig, having college deg mom is sig and pos, incar neg and sig
	** this model and model with ln_hhincome97 is almosst the same, only the coefficient for all yeasrs parental coresidence increses from 0.030 to 0.045 from a switch to income and hhnetwrth97.
	
	eststo: quietly mi estimate, post: mlogit empstatusage32 i.livedwpar_cat i.SEX i.race i.citizenship i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.momeduc2 i.incarstat2 i.intact c.debt25 c.totalurban c.totalsouth c.nsibling97 c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3, vce(robust) base(0) // no significance for parental duration but coeffs neg
	
	mi estimate: mlogit empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.citizenship i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3, vce(robust) base(0) // no significance for parantal duration but coeffs negative
	
	
// Stratified analysis with interaction of parental duration and parental educ
	
	eststo: quietly mi estimate, post: reg occeduc_max i.livedwpar_cat##i.momeduc2 i.SEX i.race i.citizenship i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3, vce(robust) // if you are a college educ person spending SOME years is neg and sig, female sig +, black negat sig, enrolled in 24 + sig, have children 24 neg sig, debt is + sig, having college deg mom is sig and pos, incar neg and sig
	// Interaction: The interaction of college degree educated mom and some duration in the parental household is positive and significant, however those who have HS educated mom and college degree educated mom and who spent all their years in the parental household have negative and significant coef
	
	eststo: quietly mi estimate, post: mlogit empstatusage32 i.livedwpar_cat##i.momeduc2 i.SEX i.race i.citizenship i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.incarstat2 i.intact c.debt25 c.totalurban c.totalsouth c.nsibling97 c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3, vce(robust) base(0)
	
	
	
	
// Not-Stratified analysis with interaction of parental duration and parental educ
	
	eststo: quietly mi estimate, post: glm occeduc_max i.livedwpar_cat##i.momeduc2 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	
	eststo: quietly mi estimate, post: mlogit empstatusage32 i.livedwpar_cat##i.momeduc2 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.incarstat2 i.intact c.debt25 c.totalurban c.totalsouth c.nsibling97 c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)	
	
	
esttab using "$results/NLSY2432allsaminteraction.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)




// this is where I read about the *post* commad in stata: https://www.statalist.org/forums/forum/general-stata-discussion/general/1013-esttab-and-mi-no-stored-results
	
	 mi passive: generate duration2=totaldurationinhh2432 ^ 2 // this is useless
	 // generated a new variable t asses the differences between those who spent NONE and those who spent all
	 mi passive: generate duration = 1 if totaldurationinhh2432 == 9
	 mi passive: replace duration = 0 if totaldurationinhh2432 == 0
	 // like a ttest, I wanted to see if there is a statistical significant differece of income between average income of those who spent none btw 24-32 and those who spent all btw 24-32. 
	 mi estimate: reg ln_hhincome97 c.duration [pweight=SAMPLING_PANEL_WEIGHT_1997] // Yes a simple regression analysis shows that there is a statistical differece and those who spent all have a negative coefficient.
	
	
	
// Does employment at 24 predict total duration in the parental house?
// how does other variables predict parental coresidence:
mi estimate: mlogit livedwpar_cat i.empstat24_2 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) rrr

mi estimate: glm  totaldurationinhh2432 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)


eststo: quietly mi estimate, post: glm totaldurationinhh2432 i.empstat24_2 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97[pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
eststo: quietly mi estimate, post: mlogit livedwpar_cat i.empstat24_2 i.SEX i.race i.citizenship i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 c.debt25 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact c.ln_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)


esttab using "$results/NLSY2432empdur.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)



*/




/*

mdesc ID livedwpar_bin livedwpar_cat livedwpar_cat2 livedwpar_cat3 livedwpar_cat4 livedwpar_cat5 livedwpar_cat6 livedwpar_cat7 livedwpar_cat8 livedwpar_cat9 livedwpar_cat10 livedwpar_cat11 livedwpar_cat12 SEX race education_new enrolled24 maritalstat24 maritalstat32 children24 children32 empstatge24 empstatusage24 empstatusage_bin2_24 momeduc parenteduc momedu_bi momeduCol_bi livingarrangement1997 incarstat nsibling97 totalurban totalsouth BYEAR south logturban livingat24 ave* empdur1523 empdur1523_fulltime empdur2432 empdur2431 empdur2431_fulltime empdur2531 empdur2531_fulltime havedebt30 maritalstat30 maritalstat32 citizenship ln_hhnetwrth97 empstatusage32 occeduc_max SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 totaldurationinhh2432 schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97 incomesource97 *debt* ln_debt25 hhincome97 hhnetwrth97 ln_hhincome97 ln_hhnetwrth97 *debt* sum_mh_2000 asvabscore enrolled24 maritalstat24 children24 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25 genhlth97 ln_hhnetwrth97 incomesource97 ln_hhincome97 ln_debt20 ln_hhntwrthatage20

// https://www.ssc.wisc.edu/sscc/pubs/stata_mi_decide.htm#AreMyDataMCARMARorMNAR
// Then run logit models to test if any of the other variables predict whether a given variable is missing. If they do, then the data is MAR rather than MCAR.
misstable sum, gen(miss_)
*logit miss_hhincome97 SEX race  // For income race is MAR but sex is MCAR

logit miss_citizenship race SEX // for citizenship race is MAR, sex is MCAR
logit miss_hhnetwrth97 race SEX // both MCAR
logit miss_hhincome97 education_new race // race is MAR, education is MCAR
logit miss_hhincome97 BYEAR 
logit miss_debt25 race SEX // both MCAR
logit miss_debt25 totaldurationinhh2432 // MAR


// It would also be a good idea to run t-tests to see if the values of the other variables vary between missingness groups:

ttest race, by(miss_citizenship) // yes there is a difference between groups
ttest SEX, by(miss_citizenship) //nope
*ttest citizenship, by(miss_education_new) //nope 
ttest race, by(miss_hhincome97) // yes
ttest SEX, by(miss_hhnetwrth97) //no
ttest race, by(miss_hhnetwrth97) // yes
ttest SEX, by(miss_ln_debt25) // no


// What is the situation of COVARIATES and things that can predict IV?

mdesc SEX race nsibling97 education_new momeduc momedu_bi momeduCol_bi parenteduc incarstat enrolled24 maritalstat24 children24 empstatge24 livingarrangement1997 totalurban totalsouth south ave* livedwpar_cat empdur1523 empdur1523_fulltime empdur2432 empdur2431 empdur2431_fulltime empdur2531 empdur2531_fulltime havedebt30 maritalstat30 maritalstat32 citizenship ln_hhnetwrth97 empstatusage32 occeduc_max SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 totaldurationinhh2432 schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97 incomesource97 ln_debt25 hhincome97 hhnetwrth97 ln_hhincome97 ln_hhnetwrth97  empstatusage24

** Assess differences in total duration by education **
reg totaldurationinhh2432 i.education_new
margins education_new
marginsplot 

// Less than HS and Some college have similar mean duration in the parental household
// High school graduates have slightly higher mean duration in the parental hh
// College graduates have way lower mean duration

*/










********************************************************************************
************************** Propensity Score Analysis ***************************
********************************************************************************

* DV1: 						empstatusage32 ---> BINARY version: emp32_bin
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* MAIN Controls: 			SEX race citizenship education_new
* Family/background: 		nsibling97 parenteduc momeduc livingarrangement1997
*							ln_hhnetwrth97 incomesource97 ln_hhincome97 ln_debt20 ln_hhntwrthatage20
*							ave* (personality traits) 
*							sum_mh_2000 (psychological wellbeing) asvabscore (cognitive skills)
*							genhlth97 
* Controls at age 24: 		enrolled24 maritalstat24 children24 totalurban totalsouth 
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_* 
* additional variables to use in multiple imputation: schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97


// SAMPLING weights usage in PSA - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5802372/
 
// Evidence suggests that sampling weights need to be incorporated into a propensity score matching analysis to obtain valid and unbiased estimates of the treatment effect in the sampling weighted population (DuGoff, Schuler, and Stuart 2014; Austin, Jembere, and Chiu 2016; Lenis et al. 2019


// Create the ps and then impute that as well 
// I am doing this based on "Specifically, it is not clear whether oneshould impute the confounders first and then estimate the PS, referred to as a passive approach (Van Buuren, 2018), or whether one should impute the PS as if it were any other variable, referred to as an active approach (Von Hippel, 2009)."
// https://digitalcommons.wayne.edu/cgi/viewcontent.cgi?article=3439&context=jmasm

*gen ln_asvabscore = log(asvabscore+1)

mdesc asvabscore genhlth97 ln_debt20 sum_mh_2002 ave*

logit livedwpar_bin i.SEX i.race i.education_new i.momeduc c.totalurban i.south c.empdur1523 i.enrolled24 i.maritalstat24 i.children24 i.empstatusage24 c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.sum_mh_2002 c.asvabscore i.incomesource97 c.genhlth97 i.schooltype97 i.dwelling97 i.enrolled97 i.livingarrangement1997 c.nsibling97 c.hhsize97 c.ln_debt20 [pw=SAMPLING_PANEL_WEIGHT_1997], or

predict ps 
mdesc ps

		** To calculate propensity score weight
			gen 	psweight = .
			replace psweight = (1/ps) if livedwpar_bin == 1
			replace psweight = (1/(1-ps)) if livedwpar_bin == 0
			
			sum psweight 

	** Check the distribution of propensity scores
	hist ps
	
	* This distribution rather has a meaningful normal distribution but the weights below does not have. I am still not sure which one I should take into account more carefully
	
	
	** Check the distribution of propensity scores
	hist psweight
			

* 2 - Second: Transforming the weights according to the following formula: w(t, x) = t + [(1 − t)/1 − e(x)], where e(x) is the propensity score and t is the treatment status.

gen ps_weightt = livedwpar_bin + [(1 - livedwpar_bin)/(1 - ps)]

* 3 - Third: Calculate the counterfactual weight using the formula w(t, x) = t/e(x) + 1 − t.

gen ps_weightc = livedwpar_bin/ps + 1  - livedwpar_bin

	
	
* 4 - Model weights to be used in al anlaysis // following Min Cha & Crosnoe article 2022

gen ps_weight_w = (livedwpar_bin /ps) + [(1 - livedwpar_bin)/(1 - ps)]

	
			** Trim the propensity score weight following Frank et al. 2008 about but mostly Kelly's advice
			//The greatest concern with the weighting approach is that extreme weights could exert undue influence on the estimates. This is easily addressed by examining the distribution of weights and trimming extreme values. In our study, a box plot of the weights indicated five extreme values ranging from 28 to 68 (relative to the median of 1.14 and the upper quartile defined by 1.32). We trimmed the extreme weights to a value of 20, which was 1 greater than the next most extreme weight in
			
			** this is more like topcoding the ps weight
          
		   gen		psweight_trim = psweight
		   replace 	psweight_trim = 10 if psweight > 10

			
			list 	ID livedwpar_bin psweight ps in 1/10
	


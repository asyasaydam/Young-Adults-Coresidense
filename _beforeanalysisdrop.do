********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* DROP 
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2023
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97drop_`logdate'.log", t replace


use "$temp/13_ipums_nlsy_merge", clear
drop		_merge
merge 		m:m ID using "$temp/19_ipums_nlsy_merge"
*drop		_merge
count

*I should have 8,984 people

duplicates list ID // check which IDs are duplicate
drop dup
gen dup2 = _n
browse ID dup2 if ID == 4092 | ID == 8084 | ID == 7554 | ID == 8455

//ID	dup2
/*
ID	dup2
4092	4083
4092	4084
7554	7532
7554	7533
8084	8057
8084	8058
8455	8426
8455	8427

*/
//
drop if inlist(dup2, 4084, 7533, 8058,8427)
drop dup2
count

corr occeduc_max occprest_max



tab sex // 4599 male, 4385 female
drop if SEX == 1

* We don't want to have people who have missing Ys. What are my Ys?

tab empstatusage32, m 	// 704
tab occeduc_max, m		// 798
tab occprest_max, m		//802

tabstat empstatusage32, by(sex) missing stat(mean sd n)
tab empstatusage32 sex, m 
tabstat occeduc_max sex, m	
tabstat occprest_max sex, m



save "$temp/predropempstatoccprest2", replace
drop if empstatusage32  == . & occprest_max == . // 534 cases deleted



mdesc SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 ID BYEAR ///
	education_new race citizenship livingarrangement1997 ///
	parenteduc hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 sum_mh_2000 asvabscore ///
	schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 ///
	south totalurban nsibling97 ///
	enrolled24 empstatusage24 children24 childrenhh24 childrenhh32 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat children32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 //
	
*drop if education_new == .

mdesc citizenship hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 children24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat children32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 //

save "$temp/predropempstatoccprest", replace

tab empstatusage32, m 	// 177
tab occeduc_max, m		// 271
tab occprest_max, m		// 275
tab empstatge32 empstatusage32, col
oneway occprest_max empstatge32, tabulate bonfer

// Go to _multipleimputation do file if you want to impute and analyse
// Go to _completecase do file to analyse for complete case



log close



/*
** so in total 1581 dropped but not sure how many of these are men and women
** I figured: 867+56 = 923 which is %20

* Drop if they don't have an observation at age 24
tab livingat24 sex, m // 312 missing in total, 184 male, 128 female
drop if livingat24 == .



*drop if SEX == 1

* I am going to use my judgement and drop for my background characteristics that are missing but first lets see what are missing?

mdesc totaldurationinhh2432 totaldurationinhh2429 education_new momeduc livingarrangement1997 maritalstat24 children24 enrolled24 havedebt30 incarstat maritalstat32 ave* asvabscore genhlth97 sum_mh_2000 sum_mh_2002


// update the missings package
*adoupdate missings

// visualize missing data patterns for multiple variables
misstable sum totaldurationinhh2432 totaldurationinhh2429 education_new momeduc livingarrangement1997 maritalstat24 children24 enrolled24 havedebt30 incarstat maritalstat32 ave* asvabscore genhlth97 sum_mh_2000 sum_mh_2002

misstable pattern totaldurationinhh2432 totaldurationinhh2429 education_new momeduc livingarrangement1997 maritalstat24 children24 enrolled24 havedebt30 incarstat maritalstat32 ave* asvabscore genhlth97 sum_mh_2000 sum_mh_2002

misstable pattern livingarrangement1997 education_new enrolled24 momeduc incarstat maritalstat24 children24




mdesc livingarrangement1997 education_new enrolled24 momeduc incarstat maritalstat24 children24 citizenship empstatge24


drop if momeduc == .
mdesc livingarrangement1997 education_new enrolled24 momeduc incarstat maritalstat24 children24 citizenship empstatge24

drop if enrolled24 == .
drop if incarstat == .
drop if empstatge24 == .
drop if children24 == .
mdesc livingarrangement1997 education_new enrolled24 momeduc incarstat maritalstat24 children24 citizenship empstatge24


di 184 +129 +13+10+6
** 342

/*

// Family Background -- *drop if livingarrangement1997 == .
gen 		intact = livingarrangement1997
drop 		livingarrangement1997
label var 	intact "living arrangement at year 1997 (for mean imputation)"
gen 		miss_intact = 0
replace 	miss_intact = 1 if intact == .
label var 	miss_intact "missing parental"
sum 		miss_intact
sum 		intact
return list
replace 	intact=round(r(mean)) if intact == .
label 		define intact 0 "Both parents" 1 "Single parents" 2 "Other arrangements"
label 		values intact intact
rename 		intact livingarrangement1997

// Education
gen 		education_new2 = education_new
drop		education_new
label var 	education_new2 "education year of respondent (for mean imputation)"
gen 		miss_education_new2 = 0
replace 	miss_education_new2 = 1 if education_new2 == .
label var 	miss_education_new2 "missing education"
sum 		miss_education_new2
sum 		education_new2
return list

replace 	education_new2=round(r(mean)) if education_new2 == .
rename		education_new2 education_new

*replace missing values with the mean of the variable - *drop if enrolled24 == . 
gen 		enrolled24_2 = enrolled24
drop		enrolled24
label var 	enrolled24_2 "enrolment of respondent (for mean imputation)"
gen 		miss_enrolled24_2 = 0
replace 	miss_enrolled24_2 = 1 if enrolled24_2 == .
label var 	miss_enrolled24_2 "missing enrolment"
sum 		miss_enrolled24_2
sum 		enrolled24_2
return list

replace 	enrolled24_2=round(r(mean)) if enrolled24_2 == .
label 		define enrolled24_2  0 "Not enrolled" 1 "Enrolled"
label 		values enrolled24_2 enrolled24_2 
rename		enrolled24_2 enrolled24


/// Moms education
gen 		momeduc2 = momeduc
drop 		momeduc
label var 	momeduc2 "mom education (for mean imputation)"
gen 		miss_momeduc = 0
replace 	miss_momeduc = 1 if momeduc2 == .
label var 	miss_momeduc "missing mom education"
sum 		miss_momeduc
sum 		momeduc2
return list

replace 	momeduc2=round(r(mean)) if momeduc2 == .
label 		define momeduc2 0 "Less than HS" 1 "HS" 2 "Some College" 3 "College Degree and +"
label 		values momeduc2 momeduc2
tab 		momeduc2
rename		momeduc2 momeduc


/// Incarceration Status
gen 		incarstat2 = incarstat
drop 		incarstat
label var 	incarstat2 "incarceration status (for mean imputation)"
gen 		miss_incarstat2 = 0
replace 	miss_incarstat2 = 1 if incarstat2 == .
label var 	miss_incarstat2 "missing incarcerated"
sum 		miss_incarstat2
sum 		incarstat2
return list
replace 	incarstat2=round(r(mean)) if incarstat2 == .
label 		define incarstat2 0 " Never Incarcerated" 1 "Incarcerated at least once"
label 		values incarstat2 incarstat2
rename		incarstat2 incarstat


// Marital status at 24
gen 		maritalstat24_2 = maritalstat24
drop 		maritalstat24
label var 	maritalstat24_2 "married at 24(for mean imputation)"
gen 		miss_maritalstat24_2 = 0
replace 	miss_maritalstat24_2 = 1 if maritalstat24_2 == .
label var 	miss_maritalstat24_2 "missing married at 24"
sum 		miss_maritalstat24_2
sum 		maritalstat24_2
return list
replace 	maritalstat24_2=round(r(mean)) if maritalstat24_2 == .
label 		define maritalstat24_2  0 "Single" 1 "Married" 
label 		values maritalstat24_2 maritalstat24_2
rename 		maritalstat24_2 maritalstat24


// Children at 24
gen 		children24_2 = children24
drop 		children24
label var 	children24_2 "children at 24(for mean imputation)"
gen 		miss_children24_2 = 0
replace 	miss_children24_2 = 1 if children24_2 == .
label var 	miss_children24_2 "missing children at 24"
sum 		miss_children24_2
sum 		children24_2
return list
replace 	children24_2=round(r(mean)) if children24_2 == .
label 		define children24_2 0 "No child" 1 "Have children at age 24"
label 		values children24_2 children24_2
rename		children24_2 children24

*/

 
save 	"$temp/beforeanalysisdrop", replace

** do missing empoyment status at 32 align with RNI variables? Lets check!
** Read below:

// Drop if also they are missing from the survey completely when they are 31-32.
// Follow up - No because some people look like they refused to complete the survey but they have employment history, so it is wise to not drop for RNI but only for those who does not hace employment status at age 32

/*
drop if BYEAR == 1980 & RNI_2011 >= 80 // So when this cohort is 31
drop if BYEAR == 1981 & RNI_2013 >= 80 // this cohort is 32
drop if BYEAR == 1982 & RNI_2013 >= 80 // this cohort is 31
drop if BYEAR == 1983 & RNI_2015 >= 80 // this cohort is 32
drop if BYEAR == 1984 & RNI_2015 >= 80 // this cohort is 31
*/



/*// this is to drop for the deceased.
forvalues y=1998/2011 {
 drop if RNI_`y' == 98
    }       
	
drop if RNI_2013 == 98
drop if RNI_2015 == 98
*drop if RNI_2017 == 98 // I am cancelling this because by the year 2017 no one is 32
*/

/* Reasins for Non interview
80 OOS/Deceased
89 NIR blocked
90 Unlocatable
91 Very Hostile Refusal
92 Technical problem
93 Language Barrier
94 Respondent too Ill
95 Respondent Unavailable Entire Field Period
96 Refusal
97 Hostile Refusal
98 NIR/Deceased
99 Other */


*generate two more variables that shows their situation at the age of 24 and at the end of 32  

* Instead I dropped if they were missing in the survey/if they weren't interviewed in year that they turn into 24. 
* I did this, since I control for variables at that age. But by also dropping them even if they return to the survey, I excluded them? GET BACK ON THIS LATER!
*drop if BYEAR == 1980 & RNI_2004 >= 80
*drop if BYEAR == 1981 & RNI_2005 >= 80
*drop if BYEAR == 1982 & RNI_2006 >= 80
*drop if BYEAR == 1983 & RNI_2007 >= 80
*drop if BYEAR == 1984 & RNI_2008 >= 80   


/*
// Drop if also they are missing from the survey completely when they are 31-32
drop if BYEAR == 1980 & RNI_2011 >= 80 // So when this cohort is 31
drop if BYEAR == 1981 & RNI_2013 >= 80 // this cohort is 32
drop if BYEAR == 1982 & RNI_2013 >= 80 // this cohort is 31
drop if BYEAR == 1983 & RNI_2015 >= 80 // this cohort is 32
drop if BYEAR == 1984 & RNI_2015 >= 80 // this cohort is 31


// count drops to 6550

// Make a cumulative/average employment status throughout the 32-34
egen  	empstatus3234 = rowmean(empstatusage32 empstatusage33 empstatusage34)
gen		empstatus323334 = round(empstatus3234)

// see the other missings

mdesc ln_hhincome97 occeduc_max citizenship momeduc parenteduc empstatusage24 ln_debt25 education livingarrangement1997 enrolled24 incarstat education_new maritalstat24 children24 empstatusage32 totalurban south sibling97 SEX havedebt30

// If I were to impute
// education children24 livingarrangement1997 incarstat parenteduc

// These have more than %10 missing: citizenship and hhincome97. So I won't use them.

// I will drop the cases for missing on my employment status at 32 and if I don't have an observation at 24
drop if empstatusage32 == .
*/


count
// 6180

// Finally I will drop if the person does not have an observation/has missing on their living at 24 situation

*drop if livingat24 == .

count
//5497

// Lets get this as my final sample

**** Alternatively, I could have not used RNI and just dropped if there was no observation at 24 about living situation and then drop at age 32 and not drop for RNI at all. Then I could have a sample of 5,862

// not sure how this works but to be able to srot the missings after dopping cases I find this code online: https://www.statalist.org/forums/forum/general-stata-discussion/general/1344273-tabmiss-sort

/*unab all : _all
gen nmissing = .
gen varname = ""

local i = 1

qui foreach v of local all {
    count if missing(`v')
    replace nmissing = r(N) in `i'
    replace varname = "`v'" in `i'
    local ++i
}

gsort -nmissing
list varname nmissing if inrange(nmissing, 1, .) , noobs sep(0)
*/




*save "$temp/NLSY97_Final_sample_wout_occ_outcome", replace

************************ Mean Impute ***********************************
****************************** ****************************** ******************
/*use "$temp/NLSY97_Final_sample_wout_occ_outcome", clear
/// count 5437

// missings that I care about 
// mdesc education parenteduc incarstat children24 livingarrangement1997 emplstatage24_collp

// Own educ







//// PARENT education
gen 		parenteduc2 = parenteduc
label var 	parenteduc2 "education year of respondent (for mean imputation)"
gen 		miss_parenteduc = 0
replace 	miss_parenteduc = 1 if parenteduc2 == .
label var 	miss_parenteduc "missing parent education"
sum 		miss_parenteduc
sum 		parenteduc2
return list

replace 	parenteduc2=round(r(mean)) if parenteduc2 == .
label 		define parenteduc2 0 "Less than Highschool" 1 "HS" 2 "Some College or more" // 3 is actually Associate degree and more
label 		values parenteduc2 parenteduc2
tab 		parenteduc2





// Children at 32
gen 		children32_2 = children32
label var 	children32_2 "children at 32(for mean imputation)"
gen 		miss_children32_2 = 0
replace 	miss_children32_2 = 1 if children32_2 == .
label var 	miss_children32_2 "missing children at 32"
sum 		miss_children32_2
sum 		children32_2
return list
replace 	children32_2=round(r(mean)) if children32_2 == .
label 		define children32_2 0 "No child" 1 "Have children at age 32"
label 		values children32_2 children32_2


// Employment at 24
gen 		empstatusage24_2 = empstatusage24
label var 	empstatusage24_2 "employment at 24(for mean imputation)"
gen 		miss_empstatusage24_2 = 0
replace 	miss_empstatusage24_2 = 1 if empstatusage24 == .
label var 	miss_empstatusage24_2 "missing employment at 24"
sum 		miss_empstatusage24_2
sum 		empstatusage24_2
return list
replace 	empstatusage24_2=round(r(mean)) if empstatusage24_2 == .
label 		define empstatusage24_2 0 "No employment" 1 "Part-time employed" 2 "Full time employed"
label 		values empstatusage24_2 empstatusage24_2


// Employment at 24 but parttime and no employ merges into 1
gen 		empstatusage_bin2_24_2 = empstatusage_bin2_24
label var 	empstatusage_bin2_24_2 "employment at 24(for mean imputation)"
gen 		miss_empstatusage_bin2_24_2 = 0
replace 	miss_empstatusage_bin2_24_2 = 1 if empstatusage_bin2_24 == .
label var 	miss_empstatusage_bin2_24_2 "missing employment at 24"
sum 		miss_empstatusage_bin2_24_2
sum 		empstatusage_bin2_24_2
return list
replace 	empstatusage_bin2_24_2=round(r(mean)) if empstatusage_bin2_24_2 == .
label 		define empstatusage_bin2_24_2 0 "No or parttime employment" 1 "Full time employed"
label 		values empstatusage_bin2_24_2 empstatusage_bin2_24_2




// Marital status at 32
gen 		maritalstat32_2 = maritalstat32
label var 	maritalstat32_2 "married at 32(for mean imputation)"
gen 		miss_maritalstat32_2 = 0
replace 	miss_maritalstat32_2 = 1 if maritalstat32_2 == .
label var 	miss_maritalstat32_2 "missing married at 32"
sum 		miss_maritalstat32_2
sum 		maritalstat32_2
return list
replace 	maritalstat32_2=round(r(mean)) if maritalstat32_2 == .
label 		define maritalstat32_2  0 "Single" 1 "Married" 2 "Separated/Divorced/Widowed"
label 		values maritalstat32_2 maritalstat32_2


// Have debt at 30
gen 		havedebt30_2 = havedebt30
label var 	havedebt30_2 "have debt at age 30(for mean imputation)"
gen 		miss_havedebt30_2 = 0
replace 	miss_havedebt30_2 = 1 if havedebt30_2 == .
label var 	miss_havedebt30_2 "have debt at age 30"
sum 		miss_havedebt30_2
sum 		havedebt30_2
return list
replace 	havedebt30_2=round(r(mean)) if havedebt30_2 == .
label 		define havedebt30_2  0 "No debt" 1 "Have debt" 
label 		values havedebt30_2 havedebt30_2

save "$temp/NLSY97_Final_sample_with_meanimpu", replace


mdesc 		SEX race citizenship education_new2 enrolled24_2 momeduc2 maritalstat24_2 empstatusage24_2 intact incarstat2
*/




/*
*********************  Multiple Impute ***********************************
****************************** ****************************** ******************

use "$temp/NLSY97_Final_sample_wout_occ_outcome", clear

*only keep the variables that I need
keep BYEAR SAMPLING* empstatus323334 empstatusage32 empstatusage33 empstatusage34 totaldurationinhh2432 livedwparafter24 livingat24 SEX race citizenship education maritalstat24 maritalstat32 children32 children24 totalurban totalsouth nsibling97 parenteduc momeduc livingarrangement1997 hhincome97 incarstat ave*

// Create flag for variables of interest with missing data
foreach var in education children24 livingarrangement1997 incarstat parenteduc citizenship hhincome97 {
	gen `var'_flag=0
	replace `var'_flag=1 if `var'==.
	tab `var'_flag,m
	}
	
// Using multiple imputation to address high levels of missing data on independent variables
mi set wide
mi misstable sum education children24 livingarrangement1997 incarstat parenteduc citizenship hhincome97
mi misstable patterns education children24 livingarrangement1997 incarstat parenteduc hhincome97 citizenship


// Need to replace "." with a value for variables we do not want to impute

foreach var in empstatusage32 totaldurationinhh2432 SEX race maritalstat24 maritalstat32 employedat24 momeduc totalurban totalsouth aveextra aveagree avecons aveemost aveopen {
    replace `var'=99 if `var'==.
	tab `var',m
}

mi register imputed education children24 livingarrangement1997 incarstat parenteduc citizenship hhincome97
mi register regular empstatusage32 totaldurationinhh2432 SEX race maritalstat24 maritalstat32 employedat24 momeduc totalurban totalsouth BYEAR aveextra aveagree avecons aveemost aveopen

mi impute chained (ologit) hhincome97 education parenteduc (mlogit) livingarrangement1997  (logit) children24 incarstat citizenship  = i.empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.maritalstat24 i.maritalstat32 i.BYEAR i.employedat24 c.totalurban c.totalsouth c.aveextra c.aveagree c.avecons c.aveemost c.aveopen, add(20) rseed(123) force noisily augment

	*check
	mi xeq 0/5: tab education
	mi xeq 0/5: tab parenteduc
	mi xeq 0/5: tab livingarrangement1997
	mi xeq 0/5: tab incarstat
	mi xeq 0/5: tab citizenship
	mi xeq 0/5: tab hhincome97
	mi xeq 0/5: tab children24
	
// After completing imputation, need to replace "99" with "." to mark missing data

foreach var in empstatusage32 totaldurationinhh2432 SEX race maritalstat24 maritalstat32 employedat24 momeduc totalurban totalsouth aveextra aveagree avecons aveemost aveopen {
    replace `var'=. if `var'==99
	tab `var',m
	}

// Testing imputation
mi estimate: mlogit empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.maritalstat24 i.maritalstat32 i.employedat24 c.totalurban c.totalsouth i.livingarrangement1997 i.hhincome97 i.education i.parenteduc i.children24 i.incarstat i.citizenship livingarrangement1997_flag hhincome97_flag education_flag parenteduc_flag children24_flag incarstat_flag citizenship_flag [aw=SAMPLING_PANEL_WEIGHT_1997], vce(robust)


	
	// complete sample is 5437 and the missing is 5307
	// flagged variables arent significant EXCEPT incarceration
/*
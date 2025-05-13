********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997) 
* by Asya Saydam (asyasaydam@utexas.edu)
* Scd pring 2022 (Jan 2022)

********************************************************************************
******************** 
** Project set up ** 
********************

cd
global basecode "T:\github\Transitions"

do "$basecode/setup_asaydam.do" /// note that setup_environment will run your personal setup file.

do "$basecode/setup_environment.do"

***************************************************
** Extract data and store in created_data folder **
***************************************************
do "$basecode/HITA/NLSY/1_extract_label.do"
do "$basecode/HITA/NLSY/2_extract_employment.do"
do "$basecode/HITA/NLSY/3_extract_incarceration.do"
do "$basecode/HITA/NLSY/4_extract_children.do"
do "$basecode/HITA/NLSY/5_extract_interviewdate.do"
do "$basecode/HITA/NLSY/6_extract_personality.do"
do "$basecode/HITA/NLSY/7_extract_occup.do"
do "$basecode/HITA/NLSY/8_extract_hrswrk.do"
do "$basecode/HITA/NLSY/9_extract_employmentcross.do"
do "$basecode/HITA/NLSY/10_extract_occup2019.do"
do "$basecode/HITA/NLSY/11_extract_enrollment.do"
do "$basecode/HITA/NLSY/12_extract_health_asset.do"
do "$basecode/HITA/NLSY/13_extract_cognitive.do"


*************************************
** Extract & recode data for ipums **
*************************************
do "$basecode/HITA/NLSY/14_extract_ipums.do"
do "$basecode/HITA/NLSY/15_ipums_occ_pool.do"

************************************
*** Recode occupational prestige ***
************************************
do "$basecode/HITA/NLSY/16_extract_ipums.do" // eq. of 14
do "$basecode/HITA/NLSY/17_ipums_occpres.do" // eq. of 15

**********************
** Variable recodes **
**********************

** Run through variable recodes

do "$basecode/HITA/NLSY/7_rename_merge.do"

do "$basecode/HITA/NLSY/8_employment.do"

do "$basecode/HITA/NLSY/9_recode.do"

do "$basecode/HITA/NLSY/10_hhroster.do"

do "$basecode/HITA/NLSY/11_occupations.do"

do "$basecode/HITA/NLSY/12_occeduc_occ_match.do"
do "$basecode/HITA/NLSY/18_occpres_occ_match.do" // equivalent of 12_occeduc


** Merge with ipums data
do "$basecode/HITA/NLSY/13_ipums_nlsy_merge.do" // occupational education
do "$basecode/HITA/NLSY/19_ipums_nlsy_merge.do" // occupational prestige

** Drop for missing cases 
do "$basecode/HITA/NLSY/_beforeanalysisdrop.do" // Here I drop for both mising occupational prestige and employment status

*************************
** multiple imputation **
*************************

** For employment status
do "$basecode/HITA/NLSY/_multipleimputation_emp"

** For occupational prestige
do "$basecode/HITA/NLSY/_multipleimputation_occ"

*************************
** Descriptive results **
*************************

// Analytical Sample table for Men
do "$basecode/HITA/NLSY/AnalyticalSample_Men"

// Employment outcomes by parental coresidence
do "$basecode/HITA/NLSY/DVbyIV_Sample_Men"


// Analytical Sample table for women
*do "$basecode/HITA/NLSY/AnalyticalSample_Women"

// The below ones are covariates by IV so I will now fix them

// Descriptive table for Men
*do "$basecode/HITA/NLSY/propensityscore_descriptiveanalysisMen"

// Descriptive table for Women
*do "$basecode/HITA/NLSY/propensityscore_descriptiveanalysisWomen"




**************
** Analyses **
**************
do "$basecode/HITA/NLSY/_aftermianalysis.do"

do "$basecode/HITA/NLSY/_eventhistory.do"

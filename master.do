********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997) 
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022 

********************
******************** 
** Project set up ** 
********************

cd
global basecode "T:\githubAS\Projects"

do "$basecode/setup_asaydam.do" /// note that setup_environment will run your personal setup file.

*do "$basecode/setup_environment.do"

***************************************************
** Extract data and store in created_data folder **
***************************************************
do "$basecode/HITA/1_extract_label.do"
do "$basecode/HITA/2_extract_employment.do"
do "$basecode/HITA/3_extract_incarceration.do"
do "$basecode/HITA/4_extract_children.do"
do "$basecode/HITA/5_extract_interviewdate.do"
do "$basecode/HITA/6_extract_personality.do"
do "$basecode/HITA/7_extract_occup.do"
do "$basecode/HITA/8_extract_hrswrk.do"
do "$basecode/HITA/9_extract_employmentcross.do"
do "$basecode/HITA/10_extract_occup2019.do"
do "$basecode/HITA/11_extract_enrollment.do"
do "$basecode/HITA/12_extract_health_asset.do"
do "$basecode/HITA/13_extract_cognitive.do"
do "$basecode/HITA/14_extract_cognitive_health_assests.do"


*************************************
** Extract & recode data for ipums **
*************************************
do "$basecode/HITA/15_extract_ipums.do"
do "$basecode/HITA/16_ipums_occ_pool.do"

************************************
*** Recode occupational prestige ***
************************************
do "$basecode/HITA/17_extract_ipums.do" // eq. of 14
do "$basecode/HITA/18_ipums_occpres.do" // eq. of 15

**********************
** Variable recodes **
**********************

** Run through variable recodes

do "$basecode/HITA/7_rename_merge.do"

do "$basecode/HITA/8_employment.do"

do "$basecode/HITA/9_recode.do"

do "$basecode/HITA/10_hhroster.do"

do "$basecode/HITA/11_occupations.do"

do "$basecode/HITA/12_occeduc_occ_match.do"
do "$basecode/HITA/18_occpres_occ_match.do" // equivalent of 12_occeduc


** Merge with ipums data
do "$basecode/HITA/13_ipums_nlsy_merge.do" // occupational education
do "$basecode/HITA/19_ipums_nlsy_merge.do" // occupational prestige

** Drop for missing cases 
do "$basecode/HITA/_beforeanalysisdrop.do" // Here I drop for both mising occupational prestige and employment status

*************************
** multiple imputation **
*************************

** For employment status
do "$basecode/HITA/_multipleimputation_emp"

** For occupational prestige
do "$basecode/HITA/_multipleimputation_occ"

*************************
** Descriptive results **
*************************

// Analytical Sample table for Men
do "$basecode/HITA/AnalyticalSample_Men"

// Employment outcomes by parental coresidence
do "$basecode/HITA/DVbyIV_Sample_Men"



**************
** Analyses **
**************
do "$basecode/HITA/_aftermianalysis.do"

do "$basecode/HITA/_eventhistory.do"


********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Enrollment variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022

********************************************************************************

* Purpose: This file extracts occupational code variables 

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_enrollment_`logdate'.log", t replace


import delimited "$NLSY1997\default_enrollment.csv"
rename *, upper


label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1201400 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R1201400 vlR1201400

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlR2560000 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R2560000 vlR2560000

label define vlR2560001 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R2560001 vlR2560001

label define vlR3881500 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R3881500 vlR3881500

label define vlR3881501 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R3881501 vlR3881501

label define vlR5460600 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R5460600 vlR5460600

label define vlR5460601 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R5460601 vlR5460601

label define vlR7224200 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R7224200 vlR7224200

label define vlR7224201 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values R7224201 vlR7224201

label define vlS1538000 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S1538000 vlS1538000

label define vlS1538001 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S1538001 vlS1538001

label define vlS2007700 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S2007700 vlS2007700

label define vlS2007701 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S2007701 vlS2007701

label define vlS3808500 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S3808500 vlS3808500

label define vlS3808501 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S3808501 vlS3808501

label define vlS5408900 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S5408900 vlS5408900

label define vlS7509700 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values S7509700 vlS7509700

label define vlT0013000 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T0013000 vlT0013000

label define vlT2015900 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T2015900 vlT2015900

label define vlT3606200 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T3606200 vlT3606200

label define vlT5206600 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T5206600 vlT5206600

label define vlT6656400 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T6656400 vlT6656400

label define vlT8128800 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values T8128800 vlT8128800

label define vlU0008700 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values U0008700 vlU0008700

label define vlU1845300 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values U1845300 vlU1845300

label define vlU3443800 1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program" 
label values U3443800 vlU3443800
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1201400 CV_ENROLLSTAT_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename R2560000 CV_ENROLLSTAT_1998 
  rename R2560001 CV_ENROLLSTAT_EDT_1998 
  rename R3881500 CV_ENROLLSTAT_1999 
  rename R3881501 CV_ENROLLSTAT_EDT_1999 
  rename R5460600 CV_ENROLLSTAT_2000 
  rename R5460601 CV_ENROLLSTAT_EDT_2000 
  rename R7224200 CV_ENROLLSTAT_2001 
  rename R7224201 CV_ENROLLSTAT_EDT_2001 
  rename S1538000 CV_ENROLLSTAT_2002 
  rename S1538001 CV_ENROLLSTAT_EDT_2002 
  rename S2007700 CV_ENROLLSTAT_2003 
  rename S2007701 CV_ENROLLSTAT_EDT_2003 
  rename S3808500 CV_ENROLLSTAT_2004 
  rename S3808501 CV_ENROLLSTAT_EDT_2004 
  rename S5408900 CV_ENROLLSTAT_2005 
  rename S7509700 CV_ENROLLSTAT_2006 
  rename T0013000 CV_ENROLLSTAT_2007 
  rename T2015900 CV_ENROLLSTAT_2008 
  rename T3606200 CV_ENROLLSTAT_2009 
  rename T5206600 CV_ENROLLSTAT_2010 
  rename T6656400 CV_ENROLLSTAT_2011 
  rename T8128800 CV_ENROLLSTAT_2013 
  rename U0008700 CV_ENROLLSTAT_2015 
  rename U1845300 CV_ENROLLSTAT_2017 
  rename U3443800 CV_ENROLLSTAT_2019 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save "$created_data/NLSY97_extract_enrollment", replace

log close

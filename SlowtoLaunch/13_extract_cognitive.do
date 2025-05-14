* How does parental coresidence impact employment outcomes (NLSY1997)
* Enrollment variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2022

********************************************************************************

* Purpose: This file extracts occupational code variables 

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_cognitive_`logdate'.log", t replace

import delimited "$NLSY1997\HITA_cognitive.csv"
rename *, upper




label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 1 "Male"  2 "Female"  0 "No Information" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 1 "Cross-sectional"  0 "Oversample" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlR5473600 0 "0: 0%"  1 "1 TO 10: 1%-10%"  11 "11 TO 20: 11%-20%"  21 "21 TO 30: 21%-30%"  31 "31 TO 40: 31%-40%"  41 "41 TO 50: 41%-50%"  51 "51 TO 60: 51%-60%"  61 "61 TO 70: 61%-70%"  71 "71 TO 80: 71%-80%"  81 "81 TO 90: 81%-90%"  91 "91 TO 100: 91%-100%" 
label values R5473600 vlR5473600

label define vlR7237300 0 "0: 0%"  1 "1 TO 10: 1%-10%"  11 "11 TO 20: 11%-20%"  21 "21 TO 30: 21%-30%"  31 "31 TO 40: 31%-40%"  41 "41 TO 50: 41%-50%"  51 "51 TO 60: 51%-60%"  61 "61 TO 70: 61%-70%"  71 "71 TO 80: 71%-80%"  81 "81 TO 90: 81%-90%"  91 "91 TO 100: 91%-100%" 
label values R7237300 vlR7237300

label define vlR9829600 0 "0"  1 "1 TO 999: .001-.999"  1000 "1000 TO 19999: 1.000-19.999"  20000 "20000 TO 39999: 20.000-39.999"  40000 "40000 TO 59999: 40.000-59.999"  60000 "60000 TO 79999: 60.000-79.999"  80000 "80000 TO 100000: 80.000-100.000" 
label values R9829600 vlR9829600

label define vlS1552600 0 "0: 0%"  1 "1 TO 10: 1%-10%"  11 "11 TO 20: 11%-20%"  21 "21 TO 30: 21%-30%"  31 "31 TO 40: 31%-40%"  41 "41 TO 50: 41%-50%"  51 "51 TO 60: 51%-60%"  61 "61 TO 70: 61%-70%"  71 "71 TO 80: 71%-80%"  81 "81 TO 90: 81%-90%"  91 "91 TO 100: 91%-100%" 
label values S1552600 vlS1552600

label define vlZ9033700 1 "200 - 300"  2 "301 - 400"  3 "401 - 500"  4 "501 - 600"  5 "601 - 700"  6 "701 - 800"  0 "Have not yet received the scores" 
label values Z9033700 vlZ9033700

label define vlZ9033800 1 "Round 1"  2 "Round 2"  3 "Round 3"  4 "Round 4"  5 "Round 5"  6 "Round 6"  7 "Round 7"  8 "Round 8"  9 "Round 9"  10 "Round 10"  11 "Round 11"  12 "Round 12"  13 "Round 13"  14 "Round 14"  15 "Round 15"  16 "Round 16"  17 "Round 17"  18 "Round 18"  19 "Round 19" 
label values Z9033800 vlZ9033800

label define vlZ9033900 1 "200 - 300"  2 "301 - 400"  3 "401 - 500"  4 "501 - 600"  5 "601 - 700"  6 "701 - 800"  0 "Have not yet received the scores" 
label values Z9033900 vlZ9033900

label define vlZ9034000 1 "Round 1"  2 "Round 2"  3 "Round 3"  4 "Round 4"  5 "Round 5"  6 "Round 6"  7 "Round 7"  8 "Round 8"  9 "Round 9"  10 "Round 10"  11 "Round 11"  12 "Round 12"  13 "Round 13"  14 "Round 14"  15 "Round 15"  16 "Round 16"  17 "Round 17"  18 "Round 18"  19 "Round 19" 
label values Z9034000 vlZ9034000

label define vlZ9034100 1 "0 - 6"  2 "7 - 12"  3 "13 - 18"  4 "19 - 24"  5 "25 - 30"  6 "31 - 36"  0 "Have not yet received the scores" 
label values Z9034100 vlZ9034100

label define vlZ9034200 1 "Round 1"  2 "Round 2"  3 "Round 3"  4 "Round 4"  5 "Round 5"  6 "Round 6"  7 "Round 7"  8 "Round 8"  9 "Round 9"  10 "Round 10"  11 "Round 11"  12 "Round 12"  13 "Round 13"  14 "Round 14"  15 "Round 15"  16 "Round 16"  17 "Round 17"  18 "Round 18"  19 "Round 19" 
label values Z9034200 vlZ9034200
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename R5473600 CV_PIAT_PERCENTILE_SCORE_2000 
  rename R5473700 CV_PIAT_STANDARD_SCORE_2000 
  rename R7237300 CV_PIAT_PERCENTILE_SCORE_2001 
  rename R7237400 CV_PIAT_STANDARD_SCORE_2001 
  rename R9829600 ASVAB_MATH_VERBAL_SCORE_PCT_1999 
  rename S1552600 CV_PIAT_PERCENTILE_SCORE_2002 
  rename S1552700 CV_PIAT_STANDARD_SCORE_2002 
  rename Z9033700 CVC_SAT_MATH_SCORE_2007_XRND 
  rename Z9033800 CVC_SAT_MATH_RND_2007_XRND 
  rename Z9033900 CVC_SAT_VERBAL_SCORE_2007_XRND 
  rename Z9034000 CVC_SAT_VERBAL_RND_2007_XRND 
  rename Z9034100 CVC_ACT_SCORE_2007_XRND 
  rename Z9034200 CVC_ACT_RND_2007_XRND 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save "$created_data/NLSY97_extract_cognitive", replace

log close
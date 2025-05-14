********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Extract and Rename personality & health variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: This file extracts personality treat related variables 

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_personality_`logdate'.log", t replace


import delimited "$NLSY1997\HITApersonality.csv"
rename *, upper



label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlS0920000 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920000 vlS0920000

label define vlS0920100 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920100 vlS0920100

label define vlS0920200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920200 vlS0920200

label define vlS0920300 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920300 vlS0920300

label define vlS0920400 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920400 vlS0920400

label define vlS0920500 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920500 vlS0920500

label define vlS0920600 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920600 vlS0920600

label define vlS0920700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values S0920700 vlS0920700

label define vlT3162500 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162500 vlT3162500

label define vlT3162501 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162501 vlT3162501

label define vlT3162502 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162502 vlT3162502

label define vlT3162503 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162503 vlT3162503

label define vlT3162504 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162504 vlT3162504

label define vlT3162505 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162505 vlT3162505

label define vlT3162506 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162506 vlT3162506

label define vlT3162507 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162507 vlT3162507

label define vlT3162508 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162508 vlT3162508

label define vlT3162509 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162509 vlT3162509

label define vlT3162600 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162600 vlT3162600

label define vlT3162601 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162601 vlT3162601

label define vlT3162602 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162602 vlT3162602

label define vlT3162603 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162603 vlT3162603

label define vlT3162700 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162700 vlT3162700

label define vlT3162701 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162701 vlT3162701

label define vlT3162702 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162702 vlT3162702

label define vlT3162703 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T3162703 vlT3162703

label define vlT6216400 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216400 vlT6216400

label define vlT6216401 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216401 vlT6216401

label define vlT6216402 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216402 vlT6216402

label define vlT6216403 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216403 vlT6216403

label define vlT6216500 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216500 vlT6216500

label define vlT6216501 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216501 vlT6216501

label define vlT6216502 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216502 vlT6216502

label define vlT6216503 1 "1 -- Disagree strongly"  2 "2 -- Disagree moderately"  3 "3 -- Disagree a little"  4 "4 -- Neither agree nor disagree"  5 "5 -- Agree a little"  6 "6 -- Agree moderately"  7 "7 -- Agree strongly" 
label values T6216503 vlT6216503

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
  rename S0920000 YSAQ_282J_2002   // YSAQ-282J
  rename S0920100 YSAQ_282K_2002   // YSAQ-282K
  rename S0920200 YSAQ_282L_2002   // YSAQ-282L
  rename S0920300 YSAQ_282M_2002   // YSAQ-282M
  rename S0920400 YSAQ_282N_2002   // YSAQ-282N
  rename S0920500 YSAQ_2820_2002   // YSAQ-2820
  rename S0920600 YSAQ_282P_2002   // YSAQ-282P
  rename S0920700 YSAQ_282Q_2002   // YSAQ-282Q
  rename T3162500 YTEL_TIPIA_000001_2008   // YTEL-TIPIA~000001
  rename T3162501 YTEL_TIPIA_000002_2008   // YTEL-TIPIA~000002
  rename T3162502 YTEL_TIPIA_000003_2008   // YTEL-TIPIA~000003
  rename T3162503 YTEL_TIPIA_000004_2008   // YTEL-TIPIA~000004
  rename T3162504 YTEL_TIPIA_000005_2008   // YTEL-TIPIA~000005
  rename T3162505 YTEL_TIPIA_000006_2008   // YTEL-TIPIA~000006
  rename T3162506 YTEL_TIPIA_000007_2008   // YTEL-TIPIA~000007
  rename T3162507 YTEL_TIPIA_000008_2008   // YTEL-TIPIA~000008
  rename T3162508 YTEL_TIPIA_000009_2008   // YTEL-TIPIA~000009
  rename T3162509 YTEL_TIPIA_000010_2008   // YTEL-TIPIA~000010
  rename T3162600 YTEL_IND_000001_2008   // YTEL-IND~000001
  rename T3162601 YTEL_IND_000002_2008   // YTEL-IND~000002
  rename T3162602 YTEL_IND_000003_2008   // YTEL-IND~000003
  rename T3162603 YTEL_IND_000004_2008   // YTEL-IND~000004
  rename T3162700 YTEL_TRAD_000001_2008   // YTEL-TRAD~000001
  rename T3162701 YTEL_TRAD_000002_2008   // YTEL-TRAD~000002
  rename T3162702 YTEL_TRAD_000003_2008   // YTEL-TRAD~000003
  rename T3162703 YTEL_TRAD_000004_2008   // YTEL-TRAD~000004
  rename T6216400 YTEL_IND_000001_2010   // YTEL-IND~000001
  rename T6216401 YTEL_IND_000002_2010   // YTEL-IND~000002
  rename T6216402 YTEL_IND_000003_2010   // YTEL-IND~000003
  rename T6216403 YTEL_IND_000004_2010   // YTEL-IND~000004
  rename T6216500 YTEL_TRAD_000001_2010   // YTEL-TRAD~000001
  rename T6216501 YTEL_TRAD_000002_2010   // YTEL-TRAD~000002
  rename T6216502 YTEL_TRAD_000003_2010   // YTEL-TRAD~000003
  rename T6216503 YTEL_TRAD_000004_2010   // YTEL-TRAD~000004
  
  
  save "$temp/NLSY97_extract_personality", replace
  
clear
import delimited "$NLSY1997\HITA_health.csv"
rename *, upper


label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0320600 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R0320600 vlR0320600

label define vlR0536300 1 "Male"  2 "Female"  0 "No Information" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR0681200 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R0681200 vlR0681200

label define vlR1235800 1 "Cross-sectional"  0 "Oversample" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlR2164000 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R2164000 vlR2164000

label define vlR3481900 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R3481900 vlR3481900

label define vlR4880100 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R4880100 vlR4880100

label define vlR6497500 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values R6497500 vlR6497500

label define vlS1225000 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values S1225000 vlS1225000

label define vlS1246500 1 "YES"  0 "NO" 
label values S1246500 vlS1246500

label define vlS3302500 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values S3302500 vlS3302500

label define vlS4919500 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values S4919500 vlS4919500

label define vlS6661100 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values S6661100 vlS6661100

label define vlS8644200 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values S8644200 vlS8644200

label define vlT1049500 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T1049500 vlT1049500

label define vlT3144600 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T3144600 vlT3144600

label define vlT4562200 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T4562200 vlT4562200

label define vlT6206400 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T6206400 vlT6206400

label define vlT7703800 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T7703800 vlT7703800

label define vlT9093100 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values T9093100 vlT9093100

label define vlU1096500 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values U1096500 vlU1096500

label define vlU2962600 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values U2962600 vlU2962600

label define vlU4368000 1 "Excellent"  2 "Very good"  3 "Good"  4 "Fair"  5 "Poor" 
label values U4368000 vlU4368000

label define vlZ0529500 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529500 vlZ0529500

label define vlZ0529600 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529600 vlZ0529600

label define vlZ0529700 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529700 vlZ0529700

label define vlZ0529800 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529800 vlZ0529800

label define vlZ0529900 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529900 vlZ0529900

label define vlZ0530000 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0530000 vlZ0530000

label define vlZ0530100 1 "A LOT"  2 "A LITTLE"  3 "NOT AT ALL" 
label values Z0530100 vlZ0530100

label define vlZ0530200 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "A GOOD BIT OF THE TIME"  4 "SOME OF THE TIME"  5 "A LITTLE OF THE TIME"  6 "NONE OF THE TIME" 
label values Z0530200 vlZ0530200

label define vlZ0530600 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "A GOOD BIT OF THE TIME"  4 "SOME OF THE TIME"  5 "A LITTLE OF THE TIME"  6 "NONE OF THE TIME" 
label values Z0530600 vlZ0530600

/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename R0000100 PUBID_1997 
  rename R0320600 YHEA_100_1997   // YHEA-100
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R0681200 PC9_001_1997   // PC9-001
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename R2164000 YHEA_100_1998   // YHEA-100
  rename R3481900 YHEA_100_1999   // YHEA-100
  rename R4880100 YHEA_100_2000   // YHEA-100
  rename R6497500 YHEA_100_2001   // YHEA-100
  rename S1225000 YHEA_100_2002   // YHEA-100
  rename S1246500 YHEA_2800_2002   // YHEA-2800
  rename S3302500 YHEA_100_2003   // YHEA-100
  rename S4919500 YHEA_100_2004   // YHEA-100
  rename S6661100 YHEA_100_2005   // YHEA-100
  rename S8644200 YHEA_100_2006   // YHEA-100
  rename T1049500 YHEA_100_2007   // YHEA-100
  rename T3144600 YHEA_100_2008   // YHEA-100
  rename T4562200 YHEA_100_2009   // YHEA-100
  rename T6206400 YHEA_100_2010   // YHEA-100
  rename T7703800 YHEA_100_2011   // YHEA-100
  rename T9093100 YHEA_100_2013   // YHEA-100
  rename U1096500 YHEA_100_2015   // YHEA-100
  rename U2962600 YHEA_100_2017   // YHEA-100
  rename U4368000 YHEA_100_2019   // YHEA-100
  rename Z0529500 YHEA29_240_COMB_XRND   // YHEA29-240_COMB
  rename Z0529600 YHEA29_245_COMB_XRND   // YHEA29-245_COMB
  rename Z0529700 YHEA29_250_COMB_XRND   // YHEA29-250_COMB
  rename Z0529800 YHEA29_255_COMB_XRND   // YHEA29-255_COMB
  rename Z0529900 YHEA29_260_COMB_XRND   // YHEA29-260_COMB
  rename Z0530000 YHEA29_265_COMB_XRND   // YHEA29-265_COMB
  rename Z0530100 YHEA29_270_COMB_XRND   // YHEA29-270_COMB
  rename Z0530200 YHEA29_285_COMB_XRND   // YHEA29-285_COMB
  rename Z0530600 YHEA29_290_COMB_XRND   // YHEA29-290_COMB


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */


save "$temp/HITA_health", replace
use  "$temp/HITA_health", clear
merge m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997 using "$temp/NLSY97_extract_personality"
drop	_merge


save "$created_data/NLSY97_extract_personality", replace

log close

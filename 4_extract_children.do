********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Extract and Rename children
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: This file extracts number of children

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_children_`logdate'.log", t replace


import delimited "$NLSY1997\HITAchildren.csv"
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

label define vlU0014901 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U0014901 vlU0014901

label define vlU0014902 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U0014902 vlU0014902

label define vlU1852800 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U1852800 vlU1852800

label define vlU1852900 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U1852900 vlU1852900
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
  rename U0014901 CV_BIO_CHILD_HH_U18_2015 
  rename U0014902 CV_BIO_CHILD_NR_U18_2015 
  rename U1852800 CV_BIO_CHILD_HH_U18_2017 
  rename U1852900 CV_BIO_CHILD_NR_U18_2017 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save "$temp/NLSY_child", replace
clear 

import delimited "$NLSY1997\HITA_NRchild.csv"
rename *, upper

label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1211200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values R1211200 vlR1211200

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlR2570200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values R2570200 vlR2570200

label define vlR3892200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values R3892200 vlR3892200

label define vlR5474200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values R5474200 vlR5474200

label define vlR7237900 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5" 
label values R7237900 vlR7237900

label define vlS1553200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values S1553200 vlS1553200

label define vlS2022800 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values S2022800 vlS2022800

label define vlS3823700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values S3823700 vlS3823700

label define vlS5423700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values S5423700 vlS5423700

label define vlS7525800 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values S7525800 vlS7525800

label define vlT0026100 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T0026100 vlT0026100

label define vlT2021000 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T2021000 vlT2021000

label define vlT3611700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T3611700 vlT3611700

label define vlT5211800 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T5211800 vlT5211800

label define vlT6663200 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T6663200 vlT6663200

label define vlT8134400 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values T8134400 vlT8134400

label define vlU0014900 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U0014900 vlU0014900

label define vlU0014902 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U0014902 vlU0014902

label define vlU1852700 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U1852700 vlU1852700

label define vlU1852900 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U1852900 vlU1852900

label define vlU3452000 0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10 TO 999: 10+" 
label values U3452000 vlU3452000
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1211200 CV_BIO_CHILD_NR_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename R2570200 CV_BIO_CHILD_NR_1998 
  rename R3892200 CV_BIO_CHILD_NR_1999 
  rename R5474200 CV_BIO_CHILD_NR_2000 
  rename R7237900 CV_BIO_CHILD_NR_2001 
  rename S1553200 CV_BIO_CHILD_NR_2002 
  rename S2022800 CV_BIO_CHILD_NR_2003 
  rename S3823700 CV_BIO_CHILD_NR_2004 
  rename S5423700 CV_BIO_CHILD_NR_2005 
  rename S7525800 CV_BIO_CHILD_NR_2006 
  rename T0026100 CV_BIO_CHILD_NR_2007 
  rename T2021000 CV_BIO_CHILD_NR_2008 
  rename T3611700 CV_BIO_CHILD_NR_2009 
  rename T5211800 CV_BIO_CHILD_NR_2010 
  rename T6663200 CV_BIO_CHILD_NR_2011 
  rename T8134400 CV_BIO_CHILD_NR_2013 
  rename U0014900 CV_BIO_CHILD_NR_2015 
  rename U0014902 CV_BIO_CHILD_NR_U18_2015 
  rename U1852700 CV_BIO_CHILD_NR_2017 
  rename U1852900 CV_BIO_CHILD_NR_U18_2017 
  rename U3452000 CV_BIO_CHILD_NR_U18_2019 


save "$temp/NLSY_childNR", replace

use			"$temp/NLSY_child", clear 
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$temp/NLSY_childNR" 
drop		_merge



save "$created_data/NLSY97_extract_child", replace

log close
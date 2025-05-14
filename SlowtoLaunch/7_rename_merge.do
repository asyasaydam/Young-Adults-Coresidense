********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Merge & Rename & Construct variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: This file merges data and renames the variables and constructs mainly for the duration of hh 24-33 (number of total varaibles #6982) 


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97construct_`logdate'.log", t replace



use			"$created_data/NLSY97_extract", clear // 1_extract_label do file
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract1" // Hourly employment variables are here. // 2_extract_employment do file
drop		_merge
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_emplo" // Hourly employment variables are here. // 2_extract_employment do file
drop		_merge 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_incarc" // incarceration history // 3_extract_incarceration
drop 		_merge 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_child" // just two additional variables about the number of children // 4_extract_children
drop 		_merge
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_interviewdate" // this only includes the KEY variables and interview date variables // 5_extract_interviewdate
assert 		_merge ==3
drop 		_merge
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_personality" // personality characteristics // 6_extract_personality
drop 		_merge 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_occup" // occupational codes // 7_extract_occup
drop 		_merge 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_hrswrk" // hours worked weekly // 8_extract_hrswrk
drop 		_merge 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$created_data/NLSY97_extract_employcross" // hours worked weekly // 9_extract_employmentcross
drop 		_merge 
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using"$created_data/NLSY97_extract_occup2019" // occupations for 2019 // 10_extract_occup2019.do"
drop		_merge
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using"$created_data/NLSY97_extract_enrollment" // 11_extract_enrollment
drop		_merge
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using"$created_data/NLSY97_extract_health_asset" // health, assets //12_extract_health_asset
drop		_merge
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using"$created_data/NLSY97_extract_cognitive" // 13_extract_cognitive
drop		_merge


save "$temp/NLSY97_merged", replace
use "$temp/NLSY97_merged", clear

// SIMPLIFY SOME MAIN VARIABLES

* ID variables
rename 		SIDCODE_1997 HH_ID_97 						// Changed the household ID variable to a more simpler one
rename		PUBID_1997	ID								// Changed the individual ID

**Sex
rename		KEY_SEX_1997 SEX 							// Changed the sex variable to a more simple one

**Birthyear/Birth date
rename		KEY_BDATE_Y_1997 BYEAR 						// Changed the birth year to a simpler one

**Race/Ethnicity & Immigration/Citizenship status (Flag:citizenship may vary according to year)
rename		KEY_RACE_ETHNICITY_1997 RACEETHN 			// This is a combination of race and etnicity. No need to use the separate race and etnicity variables. This might require recoding since Black is 1 and White is 4 perhaps
rename		CV_CITIZENSHIP_1997 CITIZENSHIP 			// This is citizenship by birth and I think I would not be interested if the citizenship status changes over the years?
rename 		CV_CITIZEN_CURRENT_2001 CITIZENSHIP_CURRENT

** AGE
rename		SYMBOL_KEY_AGE_2003 age03 // I don't know what this is used for? the age distribution at 2003?


**Education/Training
rename 		CVC_HGC_EVER_XRND HIGHEST_GRADE				// This is the variable for highest grade so it goes from 1st to last and not cumulative. I might use the other one which is highest degree received
rename		CVC_HIGHEST_DEGREE_EVER_XRND EDUC			// This education variable is better.  

// About XRND: For example, the NLSY97 variable "CVC_HGC_EVER" is the highest grade ever reported through the last round of interview and has XRND listed as its survey year because the highest grade completed is present for each respondent, regardless of when the information was collected. 

rename 		CVC_TRN_CERT_XRND TRAINING 					// Respondent has ever received training Y/N 
rename		CVC_TRN_CERT_DATE_Y_XRND  DATE_TRAINING 	// The date of the training



* Marital Status over the years
// So for this one I will have to see if marital status changed from the year that the young adult was at home and then moved out

*** Marital stat collapsed

forvalues y=1997/2011{
rename 	CV_MARSTAT_COLLAPSED_`y' MARSTAT`y'
}
rename 	CV_MARSTAT_COLLAPSED_2013 MARSTAT2013
rename 	CV_MARSTAT_COLLAPSED_2015 MARSTAT2015
rename 	CV_MARSTAT_COLLAPSED_2017 MARSTAT2017

*** Marital stat with cohab

forvalues y=1997/2011{
rename 	CV_MARSTAT_`y' UNIONSTAT`y'
}
rename 	CV_MARSTAT_2013 UNIONSTAT2013
rename 	CV_MARSTAT_2015 UNIONSTAT2015
rename 	CV_MARSTAT_2017 UNIONSTAT2017




**Income of YA
// This variable is total income from wages and salary last year. I will need this for each individual before they move out. For example, if a YA moved out of the parental household in 2004. I need their income on 2003. So I need to use INCOME03 for that person.

forvalues y=1997/2011{
rename 	YINC_1700_`y' INCOME`y'
}
rename 	YINC_1700_2013 INCOME12
rename 	YINC_1700_2015 INCOME14
rename 	YINC_1700_2017 INCOME16

// Refusal -1
// Don't know -2
// Valid Skip -4
// Non-interview -5

// If the respondent replies as -1 or -2 then there is an additional question. How does that work? Should I impute those who refuse or don't know with the additional questions reply? e.g. R04903.00 [YINC-1800] (for 1997)
forvalues y=1997/2011{
rename 	YINC_1800_`y' ESTINCOME`y'
}
rename 	YINC_1800_2013 ESTINCOME12
rename 	YINC_1800_2015 ESTINCOME14
rename 	YINC_1800_2017 ESTINCOME16


**Family Structure at age 2 & 6 & 12 (Should I pick one age? Probably taking 12 is the best.)
// Relationship of the parent figure(s)/guardian(s) in the  household to the respondent at age 2
rename 	CVC_YTH_REL_HH_AGE2_YCHR_XRND	PARENTREL_AGE2
rename 	CVC_YTH_REL_HH_AGE6_YCHR_XRND	PARENTREL_AGE6
rename 	CVC_YTH_REL_HH_AGE12_YCHR_XRND	PARENTREL_AGE12 


**Relationship to the parental household figure
rename 	CV_YTH_REL_HH_CURRENT_2003 HHREL_2003


save "$temp/NLSY97_merged_renamed", replace


************** 2003 CASE YEAR *****************
/// So lets take 2003 as a case year where people born in 1980 to 1984 are around 18 to 24. It can be a starting/assumption year for the rest of the analysis.
recode HHREL_2003 (-5=.)(1/3=1)(4/7=2)(8/10=3), gen(parentalhh_2003)
label define parentalhh_2003 1 "Both parents" 2 "Single/Adoptive/Foster parent" 3 "Other"
label values parentalhh_2003 parentalhh_2003


/* 2066        1 Both biological parents
     450       2 Two parents, biological mother
      95       3 Two parents, biological father
	  
    1250       4 Biological mother only
     207       5 Biological father only
	 
      23       6 Adoptive parent(s)
       3       7 Foster parent(s)
	   
      34       8 No parents, grandparents
      14       9 No parents, other relatives
    3612      10 Anything else
  -------
    7754
 
Refusal(-1)            0
Don't Know(-2)         0
TOTAL =========>    7754   VALID SKIP(-4)       0     NON-INTERVIEW(-5)    1230
*/

// The number of non-interview for this question (1230) is same across other questions. I couldn't figure out the reason yet probably there is a group (maybe new people?) that is not interviewed.


recode 	parentalhh_2003 (1/2=1)(3=2), gen(parenthh03)
label 	define parenthh03 1 "With parents" 2 "W/out parents"
label 	values parenthh03 parenthh03



tab 	parenthh03 age03, nofreq col


save "$created_data/NLSY97_rename", replace
log close


********************************************************************************
************************ MOVEOUT MOVEBACK VARIABLE *****************************
********************************************************************************
********************************************************************************

/*


**First moved out on own:

// What month and year did you first move out on your own for at least three months, even if you moved back in to someone else's household after that?
rename 	YHHI_56300_Y_2003 	MOVEOUT03
rename 	YHHI_56300_Y_2004 	MOVEOUT04
rename 	YHHI_56300A_Y_2004 	MOVEOUT04_DLI // since date of last interview (should I use this or use the plain version of the question? Why there are two)
rename 	YHHI_56300_Y_2005 	MOVEOUT05
rename 	YHHI_56300A_Y_2005 	MOVEOUT05_DLI
rename 	YHHI_56300_Y_2006 	MOVEOUT06
rename  YHHI_56300A_Y_2006 	MOVEOUT06_DLI
rename 	YHHI_56300_Y_2007 	MOVEOUT07
rename 	YHHI_56300A_Y_2007 	MOVEOUT07_DLI
rename 	YHHI_56300_Y_2008 	MOVEOUT08
rename 	YHHI_56300A_Y_2008 	MOVEOUT08_DLI
rename 	YHHI_56300_Y_2009 	MOVEOUT09
rename 	YHHI_56300A_Y_2009 	MOVEOUT09_DLI
rename 	YHHI_56300_Y_2010 	MOVEOUT10
rename  YHHI_56300A_Y_2010 	MOVEOUT10_DLI
rename 	YHHI_56300_Y_2011 	MOVEOUT11
rename 	YHHI_56300A_Y_2011 	MOVEOUT11_DLI
rename	YHHI_56300_Y_2013 	MOVEOUT13
rename 	YHHI_56300A_Y_2013 	MOVEOUT13_DLI
rename	YHHI_56300_Y_2015 	MOVEOUT15
rename	YHHI_56300A_Y_2015 	MOVEOUT15_DLI
rename  YHHI_56300_Y_2017 	MOVEOUT17
rename 	YHHI_56300A_Y_2017	MOVEOUT17_DLI

// SO I guess I understand the difference! One of them is asking when for the first time the YA has moved out of the parental house (or whatever household they grow up in) and moved out. THE OTHER question with DLI is asking when since the last interview the respondent first move out. I think I am interested in the plain version!!!! 

// There is a variable that I forgot to add: S39510 => Has R lived on own since DLI? Since dLI, have you lived on your own, either w roommates or by yourself? Y/N

// After tabing several I found this to be not useful since many of the years the answer is -5 or -4 meaning that the question is skipped generally.

// 9.11.21 note: I browsed with all the moveout* and non-DLI ones almost have only skip. WHY? Is it because the DLI ones take the 2003 as an answer and if the answer was -4 or -5 in 2003 then this question is asked? In other words, if a respondent have indicated a year of first move out in 2003 then this question is never asked to that person. YES!
// I can use this variable to identify the age of first moving out. 

// if they never lived apart from their parents
// if they previously repoted that they moved out 


*preserve

* before using egen, I might want to recode missings
forvalues y=3/9 {
	recode MOVEOUT0`y'(-5/-1=.)
}

gen 	MOVEOUT12 = MOVEOUT13
gen 	MOVEOUT14 = MOVEOUT15
gen 	MOVEOUT16 = MOVEOUT17

forvalues y=10/17 {
	recode MOVEOUT`y'(-5/-1=.)
}

*_DLI
forvalues y=4/9 {
	recode MOVEOUT0`y'_DLI(-5/-1=.)
}

gen 	MOVEOUT12_DLI = MOVEOUT13_DLI
gen 	MOVEOUT14_DLI = MOVEOUT15_DLI
gen 	MOVEOUT16_DLI = MOVEOUT17_DLI

forvalues y=10/17 {
	recode MOVEOUT`y'_DLI (-5/-1=.)
}


*keep 		BYEAR MOVEOUT03 MOVEOUT04_DLI MOVEOUT05_DLI MOVEOUT06_DLI MOVEOUT07_DLI MOVEOUT08_DLI MOVEOUT09_DLI MOVEOUT10_DLI MOVEOUT11_DLI MOVEOUT13_DLI MOVEOUT15_DLI MOVEOUT17_DLI

egen		firstmoveout = rowmax(MOVEOUT*) 		// This captures the year when they first move out. however if they never moved out, then this variable is something like -4. 
*browse		firstmoveout ID MOVEOUT* 

gen 		agefirstmoveout = firstmoveout - BYEAR // by subtracting it from the birthyear I capture the the age that they first moved out.
*browse		agefirstmoveout 						// this creates negative values for people who have never moved out. I can replace all negative values with missing or 0.
replace 	agefirstmoveout = 0 if agefirstmoveout < 0 // here 0 means never moved out or -5(noninterview) or -2(don't know)
tab 		agefirstmoveout
*restore 

// what is the age of people who never moved out according to this variable? // so later when I construct this variable I can assume that those whose agefirstmoveout is zero never moved out?? but what if they were somewhre else and moved back in? how do I differentiate that.
// also okay, we understand when these people moved out, but are we sure they moved out from parental households? Maybe they were living with grandparents? Maybe they were living with other family members? Do I consider this as a proxy?

// age of people who never moved out at the year of 2017

*browse BYEAR agefirstmoveout SYMBOL_KEY_AGE_2017 // there are many -5 for the symbolkeyage2017 variable. Does this mean these people were not interviewed? might be. I can impute for the ages. What I need to do? First do I need their ages for each year, their birth date might be also enough. If I end up using a specific year then I can only subtract. But if I need to find the year which they turned into that specific age, then maybe imputing might be useful. just to have variables for each year. but also if for example ID == 1 does not have a symbol_key_age_2017, does it mean for this person was not interviewed? 
*browse if ID == 1 // A good exercise might be to take this person to excel and see what the other variables are!!!


*browse BYEAR agefirstmoveout SYMBOL_KEY_AGE_*


// FLAG: HOW MOVEOUTO3 i.e. how in the survey year 2003, they indicate that they move out of the house for the first time  in 2004
// Followup: There is a variable for interview date, surprisingly year 2003 includes some people who were interviewed in 2004 (this is probably similar for other years). so probably they interviewed some in 2004 and those must match with moveout03 - 2004 years.

*browse ID MOVEOUT03 CV_INTERVIEW_DATE_Y_2003 if MOVEOUT03 == 2004 // YES!




// 9.12.2021 
// For each person, I need to find the year which they turn into 24 and 32, 33, so that I can use that variable for constructing other variables.

gen 	yearatage24 = BYEAR + 24
gen 	yearatage32 = BYEAR + 32
gen 	yearatage33 = BYEAR + 33
gen		yearatage34 = BYEAR + 34

// what is the interview year variable?
// CV_INTERVIEW_DATE_Y_1997
         
// If they answered yes to this (lead in q)"Did you ever move back to parents or other's hh after you moved out?" (S21756) then it leads to year variable. This doesnt have a _DLI variable
rename 	YHHI_56500_Y_2003 	MOVEBACK03 
rename 	YHHI_56500_Y_2004 	MOVEBACK04 
rename 	YHHI_56500_Y_2005	MOVEBACK05 
rename 	YHHI_56500_Y_2006 	MOVEBACK06
rename 	YHHI_56500_Y_2007	MOVEBACK07 
rename 	YHHI_56500_Y_2008 	MOVEBACK08  
rename 	YHHI_56500_Y_2009 	MOVEBACK09
rename 	YHHI_56500_Y_2010 	MOVEBACK10
rename 	YHHI_56500_Y_2011 	MOVEBACK11
rename 	YHHI_56500_Y_2013 	MOVEBACK13
rename 	YHHI_56500_Y_2015 	MOVEBACK15
rename 	YHHI_56500_Y_2017 	MOVEBACK17
// The question is "What month and year did you first move out on your own for at least three  months, even if you moved back in to someone else's household after that?
 	
* before using egen, I might want to recode missings
forvalues y=3/9 {
	recode MOVEBACK0`y'(-5/-1=.)
}

gen 	MOVEBACK12 = MOVEBACK13
gen 	MOVEBACK14 = MOVEBACK15
gen 	MOVEBACK16 = MOVEBACK17

forvalues y=10/17 {
	recode MOVEBACK`y'(-5/-1=.)
}



	
	
	


// age at first move back
egen		firstmoveback = rowmax(MOVEBACK*)
gen 		agefirstmoveback = firstmoveback - BYEAR // by subtracting it from the birthyear I capture the the age that they first moved back.
browse		agefirstmoveback 						// this creates negative values for people who have never moved out. I can replace all negaitve values with missing or 0.
replace 	agefirstmoveback = 0 if agefirstmoveback < 0
tab 		agefirstmoveback


*9.22.21
// I did a new tab here to see how many of the missing ageof firstmoveout are also in age of firs move back.
// agefirstmoveout is 1076 and agefirstmoveback is 4196
// there tab, intersection is 1053 which means that, out of the first missigs people on first move back, 23 of the/m (1076-1053) has a move out variable. This might be due to youth that was in another household and decided to come back. This whole calculation also shows me that, many dont have a move back(around ~3000). So 
tab 	agefirstmoveback agefirstmoveout if agefirstmoveback == 0 & agefirstmoveout == 0 // 



// FLAG: I am not sure (becuase I didnt check carefully) but if there are multiple moveouts and moveback
/*
gen 		path = 0
replace		path = 1 if firstmoveout < 0 // never exit the house
replace		path = 2 if firstmoveout > 0 & firstmoveback < 0 	// did exist and didn't come back.
replace		path = 3 if firstmoveout > 0 & firstmoveback > 0 // did exist and did come back.
*/


// Now I will create a variable that calculates the total duration of the YA at the parental household until 33. This creates a continuous variable.
gen 	 	totaldurationathh = .
replace 	totaldurationathh = 2017 - BYEAR if firstmoveout < 0 // never exit the house. code: I basically calculate their age from the lates interview year. Since they never exit, that is their total duration at the parental household
replace		totaldurationathh = agefirstmoveout if firstmoveout > 0 & firstmoveback < 0 	// did exist and didn't come back. since these YA didnt come back, the age of first move out is the total duration they spend at the parental hh (if that is a parental hh)
replace		totaldurationathh = agefirstmoveout + [2017 - firstmoveback] if firstmoveout > 0 & firstmoveback > 0 // did exist and did come back. If they moved out and come back in the same year, then they look like they have never spent time out. 

*browse BYEAR ID firstmoveback firstmoveout totaldurationathh


gen 		ageat2017 = 2017 - BYEAR
gen 		totaldurationhh_out = ageat2017 - totaldurationathh


///////////////////////////////////////////////////////

gen 		totalduration2433 = . 

*1) YA never moved out
replace 	totalduration2433 = 10  if agefirstmoveout == 0 & agefirstmoveback == 0

*2a) YA never moved out (because they were never in the hh) but came back at certain point before after 24 but before 33 
replace 	totalduration2433 = ((33 - agefirstmoveback) + .5) if agefirstmoveout == 0 & agefirstmoveback > 24 & agefirstmoveback <= 33 & agefirstmoveback > 0

*2b) YA never moved out (because they were never in the hh) but came back at certain point before 24 
replace 	totalduration2433 = 10 if agefirstmoveout == 0 & agefirstmoveback <= 24 & agefirstmoveback > 0

*2c) YA never moved out (because they were never in the hh) but came back at certain point after 33 
replace 	totalduration2433 = 0 if agefirstmoveout == 0 & agefirstmoveback > 33 


*3) YA moved out before 24 and never came back 
replace 	totalduration2433 = 0 if agefirstmoveout < 24 & agefirstmoveout > 0 & agefirstmoveback == 0 

*4) YA moved out before 24 and come back before 24
replace 	totalduration2433 = 10 if agefirstmoveout < 24 & agefirstmoveout > 0 & agefirstmoveback <= 24 & agefirstmoveback > 0

*5) YA moved out before 24 and come back btw 24-33 or at 33
replace 	totalduration2433 = (33 - agefirstmoveback) if agefirstmoveout < 24 & agefirstmoveout > 0 & agefirstmoveback >= 24 & agefirstmoveback <= 33

*6) YA moved out before 24 and come back after 33
replace		totalduration2433 = 0 if agefirstmoveout <= 24 & agefirstmoveout > 0 & agefirstmoveback > 33

*7) YA moved out after 24 and never came back
replace 	totalduration2433 = (agefirstmoveout - 23.5) if agefirstmoveout >= 24 & agefirstmoveback == 0 

*8) YA moved out after 24 and come back 24-33
replace 	totalduration2433 = (agefirstmoveout - 24) + (33 - agefirstmoveback) if agefirstmoveout >= 24 & agefirstmoveback <= 33 & agefirstmoveback > 0

*9) YA move out after 24 and come back after 33
replace  	totalduration2433 = (agefirstmoveout - 24) if agefirstmoveout >= 24 & agefirstmoveback > 33

*10) YA moved out after 33 and either didn't come back or come back after 33
replace 	totalduration2433 = 10 if  agefirstmoveout > 33 & agefirstmoveback == 0 | agefirstmoveback > 33

*11) YA moved out between 24-33 at a particular age and then returned back in the same year //check with 8
replace 	totalduration2433 = 9.5 if agefirstmoveout == agefirstmoveback & agefirstmoveout != 0 & agefirstmoveback != 0 & yearatage24 < firstmoveout & firstmoveback < yearatage33 & agefirstmoveout > 24 & agefirstmoveout < 33 & agefirstmoveback > 24 & agefirstmoveback < 33  // last part limits it to  24-33

*12) YA moved back between 24-33 at a particular age and then moved out in the same year 
replace 	totalduration2433 = .5 	if agefirstmoveout == agefirstmoveback & agefirstmoveout != 0 & agefirstmoveback != 0 & firstmoveback > yearatage24 & firstmoveout < yearatage33 & agefirstmoveout > 24 & agefirstmoveout < 33 & agefirstmoveback > 24 & agefirstmoveback < 33

*replace 	totalduration2433 = totalduration2433 + 1 
tab 		totalduration2433, m





*replace who moved out and moved in at the same time on average 6 months, or 9 and half


/*
replace 	totalduration2433 = 0 	if agefirstmoveout < 24 & agefirstmoveback <= 0 // This indicates for YAs who left the parental household before age 24 and didnt come back
replace 	totalduration2433 = 0 	if agefirstmoveout < 24 &  firstmoveout > 0 & agefirstmoveback > 33

replace 	totalduration2433 = 10 	if agefirstmoveout < 24 & agefirstmoveback <= 24 // This indicates for YAs who left before 24 and come back before or at latest 24 and didn't exit afterwards
replace 	totalduration2433 = 10 	if agefirstmoveout >= 33 // This calculates for YA who move out for the first time after 33. We don't know or dont care if they come back 


replace 	totalduration2433 = 10 - (33 - agefirstmoveback) if agefirstmoveout <= 24 & agefirstmoveback <= 33 & agefirstmoveback > 24 & firstmoveback > 0 & firstmoveout > 0 // This calculates for YA who move out before 24 but come back before 33 to 33 minus their come back age would give the gap

replace 	totalduration2433 = (agefirstmoveout - 24) 		if agefirstmoveout >= 24 & firstmoveback < 0 // this indicates for YA who left after 24 but never come back
replace 	totalduration2433 = (33 - agefirstmoveback) + (agefirstmoveout - 24) if agefirstmoveout >= 24 & firstmoveback > 0 & agefirstmoveback <= 33 // this idicates for YA who left after 24 and come back before 33
9- replace 	totalduration2433 = (agefirstmoveout - 24) 		if agefirstmoveout >= 24 & firstmoveback > 0 & agefirstmoveback > 33 // this replaces with YA who move out after 24 and came back later than 33 


replace 	totalduration2433 = totalduration2433 + 1 
tab 		totalduration2433, m

*browse ID CITIZENSHIP EDUC SEX RACEETHN PARENTREL_AGE12 PARENTREL_AGE2 totalduration2433 MOVEOU* agefirstmoveback agefirstmoveout BYEAR if agefirstmoveout  <= 0 & totalduration2433 == .
// there are missing variables. Most of them are people who are back to parental house after 33 so there is no room for calculation. Some of them (there is 6) seems like they never move out because they were never in their parents house (their parent relationship variable at age 2, 6, 12 (except one (ID==1431) is also missing) BUT they return at one point. For reliability I can make another variable that calculates the time between 24-33 regardless of their situation before than. However, these people might be incarcerated as kids? Check sex and gender and educ. Either drop these or what to do?If not drop then calculate for their time btw 24-33.
replace 	totalduration2433 = (33 - agefirstmoveback) if agefirstmoveout <= 0 & agefirstmoveback != 0 & agefirstmoveback <= 33
tab 		totalduration2433, m

gsort 		totalduration2433  // new command learned: this sorts ascending

// FLAG: does it calculate correctly?

// the remaining missing ones are people who come back after 33, so do I drop them? or calcualte their duration as 0?
// okay lets assume that I calculate their total duration btw 24-33 as zero, further than this should I have another variable that calculates for further duration like post24 hh duration?

tab 		totalduration2433, m

// There is still a problem, but I will let it for now. and now will try to work on the employment
*/
*/




// I will code them to the mean value of the parent educ, unknown - for parents education. 
// categorical - create a missing
// interval ratio - to the mean 
// then include a flag - dichotmous - missing control for it 



// look at the strategy
// characteristics at age 24, and predict their employment at age 33. 
// numbers of years lived with parents

// layer - in the middle mising variable varsa -  last year neyse onu al

// endogenous - control for 24 for now. 
// first model - bivaraite 
// multivaraite - with the controls at the age characteristics 
// last model - with controls for parental/marital status




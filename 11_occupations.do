
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Construct occupational codes 
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97occup_`logdate'.log", t replace


use "$temp/NLSY97_hhroster", clear

// I think I can code for occupation history by not including their occupations.
// Usage of occupational education scores should only be for the outcome ages that I am interested, other wise it super hard to match occupations each year to YEMP codes as they change and sometimes some codes don't exist in some years. 

// these are some differences I started to identify between NLSY and ACS codes but did not finish it as there huge discreapncies : 
*recode ALL YEMPs (40/60=30)(210=200)(340=310)(1040=150)(1110=1100)(1230=1220)(1500=1520)(1340=1530)(2710=2700)(2830=2810)

drop YEMP_OCCODE_2002_*_199* YEMP_OCCODE_2002_*_2000 YEMP_OCCODE_2002_*_2001 YEMP_OCCODE_2002_*_2002 YEMP_OCCODE_2002_*_2003 

// each year has different numbers of ROS items like 
// 2004 - 7 ---drop this later
// 2005 - 9
// 2006 - 9
// 2007 - 8 (made it 9)
gen YEMP_OCCODE_2002_09_2007 = YEMP_OCCODE_2002_08_2007
// 2008 - 9
// 2009 - 9
// 2010 - 9
// 2011 - 9 & 13????
// 2013 - 9
// 2015 - 9
// 2017 - 14
// 2019 - 11

********** Occupations ************

forvalues y=2005/2011{
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_`y' (-5/-3=.), gen(occupation_`w'_`y')
	}
}


**** 2011 - rositem 13 ***
		recode YEMP_OCCODE_2002_13_2011 (-5/-3=.), gen(occupation_13_2011)


**** 2013 ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2013 (-5/-3=.), gen(occupation_`w'_2013)
	}


**** 2015 ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2015 (-5/-3=.), gen(occupation_`w'_2015)

	}

	

**** 2017a ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2017 (-5/-3=.), gen(occupation_`w'_2017)
			
	}
	

**** 2017b ***
	forvalues w=10/14 {
		recode YEMP_OCCODE_2002_`w'_2017 (-5/-3=.), gen(occupation_`w'_2017)
			
	}
	

*** 2019 ****
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2019 (-5/-3=.), gen(occupation_`w'_2019)
			
	}
	
	forvalues w=10/11 {
		recode YEMP_OCCODE_2002_`w'_2019 (-5/-3=.), gen(occupation_`w'_2019)
			
	}
	
save		"$temp/nlsy_occupa", replace	
/*	
egen 		occupation_2005_min = rowmin(occupation_*_2005)
egen 		occupation_2005_max = rowmax(occupation_*_2005)
browse		 ID occupation_*_2005 occupation_2005	
browse 		ID occupation_* if ID == 6329 | ID == 2779 | ID == 654 // these people have multiple occupations?
*/

// What I want is to see their occupations when they are 32? SO I should code accordingly. Still not sure which occupation to fixate on. 

// People were asked about their employment status monthly. How to interpret this yearly codes? Look at the questionnaire?
// maybe I should first see the total hours workes for each job?

// For 2012 I will use occupation at 2011 and for 2014 I will use occupation at 2013 and for 2016 I will use occupation at 2015. I am not going to create new variables for now. 

// What is their occupation at age 32 - take a simple approach and got whatever they have as in their occupation_1_YEAR

// follow up: Because there are cases where young adults seem to be employed either parttime or full time, but when I code for their occupation based on these intermediate years, some young adults end up being shown employed but not have an occupation, so for these medium years, I will create new variables where it goes and finds the non missing within that year. For 2012, 2014 and 2016 I am doing this. 

use "$temp/nlsy_occupa", clear

forvalues x= 1/4 {
egen 			occupation_`x'_2012 = rowmax(occupation_`x'_2011 occupation_`x'_2013) // This decision is important since there are cases where young adult is employed both in 2011 and 2013 but they are different occupation, by picking the highest occupation code I make an arbitrary decision, but that arbitrariness is for all. 
egen 			occupation_`x'_2014 = rowmax(occupation_`x'_2013 occupation_`x'_2015)
egen 			occupation_`x'_2016 = rowmax(occupation_`x'_2015 occupation_`x'_2017)
egen			occupation_`x'_2018 = rowmax(occupation_`x'_2017 occupation_`x'_2019)
}


// 1st job
gen 			occupation32_1 = .
replace         occupation32_1 = occupation_1_2012 if yearatage32 == 2012 // 1980 
replace         occupation32_1 = occupation_1_2013 if yearatage32 == 2013 // 1981 
replace         occupation32_1 = occupation_1_2014 if yearatage32 == 2014 // 1982
replace         occupation32_1 = occupation_1_2015 if yearatage32 == 2015 // 1983
replace         occupation32_1 = occupation_1_2016 if yearatage32 == 2016 // 1984


// 2nd job
gen 			occupation32_2 = .
replace         occupation32_2 = occupation_2_2012 if yearatage32 == 2012 & occupation_2_2012 != .  // 1980 
replace         occupation32_2 = occupation_2_2013 if yearatage32 == 2013 & occupation_2_2013 != . // 1981 
replace         occupation32_2 = occupation_2_2014 if yearatage32 == 2014 & occupation_2_2014 != . // 1982
replace         occupation32_2 = occupation_2_2015 if yearatage32 == 2015 & occupation_2_2015 != . // 1983
replace         occupation32_2 = occupation_2_2016 if yearatage32 == 2016 & occupation_2_2016 != . // 1984


// 3rd job
gen 			occupation32_3 = .
replace         occupation32_3 = occupation_3_2012 if yearatage32 == 2012 & occupation_3_2012 != . // 1980 
replace         occupation32_3 = occupation_3_2013 if yearatage32 == 2013 & occupation_3_2013 != . // 1981 
replace         occupation32_3 = occupation_3_2014 if yearatage32 == 2014 & occupation_3_2014 != . // 1982
replace         occupation32_3 = occupation_3_2015 if yearatage32 == 2015 & occupation_3_2015 != . // 1983
replace         occupation32_3 = occupation_3_2016 if yearatage32 == 2016 & occupation_3_2016 != . // 1984

// 4th job
gen 			occupation32_4 = .
replace         occupation32_4 = occupation_4_2012 if yearatage32 == 2012 & occupation_4_2012 != . // 1980 
replace         occupation32_4 = occupation_4_2013 if yearatage32 == 2013 & occupation_4_2013 != . // 1981 
replace         occupation32_4 = occupation_4_2014 if yearatage32 == 2014 & occupation_4_2014 != . // 1982
replace         occupation32_4 = occupation_4_2015 if yearatage32 == 2015 & occupation_4_2015 != . // 1983
replace         occupation32_4 = occupation_4_2016 if yearatage32 == 2016 & occupation_4_2016 != . // 1984


// I will ignore the ones who reported more than 4 because the ratio of who had more than 4 assigned was around 1.5-2%



** second job
// Below you replace occupation at 32 (if missing) with any of the jobs the young adult has between 31-33
** first job
egen 			anyoccupation30s_1_1980 = rowmax (occupation_1_2011 occupation_1_2012 occupation_1_2013) // young adult born in 1980, occupations that are reported as first job btw ages 30-33. i go and pick up the one with the highest code. Is higher code a better indicator?
egen 			anyoccupation30s_1_1981 = rowmax (occupation_1_2012 occupation_1_2013 occupation_1_2014) 
egen 			anyoccupation30s_1_1982 = rowmax (occupation_1_2013 occupation_1_2014 occupation_1_2015) 
egen 			anyoccupation30s_1_1983 = rowmax (occupation_1_2014 occupation_1_2015 occupation_1_2016) 
egen 			anyoccupation30s_1_1984 = rowmax (occupation_1_2015 occupation_1_2016 occupation_1_2017)



replace  		occupation32_1 = anyoccupation30s_1_1980 if yearatage32 == 2012 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1980 
replace  		occupation32_1 = anyoccupation30s_1_1981 if yearatage32 == 2013 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1981 
replace  		occupation32_1 = anyoccupation30s_1_1982 if yearatage32 == 2014 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1982 
replace  		occupation32_1 = anyoccupation30s_1_1983 if yearatage32 == 2015 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1983 
replace  		occupation32_1 = anyoccupation30s_1_1984 if yearatage32 == 2016 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1984 

// 6611 to 7202 is the improvement in the sample size for occupation at age 32_1 substitution

** second job
egen 			anyoccupation30s_2_1980 = rowmax (occupation_2_2011 occupation_2_2012 occupation_2_2013) 
egen 			anyoccupation30s_2_1981 = rowmax (occupation_2_2012 occupation_2_2013 occupation_2_2014) 
egen 			anyoccupation30s_2_1982 = rowmax (occupation_2_2013 occupation_2_2014 occupation_2_2015) 
egen 			anyoccupation30s_2_1983 = rowmax (occupation_2_2014 occupation_2_2015 occupation_2_2016) 
egen 			anyoccupation30s_2_1984 = rowmax (occupation_2_2015 occupation_2_2016 occupation_2_2017)


replace  		occupation32_2 = anyoccupation30s_2_1980 if yearatage32 == 2012 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1980 - // 1980 - this is basically saying the if the person is 32 years old, doesn't have first, second, third or fourth job then go and see if the person has any occupation - as a second occupation though - in ages between 30-33.
replace  		occupation32_2 = anyoccupation30s_2_1981 if yearatage32 == 2013 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1981 
replace  		occupation32_2 = anyoccupation30s_2_1982 if yearatage32 == 2014 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1982 
replace  		occupation32_2 = anyoccupation30s_2_1983 if yearatage32 == 2015 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1983 
replace  		occupation32_2 = anyoccupation30s_2_1984 if yearatage32 == 2016 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1984 

// 3248 to 3255 is the improvement here

** third job
egen 			anyoccupation30s_3_1980 = rowmax (occupation_3_2011 occupation_3_2012 occupation_3_2013) 
egen 			anyoccupation30s_3_1981 = rowmax (occupation_3_2012 occupation_3_2013 occupation_3_2014) 
egen 			anyoccupation30s_3_1982 = rowmax (occupation_3_2013 occupation_3_2014 occupation_3_2015) 
egen 			anyoccupation30s_3_1983 = rowmax (occupation_3_2014 occupation_3_2015 occupation_3_2016) 
egen 			anyoccupation30s_3_1984 = rowmax (occupation_3_2015 occupation_3_2016 occupation_3_2017)


replace  		occupation32_3 = anyoccupation30s_3_1980 if yearatage32 == 2012 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1980 - this is basically saying the if the person is 32 years old, doesn't have first, second, third or fourth job then go and see if the person has any occupation - as a third occupation though - in ages 30-33.
replace  		occupation32_3 = anyoccupation30s_3_1981 if yearatage32 == 2013 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1981 
replace  		occupation32_3 = anyoccupation30s_3_1982 if yearatage32 == 2014 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1982 
replace  		occupation32_3 = anyoccupation30s_3_1983 if yearatage32 == 2015 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1983 
replace  		occupation32_3 = anyoccupation30s_3_1984 if yearatage32 == 2016 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1984 
// 0 change happened above so I will stop here. 

// 1170 to 1170 here so no change


** fourth job
egen 			anyoccupation30s_4_1980 = rowmax (occupation_4_2011 occupation_4_2012 occupation_4_2013) 
egen 			anyoccupation30s_4_1981 = rowmax (occupation_4_2012 occupation_4_2013 occupation_4_2014) 
egen 			anyoccupation30s_4_1982 = rowmax (occupation_4_2013 occupation_4_2014 occupation_4_2015) 
egen 			anyoccupation30s_4_1983 = rowmax (occupation_4_2014 occupation_4_2015 occupation_4_2016) 
egen 			anyoccupation30s_4_1984 = rowmax (occupation_4_2015 occupation_4_2016 occupation_4_2017)


replace  		occupation32_4 = anyoccupation30s_4_1980 if yearatage32 == 2012 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1980 
replace  		occupation32_4 = anyoccupation30s_4_1981 if yearatage32 == 2013 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1981 
replace  		occupation32_4 = anyoccupation30s_4_1982 if yearatage32 == 2014 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == .  & occupation32_4 == . // 1982 
replace  		occupation32_4 = anyoccupation30s_4_1983 if yearatage32 == 2015 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1983 
replace  		occupation32_4 = anyoccupation30s_4_1984 if yearatage32 == 2016 & occupation32_1 == .  & occupation32_2 == . & occupation32_3 == . & occupation32_4 == . // 1984 


// 394 to 394 here so no change


// Create a dummy to signify if that occupation is high education required or not:
// this below code doesnt work because I dont specify for age groups

// 2011 and 1980 borns


/*
gen 			occ_edu_level = . 
	forvalues z=1/9 {
replace 		occ_edu_level = 1 if (occupation_`z'_2011 == 0 | occupation_`z'_2011 == 1 | occupation_`z'_2011 == 2 | occupation_`z'_2011 == 3 | occupation_`z'_2011 == 4 | occupation_`z'_2011 == 5 | occupation_`z'_2011 == 6 | occupation_`z'_2011 == 7 | occupation_`z'_2011 == 8 | occupation_`z'_2011 == 9 | occupation_`z'_2011 == 10 | occupation_`z'_2011 == 11 | occupation_`z'_2011 == 14 | occupation_`z'_2011 == 15 | occupation_`z'_2011 == 16 | occupation_`z'_2011 == 22) & yearatage32 == 2012

replace 		occ_edu_level = 0 if (occupation_`z'_2011 == 12 | occupation_`z'_2011 == 13 | occupation_`z'_2011 == 17 | occupation_`z'_2011 == 18 | occupation_`z'_2011 == 19 | occupation_`z'_2011 == 20 | occupation_`z'_2011 == 21 | occupation_`z'_2011 == 23) & yearatage32 == 2012
	}

replace 		occ_edu_level = 1 if (occupation_13_2011 == 0 | occupation_13_2011 == 1 | occupation_13_2011 == 2 | occupation_13_2011 == 3 | occupation_13_2011 == 4 | occupation_13_2011 == 5 | occupation_13_2011 == 6 | occupation_13_2011 == 7 | occupation_13_2011 == 8 | occupation_13_2011 == 9 | occupation_13_2011 == 10 | occupation_13_2011 == 11 | occupation_13_2011 == 14 | occupation_13_2011 == 15 | occupation_13_2011 == 16 | occupation_13_2011 == 22) & yearatage32 == 2012

replace 		occ_edu_level = 0 if (occupation_13_2011 == 12 | occupation_13_2011 == 13 | occupation_13_2011 == 17 | occupation_13_2011 == 18 | occupation_13_2011 == 19 | occupation_13_2011 == 20 | occupation_13_2011 == 21 | occupation_13_2011 == 23) & yearatage32 == 2012
	
// 2013 and 1981 and 1982 borns	
	forvalues z=1/9 {
replace 		occ_edu_level = 1 if (occupation_`z'_2013 == 0 | occupation_`z'_2013 == 1 | occupation_`z'_2013 == 2 | occupation_`z'_2013 == 3 | occupation_`z'_2013 == 4 | occupation_`z'_2013 == 5 | occupation_`z'_2013 == 6 | occupation_`z'_2013 == 7 | occupation_`z'_2013 == 8 | occupation_`z'_2013 == 9 | occupation_`z'_2013 == 10 | occupation_`z'_2013 == 11 | occupation_`z'_2013 == 14 | occupation_`z'_2013 == 15 | occupation_`z'_2013 == 16 | occupation_`z'_2013 == 22) & (yearatage32 == 2013 | yearatage32 == 2014)

replace 		occ_edu_level = 0 if (occupation_`z'_2013 == 12 | occupation_`z'_2013 == 13 | occupation_`z'_2013 == 17 | occupation_`z'_2013 == 18 | occupation_`z'_2013 == 19 | occupation_`z'_2013 == 20 | occupation_`z'_2013 == 21 | occupation_`z'_2013 == 23) & (yearatage32 == 2013 | yearatage32 == 2014)
	}

	

// 2013 and 1983 and 1984 borns	
		forvalues z=1/9 {
replace 		occ_edu_level = 1 if (occupation_`z'_2015 == 0 | occupation_`z'_2015 == 1 | occupation_`z'_2015 == 2 | occupation_`z'_2015 == 3 | occupation_`z'_2015 == 4 | occupation_`z'_2015 == 5 | occupation_`z'_2015 == 6 | occupation_`z'_2015 == 7 | occupation_`z'_2015 == 8 | occupation_`z'_2015 == 9 | occupation_`z'_2015 == 10 | occupation_`z'_2015 == 11 | occupation_`z'_2015 == 14 | occupation_`z'_2015 == 15 | occupation_`z'_2015 == 16 | occupation_`z'_2015 == 22) & (yearatage32 == 2015 | yearatage32 == 2016)

replace 		occ_edu_level = 0 if (occupation_`z'_2015 == 12 | occupation_`z'_2015 == 13 | occupation_`z'_2015 == 17 | occupation_`z'_2015 == 18 | occupation_`z'_2015 == 19 | occupation_`z'_2015 == 20 | occupation_`z'_2015 == 21 | occupation_`z'_2015 == 23) & (yearatage32 == 2015 | yearatage32 == 2016)
	}
*/
	
	

	
	
// this gets the highest (which is 1 in this dummy case) educ-occ level and creates a new variable. I would still have to finalize and have a single variable like education_level of occupation at age 32.
// this brings their maximum value in that given year. howver an accoupation having a higher value doesn't mean that it is higher educ. so I need to fix this. 
// Followup: this is redundant now, I used above longer version

/*egen 	educ_occu_levelat32_80 = rowmax(occupation_*_2011) if yearatage32 == 2012
egen	educ_occu_levelat32_81 = rowmax(occupation_*_2013) if yearatage32 == 2013
egen	educ_occu_levelat32_82 = rowmax(occupation_*_2013) if yearatage32 == 2014
egen	educ_occu_levelat32_83 = rowmax(occupation_*_2015) if yearatage32 == 2015	
egen	educ_occu_levelat32_84 = rowmax(occupation_*_2015) if yearatage32 == 2016	

//new
egen 	occ_educ_at32 = rowmax(educ_occu_levelat*) // this finally give me what their occupation are when they were 32 and it looks at each round corresponding the year that they turn into 32.
* However this doesn't take into account second or third job that the person has. 
*/


/// Lets drop for all the cases before 32
drop YEMP_OCCODE_2002*
drop occupation_*_200*


// Follow up - CREATE JOB TYPES


gen YEMP_SELFEMP_09_2007 = YEMP_SELFEMP_08_2007
gen YEMP_SELFEMP_09_2008 = YEMP_SELFEMP_08_2008


forvalues y=2005/2011{
	forvalues w=1/9 {
		recode YEMP_SELFEMP_0`w'_`y' (-5/-3=.), gen(jobtype_`w'_`y')
	}
}



**** 2011 - rositem 13 ***
		recode YEMP_SELFEMP_13_2011 (-5/-3=.), gen(jobtype_13_2011)


**** 2013 ***
	forvalues w=1/9 {
		recode YEMP_SELFEMP_0`w'_2013 (-5/-3=.), gen(jobtype_`w'_2013)
	}


**** 2015 ***
	forvalues w=1/9 {
		recode YEMP_SELFEMP_0`w'_2015 (-5/-3=.), gen(jobtype_`w'_2015)

	}
	

**** 2017a ***
	forvalues w=1/9 {
		recode YEMP_SELFEMP_0`w'_2017 (-5/-3=.), gen(jobtype_`w'_2017)
			
	}
	

**** 2017b ***
	forvalues w=10/14 {
		recode YEMP_SELFEMP_`w'_2017 (-5/-3=.), gen(jobtype_`w'_2017)
			
	}
	

*** 2019 ****
	forvalues w=1/9 {
		recode YEMP_SELFEMP_0`w'_2019 (-5/-3=.), gen(jobtype_`w'_2019)
			
	}
	
	forvalues w=10/11 {
		recode YEMP_SELFEMP_`w'_2019 (-5/-3=.), gen(jobtype_`w'_2019)
			
	}

	

forvalues x= 1/4 {
egen 			jobtype_`x'_2012 = rowmin(jobtype_`x'_2011 jobtype_`x'_2013) // I get the minumum, meaning that if they were not self-employed in one year but self employed in the other year they would be assigned 0, not self-employed)
egen 			jobtype_`x'_2014 = rowmin(jobtype_`x'_2013 jobtype_`x'_2015)
egen 			jobtype_`x'_2016 = rowmin(jobtype_`x'_2015 jobtype_`x'_2017)
egen 			jobtype_`x'_2018 = rowmin(jobtype_`x'_2017 jobtype_`x'_2019)
}
	
	
	
	
// 1st job
gen 			jobtype32_1 = .
replace         jobtype32_1 = jobtype_1_2012 if yearatage32 == 2012 // 1980 
replace         jobtype32_1 = jobtype_1_2013 if yearatage32 == 2013 // 1981 
replace         jobtype32_1 = jobtype_1_2014 if yearatage32 == 2014 // 1982
replace         jobtype32_1 = jobtype_1_2015 if yearatage32 == 2015 // 1983
replace         jobtype32_1 = jobtype_1_2016 if yearatage32 == 2016 // 1984


// 2nd job
gen 			jobtype32_2 = .
replace         jobtype32_2 = jobtype_2_2012 if yearatage32 == 2012 & jobtype_2_2012 != .  // 1980 
replace         jobtype32_2 = jobtype_2_2013 if yearatage32 == 2013 & jobtype_2_2013 != . // 1981 
replace         jobtype32_2 = jobtype_2_2014 if yearatage32 == 2014 & jobtype_2_2014 != . // 1982
replace         jobtype32_2 = jobtype_2_2015 if yearatage32 == 2015 & jobtype_2_2015 != . // 1983
replace         jobtype32_2 = jobtype_2_2016 if yearatage32 == 2016 & jobtype_2_2016 != . // 1984


// 3rd job
gen 			jobtype32_3 = .
replace         jobtype32_3 = jobtype_3_2012 if yearatage32 == 2012 & jobtype_3_2012 != . // 1980 
replace         jobtype32_3 = jobtype_3_2013 if yearatage32 == 2013 & jobtype_3_2013 != . // 1981 
replace         jobtype32_3 = jobtype_3_2014 if yearatage32 == 2014 & jobtype_3_2014 != . // 1982
replace         jobtype32_3 = jobtype_3_2015 if yearatage32 == 2015 & jobtype_3_2015 != . // 1983
replace         jobtype32_3 = jobtype_3_2016 if yearatage32 == 2016 & jobtype_3_2016 != . // 1984

// 4th job
gen 			jobtype32_4 = .
replace         jobtype32_4 = jobtype_4_2012 if yearatage32 == 2012 & jobtype_4_2012 != . // 1980 
replace         jobtype32_4 = jobtype_4_2013 if yearatage32 == 2013 & jobtype_4_2013 != . // 1981 
replace         jobtype32_4 = jobtype_4_2014 if yearatage32 == 2014 & jobtype_4_2014 != . // 1982
replace         jobtype32_4 = jobtype_4_2015 if yearatage32 == 2015 & jobtype_4_2015 != . // 1983
replace         jobtype32_4 = jobtype_4_2016 if yearatage32 == 2016 & jobtype_4_2016 != . // 1984



save "$temp/hitaNLSY_occupations", replace
log close









/*
use "$temp/hitaNLSY_occupations", clear


/// Generate a variable that shows if the person has more than one job:
preserve 
drop if SEX == 1
generate howmanyjobs = .

// For people who have 0 job when they are 32
replace 	howmanyjobs = 0 if occupation_1_2011 == . & yearatage32 == 2012 & occupation_2_2011 == . & occupation_3_2011 == .  & occupation_4_2011 == . 
replace 	howmanyjobs = 0 if occupation_1_2013 == . & yearatage32 == 2013 & occupation_2_2013 == . & occupation_3_2013 == . & occupation_4_2013 == .
replace 	howmanyjobs = 0 if occupation_1_2013 == . & yearatage32 == 2014 & occupation_2_2013 == . & occupation_3_2013 == . & occupation_4_2013 == .
replace 	howmanyjobs = 0 if occupation_1_2015 == . & yearatage32 == 2015 & occupation_2_2015 == . & occupation_3_2015 == . & occupation_4_2015 == .
replace 	howmanyjobs = 0 if occupation_1_2015 == . & yearatage32 == 2016 & occupation_2_2015 == . & occupation_3_2015 == . & occupation_4_2015 == .



// For people who have 1 job when they are 32
replace 	howmanyjobs = 1 if occupation_1_2011 != . & yearatage32 == 2012 & occupation_2_2011 == . 
replace 	howmanyjobs = 1 if occupation_1_2013 != . & yearatage32 == 2013 & occupation_2_2013 == . 
replace 	howmanyjobs = 1 if occupation_1_2013 != . & yearatage32 == 2014 & occupation_2_2013 == . 
replace 	howmanyjobs = 1 if occupation_1_2015 != . & yearatage32 == 2015 & occupation_2_2015 == . 
replace 	howmanyjobs = 1 if occupation_1_2015 != . & yearatage32 == 2016 & occupation_2_2015 == . 

replace 	howmanyjobs = 1 if occupation_1_2011 == . & yearatage32 == 2012 & occupation_2_2011 != . 
replace 	howmanyjobs = 1 if occupation_1_2013 == . & yearatage32 == 2013 & occupation_2_2013 != . 
replace 	howmanyjobs = 1 if occupation_1_2013 == . & yearatage32 == 2014 & occupation_2_2013 != . 
replace 	howmanyjobs = 1 if occupation_1_2015 == . & yearatage32 == 2015 & occupation_2_2015 != . 
replace 	howmanyjobs = 1 if occupation_1_2015 == . & yearatage32 == 2016 & occupation_2_2015 != .

// For people who have 2 job when they are 32
replace 	howmanyjobs = 2 if occupation_1_2011 != . & occupation_2_2011 != . & yearatage32 == 2012 & occupation_3_2011 == . 
replace 	howmanyjobs = 2 if occupation_1_2013 != . & occupation_2_2013 != . & yearatage32 == 2013 & occupation_3_2013 == . 
replace 	howmanyjobs = 2 if occupation_1_2013 != . & occupation_2_2013 != . & yearatage32 == 2014 & occupation_3_2013 == . 
replace 	howmanyjobs = 2 if occupation_1_2015 != . & occupation_2_2015 != . & yearatage32 == 2015 & occupation_3_2015 == . 
replace 	howmanyjobs = 2 if occupation_1_2015 != . & occupation_2_2015 != . & yearatage32 == 2016 & occupation_3_2015 == . 

// For people who have 3 job when they are 32
replace 	howmanyjobs = 3 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . & yearatage32 == 2012 & occupation_4_2011 == . 

replace 	howmanyjobs = 3 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & yearatage32 == 2013 & occupation_4_2013 == . 

replace 	howmanyjobs = 3 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & yearatage32 == 2014 & occupation_4_2013 == . 

replace 	howmanyjobs = 3 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & yearatage32 == 2015 & occupation_4_2015 == . 

replace 	howmanyjobs = 3 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & yearatage32 == 2016 & occupation_4_2015 == . 

// For people who have 4 job when they are 32
replace 	howmanyjobs = 4 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . &  occupation_4_2011 != . & yearatage32 == 2012 & occupation_5_2011 == . 

replace 	howmanyjobs = 4 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & yearatage32 == 2013 & occupation_5_2013 == . 

replace 	howmanyjobs = 4 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & yearatage32 == 2014 & occupation_5_2013 == . 

replace 	howmanyjobs = 4 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & yearatage32 == 2015 & occupation_5_2015 == . 

replace 	howmanyjobs = 4 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & yearatage32 == 2016 & occupation_5_2015 == . 

// For people who have 5 job when they are 32
replace 	howmanyjobs = 5 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . &  occupation_4_2011 != . & occupation_5_2011 != . & yearatage32 == 2012 & occupation_6_2011 == . 

replace 	howmanyjobs = 5 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & yearatage32 == 2013 & occupation_6_2013 == . 

replace 	howmanyjobs = 5 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & yearatage32 == 2014 & occupation_6_2013 == . 

replace 	howmanyjobs = 5 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . &  occupation_5_2015 != . & yearatage32 == 2015 & occupation_6_2015 == . 

replace 	howmanyjobs = 5 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & occupation_5_2015 != . & yearatage32 == 2016 & occupation_6_2015 == . 

// For people who have 6 job when they are 32
replace 	howmanyjobs = 6 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . &  occupation_4_2011 != . & occupation_5_2011 != . & occupation_6_2011 != . & yearatage32 == 2012 & occupation_7_2011 == . 

replace 	howmanyjobs = 6 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & yearatage32 == 2013 & occupation_7_2013 == . 

replace 	howmanyjobs = 6 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & yearatage32 == 2014 & occupation_7_2013 == . 

replace 	howmanyjobs = 6 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . &  occupation_5_2015 != . & occupation_6_2015 != . & yearatage32 == 2015 & occupation_7_2015 == . 

replace 	howmanyjobs = 6 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & occupation_5_2015 != . & occupation_6_2015 != . & yearatage32 == 2016 & occupation_7_2015 == . 

// For people who have 7 job when they are 32
replace 	howmanyjobs = 7 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . &  occupation_4_2011 != . & occupation_5_2011 != . & occupation_6_2011 != .  & occupation_7_2011 != . & yearatage32 == 2012 & occupation_8_2011 == . 

replace 	howmanyjobs = 7 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & occupation_7_2013 != . & yearatage32 == 2013 & occupation_8_2013 == . 

replace 	howmanyjobs = 7 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & occupation_7_2013 != . & yearatage32 == 2014 & occupation_8_2013 == . 

replace 	howmanyjobs = 7 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . &  occupation_5_2015 != . & occupation_6_2015 != . & occupation_7_2015 != . & yearatage32 == 2015 & occupation_8_2015 == . 

replace 	howmanyjobs = 7 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & occupation_5_2015 != . & occupation_6_2015 != .  & occupation_7_2015 != . & yearatage32 == 2016 & occupation_8_2015 == . 

// For people who have 8 job when they are 32
replace 	howmanyjobs = 8 if occupation_1_2011 != . & occupation_2_2011 != . &  occupation_3_2011 != . &  occupation_4_2011 != . & occupation_5_2011 != . & occupation_6_2011 != .  & occupation_7_2011 != . & occupation_8_2011 != . & yearatage32 == 2012 & occupation_9_2011 == . 

replace 	howmanyjobs = 8 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & occupation_7_2013 != . & occupation_8_2013 != . & yearatage32 == 2013 & occupation_9_2013 == . 

replace 	howmanyjobs = 8 if occupation_1_2013 != . & occupation_2_2013 != . & occupation_3_2013 != . & occupation_4_2013 != . & occupation_5_2013 != . & occupation_6_2013 != . & occupation_7_2013 != . & occupation_8_2013 != . & yearatage32 == 2014 & occupation_9_2013 == . 

replace 	howmanyjobs = 8 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . &  occupation_5_2015 != . & occupation_6_2015 != . & occupation_7_2015 != . & occupation_8_2015 != . & yearatage32 == 2015 & occupation_9_2015 == . 

replace 	howmanyjobs = 8 if occupation_1_2015 != . & occupation_2_2015 != . & occupation_3_2015 != . & occupation_4_2015 != . & occupation_5_2015 != . & occupation_6_2015 != .  & occupation_7_2015 != . & occupation_8_2015 != . & yearatage32 == 2016 & occupation_9_2015 == . 

replace 	howmanyjobs = 9 if howmanyjobs == .


tab howmanyjobs, m
restore 
*/
// There turns out to be almost %30 without job, this doesn't match no employment/parttime/fulltime employment outcomes. I should check the birth year?
// I checked but I couldn't understand. Let me just leave it as it is, this might be related to self employment and not having a code.
// what do I do?
// Also, some codes are same within the same year. Identify some
// Follow up: This how many jobs variable is unnecessary after doing the match with occupational scores in 12_occeduc_occ










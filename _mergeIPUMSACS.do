
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


/*keep YEMP*
	
keep YEMP_OCCODE_2002_01_2010
recode YEMP_OCCODE_2002_01_2010 (-5/-3 = 99999)
rename YEMP_OCCODE_2002_01_2010 occ2010
contract occ2010
sort occ2010
gen occnum10 = occ2010
*/


rename YEMP_OCCODE_2002_01_2002 occ2010
save "$temp/NLSY97occ", replace

clear

use "$temp/ipumsoccpoolfinal"
merge m:m occ2010 using "$temp/NLSY97occ", force


*drop YEMP_OCCODE_2002_*_199* YEMP_OCCODE_2002_*_2000 YEMP_OCCODE_2002_*_2001 YEMP_OCCODE_2002_*_2002 YEMP_OCCODE_2002_*_2003 YEMP_OCCODE_2002_*_2004

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

********** Occupations ************

forvalues y=2005/2011{
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_`y' (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_`w'_`y')
			label define occupation_`w'_`y' ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///
			
	label val occupation_`w'_`y' occupation_`w'_`y'

	}
}



**** 2011 - rositem 13 ***
		recode YEMP_OCCODE_2002_13_2011 (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_13_2011)
			label define occupation_13_2011 ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///
			
	label val occupation_13_2011 occupation_13_2011





**** 2013 ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2013 (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_`w'_2013)
			label define occupation_`w'_2013 ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///
			
	label val occupation_`w'_2013 occupation_`w'_2013
	}


**** 2015 ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2015 (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_`w'_2015)
			label define occupation_`w'_2015 ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///
		
	label val occupation_`w'_2015 occupation_`w'_2015
	}

	

**** 2017a ***
	forvalues w=1/9 {
		recode YEMP_OCCODE_2002_0`w'_2017 (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_`w'_2017)
			label define occupation_`w'_2017 ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///
	
	label val occupation_`w'_2017 occupation_`w'_2017
	}
	

**** 2017b ***
	forvalues w=10/14 {
		recode YEMP_OCCODE_2002_`w'_2017 (10/430=0)(500/950=1)(1000/1240=2)(1300/1560=3)(1600/1980=4)(2000/2060=5)(2100/2150=6) ///
			(2200/2550=7)(2600/2960=8)(3000/3540=9)(3600/3650=10)(3700/3950=11)(4000/4160=12)(4200/4250=13)(4300/4650=14) ///
			(4700/4965=15)(5000/5940=16)(6000/6130=17)(6200/6940=18)(7000/7630=19)(7700/8965=20)(9000/9750=21)(9800/9840=22)(9920/9990=23)(-5/-3=.), gen(occupation_`w'_2017)
			label define occupation_`w'_2017 ///
			0 "Management, Business, Science, and Arts" ///
			1 "Business Operations & Financial Specialists" ///
			2 "Computer and Mathematical" ///
			3 "Architecture,  Engineering and related Technicians" ///
			4 "Life, Physical, and Social Science" ///
			5 "Community and Social Services" ///
			6 "Legal" ///
			7 "Teachers, Education, Training, and Library" ///
			8 "Arts, Design, Entertainment, Sports, and Media Workers" ///
			9 "Healthcare Practitioners and Technicians" ///
			10 "Healthcare Technical Support" /// 
			11 "Protective Service" ///
			12 "Food Preparation and Serving" ///
			13 "Building and Grounds Cleaning and Maintenance" ///
			14 "Personal Care and Service" ///
			15 "Sales and related" ///
			16 "Office and Administrative Support Workers" ///
			17 "Farming, Fishing and Foresty" ///
			18 "Construction Trades and ExtractionWorkers" ///
			19 "Installation, Maintenance, and Repair" ///
			20 "Production" ///
			21 "Transportation and Material Moving Workers" ///
			22 "Military Specific" ///
			23 "Unemployed (no occupation for 5+ years) or Never Worked" ///

	label val occupation_`w'_2017 occupation_`w'_2017
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


/*// What is their occupation at age 32 - take a simple approach and got whatever they have as in their occupation_1_YEAR
gen 			occupation32 = .
replace         occupation32 = occupation_1_2011 if yearatage32 == 2012 // 1980 
replace         occupation32 = occupation_1_2013 if yearatage32 == 2013 // 1981 
replace         occupation32 = occupation_1_2013 if yearatage32 == 2014 // 1982
replace         occupation32 = occupation_1_2015 if yearatage32 == 2015 // 1983
replace         occupation32 = occupation_1_2015 if yearatage32 == 2016 // 1984*/


use		"$temp/nlsy_occupa", clear

// Create a dummy to signify if that occupation is high education required or not:
// this below code doesnt work because I dont specify for age groups

// 2011 and 1980 borns

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

// this gets the highest (which is 1 in this dummy case) educ-occ level and creates a new variable. I would still have to finalize and have a single varaible like education_level of occupation at age 32.
// this brings their maximum value in that given year. howver an accoupation having a higher value doesn't mean that it is higher educ. so I need to fix this. 
// Followup: this is redundant now, I used above longer version
egen 	educ_occu_levelat3280 = rowmax(occupation_*_2011) if yearatage32 == 2012
egen	educ_occu_levelat3281 = rowmax(occupation_*_2013) if yearatage32 == 2013
egen	educ_occu_levelat3282 = rowmax(occupation_*_2013) if yearatage32 == 2014
egen	educ_occu_levelat3283 = rowmax(occupation_*_2015) if yearatage32 == 2015	
egen	educ_occu_levelat3284 = rowmax(occupation_*_2015) if yearatage32 == 2016	

//new
egen 	occ_educ_at32 = rowmax(educ_occu_levelat*) // this finally give me what their occupation are when they were 32 at it looks at each round corresponding the year that they turn into 32 and 

// assign the dummy to the values


	
save "$temp/hitaNLSY_occupations", replace

*use			"$temp/hitaNLSY_occupations", clear
*merge 		m:1 occupation using "$temp/ipumsocc_educlevel"

save "$temp/hitaNLSY_occupations", replace

log close

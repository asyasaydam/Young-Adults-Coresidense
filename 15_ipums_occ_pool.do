********************************************************************************
* Occupations and education level
* IPUMS 2006-2019 ACS
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: identify levels of education based on occupation
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/ipumsoccup_`logdate'.log", t replace
use 		"$created_data/ipums3_extract", clear

keep 		if year >= 2012 & year < 2017  	// I restrict it to these years as the cohort of 80-84 turns into 32
											// Follow up: Now that I downloaded new data from IPUMS this doesn't delete anything

											
keep 		if age >14 & age<40	
				
save 		"$temp/ipumsoccpoolage", replace
*keep 		if sex == 1

// What I wrote earlier in another do file yet didn't follow here: Following Michael Schultz (2021 working paper) I restrict the analysis to workers who are working age, 25-54. Education and transition to work complicate the analysis. ALSO in my own analysis, since I start the clock at 24, it makes sense to keep this age group


*keep 		year sample serial perwt hhwt cluster strata gq occ occsoc occscore sex age educd occ2010 pernum

*gen 		id = (serial*10) + pernum // I created unique id for every individual

use 		"$temp/ipumsoccpoolage", clear

//recode education//

recode 		educd (0/61=0)(62/64=1)(65/71=2)(81=3)(101/116=4), gen(education)
label 		define education 0 "Less than HS" 1 "High school or GED" 2 "Some college, no degree" 3 "Associate's Degree" 4 "Bachelor's degree or more"
label 		val education education


// categorize age

recode		age (0/13=0)(14/18=1)(19/23=2)(24/29=3)(30/39=4)(40/59=5)(60/99=6), gen(age_cat)
label 		define age_cat 0 "Child" 1 "Adolescence" 2 "Youth" 3 "Young-Young Adult" 4 "Old-Young Adult" 5 "Adult" 6 "Old-Adult"
label 		val age_cat age_cat

save 		"$temp/ipumsoccpool", replace
use 		"$temp/ipumsoccpool", clear


** browse how self employed is coded in occ2010
browse 		classwkr classwkrd occ2010

** generate a new value for occ2010 to represent the self employed
** just figure out the educational score of self-employed
preserve
// Feb 23: Should I filter this all for men since we changed our focus? 
*keep		if sex == 1					// to only see for males
contract 	classwkr education 
reshape 	wide _freq, i(classwkr) j(education) // Reshape the data to wide to have education frequencies next to each other so that I can create additional variable using rowtotal option

egen		rowsum = rowtotal(_freq*) 

generate	lessthanHS		= _freq0/rowsum
generate	HSorGED			= _freq1/rowsum
generate	somecollege		= _freq2/rowsum
generate	associatedeg	= _freq3/rowsum
generate	collegedeg		= _freq4/rowsum
egen		occupationaleduc = rowtotal(*deg) // this is arbitrary since in your education construction variable you have associate degree as some college but here it is included in college degree

tab occupationaleduc


generate	 occedcuselfemp = .3706742 // this is the value that I find for self-employed. I can apply this to NLSY. I apply this in do file 13_ipums_nlsy_merge
generate	 occedcusalarywork = .3703094  // I can use the average value of salary worker again in NLSY for people who don't seem to have an occ but identified as salary worker

restore 
save 		"$temp/ipumsoccpoolslf", replace
use 		"$temp/ipumsoccpoolslf", clear


contract 	occ2010 education 
reshape 	wide _freq, i(occ2010) j(education) // Reshape the data to wide to have education frequencies next to each other so that I can create additional variable using rowtotal option

egen		rowsum = rowtotal(_freq*) 

generate	lessthanHS		= _freq0/rowsum
generate	HSorGED			= _freq1/rowsum
generate	somecollege		= _freq2/rowsum
generate	associatedeg	= _freq3/rowsum
generate	collegedeg		= _freq4/rowsum
egen		occupationaleduc = rowtotal(*deg)

tab occupationaleduc if occ2010 == 9920 // unemployed

generate	diffocced =  occupationaleduc - collegedeg // this is to see what happens if we wanted to differentiate between college and less
sort 		diffocced

summarize	occupational*

sort 		occupationaleduc

*recode     	occ2010 (7315=7310)(6515=6510)(8965=8960)(6765=6760)(6005=6000)(205=200)(6355=6350)(4965=4960)(5165=5160)(2825=2820)


*gen 	occ3dig  = occ2010
*gen		occ3digg = occ3dig / 10
*label 	define occ3digg 731 "Heating, Air Conditioning, and Refrigeration Mechanics and Installers"

*browse occ3digg occ2010 occupationaleduc

tab occupationaleduc 
// I cant use weights after contract I guess.

save 		"$temp/ipumsoccpoolfinal", replace

keep occ2010 occupationaleduc

save 		"$temp/ipumsoccpoolfinal", replace


generate occnum = occ2010
browse
sort occupationaleduc
sort occnum
browse


save 		"$temp/ipumsoccpoolfinaltomerge", replace








************************************************
************************************************
**** After reviewer suggestion
************************************************
************************************************
clear
use 		"$created_data/ipums3_extract", clear

										
keep 		if age >=24 & age<40	// KEY CHANGE			
save 		"$temp/ipumsoccpoolage2440", replace
*keep 		if sex == 1

recode 		educd (0/61=0)(62/64=1)(65/71=2)(81=3)(101/116=4), gen(education)
label 		define education 0 "Less than HS" 1 "High school or GED" 2 "Some college, no degree" 3 "Associate's Degree" 4 "Bachelor's degree or more"
label 		val education education


// categorize age

recode		age (0/13=0)(14/18=1)(19/23=2)(24/29=3)(30/39=4)(40/59=5)(60/99=6), gen(age_cat)
label 		define age_cat 0 "Child" 1 "Adolescence" 2 "Youth" 3 "Young-Young Adult" 4 "Old-Young Adult" 5 "Adult" 6 "Old-Adult"
label 		val age_cat age_cat

save 		"$temp/ipumsoccpool2440", replace
use 		"$temp/ipumsoccpool2440", clear


** browse how self employed is coded in occ2010
browse 		classwkr classwkrd occ2010

** generate a nwe value for occ2010 to represent the self employed
** just figure out the educational score of self-employed
preserve 
contract 	classwkr education 
reshape 	wide _freq, i(classwkr) j(education) // Reshape the data to wide to have education frequencies next to each other so that I can create additional variable using rowtotal option

egen		rowsum = rowtotal(_freq*) 

generate	lessthanHS		= _freq0/rowsum
generate	HSorGED			= _freq1/rowsum
generate	somecollege		= _freq2/rowsum
generate	associatedeg	= _freq3/rowsum
generate	collegedeg		= _freq4/rowsum
egen		occupationaleduc = rowtotal(*deg)

tab occupationaleduc


generate	 occedcuselfemp = .4170913 // this is the value that I find for self-employed. I can apply this to NLSY. I apply this in do file 13_ipums_nlsy_merge
generate	 occedcusalarywork = .4773635  // I can use the average value of salary worker again in NLSY for people who don't seem to have an occ but identified as salary worker

restore 

contract 	occ2010 education 
reshape 	wide _freq, i(occ2010) j(education) // Reshape the data to wide to have education frequencies next to each other so that I can create additional variable using rowtotal option

egen		rowsum = rowtotal(_freq*) 

generate	lessthanHS		= _freq0/rowsum
generate	HSorGED			= _freq1/rowsum
generate	somecollege		= _freq2/rowsum
generate	associatedeg	= _freq3/rowsum
generate	collegedeg		= _freq4/rowsum
egen		occupationaleduc = rowtotal(*deg)

tab occupationaleduc if occ2010 == 9920 // unemployed

generate	diffocced =  occupationaleduc - collegedeg // this is to see what happens if we wanted to differentiate between college and less
sort 		diffocced

summarize	occupational*
sort 		occupationaleduc

tab occupationaleduc 
save 		"$temp/ipumsoccpoolfinal2440", replace

keep occ2010 occupationaleduc

save 		"$temp/ipumsoccpoolfinal2440", replace


generate occnum = occ2010
browse
sort occupationaleduc
sort occnum
browse

save 		"$temp/ipumsoccpoolfinaltomerge2440", replace






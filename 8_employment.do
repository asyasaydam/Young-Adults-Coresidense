********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Construct employment variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021
********************************************************************************

* Purpose: This file constructs for the employment


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97employ_`logdate'.log", t replace



use "$created_data/NLSY97_rename", clear

*drop EMP_STATUS_199* EMP_STATUS_2000* EMP_STATUS_2001* EMP_STATUS_2002* 
 
 
******* Employment *************

// I did this in two steps:
*1) for first 9 weeks - stata didn't recognize the w=01 so I added that to the first recode command
*2) for the rest I did separately* 

// I merged everyone to either employed or unemployed
// Drop those that are in military service (this would not automatically drop ///
/// one person that is in military service in a year from the whole, right? ///
/// in case I keep it and then maybe filter? nv i wont drop them since each year each week is a variable)

// Employment variables look like
*0: No information reported to account for week; job dates indeterminate
*1: Not associated with an employer, not actively searching for an employer job
*2: Not working (unemployment vs. out of labor force cannot be determined)
*3: Associated with an employer, periods not working for the employer are missing
*4: Unemployed
*5: Out of the labor force
*6: Active military service



// I wrote the logic of the following below, after employmentsum calculation
forvalues w=36/39 {
	replace  EMP_STATUS_2018_`w'_XRND = EMP_STATUS_2018_40_XRND
}
			

forvalues y=1995/2019{
	forvalues w=1/9{
		recode EMP_STATUS_`y'_0`w'_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_`y'_`w')
			label define employment_`y'_`w' 0 "Unemployed/Out of the labor force" 1 "Employed"  
			label values employment_`y'_`w' employment_`y'_`w'
			*drop if employment_`y'_`w' == 2 // drop those that are in military // I added military to employment
			*drop if employment_`y'_`w' == -4 // drop valid skips
			}
}


forvalues y= 1995/2019 {
	forvalues w=10/52 {
		recode EMP_STATUS_`y'_`w'_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_`y'_`w')
		label define employment_`y'_`w' 0 "Unemployed/Out of the labor force" 1 "Employed" 
		label values employment_`y'_`w' employment_`y'_`w'
		*drop if employment_`y'_`w' == 2 // drop those that are in military / I added military to employment
		*drop if employment_`y'_`w' == -4 // drop valid skips
	}
}


// Years that have 53 week
		recode EMP_STATUS_2000_53_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_2000_53)
		recode EMP_STATUS_2005_53_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_2005_53)
		recode EMP_STATUS_2011_53_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_2011_53)
		recode EMP_STATUS_2016_53_XRND (-4/-1=.)(0/2=0)(4/5=0)(3=1)(9701/201909=1)(6=1)(5=0), gen(employment_2016_53)



save "$temp/hitaNLSY_employment", replace

**# Bookmark #1
use "$temp/hitaNLSY_employment", clear

// calculate for the sum of weeks in each year

forvalues y=1995/2019 {
	egen employmentsum`y' = rowtotal(employment_`y'_*), missing	
	}


//  I don't know what to do for some people who have missing variables for some years. ///
//  I guess since I am interested if the total is 52 as in a stable employment ///
//	situation at the age of 33 I don't care if its less than 52?
//	Follow up: NO! I think this will matter, but don't know how to get at it. 


/// After I sum employmentsum* I expect to have each year maximum to 52 thinking 
/// that at least there must be 1 person who was employed all throught the year, 
/// 2018 was the only year with a max of 48. And then I realized that for weeks 37,38,39 
/// everyone is missing! I decided to impute this to what the 40th week had thinking that there 
/// was an error. Interestingly only on 1 person (ID=1041) had observations for week 36,37,38,39.
/// That persons observation is out of the labor force for  36...40.
/// So I will copy the following above, before calculation of employmentsum to make sure that
/// those weeks also are counted and I have a sum of 52 hopefully for 2018/
/// FOLLOW-UP: later I found the only ID to be 1624 and the code is 201701 for weeks 36-37 for this person.


/*forvalues w=36/39 {
	replace  EMP_STATUS_2018_`w'_XRND = EMP_STATUS_2018_40_XRND
}*/
		

forvalues y=1995/2019 {
	gen 		employed`y' =.
	replace 	employed`y'= 1 if employmentsum`y' > 0 & employmentsum`y' != .
	replace 	employed`y'= 0 if employmentsum`y'== 0
	label 		define  employed`y' 0 "Not employed" 1 "Employed" 
	label 		values  employed`y'  employed`y'
	}


	gen 	employedat32 = .
	replace	employedat32 = employed2012 if BYEAR == 1980
	replace	employedat32 = employed2013 if BYEAR == 1981
	replace	employedat32 = employed2014 if BYEAR == 1982
	replace	employedat32 = employed2015 if BYEAR == 1983
	replace employedat32 = employed2016 if BYEAR == 1984	
	label 	define employedat32 0 "Not employed" 1 "Employed"
	label 	values employedat32 employedat32

	gen 	employedat24 = .
	replace	employedat24 = employed2004 if BYEAR == 1980
	replace	employedat24 = employed2005 if BYEAR == 1981
	replace	employedat24 = employed2006 if BYEAR == 1982
	replace	employedat24 = employed2007 if BYEAR == 1983
	replace employedat24 = employed2008 if BYEAR == 1984	
	label 	define employedat24 0 "Not employed" 1 "Employed"
	label 	values employedat24 employedat24
		


********************************************************************************
********************* NEW VARIABLE ABOUT EMPLOYMENT ****************************
********************************************************************************
/// there are 41 of these CVC_WKSWK_YR_ALL_*: I assume they each represent each 
/// year in the survey

//  CVC_HOURSWK_YR_ALL

// I will follow the steps that I did previously and then compare it to what I did

*use "$temp/hitaNLSY_employmentold", clear


*1) Recode CVC Weeks worked variables to a simpler one
forvalues w=00/09{
	recode CVC_WKSWK_YR_ALL_0`w'_XRND (-4/-3=.)(53=52), gen (weekswork200`w')
}

forvalues w=10/19{
	recode CVC_WKSWK_YR_ALL_`w'_XRND (-4/-3=.)(53=52), gen (weekswork20`w')
}

forvalues w=80/99{
	recode CVC_WKSWK_YR_ALL_`w'_XRND (-4/-3=.)(53=52), gen (weekswork19`w')
}


*2) Recode CVC hours worked a year into a simple one

forvalues w=00/09{
	recode CVC_HOURS_WK_YR_ALL_0`w'_XRND (-4/-3=.), gen (hourswork200`w')
}

forvalues w=10/19{
	recode CVC_HOURS_WK_YR_ALL_`w'_XRND (-4/-3=.), gen (hourswork20`w')
}

forvalues w=80/99{
	recode CVC_HOURS_WK_YR_ALL_`w'_XRND (-4/-3=.), gen (hourswork19`w')
}


*3) Create yearly average variable 

/// Oppenheimer et al.: we divided the NLSY variable on hours worked since the
/// last interview by the number of weeks worked since the last interview. 
/// Where information was lacking in an interview, we substituted the information for calendar year

*--> I am not using the NLSY variable that is on hours worked since last interview, 
/// instead I am using the cross rounds

** the below calculates for average hours worked per week over the year. These can be topcoded but what is the benefit to me?
forvalues y=1980/2019{
gen 	hoursworkedpw`y' = (hourswork`y' / weekswork`y')
gen 	weekhourstat`y' = (hourswork`y' / 52) // This is not exactly what I need: Follow-up 9.5.23: This line was not in the old one, however, I also remember not using this. 
}

// This hoursworkedpw is basically hours worked per week!

corr hoursworkedpw2019 weekhourstat2019
browse hoursworkedpw2019 weekhourstat2019

browse hoursworkedpw2019 weekhourstat2019 if hoursworkedpw2019 > weekhourstat2019 & weekhourstat2019 <21 & hoursworkedpw2019 > 20



forvalues y=1980/2019{
replace 	hoursworkedpw`y' = 0 if hourswork`y' == 0 & weekswork`y' == 0
}

save "$temp/hitaNLSY_employment_ax", replace
use "$temp/hitaNLSY_employment_ax", clear

// I also checked for cases where it might be weeksworked 0 and yearempstat missing because the denominator is zero basically. 

*4) Create the part-year/full-year employment
// First create a variable that is %85 of weeks worked (Oppenheimer et al.)
// How did I find 44.2? 52*.85 = 44.2
// This is basically saying that if someone worked around 44 weeks and more
// they are coded as having worked full year employment.


// Follow up: 9.5.23: Apparently this is what I did earlier which is weird because I was pretty sure I didnt only had weeksworked here, but perhaps I did. 
// I will still have to change (variable name) to be able to compare the results.
// Follow up: 9.8.23: I do have them, but have them below.

forvalues y=1980/2019{
	generate  	fullpartyearemployment_old`y' = .
	replace 	fullpartyearemployment_old`y' = 0 if weekswork`y' == 0
	replace 	fullpartyearemployment_old`y' = 1 if weekswork`y' < 44.2 & weekswork`y' != 0 & weekswork`y' != .
	replace 	fullpartyearemployment_old`y' = 2 if weekswork`y' > 44.2 & weekswork`y' != .
	label 		define fullpartyearemployment_old`y' 0 "No employment" 1 "Part-year employment" 2 "Full-year employment"
	label 		values fullpartyearemployment_old`y' fullpartyearemployment_old`y'
}



// Follow-up:9.5.23: The following coding is what I did after R&R. 
// Follow-up: 9.8.23: I added & hoursworkedpw`y' != . to the line 251, the 3rd item, replace 	fullpartyearemployment`y' = 3 

forvalues y=1980/2019{
	generate  	fullpartyearemployment`y' = .
	replace 	fullpartyearemployment`y' = 0 if weekswork`y' == 0 & hoursworkedpw`y' == 0
	replace 	fullpartyearemployment`y' = 1 if weekswork`y' <= 44.2 & weekswork`y' > 0 & weekswork`y' != . & hoursworkedpw`y' < 35 & hoursworkedpw`y' != . // part year parttime
	replace 	fullpartyearemployment`y' = 2 if weekswork`y' <= 44.2 & weekswork`y' > 0 & weekswork`y' != . & hoursworkedpw`y' >= 35 & hoursworkedpw`y' != . // part year full time
	replace 	fullpartyearemployment`y' = 2 if weekswork`y' <= 44.2 & weekswork`y' > 0 & weekswork`y' != . & hoursworkedpw`y' >= 35 & hoursworkedpw`y' != . // part year full time
	replace 	fullpartyearemployment`y' = 3 if weekswork`y' > 44.2 & weekswork`y' != . & hoursworkedpw`y' <= 35 & hoursworkedpw`y' != .
	replace 	fullpartyearemployment`y' = 4 if weekswork`y' > 44.2 & weekswork`y' != . & hoursworkedpw`y' > 35 & hoursworkedpw`y' != .
	label 		define fullpartyearemployment`y' 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Full year part time empl" 4"Full-year full time employment"
	label 		values fullpartyearemployment`y' fullpartyearemployment`y'
}




// Follow up: 9.5.23: this is perhaps what I did way in the past - and not ever use it again, it is not taking into account hours worked per week. 
/*
********************* compare to the old ***************************************
 forvalues 	y=1995/2019 {
	generate  	fullpartyearemp`y' = .
	replace 	fullpartyearemp`y' = 0 if employmentsum`y' == 0 
	replace 	fullpartyearemp`y' = 1 if employmentsum`y' < 44.2 & employmentsum`y' != 0 & employmentsum`y' != .
	replace 	fullpartyearemp`y' = 2 if employmentsum`y' > 44.2 & employmentsum`y' != .
	label 		define fullpartyearemp`y' 0 "No employment" 1 "Part-year employment" 2 "Full-year employment"
	label 		values fullpartyearemp`y' fullpartyearemp`y'
}
*/
********************* compare to the old ***************************************

// I compared this variable to the one I created above (fullpartyearemp`y) for year 2019
// There are 42 differences except missings
// The old variable did not have missings because of egen that I do to calculate employmentsum
// The missings in the 2019 are 1100 which is %15 and high above the average of other years
// Look it up with mdesc fullpartyearemployment*. 
// Until 2017 missings are below %10
// This might not be an issue considering that I would not be using these years.
// But still worth noting.


*5) Create another variable showing if yearly employment is part time or not
/*
forvalues y=1980/2019{
	recode 		hoursworkedpw`y' (0=0)(0.1/35=1)(35.01/333=2), gen(yearempstat`y')
	label 		define yearempstat`y' 0 "Not employed" 1 "Part-time work" 2 "Full-time work"
	label 		val yearempstat`y' yearempstat`y'
}
*/
// I wrote the upper limit (333) based on the highest number of hours that I see among the years



			
/*/
*6) Finally Oppenheimer et al's four categorization
(l) no employment during the year; 
(2) part-time employment (working fewer than 35 hours per week, on average), whether the work is full-year or part-year;
(3) full-time employment that is part year;
(4) year-round full-time employment.
*/

*drop employmentstatus*

/*
forvalues y=1980/2019{
	generate 	employmentstatus`y' = .
	replace 	employmentstatus`y' = 0 if yearempstat`y' == 0 & fullpartyearemployment`y' == 0
	replace 	employmentstatus`y' = 1 if yearempstat`y' == 1 & fullpartyearemployment`y' == 1
	replace 	employmentstatus`y' = 1 if yearempstat`y' == 1 & fullpartyearemployment`y' == 2
	replace 	employmentstatus`y' = 2 if yearempstat`y' == 2 & fullpartyearemployment`y' == 1
	replace 	employmentstatus`y' = 3 if yearempstat`y' == 2 & fullpartyearemployment`y' == 2
	label 		define employmentstatus`y' 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
	label 		val employmentstatus`y' employmentstatus`y'
}
*/


* extra step

* replace fullpartyearemployment with employmentstatus
forvalues y=1980/2019{
rename fullpartyearemployment`y' employmentstatus`y' 
}

*6) Finally employment status by age 

generate	empstatge15 = .
replace 	empstatge15 = employmentstatus1995 if BYEAR == 1980
replace 	empstatge15 = employmentstatus1996 if BYEAR == 1981
replace 	empstatge15 = employmentstatus1997 if BYEAR == 1982
replace 	empstatge15 = employmentstatus1998 if BYEAR == 1983
replace 	empstatge15 = employmentstatus1999 if BYEAR == 1984
label 		define empstatge15 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge15 empstatge15


generate	empstatge16 = .
replace 	empstatge16 = employmentstatus1996 if BYEAR == 1980
replace 	empstatge16 = employmentstatus1997 if BYEAR == 1981
replace 	empstatge16 = employmentstatus1998 if BYEAR == 1982
replace 	empstatge16 = employmentstatus1999 if BYEAR == 1983
replace 	empstatge16 = employmentstatus2000 if BYEAR == 1984
label 		define empstatge16 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge16 empstatge16


generate	empstatge17 = .
replace 	empstatge17 = employmentstatus1997 if BYEAR == 1980
replace 	empstatge17 = employmentstatus1998 if BYEAR == 1981
replace 	empstatge17 = employmentstatus1999 if BYEAR == 1982
replace 	empstatge17 = employmentstatus2000 if BYEAR == 1983
replace 	empstatge17 = employmentstatus2001 if BYEAR == 1984
label 		define empstatge17 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge17 empstatge17


generate	empstatge18 = .
replace 	empstatge18 = employmentstatus1998 if BYEAR == 1980
replace 	empstatge18 = employmentstatus1999 if BYEAR == 1981
replace 	empstatge18 = employmentstatus2000 if BYEAR == 1982
replace 	empstatge18 = employmentstatus2001 if BYEAR == 1983
replace 	empstatge18 = employmentstatus2002 if BYEAR == 1984
label 		define empstatge18 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge18 empstatge18


generate	empstatge19 = .
replace 	empstatge19 = employmentstatus1999 if BYEAR == 1980
replace 	empstatge19 = employmentstatus2000 if BYEAR == 1981
replace 	empstatge19 = employmentstatus2001 if BYEAR == 1982
replace 	empstatge19 = employmentstatus2002 if BYEAR == 1983
replace 	empstatge19 = employmentstatus2003 if BYEAR == 1984
label 		define empstatge19 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge19 empstatge19


generate	empstatge20 = .
replace 	empstatge20 = employmentstatus2000 if BYEAR == 1980
replace 	empstatge20 = employmentstatus2001 if BYEAR == 1981
replace 	empstatge20 = employmentstatus2002 if BYEAR == 1982
replace 	empstatge20 = employmentstatus2003 if BYEAR == 1983
replace 	empstatge20 = employmentstatus2004 if BYEAR == 1984
label 		define empstatge20 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge20 empstatge20


generate	empstatge21 = .
replace 	empstatge21 = employmentstatus2001 if BYEAR == 1980
replace 	empstatge21 = employmentstatus2002 if BYEAR == 1981
replace 	empstatge21 = employmentstatus2003 if BYEAR == 1982
replace 	empstatge21 = employmentstatus2004 if BYEAR == 1983
replace 	empstatge21 = employmentstatus2005 if BYEAR == 1984
label 		define empstatge21 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge21 empstatge21


generate	empstatge22 = .
replace 	empstatge22 = employmentstatus2002 if BYEAR == 1980
replace 	empstatge22 = employmentstatus2003 if BYEAR == 1981
replace 	empstatge22 = employmentstatus2004 if BYEAR == 1982
replace 	empstatge22 = employmentstatus2005 if BYEAR == 1983
replace 	empstatge22 = employmentstatus2006 if BYEAR == 1984
label 		define empstatge22 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge22 empstatge22	



generate	empstatge23 = .
replace 	empstatge23 = employmentstatus2003 if BYEAR == 1980
replace 	empstatge23 = employmentstatus2004 if BYEAR == 1981
replace 	empstatge23 = employmentstatus2005 if BYEAR == 1982
replace 	empstatge23 = employmentstatus2006 if BYEAR == 1983
replace 	empstatge23 = employmentstatus2007 if BYEAR == 1984
label 		define empstatge23 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge23 empstatge23	


generate	empstatge24 = .
replace 	empstatge24 = employmentstatus2004 if BYEAR == 1980
replace 	empstatge24 = employmentstatus2005 if BYEAR == 1981
replace 	empstatge24 = employmentstatus2006 if BYEAR == 1982
replace 	empstatge24 = employmentstatus2007 if BYEAR == 1983
replace 	empstatge24 = employmentstatus2008 if BYEAR == 1984
label 		define empstatge24 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge24 empstatge24	
	

generate	empstatge25 = .
replace 	empstatge25 = employmentstatus2005 if BYEAR == 1980
replace 	empstatge25 = employmentstatus2006 if BYEAR == 1981
replace 	empstatge25 = employmentstatus2007 if BYEAR == 1982
replace 	empstatge25 = employmentstatus2008 if BYEAR == 1983
replace 	empstatge25 = employmentstatus2009 if BYEAR == 1984
label 		define empstatge25 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge25 empstatge25	
			
		
generate	empstatge26 = .
replace 	empstatge26 = employmentstatus2006 if BYEAR == 1980
replace 	empstatge26 = employmentstatus2007 if BYEAR == 1981
replace 	empstatge26 = employmentstatus2008 if BYEAR == 1982
replace 	empstatge26 = employmentstatus2009 if BYEAR == 1983
replace 	empstatge26 = employmentstatus2010 if BYEAR == 1984
label 		define empstatge26 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge26 empstatge26	
		
		

generate	empstatge27 = .
replace 	empstatge27 = employmentstatus2007 if BYEAR == 1980
replace 	empstatge27 = employmentstatus2008 if BYEAR == 1981
replace 	empstatge27 = employmentstatus2009 if BYEAR == 1982
replace 	empstatge27 = employmentstatus2010 if BYEAR == 1983
replace 	empstatge27 = employmentstatus2011 if BYEAR == 1984
label 		define empstatge27 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge27 empstatge27		
		
	
generate	empstatge28 = .
replace 	empstatge28 = employmentstatus2008 if BYEAR == 1980
replace 	empstatge28 = employmentstatus2009 if BYEAR == 1981
replace 	empstatge28 = employmentstatus2010 if BYEAR == 1982
replace 	empstatge28 = employmentstatus2011 if BYEAR == 1983
replace 	empstatge28 = employmentstatus2012 if BYEAR == 1984
label 		define empstatge28 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge28 empstatge28				
			
		
generate	empstatge29 = .
replace 	empstatge29 = employmentstatus2009 if BYEAR == 1980
replace 	empstatge29 = employmentstatus2010 if BYEAR == 1981
replace 	empstatge29 = employmentstatus2011 if BYEAR == 1982
replace 	empstatge29 = employmentstatus2012 if BYEAR == 1983
replace 	empstatge29 = employmentstatus2013 if BYEAR == 1984
label 		define empstatge29 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge29 empstatge29		
		
		
generate	empstatge30 = .
replace 	empstatge30 = employmentstatus2010 if BYEAR == 1980
replace 	empstatge30 = employmentstatus2011 if BYEAR == 1981
replace 	empstatge30 = employmentstatus2012 if BYEAR == 1982
replace 	empstatge30 = employmentstatus2013 if BYEAR == 1983
replace 	empstatge30 = employmentstatus2014 if BYEAR == 1984
label 		define empstatge30 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge30 empstatge30
		
generate	empstatge31 = .
replace 	empstatge31 = employmentstatus2011 if BYEAR == 1980
replace 	empstatge31 = employmentstatus2012 if BYEAR == 1981
replace 	empstatge31 = employmentstatus2013 if BYEAR == 1982
replace 	empstatge31 = employmentstatus2014 if BYEAR == 1983
replace 	empstatge31 = employmentstatus2015 if BYEAR == 1984
label 		define empstatge31 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge31 empstatge31		
			

generate	empstatge32 = .
replace 	empstatge32 = employmentstatus2012 if BYEAR == 1980
replace 	empstatge32 = employmentstatus2013 if BYEAR == 1981
replace 	empstatge32 = employmentstatus2014 if BYEAR == 1982
replace 	empstatge32 = employmentstatus2015 if BYEAR == 1983
replace 	empstatge32 = employmentstatus2016 if BYEAR == 1984
label 		define empstatge32 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 



generate	empstatge33 = .
replace 	empstatge33 = employmentstatus2013 if BYEAR == 1980
replace 	empstatge33 = employmentstatus2014 if BYEAR == 1981
replace 	empstatge33 = employmentstatus2015 if BYEAR == 1982
replace 	empstatge33 = employmentstatus2016 if BYEAR == 1983
replace 	empstatge33 = employmentstatus2017 if BYEAR == 1984
label 		define empstatge33 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge33 empstatge33	
	
generate	empstatge34 = .
replace 	empstatge34 = employmentstatus2014 if BYEAR == 1980
replace 	empstatge34 = employmentstatus2015 if BYEAR == 1981
replace 	empstatge34 = employmentstatus2016 if BYEAR == 1982
replace 	empstatge34 = employmentstatus2017 if BYEAR == 1983
replace 	empstatge34 = employmentstatus2018 if BYEAR == 1984
label 		define empstatge34 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge34 empstatge34	
	

generate	empstatge35 = .
replace 	empstatge35 = employmentstatus2015 if BYEAR == 1980
replace 	empstatge35 = employmentstatus2016 if BYEAR == 1981
replace 	empstatge35 = employmentstatus2017 if BYEAR == 1982
replace 	empstatge35 = employmentstatus2018 if BYEAR == 1983
replace 	empstatge35 = employmentstatus2019 if BYEAR == 1984
label 		define empstatge35 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label 		val empstatge35 empstatge35
	
	
save "$temp/hitaNLSY_employment_ab1", replace
use "$temp/hitaNLSY_employment_ab1", clear



**** Create a variable that looks at all the employment between 30-34 and pulls the highest employment status
/*
local vars "empstatge30 empstatge31 empstatge32 empstatge33 empstatge34"

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for each observation
egen empstatus3034_max = rowmax(`vars')
label define empstatus3034_max 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label values empstatus3034_max empstatus3034_max
recode empstatus3034_max (1/2=1)(3=2), gen(empstatusage3034_mx)

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
****** To be able to comapre with non steady jobs
local vars "empstatge30 empstatge31 empstatge32 empstatge33 empstatge34"

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for each observation
egen empstatus3034_min = rowmin(`vars')
label define empstatus3034_min 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label values empstatus3034_min empstatus3034_min
recode empstatus3034_min (1/2=1)(3=2), gen(empstatusage3034_mn)

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for 31-33
local vars "empstatge31 empstatge32 empstatge33"
egen empstatus3133_min = rowmin(`vars')
label define empstatus3133_min 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "year round part time" 4 "Year round full time employment" 
label values empstatus3133_min empstatus3133_min
recode empstatus3133_min (1/2=1)(3=2), gen(empstatusage3133_mn)
*/


**** since age 24 is key, I will proximate age 24 employment status from age 23 and age 25

	replace empstatge24 = empstatge25 if empstatge24 == . & empstatge23 == empstatge25 // 131 changes, this is both male & female
	** Crude proximate I will fill in with age 25 observations if age 24 and age 23 is missing, I'll do the same with age 23
	replace empstatge24 = empstatge25 if empstatge24 == . & empstatge23 == . // 286
	replace empstatge24 = empstatge23 if empstatge24 == . & empstatge25 == . // 337
	replace empstatge24 = round((empstatge23 + empstatge25) / 2) if empstatge24 == . & empstatge23 != . & empstatge25 != . //51
	replace empstatge24 = empstatge22 if empstatge24 == . & empstatge23 == . & empstatge25 == . 
	
	
	
	tab empstatge32 if SEX ==1
	
	
	// Replacing 32 with the clossest steady ones first. 
	// Follow-up:  9.5.23: This muted part is perhaps what I had before the 30-34 min max one that is below, but after R&R.
	replace empstatge32 = empstatge31 if empstatge32 == . 
	replace empstatge32 = empstatge33 if empstatge32 == . 
	*replace empstatge32 = empstatge30 if empstatge32 == . 
	*replace empstatge32 = empstatge34 if empstatge32 == .
	
	
	
	// 3 categories of employment
	// merged here parttime part year with part year/full time emp.
forvalues y=15/35 {
	recode empstatge`y' (0=0)(1/3=1)(4=2), gen(empstatusage`y')
	label define empstatusage`y' 0 "No employment during the year" 1 "Part-time partyear and/or partyear full time employment and full year part time" 2 "Fulltime full year employment"
	label val empstatusage`y' empstatusage`y' 
}


	
	save "$temp/hitaNLSY_employment_a", replace
	use "$temp/hitaNLSY_employment_a", clear
	
	tab empstatge32 empstatusage32 if SEX ==1, col
	
	

	
drop employed*		
drop employmentsum*	
drop employment_*
drop employmentstatus*
*drop hrswrk*
*drop yearlyemp*
drop CVC_WKSWK_YR_ALL_*
drop CVC_HOURS_WK_YR_*
drop EMP_HOURS* // no need anymore 
drop EMP_STATUS_* // drop the old variable

save "$temp/hitaNLSY_employment", replace
log close
	
	
		
	

// I replace the missing values in the employment 32 with any 30-34 variable 
// Follow up: 9.5.23: I will mute the following paragraph for now and first do an analysis dropping all.
// Follow-up: 9.7.23: I muted it.
/*
gen employmentstat32_max = empstatusage32
label define employmentstat32_max 0 "No employment during the year" 1 "Part-time partyear and/or partyear full time employment" 2 "Fulltime full year employment"
label values employmentstat32_max employmentstat32_max
replace employmentstat32_max = empstatusage3034_mx if missing(empstatusage32)

gen employmentstat32_min = empstatusage32
label define employmentstat32_min 0 "No employment during the year" 1 "Part-time partyear and/or partyear full time employment" 2 "Fulltime full year employment"
label values employmentstat32_min employmentstat32_min
replace employmentstat32_min = empstatusage3034_mn if missing(empstatusage32)

fre empstatge32
fre	empstatusage32
fre employmentstat32_max
tab employmentstat32_min employmentstat32_max
tab empstatusage32 employmentstat32_max, m
tab empstatusage32 employmentstat32_min, m

replace empstatusage32 = employmentstat32_min if empstatusage32 == .

*/


	
* Throughout the coding, to keep as much as observations possible I did replace some missing variables with the closest observation. These were already in the original submission, but to remind myself I will write it down each. For example, if enrollment at 24 is missing, I filled them in first with age 25, and second with 23. Similarly I did this for marital status, cohabitation status, children at age 24 and 32. Similarly, if they missed citizenship at 1997, but have an observation later on, I substituted that with that years observation. I use the same logic with living arrangements at 97 and mental health. 

*  Similarly I replaced missing employment statuses at age 24 with a logic that goes like this (again this was the same in the original submission): I first replace it with employment status at age 25, if 24 is missing and if 23 and 25 are the same. Then I replace with age 25, if both 24 and 23 are missing. Then I replace it with age 23 if both 24 and 25 are missing. Then, if 23 and 25 are not the same, I round them, so  for example if someone is not employed at 23, then full time employed at 25, then they get part year full time employment that then merges with the other part time. Lastly, I replace age 24 employment with 22 if all 23, 24 and 25 is missing. 

* I was following a similar logic with employment at age 32, however, I did change the replacement in the R&R analysis process. This change mainly occured because of the suggestion to broaden the measurement of employment status to ages 32-34. I reevcaluated the replacement/substition process. I figured I can look at employment status from 30 to 34, and if 32 is missing, I would replace it with the minimum of that row meaning that if someone is employed full time at 34 but not employed at 31, then employment at 32 would be replaced by not employed. This decision was based on the fact that, if there is already a stability (missing age 32 is one factor) within these peak years of employment than proxying with the poor outcome is a better indicator. I can see that this decision can ben challenged. However, this is mainly why, the sample size has increased. 



/*
	// merged here full times whether it be full year or part year
forvalues y=15/34 {
	recode empstatge`y' (2/3=2), gen(empstatusage_alt`y')
	label define empstatusage_alt`y' 0 "No employment during the year" 1 "Part-time partyear" 2 "Fulltime full year and/or partyear full time employment"
	label val empstatusage_alt`y' empstatusage_alt`y' 
}
	*/
	
	/*
	/ 2 categories of employment where fulltime and parttime is merged
forvalues y=15/34 {
	recode empstatusage`y' (1/2=1), gen(empstatusage_bin`y')
	label define empstatusage_bin`y' 0 "No employment during the year" 1 "Part-time or full-time employment"
	label val empstatusage_bin`y' empstatusage_bin`y'
}

	// 2 categories of employment where no employment and parttime is merged
forvalues y=15/34 {
	recode empstatusage`y' (0/1=0)(2=1), gen(empstatusage_bin2_`y')
	label define empstatusage_bin2_`y' 0 "No employment/parttime during the year" 1 "Full-time employment"
	label val empstatusage_bin2_`y' empstatusage_bin2_`y'
}
*/
	

		// duration of employed years between 15 and 23
*egen 	empdur1523 = rowtotal(empstatusage_bin15 empstatusage_bin16 empstatusage_bin17 empstatusage_bin18 empstatusage_bin19 empstatusage_bin20 empstatusage_bin21 empstatusage_bin22 empstatusage_bin23), missing

		// duration of employed years between 15 and 23 with the other categorization where parttime and no emp is merged
*egen 	empdur1523_fulltime = rowtotal(empstatusage_bin2_15 empstatusage_bin2_16 empstatusage_bin2_17 empstatusage_bin2_18 empstatusage_bin2_19 empstatusage_bin2_20 empstatusage_bin2_21 empstatusage_bin2_22 empstatusage_bin2_23), missing
	
	
	// duration of employed years between 24 and 32
*egen 	empdur2432 = rowtotal(empstatusage_bin24  empstatusage_bin25 empstatusage_bin26 empstatusage_bin27 empstatusage_bin28 empstatusage_bin29 empstatusage_bin30 empstatusage_bin31 empstatusage_bin32), missing	

	// duration of employed years between 24 and 31
*egen 	empdur2431 = rowtotal(empstatusage_bin24  empstatusage_bin25 empstatusage_bin26 empstatusage_bin27 empstatusage_bin28 empstatusage_bin29 empstatusage_bin30 empstatusage_bin31), missing	

	// duration of full time employed years between 24 and 31
*egen 	empdur2431_fulltime = rowtotal(empstatusage_bin2_24  empstatusage_bin2_25 empstatusage_bin2_26 empstatusage_bin2_27 empstatusage_bin2_28 empstatusage_bin2_29 empstatusage_bin2_30 empstatusage_bin2_31), missing	


** If I use the employment status at 24 as a covariate or as a selection factor, then I think to not count age 24 situation twice, I should use 25-31 as a covariate. 
	// duration of employed years between 25 and 31
*egen 	empdur2531 = rowtotal(empstatusage_bin25 empstatusage_bin26 empstatusage_bin27 empstatusage_bin28 empstatusage_bin29 empstatusage_bin30 empstatusage_bin31), missing	

	// duration of full time employed years between 25 and 31
*egen 	empdur2531_fulltime = rowtotal(empstatusage_bin2_25 empstatusage_bin2_26 empstatusage_bin2_27 empstatusage_bin2_28 empstatusage_bin2_29 empstatusage_bin2_30 empstatusage_bin2_31), missing

	** I think when I use the number of employed years between 24 and 32 as a covariate I should use the full time employed vs. parttime or not employed. 
	** But for thepropensity score analysis when I add employment experience before age 23, it should stay as parttime and fulltime merged, since before age 23 it is not quite possible to have a full time job since education might be still going on.


*sum 	empdur2432
*sum 	empdur1523
	

		
/// For now, I would not run the following since this is only work duration. 
/*
forvalues y=2003/2019 {
	gen 	stable`y' =.
	replace stable`y'= 1 if employmentsum`y'== 52
	replace stable`y'= 0 if employmentsum`y' < 52
	*label 	define stable`y' 0 "Not stable for the year" 1 "Stable for the year" 
	*label 	values stable`y' stable`y'
	}

/*gen 		stable2018 = .
replace 	stable2018 = 1 if employmentsum2018 == 39
replace 	stable2018 = 0 if employmentsum2018 < 39
label 		define stable2018 0 "Not stable for the year" 1 "Stable for the year" 
label 		values stable2018 stable2018*/

// I have some sort of variable to show if at certain years they were stable or not. 
/// Now should I create another variable that is a combination of age 33 & employment status.

/*
forvalues y=2013/2017 {
    gen 		employmentstability33 = . 
	replace		employmentstability33 = 1 if stable`y'== 1 & yearatage33 == `y'
	replace 	employmentstability33 = 0 if stable`y'== 0 & yearatage33 == `y'
}
*/

// At age 24
gen 			employmentstability24 = .
replace         employmentstability24 = 1 if stable2004 == 1 & yearatage24 == 2004 // 1980
replace         employmentstability24 = 0 if stable2004 == 0 & yearatage24 == 2004 // 1980
replace         employmentstability24 = 1 if stable2005 == 1 & yearatage24 == 2005 // 1981
replace         employmentstability24 = 0 if stable2005 == 0 & yearatage24 == 2005 // 1981
replace         employmentstability24 = 1 if stable2006 == 1 & yearatage24 == 2006 // 1982
replace         employmentstability24 = 0 if stable2006 == 0 & yearatage24 == 2006 // 1982
replace         employmentstability24 = 1 if stable2007 == 1 & yearatage24 == 2007 // 1983
replace         employmentstability24 = 0 if stable2007 == 0 & yearatage24 == 2007 // 1983
replace         employmentstability24 = 1 if stable2008 == 1 & yearatage24 == 2008 // 1984
replace         employmentstability24 = 0 if stable2008 == 0 & yearatage24 == 2008 // 1984
 
label           define employmentstability24 0 "Not stable for the age 24" 1 "Stable for the age 24" 
label           values employmentstability24 employmentstability24



// At age 32
gen 			employmentstability32 = .
replace         employmentstability32 = 1 if stable2012 == 1 & yearatage32 == 2012 // 1980
replace         employmentstability32 = 0 if stable2012 == 0 & yearatage32 == 2012 // 1980
replace         employmentstability32 = 1 if stable2013 == 1 & yearatage32 == 2013 // 1981
replace         employmentstability32 = 0 if stable2013 == 0 & yearatage32 == 2013 // 1981
replace         employmentstability32 = 1 if stable2014 == 1 & yearatage32 == 2014 // 1982
replace         employmentstability32 = 0 if stable2014 == 0 & yearatage32 == 2014 // 1982
replace         employmentstability32 = 1 if stable2015 == 1 & yearatage32 == 2015 // 1983
replace         employmentstability32 = 0 if stable2015 == 0 & yearatage32 == 2015 // 1983
replace         employmentstability32 = 1 if stable2016 == 1 & yearatage32 == 2016 // 1984
replace         employmentstability32 = 0 if stable2016 == 0 & yearatage32 == 2016 // 1984
 
label           define employmentstability32 0 "Not stable for the age 32" 1 "Stable for the age 32" 
label           values employmentstability32 employmentstability32


// At age 33
gen 			employmentstability33 = .
replace         employmentstability33 = 1 if stable2013 == 1 & yearatage33 == 2013 // 1980
replace         employmentstability33 = 0 if stable2013 == 0 & yearatage33 == 2013 // 1980
replace         employmentstability33 = 1 if stable2014 == 1 & yearatage33 == 2014 // 1981
replace         employmentstability33 = 0 if stable2014 == 0 & yearatage33 == 2014 // 1981
replace         employmentstability33 = 1 if stable2015 == 1 & yearatage33 == 2015 // 1982
replace         employmentstability33 = 0 if stable2015 == 0 & yearatage33 == 2015 // 1982
replace         employmentstability33 = 1 if stable2016 == 1 & yearatage33 == 2016 // 1983
replace         employmentstability33 = 0 if stable2016 == 0 & yearatage33 == 2016 // 1983
replace         employmentstability33 = 1 if stable2017 == 1 & yearatage33 == 2017 // 1984
replace         employmentstability33 = 0 if stable2017 == 0 & yearatage33 == 2017 // 1984
 
label           define employmentstability33 0 "Not stable for the age 33" 1 "Stable for the age 33" 
label           values employmentstability33 employmentstability33


// At age 34
gen 			employmentstability34 = .
replace         employmentstability34 = 1 if stable2014 == 1 & yearatage34 == 2014 // 1980
replace         employmentstability34 = 0 if stable2014 == 0 & yearatage34 == 2014 // 1980
replace         employmentstability34 = 1 if stable2015 == 1 & yearatage34 == 2015 // 1981
replace         employmentstability34 = 0 if stable2015 == 0 & yearatage34 == 2015 // 1981
replace         employmentstability34 = 1 if stable2016 == 1 & yearatage34 == 2016 // 1982
replace         employmentstability34 = 0 if stable2016 == 0 & yearatage34 == 2016 // 1982
replace         employmentstability34 = 1 if stable2017 == 1 & yearatage34 == 2017 // 1983
replace         employmentstability34 = 0 if stable2017 == 0 & yearatage34 == 2017 // 1983
replace         employmentstability34 = 1 if stable2018 == 1 & yearatage34 == 2018 // 1984
replace         employmentstability34 = 0 if stable2018 == 0 & yearatage34 == 2018 // 1984

 
label           define employmentstability34 0 "Not stable for the age 34" 1 "Stable for the age 34" 
label           values employmentstability34 employmentstability34

// AGES 32-33
gen 			sumemployment3233 = employmentstability32 + employmentstability33
tab				sumemployment3233

gen 			stablemployment3233 = .
replace 		stablemployment3233 = 1 if sumemployment3233 == 2
replace 		stablemployment3233 = 0 if sumemployment3233 == 0 | sumemployment3233 == 1
label           define stablemployment3233 0 "Not Stable Employment" 1 "Stable Employment" 
label           values stablemployment3233 stablemployment3233


// AGES 33-34
gen 			sumemployment = employmentstability33 + employmentstability34
tab				sumemployment
gen 			stablemployment3334 = .
replace 		stablemployment3334 = 1 if sumemployment == 2
replace 		stablemployment3334 = 0 if sumemployment == 0 | sumemployment == 1
label           define stablemployment3334 0 "Not Stable Employment" 1 "Stable Employment" 
label           values stablemployment3334 stablemployment3334
*/


/*forvalues y= 2003/2017 {
	forvalues w=10/52 {
		drop if employment_`y'_`w' == -4 // drop valid skips
	}
}*/ // This step become unnecessary as I deleted with RNI, I think


********************************************************************************
***************************  HOURS WORKED  *************************************
********************************************************************************



/// There is a warning in NLSY about working hours saying that:
/// THIS VARIABLE IS PRESENTED AS CALCULATED; RESEARCHERS SHOULD NOTE THAT 
/// TOTALS ABOVE 168 HOURS PER WEEK ARE SUSPECT.
/// Should I top code those that have 




** Hause & Warren 2008 - Socioeconomic Indexes for Occupations: A Review, Update, and Critique
** Oppenheimer et al 2007 - Men's career development and marriage timing during a period of rising inequality
** 35 hours and more is considered full time job within a week


/*
// I will drop for the year 1994 as the observations start from week 6 - just for simplicity
drop EMP_HOURS_1994_* 

******************* Weekly status *************


// This first block will code for the first 9 weeks and then the second will code for the rest.

forvalues y=1995/2019{
	forvalues w=1/9{
		recode EMP_HOURS_`y'_0`w'_XRND (-4/-3 = .)(1/35 =1)(36/500=2), gen(hrswrk_`y'_`w')
			label define hrswrk_`y'_`w' 1 "Part-time" 2 "Full-time"  
			label values hrswrk_`y'_`w' hrswrk_`y'_`w'
			}
}


forvalues y=1995/2019{
	forvalues w=10/52{
		recode EMP_HOURS_`y'_`w'_XRND (-4/-3 = .)(1/35 =1)(36/500=2), gen(hrswrk_`y'_`w')
			label define hrswrk_`y'_`w' 1 "Part-time" 2 "Full-time"  
			label values hrswrk_`y'_`w' hrswrk_`y'_`w'
			}
}

fre hrswrk_2005_*


/// This weekly status does not help!
/// I need to add

forvalues y=1995/2019{
	forvalues w=1/9{
		recode EMP_HOURS_`y'_0`w'_XRND (-4/-3 = .)(0 = 0.1)
			}
}


forvalues y=1995/2019{
	forvalues w=10/52{
		recode EMP_HOURS_`y'_`w'_XRND (-4/-3 = .)(0 = 0.1)
			}
}


/// These years have extra 53rd week
	recode EMP_HOURS_1994_53_XRND (-4/-3 = .)(0 = 0.1)
	recode EMP_HOURS_2000_53_XRND (-4/-3 = .)(0 = 0.1)
	recode EMP_HOURS_2005_53_XRND (-4/-3 = .)(0 = 0.1)
	recode EMP_HOURS_2011_53_XRND (-4/-3 = .)(0 = 0.1)
	recode EMP_HOURS_2016_53_XRND (-4/-3 = .)(0 = 0.1)

// I code the -4 and -3 so that they dont go into calculation (egen calculates it as 0)
// I coded O's to 0.1 - IN CASE - there were any zeros but not valid skips so that
/// I can see hours worked with integer


// Generate a yearly total hours work variable. --> I did this with CVC_HOurs below
// ex. If a respondent worked 35 hours every week it will be 34*52
forvalues y=1995/2019{
		egen hrswrk_`y' = rowtotal (EMP_HOURS_`y'*)
	}

	
// recode the 0s back to missing! This was if there any 0s before, they would before
// 0.1
	
forvalues y=1995/2019{
	recode hrswrk_`y' (0=.)
	}



/// Create yearly variable
/// Oppenheimer et al.: we divided the NLSY variable on hours worked since the
/// last interview by the number of weeks worked since the last interview. 
/// Where information was lacking in an interview, we substituted the information for calendar year


// divide this by employmentsum`y

forvalues y=1995/2019{
gen 	empstat`y' = (hrswrk_`y' / employmentsum`y')
}



// There are negative values and many missings!!! 
// Also I need to go back and code for employmentsum of 1995-2013! 

//  Flag: There is a problem (or I am not sure how to deal with) since some people
/// reported working each week for X amount of hours but their total employment week 
/// is not equal to 52. There are valid skips in certain amount of weeks. 
/// For example ID 37 reported working 30 hours each week in 2018 but their total amount
/// of weeks worked is 17 meaning that they only reported 17 times, and the rest is valid skip. 
/// Is that why the empstat has VERY large outcomes, like  


// First create a variable that is %85 of employmentsum (Oppenheimer et al.)
// How did I find 44.2? 52*.85 = 44.2
// Yes there were some years where it was recorded for 53 weeks, this means that for 
/// those years I am using a lower threshold. (because 53*.85 is 45.05)
/// This is basically saying that if someone worked around 44 weeks and more
/// they are coded as having worked full year employment.

forvalues 	y=1995/2019 {
	generate  	fullpartyearemp`y' = .
	replace 	fullpartyearemp`y' = 0 if employmentsum`y' < 44.2 & employmentsum`y' != .
	replace 	fullpartyearemp`y' = 1 if employmentsum`y' > 44.2 & employmentsum`y' != .
	label 		define fullpartyearemp`y' 0 "Part-year employment" 1 "Full-year employment"
	label 		values fullpartyearemp`y' fullpartyearemp`y'
}


// then create another variable showing if yearly employment is part time or not

forvalues 	y=1995/2019 {
	recode 		empstat`y' (0/35=0)(35.01/3870=1), gen(yearlyemp`y')
	label 		define yearlyemp`y' 0 "Part-time work" 1 "Full-time work"
	label 		val yearlyemp`y' yearlyemp`y'
}

// alternative variable to differentiate between the parttime jobs
// see Sojoung Lim 2017 - "Bad Jobs" for Marriage: Precarious Work and the Transition to First Marriage
forvalues 	y=1995/2019 {
	recode 		empstat`y' (0/20=0)(21/34=1)(35.01/3870=2), gen(yearlyemp_alt`y')
	label 		define yearlyemp_alt`y' 0 "Part-time with 20 hours or fewer" 1 "Par-time more hours" 2 "Full-time work"
	label 		val yearlyemp_alt`y' yearlyemp_alt`y'
}
			
/*/ Finally Oppenheimer et al's four categorization
(l) no employment during the year; 
(2) part-time employment (working fewer than 35 hours per week, on average), whether the work is full-year or part-year;
(3) full-time employment that is part year;
(4) year-round full-time employment.*/

forvalues y=1995/2019{
	generate 	employmentstatus`y' = .
	replace 	employmentstatus`y' = 1 if yearlyemp`y' == . & fullpartyearemp`y' == .
	replace 	employmentstatus`y' = 2 if yearlyemp`y' == 0 & fullpartyearemp`y' == 0
	replace 	employmentstatus`y' = 2 if yearlyemp`y' == 0 & fullpartyearemp`y' == 1
	replace 	employmentstatus`y' = 3 if yearlyemp`y' == 1 & fullpartyearemp`y' == 0
	replace 	employmentstatus`y' = 4 if yearlyemp`y' == 1 & fullpartyearemp`y' == 1	
	*label 		define employmentstatus`y' 1 "No employment during the year" 2 "Part-time employment" 3 "Full time employment that is part year" 4 "Year round full time employment"
	*label 		val employmentstatus`y' employmentstatus`y'
}

// this assumes that 1 is missing because it is combining all those which are missing
// this might be misleading so I have to make sure that Real missings are coded as missing
// and unemployed/out of the labor force is not in this combination. 
// SO I might later have to narrow this to only those who are in the labor force
// But then, I guess, my initial categorization might not be super correct. 


*/

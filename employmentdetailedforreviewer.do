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

forvalues w=36/39 {
	replace  EMP_STATUS_2018_`w'_XRND = EMP_STATUS_2018_40_XRND
}
			

forvalues y=1995/2019{
	forvalues w=1/9{
		recode EMP_STATUS_`y'_0`w'_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_`y'_`w')
			label define employment_`y'_`w' 0 "No info and no info if unempl or inactive" 1 "unemployed" 2 "out of LF" 3 "employed"
			label values employment_`y'_`w' employment_`y'_`w'
			}
}


forvalues y= 1995/2019 {
	forvalues w=10/52 {
		recode EMP_STATUS_`y'_`w'_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_`y'_`w')
			label define employment_`y'_`w' 0 "No info and no info if unempl or inactive" 1 "unemployed" 2 "out of LF" 3 "employed"
		label values employment_`y'_`w' employment_`y'_`w'
		*drop if employment_`y'_`w' == 2 // drop those that are in military / I added military to employment
		*drop if employment_`y'_`w' == -4 // drop valid skips
	}
}


// Years that have 53 week
		recode EMP_STATUS_2000_53_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_2000_53)
		recode EMP_STATUS_2005_53_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_2005_53)
		recode EMP_STATUS_2011_53_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_2011_53)
		recode EMP_STATUS_2016_53_XRND (-4/-1=.)(0/2=0)(4=1)(5=2)(3=3)(9701/201909=3)(6=3), gen(employment_2016_53)




// calculate for the sum of weeks in each year

forvalues y=1995/2019 {
	egen employmentsum`y' = rowtotal(employment_`y'_*), missing	
	}

	
	
	forvalues y=1995/2019 {
	egen employmentave`y' = rowmean(employment_`y'_*)
	}
	
	forvalues y=1995/2019 {
	gen empave`y' =round(employmentave`y')
	label define empave`y' 0 "No info and no info if unempl or inactive" 1 "unemployed" 2 "out of LF" 3 "employed"
	label values empave`y' empave`y'
	}

	
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
gen 	yearempstatus`y' = (hourswork`y' / weekswork`y')
gen 	weekhourstat`y' = (hourswork`y' / 52) // This is not exactly what I need: Follow-up 9.5.23: This line was not in the old one, however, I also remember not using this. 
}

// This yearempstatus is basically hours worked per week!

corr yearempstatus2019 weekhourstat2019
browse yearempstatus2019 weekhourstat2019

browse yearempstatus2019 weekhourstat2019 if yearempstatus2019 > weekhourstat2019 & weekhourstat2019 <21 & yearempstatus2019 > 20



forvalues y=1980/2019{
replace 	yearempstatus`y' = 0 if hourswork`y' == 0 & weekswork`y' == 0
}

save "$temp/hitaNLSY_employment_axa", replace
use "$temp/hitaNLSY_employment_axa", clear

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
// Follow-up: 9.8.23: I added & yearempstatus`y' != . to the line 251, the 3rd item, replace 	fullpartyearemployment`y' = 3 

forvalues y=1980/2019{
	generate  	fullpartyearemployment`y' = .
	replace 	fullpartyearemployment`y' = 0 if weekswork`y' == 0 & yearempstatus`y' == 0
	replace 	fullpartyearemployment`y' = 1 if weekswork`y' <= 44.2 & weekswork`y' > 0 & weekswork`y' != . & yearempstatus`y' < 35 & yearempstatus`y' != . // part year parttime
	replace 	fullpartyearemployment`y' = 2 if weekswork`y' <= 44.2 & weekswork`y' > 0 & weekswork`y' != . & yearempstatus`y' >= 35 & yearempstatus`y' != . // part year full time
	replace 	fullpartyearemployment`y' = 3 if weekswork`y' > 44.2 & weekswork`y' != . & yearempstatus`y' > 35 & yearempstatus`y' != .
	label 		define fullpartyearemployment`y' 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Full-year full time employment"
	label 		values fullpartyearemployment`y' fullpartyearemployment`y'
}

 


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
label 		define empstatge15 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge15 empstatge15


generate	empstatge16 = .
replace 	empstatge16 = employmentstatus1996 if BYEAR == 1980
replace 	empstatge16 = employmentstatus1997 if BYEAR == 1981
replace 	empstatge16 = employmentstatus1998 if BYEAR == 1982
replace 	empstatge16 = employmentstatus1999 if BYEAR == 1983
replace 	empstatge16 = employmentstatus2000 if BYEAR == 1984
label 		define empstatge16 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge16 empstatge16


generate	empstatge17 = .
replace 	empstatge17 = employmentstatus1997 if BYEAR == 1980
replace 	empstatge17 = employmentstatus1998 if BYEAR == 1981
replace 	empstatge17 = employmentstatus1999 if BYEAR == 1982
replace 	empstatge17 = employmentstatus2000 if BYEAR == 1983
replace 	empstatge17 = employmentstatus2001 if BYEAR == 1984
label 		define empstatge17 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge17 empstatge17


generate	empstatge18 = .
replace 	empstatge18 = employmentstatus1998 if BYEAR == 1980
replace 	empstatge18 = employmentstatus1999 if BYEAR == 1981
replace 	empstatge18 = employmentstatus2000 if BYEAR == 1982
replace 	empstatge18 = employmentstatus2001 if BYEAR == 1983
replace 	empstatge18 = employmentstatus2002 if BYEAR == 1984
label 		define empstatge18 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge18 empstatge18


generate	empstatge19 = .
replace 	empstatge19 = employmentstatus1999 if BYEAR == 1980
replace 	empstatge19 = employmentstatus2000 if BYEAR == 1981
replace 	empstatge19 = employmentstatus2001 if BYEAR == 1982
replace 	empstatge19 = employmentstatus2002 if BYEAR == 1983
replace 	empstatge19 = employmentstatus2003 if BYEAR == 1984
label 		define empstatge19 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge19 empstatge19


generate	empstatge20 = .
replace 	empstatge20 = employmentstatus2000 if BYEAR == 1980
replace 	empstatge20 = employmentstatus2001 if BYEAR == 1981
replace 	empstatge20 = employmentstatus2002 if BYEAR == 1982
replace 	empstatge20 = employmentstatus2003 if BYEAR == 1983
replace 	empstatge20 = employmentstatus2004 if BYEAR == 1984
label 		define empstatge20 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge20 empstatge20


generate	empstatge21 = .
replace 	empstatge21 = employmentstatus2001 if BYEAR == 1980
replace 	empstatge21 = employmentstatus2002 if BYEAR == 1981
replace 	empstatge21 = employmentstatus2003 if BYEAR == 1982
replace 	empstatge21 = employmentstatus2004 if BYEAR == 1983
replace 	empstatge21 = employmentstatus2005 if BYEAR == 1984
label 		define empstatge21 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge21 empstatge21


generate	empstatge22 = .
replace 	empstatge22 = employmentstatus2002 if BYEAR == 1980
replace 	empstatge22 = employmentstatus2003 if BYEAR == 1981
replace 	empstatge22 = employmentstatus2004 if BYEAR == 1982
replace 	empstatge22 = employmentstatus2005 if BYEAR == 1983
replace 	empstatge22 = employmentstatus2006 if BYEAR == 1984
label 		define empstatge22 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge22 empstatge22	



generate	empstatge23 = .
replace 	empstatge23 = employmentstatus2003 if BYEAR == 1980
replace 	empstatge23 = employmentstatus2004 if BYEAR == 1981
replace 	empstatge23 = employmentstatus2005 if BYEAR == 1982
replace 	empstatge23 = employmentstatus2006 if BYEAR == 1983
replace 	empstatge23 = employmentstatus2007 if BYEAR == 1984
label 		define empstatge23 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge23 empstatge23	


generate	empstatge24 = .
replace 	empstatge24 = employmentstatus2004 if BYEAR == 1980
replace 	empstatge24 = employmentstatus2005 if BYEAR == 1981
replace 	empstatge24 = employmentstatus2006 if BYEAR == 1982
replace 	empstatge24 = employmentstatus2007 if BYEAR == 1983
replace 	empstatge24 = employmentstatus2008 if BYEAR == 1984
label 		define empstatge24 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge24 empstatge24	
	

generate	empstatge25 = .
replace 	empstatge25 = employmentstatus2005 if BYEAR == 1980
replace 	empstatge25 = employmentstatus2006 if BYEAR == 1981
replace 	empstatge25 = employmentstatus2007 if BYEAR == 1982
replace 	empstatge25 = employmentstatus2008 if BYEAR == 1983
replace 	empstatge25 = employmentstatus2009 if BYEAR == 1984
label 		define empstatge25 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge25 empstatge25	
			
		
generate	empstatge26 = .
replace 	empstatge26 = employmentstatus2006 if BYEAR == 1980
replace 	empstatge26 = employmentstatus2007 if BYEAR == 1981
replace 	empstatge26 = employmentstatus2008 if BYEAR == 1982
replace 	empstatge26 = employmentstatus2009 if BYEAR == 1983
replace 	empstatge26 = employmentstatus2010 if BYEAR == 1984
label 		define empstatge26 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge26 empstatge26	
		
		

generate	empstatge27 = .
replace 	empstatge27 = employmentstatus2007 if BYEAR == 1980
replace 	empstatge27 = employmentstatus2008 if BYEAR == 1981
replace 	empstatge27 = employmentstatus2009 if BYEAR == 1982
replace 	empstatge27 = employmentstatus2010 if BYEAR == 1983
replace 	empstatge27 = employmentstatus2011 if BYEAR == 1984
label 		define empstatge27 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge27 empstatge27		
		
	
generate	empstatge28 = .
replace 	empstatge28 = employmentstatus2008 if BYEAR == 1980
replace 	empstatge28 = employmentstatus2009 if BYEAR == 1981
replace 	empstatge28 = employmentstatus2010 if BYEAR == 1982
replace 	empstatge28 = employmentstatus2011 if BYEAR == 1983
replace 	empstatge28 = employmentstatus2012 if BYEAR == 1984
label 		define empstatge28 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge28 empstatge28				
			
		
generate	empstatge29 = .
replace 	empstatge29 = employmentstatus2009 if BYEAR == 1980
replace 	empstatge29 = employmentstatus2010 if BYEAR == 1981
replace 	empstatge29 = employmentstatus2011 if BYEAR == 1982
replace 	empstatge29 = employmentstatus2012 if BYEAR == 1983
replace 	empstatge29 = employmentstatus2013 if BYEAR == 1984
label 		define empstatge29 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge29 empstatge29		
		
		
generate	empstatge30 = .
replace 	empstatge30 = employmentstatus2010 if BYEAR == 1980
replace 	empstatge30 = employmentstatus2011 if BYEAR == 1981
replace 	empstatge30 = employmentstatus2012 if BYEAR == 1982
replace 	empstatge30 = employmentstatus2013 if BYEAR == 1983
replace 	empstatge30 = employmentstatus2014 if BYEAR == 1984
label 		define empstatge30 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge30 empstatge30
		
generate	empstatge31 = .
replace 	empstatge31 = employmentstatus2011 if BYEAR == 1980
replace 	empstatge31 = employmentstatus2012 if BYEAR == 1981
replace 	empstatge31 = employmentstatus2013 if BYEAR == 1982
replace 	empstatge31 = employmentstatus2014 if BYEAR == 1983
replace 	empstatge31 = employmentstatus2015 if BYEAR == 1984
label 		define empstatge31 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge31 empstatge31		
			

generate	empstatge32 = .
replace 	empstatge32 = employmentstatus2012 if BYEAR == 1980
replace 	empstatge32 = employmentstatus2013 if BYEAR == 1981
replace 	empstatge32 = employmentstatus2014 if BYEAR == 1982
replace 	empstatge32 = employmentstatus2015 if BYEAR == 1983
replace 	empstatge32 = employmentstatus2016 if BYEAR == 1984
label 		define empstatge32 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge32 empstatge32


generate	empstatge33 = .
replace 	empstatge33 = employmentstatus2013 if BYEAR == 1980
replace 	empstatge33 = employmentstatus2014 if BYEAR == 1981
replace 	empstatge33 = employmentstatus2015 if BYEAR == 1982
replace 	empstatge33 = employmentstatus2016 if BYEAR == 1983
replace 	empstatge33 = employmentstatus2017 if BYEAR == 1984
label 		define empstatge33 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge33 empstatge33	
	
generate	empstatge34 = .
replace 	empstatge34 = employmentstatus2014 if BYEAR == 1980
replace 	empstatge34 = employmentstatus2015 if BYEAR == 1981
replace 	empstatge34 = employmentstatus2016 if BYEAR == 1982
replace 	empstatge34 = employmentstatus2017 if BYEAR == 1983
replace 	empstatge34 = employmentstatus2018 if BYEAR == 1984
label 		define empstatge34 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge34 empstatge34	
	

generate	empstatge35 = .
replace 	empstatge35 = employmentstatus2015 if BYEAR == 1980
replace 	empstatge35 = employmentstatus2016 if BYEAR == 1981
replace 	empstatge35 = employmentstatus2017 if BYEAR == 1982
replace 	empstatge35 = employmentstatus2018 if BYEAR == 1983
replace 	empstatge35 = employmentstatus2019 if BYEAR == 1984
label 		define empstatge35 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label 		val empstatge35 empstatge35
	
	
save "$temp/hitaNLSY_employment_abas1", replace
use "$temp/hitaNLSY_employment_abas1", clear



**** Create a variable that looks at all the employment between 30-34 and pulls the highest employment status
/*
local vars "empstatge30 empstatge31 empstatge32 empstatge33 empstatge34"

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for each observation
egen empstatus3034_max = rowmax(`vars')
label define empstatus3034_max 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label values empstatus3034_max empstatus3034_max
recode empstatus3034_max (1/2=1)(3=2), gen(empstatusage3034_mx)

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
****** To be able to comapre with non steady jobs
local vars "empstatge30 empstatge31 empstatge32 empstatge33 empstatge34"

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for each observation
egen empstatus3034_min = rowmin(`vars')
label define empstatus3034_min 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
label values empstatus3034_min empstatus3034_min
recode empstatus3034_min (1/2=1)(3=2), gen(empstatusage3034_mn)

// Follow-up:9.8.23: I did the following in the R&R process (july-august 23)
// use egen function to calculate the first non-missing value for 31-33
local vars "empstatge31 empstatge32 empstatge33"
egen empstatus3133_min = rowmin(`vars')
label define empstatus3133_min 0 "No employment" 1 "Part-year part-time employment" 2 "Part-year full-time employment" 3 "Year round full time employment"
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
	
	// Replacing 32 with the clossest steady ones first. 
	// Follow-up:  9.5.23: This muted part is perhaps what I had before the 30-34 min max one that is below, but after R&R.
	replace empstatge32 = empstatge30 if empstatge32 == . 
	replace empstatge32 = empstatge33 if empstatge32 == . 
	
	
	// 3 categories of employment
	// merged here parttime part year with part year/full time emp.
forvalues y=15/35 {
	recode empstatge`y' (1/2=1)(3=2), gen(empstatusage`y')
	label define empstatusage`y' 0 "No employment during the year" 1 "Part-time partyear and/or partyear full time employment" 2 "Fulltime full year employment"
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
	
	
		


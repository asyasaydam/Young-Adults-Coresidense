********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* HH roster
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021
********************************************************************************

* Purpose:  Try to create living with parents from HH roster

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97constructHHROSTER_`logdate'.log", t replace


use 		 "$temp/hitaNLSY_recode", clear

// generate these items to be able to use in forvalues command
gen HHI_RELY_12_2007 = HHI_RELY_11_2007 
gen HHI_RELY_13_2013 = HHI_RELY_12_2013 

* Recode 1 if the household has mother, father, adoptive mother, step mother, step father. There is also mother-in-law, but I didn't add that. 

////2000 - 2011

forvalues y=1998/2011{
	forvalues x=1/9 {
		recode HHI_RELY_0`x'_`y' (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_`y')
	}
}

forvalues y=1998/2011{
	forvalues x=10/12 {
		recode HHI_RELY_`x'_`y' (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_`y')
	}
}

recode HHI_RELY_13_2003 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_13_2003)
recode HHI_RELY_13_2005 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_13_2005)
recode HHI_RELY_13_2006 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_13_2006)
recode HHI_RELY_14_2006 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_14_2006)
recode HHI_RELY_13_2008 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_13_2008)
forvalues x=14/18 {
		recode HHI_RELY_`x'_2009 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2009)
	}
forvalues x=13/15 {
		recode HHI_RELY_`x'_2010 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2010)
	}
forvalues x=13/14 {
		recode HHI_RELY_`x'_2011 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2011)
	}

//// 2013
forvalues x=1/9 {
		recode HHI_RELY_0`x'_2013 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2013)
	}
	
forvalues x=10/13 {
	recode HHI_RELY_`x'_2013 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2013)
}


//// 2015
forvalues x=1/9 {
		recode HHI_RELY_0`x'_2015 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2015)
	}
	
forvalues x=10/17 {
		recode HHI_RELY_`x'_2015 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2015)
	}

//// 2017
forvalues x=1/9 {
		recode HHI_RELY_0`x'_2017 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2017)
	}
forvalues x=10/17 {
		recode HHI_RELY_`x'_2017 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2017)
	}

//// 2019
forvalues x=1/9 {
		recode HHI_RELY_0`x'_2019 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2019)
	}
forvalues x=10/17 {
		recode HHI_RELY_`x'_2019 (3/10=1)(1/2=0)(11/999=0)(-5/-1=.),gen(relhh_`x'_2019)
	}


		
save "$temp/NLSY97_relationship", replace


use "$temp/NLSY97_relationship", clear


// replace anyparentyear with 1 if either mom or dad is there in the hh
forvalues y=1998/2011 {
	egen anyparent`y'= rowmax(relhh_*_`y')
}


egen 	anyparent2013 = rowmax(relhh_*_2013)
egen 	anyparent2015 = rowmax(relhh_*_2015)
egen 	anyparent2017 = rowmax(relhh_*_2017)
egen	anyparent2019 = rowmax(relhh_*_2019)


// I will recode for people who were in the military  to be recoded as not with living with parents for that year. 
	
forvalues x=1998/2011 {
	forvalues y=1998/2011 {
	replace anyparent`y'= 0 if RNI_`x' == 93
	}
}		


	replace anyparent2013= 0 if RNI_2013 == 93
	replace anyparent2015= 0 if RNI_2015 == 93
	replace anyparent2017= 0 if RNI_2017 == 93
	replace anyparent2017= 0 if RNI_2019 == 93
	


		/// I generated new variables for in between years and assumed people continued to live as the year before. 
		/// This is an arbitrary decision
		gen anyparent2012 = anyparent2011
		gen	anyparent2014 = anyparent2013
		gen	anyparent2016 = anyparent2015
		gen anyparent2018 = anyparent2017

	
	browse anyparent2004 anyparent2005 anyparent2006 anyparent2007 anyparent2008 anyparent2009 anyparent2010 anyparent2011 anyparent2012 if BYEAR == 1980	



// situation when they are 19
gen 		livingat18 = .
replace 	livingat18 = anyparent1998 if BYEAR == 1980
replace 	livingat18 = anyparent1999 if BYEAR == 1981
replace		livingat18 = anyparent2000 if BYEAR == 1982
replace		livingat18 = anyparent2001 if BYEAR == 1983
replace		livingat18 = anyparent2002 if BYEAR == 1984
label 		define livingat18 0 "No parents at age 18" 1 "With parents at age 18"  
label 		values livingat18 livingat18

// situation when they are 19
gen 		livingat19 = .
replace 	livingat19 = anyparent1999 if BYEAR == 1980
replace 	livingat19 = anyparent2000 if BYEAR == 1981
replace		livingat19 = anyparent2001 if BYEAR == 1982
replace		livingat19 = anyparent2002 if BYEAR == 1983
replace		livingat19 = anyparent2003 if BYEAR == 1984
label 		define livingat19 0 "No parents at age 19" 1 "With parents at age 19"  
label 		values livingat19 livingat19


// situation when they are 20
gen 		livingat20 = .
replace 	livingat20 = anyparent2000 if BYEAR == 1980
replace 	livingat20 = anyparent2001 if BYEAR == 1981
replace		livingat20 = anyparent2002 if BYEAR == 1982
replace		livingat20 = anyparent2003 if BYEAR == 1983
replace		livingat20 = anyparent2004 if BYEAR == 1984
label 		define livingat20 0 "No parents at age 20" 1 "With parents at age 20"  
label 		values livingat20 livingat20


// situation when they are 21
gen 		livingat21 = .
replace 	livingat21 = anyparent2001 if BYEAR == 1980
replace 	livingat21 = anyparent2002 if BYEAR == 1981
replace		livingat21 = anyparent2003 if BYEAR == 1982
replace		livingat21 = anyparent2004 if BYEAR == 1983
replace		livingat21 = anyparent2005 if BYEAR == 1984
label 		define livingat21 0 "No parents at age 21" 1 "With parents at age 21"  
label 		values livingat21 livingat21
		
		
// situation when they are 22
gen 		livingat22 = .
replace 	livingat22 = anyparent2002 if BYEAR == 1980
replace 	livingat22 = anyparent2003 if BYEAR == 1981
replace		livingat22 = anyparent2004 if BYEAR == 1982
replace		livingat22 = anyparent2005 if BYEAR == 1983
replace		livingat22 = anyparent2006 if BYEAR == 1984
label 		define livingat22 0 "No parents at age 22" 1 "With parents at age 22"  
label 		values livingat22 livingat22

		
// situation when they are 23
gen 		livingat23 = .
replace 	livingat23 = anyparent2003 if BYEAR == 1980
replace 	livingat23 = anyparent2004 if BYEAR == 1981
replace		livingat23 = anyparent2005 if BYEAR == 1982
replace		livingat23 = anyparent2006 if BYEAR == 1983
replace		livingat23 = anyparent2007 if BYEAR == 1984
label 		define livingat23 0 "No parents at age 23" 1 "With parents at age 23"  
label 		values livingat23 livingat23



// situation when they are 24
gen 		livingat24 = .
replace 	livingat24 = anyparent2004 if BYEAR == 1980
replace 	livingat24 = anyparent2005 if BYEAR == 1981
replace		livingat24 = anyparent2006 if BYEAR == 1982
replace		livingat24 = anyparent2007 if BYEAR == 1983
replace		livingat24 = anyparent2008 if BYEAR == 1984
label 		define livingat24 0 "No parents at age 24" 1 "With parents at age 24"  
label 		values livingat24 livingat24


// situation when they are 25
gen 		livingat25 = .
replace 	livingat25 = anyparent2005 if BYEAR == 1980
replace 	livingat25 = anyparent2006 if BYEAR == 1981
replace		livingat25 = anyparent2007 if BYEAR == 1982
replace		livingat25 = anyparent2008 if BYEAR == 1983
replace		livingat25 = anyparent2009 if BYEAR == 1984
label 		define livingat25 0 "No parents at age 25" 1 "With parents at age 25"  
label 		values livingat25 livingat25



// situation when they are 26
gen 		livingat26 = .
replace 	livingat26 = anyparent2006 if BYEAR == 1980
replace 	livingat26 = anyparent2007 if BYEAR == 1981
replace		livingat26 = anyparent2008 if BYEAR == 1982
replace		livingat26 = anyparent2009 if BYEAR == 1983
replace		livingat26 = anyparent2010 if BYEAR == 1984
label 		define livingat26 0 "No parents at age 26" 1 "With parents at age 26"  
label 		values livingat26 livingat26

// situation when they are 27
gen 		livingat27 = .
replace 	livingat27 = anyparent2007 if BYEAR == 1980
replace 	livingat27 = anyparent2008 if BYEAR == 1981
replace		livingat27 = anyparent2009 if BYEAR == 1982
replace		livingat27 = anyparent2010 if BYEAR == 1983
replace		livingat27 = anyparent2011 if BYEAR == 1984
label 		define livingat27 0 "No parents at age 27" 1 "With parents at age 27"  
label 		values livingat27 livingat27

// situation when they are 28
gen 		livingat28 = .
replace 	livingat28 = anyparent2008 if BYEAR == 1980
replace 	livingat28 = anyparent2009 if BYEAR == 1981
replace		livingat28 = anyparent2010 if BYEAR == 1982
replace		livingat28 = anyparent2011 if BYEAR == 1983
replace		livingat28 = anyparent2012 if BYEAR == 1984
label 		define livingat28 0 "No parents at age 28" 1 "With parents at age 28"  
label 		values livingat28 livingat28

// situation when they are 29
gen 		livingat29 = .
replace 	livingat29 = anyparent2009 if BYEAR == 1980
replace 	livingat29 = anyparent2010 if BYEAR == 1981
replace		livingat29 = anyparent2011 if BYEAR == 1982
replace		livingat29 = anyparent2012 if BYEAR == 1983
replace		livingat29 = anyparent2013 if BYEAR == 1984
label 		define livingat29 0 "No parents at age 29" 1 "With parents at age 29"  
label 		values livingat29 livingat29

// situation when they are 30
gen 		livingat30 = .
replace 	livingat30 = anyparent2010 if BYEAR == 1980
replace 	livingat30 = anyparent2011 if BYEAR == 1981
replace		livingat30 = anyparent2012 if BYEAR == 1982
replace		livingat30 = anyparent2013 if BYEAR == 1983
replace		livingat30 = anyparent2014 if BYEAR == 1984
label 		define livingat30 0 "No parents at age 30" 1 "With parents at age 30"  
label 		values livingat30 livingat30

// situation when they are 31
gen 		livingat31 = .
replace 	livingat31 = anyparent2011 if BYEAR == 1980
replace 	livingat31 = anyparent2012 if BYEAR == 1981
replace		livingat31 = anyparent2013 if BYEAR == 1982
replace		livingat31 = anyparent2014 if BYEAR == 1983
replace		livingat31 = anyparent2015 if BYEAR == 1984
label 		define livingat31 0 "No parents at age 31" 1 "With parents at age 31"  
label 		values livingat31 livingat31

// situation when they are 32
gen 		livingat32 = .
replace 	livingat32 = anyparent2012 if BYEAR == 1980
replace 	livingat32 = anyparent2013 if BYEAR == 1981
replace		livingat32 = anyparent2014 if BYEAR == 1982
replace		livingat32 = anyparent2015 if BYEAR == 1983
replace		livingat32 = anyparent2016 if BYEAR == 1984
label 		define livingat32 0 "No parents at age 32" 1 "With parents at age 32"  
label 		values livingat32 livingat32


// situation when they are 33
gen 		livingat33 = .
replace 	livingat33 = anyparent2013 if BYEAR == 1980
replace 	livingat33 = anyparent2014 if BYEAR == 1981
replace		livingat33 = anyparent2015 if BYEAR == 1982
replace		livingat33 = anyparent2016 if BYEAR == 1983
replace		livingat33 = anyparent2017 if BYEAR == 1984
label 		define livingat33 0 "No parents at age 33" 1 "With parents at age 33"  
label 		values livingat33 livingat33

save "$temp/NLSY97_relationshiphh", replace
use "$temp/NLSY97_relationshiphh", clear





// For 9 years, between 24-32
egen 	totaldurationinhh2432 = rowtotal(livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 livingat30 livingat31 livingat32), missing


*******************************
****** New variable 25-29 *****
*******************************
// For 5 years, between 25-29
egen 	totaldurationinhh2529 = rowtotal(livingat25 livingat26 livingat27 livingat28 livingat29), missing


// For 6 years, between 24-29
egen 	totaldurationinhh2429 = rowtotal(livingat24 livingat25 livingat26 livingat27 livingat28 livingat29), missing



// CREATE a new binary outcome for 24-29
gen 		livedwpar_bin = .
replace 	livedwpar_bin = 0 if totaldurationinhh2429 == 0
replace 	livedwpar_bin = 1 if totaldurationinhh2429 > 0 & totaldurationinhh2429 != .
label 		define livedwpar_bin 0 "Never lived with parents after 24" 1 "Lived with parents after 24"
label 		val livedwpar_bin livedwpar_bin




 *** categorization of the 24-29 variable ***
	gen 	livedwpar_cat = .
	replace livedwpar_cat = 0 if totaldurationinhh2429 == 0
	replace livedwpar_cat = 1 if totaldurationinhh2429 > 0 & totaldurationinhh2429 < 6
	replace livedwpar_cat = 2 if totaldurationinhh2429 == 6
	tab 	livedwpar_cat [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat 0 "None" 1 "Some" 2 "All"
	label 	val livedwpar_cat livedwpar_cat

	
	
 	
drop HHI_RELY*
*drop anyparent*
save "$temp/NLSY97_hhroster", replace
log close
	
















// Fill in living at 24 by making some assumptions
// 1. If they have an observation for 23 and 25 and if they are the same, fill in age 24 by 25
// 2. If they are missing 24, but they continuously have same for 25,26,27 then fill in 24 by 25
// 3. If they are missing 24, 23 but they have observations for 25,and later ages and they have at least have once living with parents in those 25,26,27... ages, than fill it in with living with 24. Similar for not living. Lastly, if they are continuously not living with parents at 25 26 27 but living with 25, then fill it in with not living. Finally if 25 is also missing but the rest is not missing and not living, fill it with not living
// 4. If they are not living w parents at 23 but turned into living at 25, then fill 24 as living



/*
// 1. assumption
replace 	livingat24 = livingat25 if livingat23 == livingat25 & livingat24 == . 
// how many? 128 changed

// 2. assumption
replace  	livingat24 = livingat25 if livingat24 == . & livingat25 == livingat26 & livingat26 == livingat27
// how many? 124 changed

// 3. assumption
replace 	livingat24 = 1 if livingat24 == . & livingat23 == . & inlist(1, livingat25, livingat26, livingat27, livingat28, livingat29) // 164
replace 	livingat24 = 1 if livingat24 == . & livingat23 == 1 & inlist(1, livingat25, livingat26, livingat27, livingat28, livingat29) // 64
replace 	livingat24 = 0 if livingat24 == . & livingat23 == . & inlist(0, livingat25, livingat26, livingat27, livingat28, livingat29) // 366
replace 	livingat24 = 0 if livingat24 == . & livingat23 == 0 & inlist(0, livingat25, livingat26, livingat27, livingat28, livingat29) // 174
replace 	livingat24 = 0 if livingat24 == . & livingat23 == 1 & inlist(livingat25, livingat26, livingat27, livingat28, livingat29, 0) 		// 159
replace 	livingat24 = 0 if livingat24 == . & livingat23 == 1 & inlist(livingat26, livingat27, livingat28, livingat29, 0) // 23


// 107, 48, 219, 95, 104, 12, 5
// 4. assumption
replace 	livingat24 = 1 if livingat24 == . & livingat23 == 0 & livingat25 == 1

// I find the following first by dropping females, but I mute that because I don't want to do that yet. though why?
di 107 + 48 +219+95+104+12+5
** 590

//// More assumptions about age 25
// 1. assumption
*replace 	livingat25 = livingat27 if livingat25 == . & livingat23 == livingat27  

//// More assumptions about age 26 
// 1. assumption
*replace 	livingat26 = livingat27 if livingat26 == . & livingat25 == livingat27  

// 2. assumption
*replace  	livingat26 = livingat27 if livingat26 == . & livingat27 == livingat28 & livingat28 == livingat29
// 125


//// More assumptions about age 29 
// 1. If they have continuously same for 26 27 28 and if 29 is missing, then plug in
*replace 	livingat29 = 1 if livingat29 == . & inlist(livingat25, livingat26, livingat27, livingat28, 1) //1302
*replace 	livingat29 = 0 if livingat29 == . & inlist(livingat25, livingat26, livingat27, livingat28, 0) // 85

*replace 	livingat29 = 1 if livingat29 == . & inlist(livingat30, livingat26, livingat27, livingat28, 1) // 14
*replace 	livingat29 = 0 if livingat29 == . & inlist(livingat30, livingat26, livingat27, livingat28, 0) // 0 

*/









// I find the average of their living situation post 24 
// to be able to guess meaningfully for living with parents at age 24
// this is a very arbitrary decision - I might have to ignore this and just drop those missing at age 24
/*
egen ave2528 = rowmean(livingat25 livingat26 livingat27 livingat28)
gen ave2528_=round(ave2528)

// another trial to round 
egen ave2527 = rowmean(livingat25 livingat26 livingat27)
gen ave2527_ = round(ave2527)

// this is too much stressing
egen ave2529 = rowmean(livingat25 livingat26 livingat27 livingat28 livingat29)
gen ave2529_=round(ave2529)

//so for the initial phase of their age 24, I will use this
replace 	livingat24 = ave2528_ if livingat24 == .

//lastly replace the missings with 23
replace 	livingat24 = livingat23 if livingat24 == . & ave2528_ == .


// this show me the ones who have different situations at 23 and 25 while missing 24
*browse livingat2* if livingat24  == . & livingat23 != livingat25 & livingat23 != . & livingat25 != . & ave2528_ != ave2527_
*/

		




/*// CREATE a binary outcome for those who were leaving with their parents after 24 and those WHO never lived with their parents after 24 
gen 		livedwpar_bin = .
replace 	livedwpar_bin = 0 if totaldurationinhh2432 == 0
replace 	livedwpar_bin = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 != .
label 		define livedwpar_bin 0 "Never lived with parents after 24" 1 "Lived with parents after 24"
label 		val livedwpar_bin livedwpar_bin


// CREATE a new binary outcome for 25-29
gen 		livedwpar_bi = .
replace 	livedwpar_bi = 0 if totaldurationinhh2529 == 0
replace 	livedwpar_bi = 1 if totaldurationinhh2529 > 0 & totaldurationinhh2529 != .
label 		define livedwpar_bi 0 "Never lived with parents after 24" 1 "Lived with parents after 24"
label 		val livedwpar_bi livedwpar_bi*/






/* 
 *** categorization of the 24-32 variable ***
	gen 	livedwpar_cat = .
	replace livedwpar_cat = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 < 9
	replace livedwpar_cat = 2 if totaldurationinhh2432 == 9
	tab 	livedwpar_cat [aw=SAMPLING_PANEL_WEIGHT_1997 ]
	label 	define livedwpar_cat 0 "None" 1 "Some" 2 "All"
	label 	val livedwpar_cat livedwpar_cat


 *** categorization of the variable again ***
	gen 	livedwpar_cat2 = .
	replace livedwpar_cat2 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat2 = 1 if totaldurationinhh2432 == 1
	replace livedwpar_cat2 = 2 if totaldurationinhh2432 > 1 & totaldurationinhh2432 < 9
	replace livedwpar_cat2 = 3 if totaldurationinhh2432 == 9
	tab 	livedwpar_cat2 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat2 0 "None" 1 "1 year" 2 "2 to 8 years" 3 "All"
	label 	val livedwpar_cat2 livedwpar_cat2	
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat3 = .
	replace livedwpar_cat3 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat3 = 1 if totaldurationinhh2432 == 1 | totaldurationinhh2432 == 2
	replace livedwpar_cat3 = 2 if totaldurationinhh2432 > 2 & totaldurationinhh2432 < 9
	replace livedwpar_cat3 = 3 if totaldurationinhh2432 == 9
	tab 	livedwpar_cat3 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat3 0 "None" 1 "1-2 years" 2 "3 to 8 years" 3 "All"
	label 	val livedwpar_cat3 livedwpar_cat3	
	

 *** categorization of the variable again ***
	gen 	livedwpar_cat4 = .
	replace livedwpar_cat4 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat4 = 1 if totaldurationinhh2432 == 1 | totaldurationinhh2432 == 2 | totaldurationinhh2432 == 3
	replace livedwpar_cat4 = 2 if totaldurationinhh2432 > 3 & totaldurationinhh2432 < 9
	replace livedwpar_cat4 = 3 if totaldurationinhh2432 == 9
	tab 	livedwpar_cat4 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat4 0 "None" 1 "1-3 years" 2 "4 to 8 years" 3 "All"
	label 	val livedwpar_cat4 livedwpar_cat4	

 *** categorization of the variable again ***
	gen 	livedwpar_cat5 = .
	replace livedwpar_cat5 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat5 = 1 if totaldurationinhh2432 == 1 | totaldurationinhh2432 == 2 | totaldurationinhh2432 == 3
	replace livedwpar_cat5 = 2 if totaldurationinhh2432 > 3 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat5 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat5 0 "None" 1 "1-3 years" 2 "4 to 9 years"
	label 	val livedwpar_cat5 livedwpar_cat5

 *** categorization of the variable again ***
	gen 	livedwpar_cat6 = .
	replace livedwpar_cat6 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat6 = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 < 5
	replace livedwpar_cat6 = 2 if totaldurationinhh2432 > 4 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat6 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat6 0 "None" 1 "1-4 years" 2 "5 to 9 years"
	label 	val livedwpar_cat6 livedwpar_cat6
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat7 = .
	replace livedwpar_cat7 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat7 = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 < 6
	replace livedwpar_cat7 = 2 if totaldurationinhh2432 > 5 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat7 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat7 0 "None" 1 "1-5 years" 2 "6 to 9 years"
	label 	val livedwpar_cat7 livedwpar_cat7
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat8 = .
	replace livedwpar_cat8 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat8 = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 < 7
	replace livedwpar_cat8 = 2 if totaldurationinhh2432 > 6 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat8 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat8 0 "None" 1 "1-6 years" 2 "7 to 9 years"
	label 	val livedwpar_cat8 livedwpar_cat8
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat9 = .
	replace livedwpar_cat9 = 0 if totaldurationinhh2432 == 0
	replace livedwpar_cat9 = 1 if totaldurationinhh2432 > 0 & totaldurationinhh2432 < 8
	replace livedwpar_cat9 = 2 if totaldurationinhh2432 > 7 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat9 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat9 0 "None" 1 "1-7 years" 2 "8-9 years"
	label 	val livedwpar_cat9 livedwpar_cat9
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat10 = .
	replace livedwpar_cat10 = 0 if totaldurationinhh2432 == 0 
	replace livedwpar_cat10 = 1 if totaldurationinhh2432 == 1 
	replace livedwpar_cat10 = 2 if  totaldurationinhh2432 == 2 | totaldurationinhh2432 == 3 | totaldurationinhh2432 == 4 | totaldurationinhh2432 == 5
	replace livedwpar_cat10 = 3 if totaldurationinhh2432 > 5 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat10 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat10 0 "None" 1 "1 year" 2 "2-5 years" 3 "6-9 years"
	label 	val livedwpar_cat10 livedwpar_cat10
	
 *** categorization of the variable again ***
	gen 	livedwpar_cat11 = .
	replace livedwpar_cat11 = 0 if totaldurationinhh2432 == 0 
	replace livedwpar_cat11 = 1 if totaldurationinhh2432 == 1 
	replace livedwpar_cat11 = 2 if  totaldurationinhh2432 == 2 | totaldurationinhh2432 == 3 | totaldurationinhh2432 == 4
	replace livedwpar_cat11 = 3 if totaldurationinhh2432 > 4 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat11 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat11 0 "None" 1 "1 year" 2 "2-4 years" 3 "5-9 years"
	label 	val livedwpar_cat11 livedwpar_cat11

 *** categorization of the variable again ***
	gen 	livedwpar_cat12 = .
	replace livedwpar_cat12 = 0 if totaldurationinhh2432 == 0 
	replace livedwpar_cat12 = 1 if totaldurationinhh2432 == 1 
	replace livedwpar_cat12 = 2 if  totaldurationinhh2432 == 2 | totaldurationinhh2432 == 3 
	replace livedwpar_cat12 = 3 if totaldurationinhh2432 > 3 & totaldurationinhh2432 < 10
	tab 	livedwpar_cat12 [aw=SAMPLING_PANEL_WEIGHT_1997]
	label 	define livedwpar_cat12 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-9 years"
	label 	val livedwpar_cat12 livedwpar_cat12	
	*/


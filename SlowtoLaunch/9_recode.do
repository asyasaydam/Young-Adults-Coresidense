********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Merge & Rename & Construct variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97recode_`logdate'.log", t replace



use 	 "$temp/hitaNLSY_employment", clear
// recode SEX
rename 		SEX sex
recode 		sex 1=0 2=1, gen (SEX)
label 		define SEX 0 "male" 1 "female"
label 		values SEX SEX


// recode EDUC
*Gelblum 2014: no educ credential, GED, high schooldiploma, some college but no degree, ass deg, bac deg, graduate degree
*Lim 2017: Less than high school, High school, Some college, University or more


recode 		EDUC (-3=.)(0=0)(1/2=1)(3=2)(4/7=3), gen(education)
label 		define education 0 "Less than HS" 1 "High School" 2 "Associate Degree" 3 "College Degree and +" 
label 		values education education

// Follow-up: 9.5.23: I realized that I changed the recoding of education. I moved GED from ltHS to HS.


// I followed Sweeney , M (2002). Two decades of family change: The shifting economic foundations of marriage. American Sociological Review

tab 		HIGHEST_GRADE, nolabel m
recode 		HIGHEST_GRADE (-3=.)(0/11=0)(12=1)(13/15=2)(16/20=3)(95=0), gen(education_new)
label 		define education_new 0 "Less than HS" 1 "High School" 2 "Some College" 3 "College Degree and +" 
label 		values education_new education_new


tab 		education education_new, m
// The above two variables indicate education of the respondent. The "education" is based on degrees, and the education_new is based on grade, so if someone is some college and since it doesnt have a degree, it is under HS in the first varaible(education) but in the second variable it is in some college. There are differences in the missing. There are more missing variables in the second one, so based on the crosstab, I will recode the missing ones in the second to their appropriate cells based on the first one. 


replace 	education_new = education if education_new == . 

// Still the crosstab is not consistent. For example 9 people have less than HS degree acording to EDUC variable, and college degree according to the other HIGHEST GRADE variable. Not sure how to deal with this. 



// Current Enrollment Status 

drop 	CV_ENROLLSTAT_2004
rename 	CV_ENROLLSTAT_EDT_2004 CV_ENROLLSTAT_2004


forvalues y=2000/2019 {
		if `y' != 2012 & `y' != 2014 & `y' != 2016 & `y' != 2018 {
		recode CV_ENROLLSTAT_`y' (-5/-3=.)(1/7=0)(8/11=1),gen(enrollment_`y')
		label define enrollment_`y' 0 "Not enrolled" 1 "Enrolled"
		label values enrollment_`y' enrollment_`y'
	}
}

// generate a variable with all the enrollment variables in a list
local vars "CV_ENROLLSTAT_2000 CV_ENROLLSTAT_2001 CV_ENROLLSTAT_2002 CV_ENROLLSTAT_2003 CV_ENROLLSTAT_2004 CV_ENROLLSTAT_2005 CV_ENROLLSTAT_2006 CV_ENROLLSTAT_2007 CV_ENROLLSTAT_2008 CV_ENROLLSTAT_2009 CV_ENROLLSTAT_2010 CV_ENROLLSTAT_2011 CV_ENROLLSTAT_2013 CV_ENROLLSTAT_2015 CV_ENROLLSTAT_2017 CV_ENROLLSTAT_2019"

// use egen function to calculate the first non-missing value for each observation
egen highest_enrol = rowmax(`vars')

/*	226       1 Not enrolled, no high school degree, no GED
       3       2 Not enrolled, GED
       4       3 Not enrolled, high school degree
       0       4 Not enrolled, some college
       0       5 Not enrolled, 2-year college graduate
       0       6 Not enrolled, 4-year college graduate
       0       7 Not enrolled, graduate degree
    8742       8 Enrolled in grades 1-12, not a high school graduate
       5       9 Enrolled in a 2-year college
       2      10 Enrolled in a 4-year college
       0      11 Enrolled in a graduate program
	   */
	   

	   recode highest_enrol -5/-3=. 1=0 1/3=1 4/5=2 6/7=3 8=0 9/11=2
	   replace education_new = highest_enrol if education_new == . 
	   tab 		education education_new, m
	   tab 		education_new SEX, m
	   



	
	
** Enrollment status at age 23	
gen 		enrolled23 = .
replace		enrolled23 = enrollment_2003 if BYEAR == 1980
replace		enrolled23 = enrollment_2004 if BYEAR == 1981
replace		enrolled23 = enrollment_2005 if BYEAR == 1982
replace		enrolled23 = enrollment_2006 if BYEAR == 1983
replace		enrolled23 = enrollment_2007 if BYEAR == 1984
label 		define enrolled23 0 "Not enrolled" 1 "Enrolled"
label 		values enrolled23 enrolled23	
		
	
** Enrollment status at age 24
gen 		enrolled24 = .
replace		enrolled24 = enrollment_2004 if BYEAR == 1980
replace		enrolled24 = enrollment_2005 if BYEAR == 1981
replace		enrolled24 = enrollment_2006 if BYEAR == 1982
replace		enrolled24 = enrollment_2007 if BYEAR == 1983
replace		enrolled24 = enrollment_2008 if BYEAR == 1984
label 		define enrolled24 0 "Not enrolled" 1 "Enrolled"
label 		values enrolled24 enrolled24


** Enrollment status at age 25 // I am creating this to be able to substitute for the missingness on 24
gen 		enrolled25 = .
replace		enrolled25 = enrollment_2005 if BYEAR == 1980
replace		enrolled25 = enrollment_2006 if BYEAR == 1981
replace		enrolled25 = enrollment_2007 if BYEAR == 1982
replace		enrolled25 = enrollment_2008 if BYEAR == 1983
replace		enrolled25 = enrollment_2009 if BYEAR == 1984
label 		define enrolled25 0 "Not enrolled" 1 "Enrolled"
label 		values enrolled25 enrolled25


// Substitute-Replacement
replace 	enrolled24 = enrolled23 if enrolled24 == .
replace 	enrolled24 = enrolled25 if enrolled24 == . 


** Enrollment status at age 26
gen 		enrolled26 = .
replace		enrolled26 = enrollment_2006 if BYEAR == 1980
replace		enrolled26 = enrollment_2007 if BYEAR == 1981
replace		enrolled26 = enrollment_2008 if BYEAR == 1982
replace		enrolled26 = enrollment_2009 if BYEAR == 1983
replace		enrolled26 = enrollment_2010 if BYEAR == 1984
label 		define enrolled26 0 "Not enrolled" 1 "Enrolled"
label 		values enrolled26 enrolled26



/*recode PARENTREL_AGE2 
PARENTREL_AGE6 PARENTREL_AGE12
there us to much missing data in this, but this could work: tab CV_YTH_REL_HH_AGE_12_1997 since they are 12-18 in year 1997
*/ 

*save "$temp/recoding0", replace
*use "$temp/recoding0", clear

// I used the citizenship at 1997 
recode 		CITIZENSHIP (-4=.)(1=1)(2/3=0), gen(citizenship)
label		define citizenship 0 "Not born in the US" 1 "Born in the US"	
label 		values citizenship citizenship	

// just generated the following so that I can use that in the loop too.
gen  		CV_CITIZEN_CURRENT_2005 = CV_CITIZEN_CURRENT_2004

recode CITIZENSHIP_CURRENT (1=1) (2/6=0) (-5/-3=.) // Follow up: 9.5.23: this is new to recode after R&R

forvalues i = 2002/2015 {
    if `i' != 2012 & `i' != 2014 {
        recode CV_CITIZEN_CURRENT_`i' (1=1) (2/6=0) (-5/-3=.), gen(citizenship`i')
        label define citizenship`i' 0 "Not born in the US" 1 "Born in the US"
        label values citizenship`i' citizenship`i'
    }
}

// generate a variable with all the citizenship variables in a list
local vars "CITIZENSHIP_CURRENT citizenship2002 citizenship2003 citizenship2004 citizenship2005 citizenship2006 citizenship2007 citizenship2008 citizenship2009 citizenship2010 citizenship2011 citizenship2013 citizenship2015"

// Follow up: 9.7.23: R7295600 - CITIZENSHIP_CURRENT belongs to year 2001

// use egen function to calculate the first non-missing value for each observation
egen first_citizenship = rowfirst(`vars')
label define first_citizenship 0 "Not born in the US" 1 "Born in the US"
label values first_citizenship first_citizenship

// replace the missing values in the citizenship variable with the corresponding non-missing values from the first_citizenship variable
replace citizenship = first_citizenship if missing(citizenship) 

*save "$temp/recoding0a", replace
*use "$temp/recoding0a", clear


****************************************
********** Race/ethncitiy **************
****************************************


recode 		RACEETHN (1=1)(2=2)(4=0), gen(race)
label 		define race 0 "White" 1 "Black" 2 "Hispanic" 3 "Other"
label 		values race race

// I followed Houle 2013 here. I don't think mixed race should be labeled black, on the other hand with the new setting hispanic is gone. 
// Follow up: i changed my mind. I might just drop mixed race later

/*Codebook
1 Both biological parents
2 Two parents, biological mother
3 Two parents, biological father
4 Biological mother only
5 Biological father only
6 Adoptive parent(s)
7 Foster parent(s)
8 No parents, grandparents
9 No parents, other relatives
10 Anything else
*/


* Household living situation in 1997 - when the kids are in ages between 12-18. This is the variable that has the most cases as opposed to varaibles that show their relationship at ages 2, 6 and 12. I am merging adoptive parents and foster parents with single parents, thinking that there would be a similar disadvantage. Should probably test this assumption. 

forvalues i=1997/2002 {
	recode 		CV_YTH_REL_HH_CURRENT_`i' (-5/-3=.)(1/3=0)(4/7=1)(8/10=2), gen(livingarrangement`i')
	label 		define livingarrangement`i' 0 "Two-parent family " 1 "Single parent" 2 "Other arrangements"
	label 		values livingarrangement`i' livingarrangement`i'
}

local vars "livingarrangement1997 livingarrangement1998 livingarrangement1999 livingarrangement2000 livingarrangement2001 livingarrangement2002"

// use egen function to calculate the first non-missing value for each observation
egen first_living = rowfirst(`vars')

// replace the missing values in the citizenshipb variable with the corresponding non-missing values from the first_citizenship variable
replace livingarrangement1997 = first_living if missing(livingarrangement1997) 


*save "$temp/recoding0b", replace
*use "$temp/recoding0b", clear

* * * * * * * * * * * * 
* Parental education
* * * * * * * * * * * * 

*R1302400	CV_HGC_BIO_DAD	BIOLOGICAL FATHERS HIGHEST GRADE COMPLETED	1997
*R1302500	CV_HGC_BIO_MOM	BIOLOGICAL MOTHERS HIGHEST GRADE COMPLETED	1997


recode 		CV_HGC_BIO_MOM_1997 (-4/-3=.)(0/11=0)(95=0)(12=1)(13/15=2)(16/20=3), gen(educparmom)
recode 		CV_HGC_BIO_DAD_1997 (-4/-3=.)(0/11=0)(95=0)(12=1)(13/15=2)(16/20=3), gen(educpardad)
recode 		CV_HGC_RES_MOM_1997 (-4/-3=.)(0/11=0)(95=0)(12=1)(13/15=2)(16/20=3), gen(educparmomr)
recode 		CV_HGC_RES_DAD_1997 (-4/-3=.)(0/11=0)(95=0)(12=1)(13/15=2)(16/20=3), gen(educpardadr)

egen 		momeduc = 	rowmax(educparmo*) // This way I have created a education variable for mom
egen 		dadeduc = 	rowmax(educpardad*)
egen 		parenteduc = rowmax(educpar*) 


// 4385 young men 
browse *educ if momeduc > dadeduc & momeduc != . & dadeduc != . & SEX == 1 // For young men, 872 of them has higher educated mom than dad.
browse *educ if momeduc < dadeduc & momeduc != . & dadeduc != . & SEX == 1 // For young men, 868 of them has higher educated dad than mom
browse *educ if momeduc == dadeduc & momeduc != . & dadeduc != . & SEX == 1 // 1829 of them has equal education
browse *educ if momeduc == dadeduc & momeduc == . & dadeduc == . & SEX == 1 // 187 of them has no parental education observed
browse *educ if momeduc > dadeduc & momeduc == . & dadeduc != . & SEX == 1 // 58 of them has missing mom educat
browse *educ if momeduc < dadeduc & momeduc != . & dadeduc == . & SEX == 1 // 571 of them has missing dad educat


// This way I have created a education variable for parents that picks up the highest educ level from either mom or dad. The problem is, it says bio mom and dad. Are there non-bio mom and dad education level?
// Follow-up: I added the non residential variable for mom and dad
*browse 		ID educpar*
label 		define parenteduc 0 "Less than HS" 1 "HS" 2 "Some College" 3 "College Degree and +"
label 		values parenteduc parenteduc


label 		define momeduc 0 "Less than HS" 1 "HS" 2 "Some College" 3 "College Degree and +"
label 		values momeduc momeduc

* replace 	momeduc = parenteduc if momeduc == . & parenteduc != . 

// Follow up: 9.7.23 : I am going to use highest parent education so no need to replace momseduc with parenteduc.

recode 		momeduc 0/2 = 0 3=1, gen(momeduc_bi)
recode 		parenteduc 0/2 = 0 3=1, gen(parenteduc_bi)
label 		define parenteduc_bi 0 "Less than College" 1 "College Degree and +"
label 		values parenteduc_bi parenteduc_bi

label 		define momeduc_bi 0 "Less than College" 1 "College Degree and +"
label 		values momeduc_bi momeduc_bi





// Feb 20.22 - I recoded parents education to 4 groups
// Oct 12.22 - I am creating a continuous parental educ variable
/*recode 		CV_HGC_BIO_MOM_1997 (-4/-3=.)(95=1), gen(educparmom_cont)
recode 		CV_HGC_BIO_DAD_1997 (-4/-3=.)(95=1), gen(educpardad_cont)
recode 		CV_HGC_RES_MOM_1997 (-4/-3=.)(95=1), gen(educparmomr_cont)
recode 		CV_HGC_RES_DAD_1997 (-4/-3=.)(95=1), gen(educpardadr_cont)

egen 		momeduc_cont = rowmax(educparmom_cont educparmomr_cont) 
egen 		dadeduc_cont = rowmax(educpardad_cont educpardadr_cont) 

histogram 	momeduc_cont, freq name(g1, replace) nodraw
histogram 	dadeduc_cont, freq name(g2, replace) nodraw
graph combine g1 g2

sum momeduc_cont dadeduc_cont, detail

** create a dichotmous variable separating less than hs and hs and more
gen 		momedu_bi = .
replace 	momedu_bi = 0 if momeduc_cont <12
replace 	momedu_bi = 1 if momeduc_cont >=12
label 		define momedu_bi 0 "Less than HS" 1 "HS or more" 
label 		values momedu_bi momedu_bi

** create a dichotmous variable separating less than hs and hs and more
gen 		momeduCol_bi = .
replace 	momeduCol_bi = 0 if momeduc_cont <16
replace 	momeduCol_bi = 1 if momeduc_cont >=16
label 		define momeduCol_bi 0 "Less than College" 1 "College or more" 
label 		values momeduCol_bi momeduCol_bi
*/


/*
gen 		parenteduc2 = parenteduc
label var 	parenteduc2 "education year of respondent (for mean imputation)"
gen 		miss_parenteduc = 0
replace 	miss_parenteduc = 1 if parenteduc2 == -3
replace 	miss_parenteduc = 1 if parenteduc2 == -4
label var 	miss_parenteduc "missing education"
sum 		miss_parenteduc
sum 		parenteduc2
return list

replace 	parenteduc2=round(r(mean)) if parenteduc2 == -3
replace 	parenteduc2=round(r(mean)) if parenteduc2 == -4
label 		define parenteduc2 0 "Less than Highschool" 1 "HS" 2 "Some College or more" // 3 is actually Associate degree and more
label 		values parenteduc2 parenteduc2
tab 		parenteduc2
*/

*save "$temp/recoding1", replace
*use "$temp/recoding1", clear


* Proxy for number of siblings in 1997
rename 		CV_HH_UNDER_18_1997 nsibling97 // there is no missing data here and it can be a proxy for number of siblings (Maslowsky et al. 2021)
recode 		nsibling97 (0=1)
recode		nsibling97 (1=0)(2=1)(3/10=2), gen (sibling97)
label 		define sibling97 0 "No sibling in hh" 1 "1 sibling in hh" 2 "2 siblings and more"
label 		values sibling97 sibling97
// use this as either continuos or categorical


** Mom's age at firsth birth (not to respondent)

recode 		CV_BIO_MOM_AGE_CHILD1_1997 (-3=.)(1/14=15)(46/63=44), gen(momagebirth)



/*
* Proxy for	number of siblings in 2003
rename 		CV_HH_UNDER_18_2003 nsibling03 
recode		nsibling03 (0/1=0)(2=1)(3/10=2), gen (sibling03)
label 		define sibling03 0 "No sibling in hh" 1 "1 sibling in hh" 2 "2 siblings and more"
label 		values sibling03 sibling03

// So here I create and pick from two years considering that between 1997 and 2003 where children are under 18, they have a new born sibling or adapted sibling or step sibling. This
gen 		differencesibling = nsibling97 - nsibling03 
gen 		sibling = .
replace 	sibling = sibling97 if differencesibling >= 0 // If the sibling number in 1997 is same or more than 2003, take 1997
replace 	sibling = sibling03 if differencesibling < 0 // If the sibling number in 1997 is less than 2003, take 2003
label 		define sibling 0 "No sibling in hh" 1 "1 sibling in hh" 2 "2 siblings and more"
label 		values sibling sibling

egen		nsibling = rowtotal(nsibling*)
*/


* Not sure how I use this 
gen 	yearatage24 = BYEAR + 24
gen 	yearatage32 = BYEAR + 32
gen 	yearatage33 = BYEAR + 33
gen		yearatage34 = BYEAR + 34


* marital status at age 23
gen 		marstat23 = .
replace		marstat23 = MARSTAT2003 if BYEAR == 1980
replace		marstat23 = MARSTAT2004 if BYEAR == 1981
replace		marstat23 = MARSTAT2005 if BYEAR == 1982
replace		marstat23 = MARSTAT2006 if BYEAR == 1983
replace		marstat23 = MARSTAT2007 if BYEAR == 1984
label 		define marstat23 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat23 marstat23
recode 		marstat23 (1=1)(0=0)(2/4=0)(-5/-3=.), gen(maritalstat23)
label 		define maritalstat23 0 "Single" 1 "Married" 
label 		values maritalstat23 maritalstat23


* marital status at age 24
gen 		marstat24 = .
replace		marstat24 = MARSTAT2004 if BYEAR == 1980
replace		marstat24 = MARSTAT2005 if BYEAR == 1981
replace		marstat24 = MARSTAT2006 if BYEAR == 1982
replace		marstat24 = MARSTAT2007 if BYEAR == 1983
replace		marstat24 = MARSTAT2008 if BYEAR == 1984
label 		define marstat24 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat24 marstat24
recode 		marstat24 (1=1)(0=0)(2/4=0)(-5/-3=.), gen(maritalstat24)
label 		define maritalstat24 0 "Single" 1 "Married" 
label 		values maritalstat24 maritalstat24 

* marital status at age 25
gen 		marstat25 = .
replace		marstat25 = MARSTAT2005 if BYEAR == 1980
replace		marstat25 = MARSTAT2006 if BYEAR == 1981
replace		marstat25 = MARSTAT2007 if BYEAR == 1982
replace		marstat25 = MARSTAT2008 if BYEAR == 1983
replace		marstat25 = MARSTAT2009 if BYEAR == 1984
label 		define marstat25 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat25 marstat25
recode 		marstat25 (1=1)(0=0)(2/4=0)(-5/-3=.), gen(maritalstat25)
label 		define maritalstat25 0 "Single" 1 "Married" 
label 		values maritalstat25 maritalstat25

* marital status at age 30
gen 		marstat30 = .
replace		marstat30 = MARSTAT2010 if BYEAR == 1980
replace		marstat30 = MARSTAT2011 if BYEAR == 1981
replace		marstat30 = MARSTAT2011 if BYEAR == 1982
replace		marstat30 = MARSTAT2013 if BYEAR == 1983
replace		marstat30 = MARSTAT2013 if BYEAR == 1984
label 		define marstat30 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat30 marstat30 
recode 		marstat30 (1=1)(0=0)(2/4=2)(-5/-3=.), gen(maritalstat30)
label 		define maritalstat30 0 "Single" 1 "Married" 2 "Separated/Divorced/Widowed"
label 		values maritalstat30 maritalstat30

* marital status at age 31
gen 		marstat31 = .
replace		marstat31 = MARSTAT2011 if BYEAR == 1980
replace		marstat31 = MARSTAT2013 if BYEAR == 1981
replace		marstat31 = MARSTAT2013 if BYEAR == 1982
replace		marstat31 = MARSTAT2015 if BYEAR == 1983
replace		marstat31 = MARSTAT2015 if BYEAR == 1984
label 		define marstat31 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat31 marstat31 
recode 		marstat31 (1=1)(0=0)(2/4=2)(-5/-3=.), gen(maritalstat31)
label 		define maritalstat31 0 "Single" 1 "Married" 2 "Separated/Divorced/Widowed"
label 		values maritalstat30 maritalstat31


* marital status at age 32
gen 		marstat32 = .
replace		marstat32 = MARSTAT2011 if BYEAR == 1980
replace		marstat32 = MARSTAT2013 if BYEAR == 1981
replace		marstat32 = MARSTAT2013 if BYEAR == 1982
replace		marstat32 = MARSTAT2015 if BYEAR == 1983
replace		marstat32 = MARSTAT2015 if BYEAR == 1984
label 		define marstat32 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat32 marstat32 
recode 		marstat32 (1=1)(0=0)(2/4=2)(-5/-3=.), gen(maritalstat32)
label 		define maritalstat32 0 "Single" 1 "Married" 2 "Separated/Divorced/Widowed"
label 		values maritalstat32 maritalstat32

* marital status at age 33
gen 		marstat33 = .
replace		marstat33 = MARSTAT2013 if BYEAR == 1980
replace		marstat33 = MARSTAT2013 if BYEAR == 1981
replace		marstat33 = MARSTAT2015 if BYEAR == 1982
replace		marstat33 = MARSTAT2015 if BYEAR == 1983
replace		marstat33 = MARSTAT2017 if BYEAR == 1984
label 		define marstat33 0 "Never married" 1 "Married" 2 "Separated" 3 "Divorced" 4 "Widowed"
label 		values marstat33 marstat33 
recode 		marstat33 (1=1)(0=0)(2/4=2)(-5/-3=.), gen(maritalstat33)
label 		define maritalstat33 0 "Single" 1 "Married" 2 "Separated/Divorced/Widowed"
label 		values maritalstat33 maritalstat33

*save "$temp/recoding1a", replace
*use "$temp/recoding1a", clear


**** If cohab or not

forvalues y=1997/2011{
	recode 	UNIONSTAT`y' (-5=.)(-3=.)(2=0)(4=0)(6=0)(8=0)(10=0)(1=1)(3=1)(5=1)(7=1)(9=1), gen(unionstat`y')
	label 	define unionstat`y' 0 "Not cohabiting" 1 "Cohabiting"
	label 	values unionstat`y' unionstat`y'
}

foreach y of numlist 2013 2015 2017 {
	recode 	UNIONSTAT`y' (-5=.)(-3=.)(1=1)(2=0)(3=1)(4=0)(5=1)(6=0)(7=1)(8=0)(9=1)(10=0), gen(unionstat`y')
	label 	define unionstat`y' 0 "Not cohabiting" 1 "Cohabiting"
	label 	values unionstat`y' unionstat`y'
}



* cohab status at age 23
gen 		unionstat23 = .
replace		unionstat23 = unionstat2003 if BYEAR == 1980
replace		unionstat23 = unionstat2004 if BYEAR == 1981
replace		unionstat23 = unionstat2005 if BYEAR == 1982
replace		unionstat23 = unionstat2006 if BYEAR == 1983
replace		unionstat23 = unionstat2007 if BYEAR == 1984
label 		define unionstat23 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat23 unionstat23


* cohab status at age 24
gen 		unionstat24 = .
replace		unionstat24 = unionstat2004 if BYEAR == 1980
replace		unionstat24 = unionstat2005 if BYEAR == 1981
replace		unionstat24 = unionstat2006 if BYEAR == 1982
replace		unionstat24 = unionstat2007 if BYEAR == 1983
replace		unionstat24 = unionstat2008 if BYEAR == 1984
label 		define unionstat24 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat24 unionstat24

* cohab status at age 25
gen 		unionstat25 = .
replace		unionstat25 = unionstat2005 if BYEAR == 1980
replace		unionstat25 = unionstat2006 if BYEAR == 1981
replace		unionstat25 = unionstat2007 if BYEAR == 1982
replace		unionstat25 = unionstat2008 if BYEAR == 1983
replace		unionstat25 = unionstat2009 if BYEAR == 1984
label 		define unionstat25 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat25 unionstat25


* cohab status at age 30
gen 		unionstat30 = .
replace		unionstat30 = unionstat2010 if BYEAR == 1980
replace		unionstat30 = unionstat2011 if BYEAR == 1981
replace		unionstat30 = unionstat2011 if BYEAR == 1982
replace		unionstat30 = unionstat2013 if BYEAR == 1983
replace		unionstat30 = unionstat2013 if BYEAR == 1984
label 		define unionstat30 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat30 unionstat30 

* cohab status at age 31
gen 		unionstat31 = .
replace		unionstat31 = unionstat2011 if BYEAR == 1980
replace		unionstat31 = unionstat2013 if BYEAR == 1981
replace		unionstat31 = unionstat2013 if BYEAR == 1982
replace		unionstat31 = unionstat2015 if BYEAR == 1983
replace		unionstat31 = unionstat2015 if BYEAR == 1984
label 		define unionstat31  0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat31 unionstat31 

* cohab status at age 32
gen 		unionstat32 = .
replace		unionstat32 = unionstat2011 if BYEAR == 1980
replace		unionstat32 = unionstat2013 if BYEAR == 1981
replace		unionstat32 = unionstat2013 if BYEAR == 1982
replace		unionstat32 = unionstat2015 if BYEAR == 1983
replace		unionstat32 = unionstat2015 if BYEAR == 1984
label 		define unionstat32 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat32 unionstat32 


* cohab status at age 33
gen 		unionstat33 = .
replace		unionstat33 = unionstat2013 if BYEAR == 1980
replace		unionstat33 = unionstat2013 if BYEAR == 1981
replace		unionstat33 = unionstat2015 if BYEAR == 1982
replace		unionstat33 = unionstat2015 if BYEAR == 1983
replace		unionstat33 = unionstat2017 if BYEAR == 1984
label 		define unionstat33 0 "Not cohabiting" 1 "Cohabiting"
label 		values unionstat33 unionstat33 




**** Replacements
replace 	maritalstat24 = maritalstat23 if maritalstat24 == .
replace 	maritalstat24 = maritalstat25 if maritalstat24 == . 
replace 	maritalstat32 = maritalstat33 if maritalstat32 == . 
replace 	maritalstat32 = maritalstat30 if maritalstat32 == . 

replace 	unionstat24 = unionstat23 if unionstat24 == .
replace 	unionstat24 = unionstat25 if unionstat24 == . 
replace 	unionstat32 = unionstat30 if unionstat32 == . 
replace 	unionstat32 = unionstat33 if unionstat32 == . 



*** Can I merge these two variables?

gen 		unionstatus24 = .
replace 	unionstatus24 = 0 if maritalstat24 == 0  & unionstat24 == 0
replace 	unionstatus24 = 1 if maritalstat24 == 0  & unionstat24 == 1
replace 	unionstatus24 = 2 if maritalstat24 == 1  & unionstat24 == 0
replace 	unionstatus24 = 2 if maritalstat24 == 1  & unionstat24 == 1
replace 	unionstatus24 = 0 if maritalstat24 == 2  & unionstat24 == 0
replace 	unionstatus24 = 1 if maritalstat24 == 2  & unionstat24 == 1
label 		define unionstatus24 0 "Unpartnered" 1 "Cohabiting" 2 "Married"
label		values unionstatus24 unionstatus24






gen 		unionstatus32 = .
replace 	unionstatus32 = 0 if maritalstat32 == 0  & unionstat32 == 0
replace 	unionstatus32 = 1 if maritalstat32 == 0  & unionstat32 == 1
replace 	unionstatus32 = 2 if maritalstat32 == 1  & unionstat32 == 0
replace 	unionstatus32 = 2 if maritalstat32 == 1  & unionstat32 == 1
replace 	unionstatus32 = 0 if maritalstat32 == 2  & unionstat32 == 0
replace 	unionstatus32 = 1 if maritalstat32 == 2  & unionstat32 == 1
label 		define unionstatus32 0 "Unpartnered" 1 "Cohabiting" 2 "Married"
label		values unionstatus32 unionstatus32

drop unionstat2* UNIONSTAT20* unionstat3*


// which cohort

generate	cohort = BYEAR

*save "$temp/recoding2", replace
*use "$temp/recoding2", clear

* having a child at 24 32 // this effects independent variable rather than dependent
*21		U1852800	CV_BIO_CHILD_HH_U18	# BIO CHILDREN R HAS IN HOUSEHOLD (UNDER AGE 18 ONLY)	2017
*22		U1852900	CV_BIO_CHILD_NR_U18	# NON-RESIDENT BIO CHILDREN R HAS (UNDER AGE 18 ONLY)	2017

// In the NLS Investigator website for these children variable it is suggested that "Note: Rs without any biological children are assigned a valid skip (-4)." That is why i code -4 as 0 instead of missing. 
// (1/. - indicates whatever the upper limit is.

** bio HH child
forvalues y=2003/2011{
rename 	CV_BIO_CHILD_HH_`y' children`y'
}

foreach y of numlist 2013 2015 2017 {
rename 		CV_BIO_CHILD_HH_`y' children`y'
}

** NR child
forvalues y=2003/2011{
rename 	CV_BIO_CHILD_NR_`y' children_nr`y'
}

foreach y of numlist 2013 2015 2017 {
rename 		CV_BIO_CHILD_NR_`y' children_nr`y'
}

*save "$temp/recoding2a", replace
*use "$temp/recoding2a", clear

// BIO child in HH
forvalues y = 2003/2011 {
    recode children`y' (-5 = .)(-3 = .)(-4=0)(0=0)(1/. = 1), gen(child_hh`y')
    label define child_hh`y' 0 "No child in HH" 1 "Have children"
    label values child_hh`y' child_hh`y'
}


foreach y of numlist 2013 2015 2017 {
	recode 		children`y' (-5=.)(-4=0)(-3=.)(0=0)(1/.=1), gen (child_hh`y')
	label 		define child_hh`y' 0 "No child in HH" 1 "Have children"
	label 		values child_hh`y' child_hh`y'
}

// Non-resident child coding

forvalues y=2003/2011 {
	recode 		children_nr`y' (-5=.)(-4=0)(-3=.)(0=0)(1/.=1), gen (child_nr`y')
	label 		define child_nr`y' 0 "No NR child" 1 "Have NR children"
	label 		values child_nr`y' child_nr`y'
}

foreach y of numlist 2013 2015 2017 {
	recode 		children_nr`y' (-5=.)(-4=0)(-3=.)(0=0)(1/.=1), gen (child_nr`y')
	label 		define child_nr`y' 0 "No NR child" 1 "Have NR children"
	label 		values child_nr`y' child_nr`y'
}


*save "$temp/recoding2b", replace
*use "$temp/recoding2b", clear

** Collapse NR and HH child 

forvalues y=2003/2011 {
	gen 		child`y' = child_hh`y' + child_nr`y'
	*recode    	child`y' (0=0)(1/2=1)
	label 		define child`y' 0 "No child" 1 "Have child"
	label 		values child`y' child`y'
}

foreach y of numlist 2013 2015 2017 {
	gen 		child`y' = child_hh`y' + child_nr`y'
	*recode    	child`y' (0=0)(1/2=1)
	label 		define child`y' 0 "No child" 1 "Have child"
	label 		values child`y' child`y'
}


forvalues y=2003/2011 {
	generate anychild`y' = .
	replace anychild`y' = 0 if child`y' == 0 
	replace anychild`y' = 1 if child_hh`y' == 1 & child_nr`y' == 0
	replace anychild`y' = 2 if child_hh`y' == 0 & child_nr`y' == 1
	replace anychild`y' = 1 if child_hh`y' == 1 & child_nr`y' == 1
	label 	define anychild`y' 0 "No child" 1 "Have residential child" 2 "Have non-residential child"
	label 	values anychild`y' anychild`y'
}


foreach y of numlist 2013 2015 2017 {
	generate anychild`y' = .
	replace anychild`y' = 0 if child`y' == 0 
	replace anychild`y' = 1 if child_hh`y' == 1 & child_nr`y' == 0
	replace anychild`y'= 2 if child_hh`y' == 0 & child_nr`y' == 1
	replace anychild`y' = 1 if child_hh`y' == 1 & child_nr`y' == 1
	label 	define anychild`y' 0 "No child" 1 "Have residential child" 2 "Have non-residential child"
	label 	values anychild`y' anychild`y'
}



gen 		children23 = .
replace		children23 = anychild2003 if BYEAR == 1980
replace		children23 = anychild2004 if BYEAR == 1981
replace		children23 = anychild2005 if BYEAR == 1982
replace		children23 = anychild2006 if BYEAR == 1983
replace		children23 = anychild2007 if BYEAR == 1984
label 		define children23 0 "No child at age 23" 1 "Have residential children at age 23" 2 "Have nonresidential children at age 23"
label 		values children23 children23

gen 		children24 = .
replace		children24 = anychild2004 if BYEAR == 1980
replace		children24 = anychild2005 if BYEAR == 1981
replace		children24 = anychild2006 if BYEAR == 1982
replace		children24 = anychild2007 if BYEAR == 1983
replace		children24 = anychild2008 if BYEAR == 1984
label 		define children24 0 "No child at age 24" 1 "Have residential children at age 24" 2 "Have nonresidential children at age 24"
label 		values children24 children24

gen 		children25 = .
replace		children25 = anychild2005 if BYEAR == 1980
replace		children25 = anychild2006 if BYEAR == 1981
replace		children25 = anychild2007 if BYEAR == 1982
replace		children25 = anychild2008 if BYEAR == 1983
replace		children25 = anychild2009 if BYEAR == 1984
label 		define children25 0 "No child at age 24" 1 "Have residential children at age 25" 2 "Have nonresidential children at age 25"
label 		values children25 children25

// Follow-up: 9.7.23: I am adding age 30, because it doesn't make sense when I do the replacements of age 32 with 31 since I already use the year before because the survey becomes biannually after a point
gen 		children30 = .
replace		children30 = anychild2010 if BYEAR == 1980
replace		children30 = anychild2011 if BYEAR == 1981
replace		children30 = anychild2011 if BYEAR == 1982
replace		children30 = anychild2013 if BYEAR == 1983
replace		children30 = anychild2013 if BYEAR == 1984


gen 		children31 = .
replace		children31 = anychild2011 if BYEAR == 1980
replace		children31 = anychild2011 if BYEAR == 1981
replace		children31 = anychild2013 if BYEAR == 1982
replace		children31 = anychild2013 if BYEAR == 1983
replace		children31 = anychild2015 if BYEAR == 1984

gen 		children32 = .
replace		children32 = anychild2011 if BYEAR == 1980
replace		children32 = anychild2013 if BYEAR == 1981
replace		children32 = anychild2013 if BYEAR == 1982
replace		children32 = anychild2015 if BYEAR == 1983
replace		children32 = anychild2015 if BYEAR == 1984

label 		define children32 0 "No children at 32" 1 "Have residential children at age 32" 2 "Have nonresidential children at age 32"
label 		values children32 children32

gen 		children33 = .
replace		children33 = anychild2013 if BYEAR == 1980
replace		children33 = anychild2013 if BYEAR == 1981
replace		children33 = anychild2015 if BYEAR == 1982
replace		children33 = anychild2015 if BYEAR == 1983
replace		children33 = anychild2017 if BYEAR == 1984


** Replacement/ Substitution - replace children status 24 with childrenstatus at 23 for missings
replace 	children24 = children23 if children24 == . 
replace 	children24 = children25 if children24 == . 
replace 	children32 = children30 if children32 == . 
replace 	children32 = children33 if children32 == .


** Some replacements I use other ages as a proxy
/*
replace 	children32 = child2010 if BYEAR == 1980 & child2011 == . & child2010 != .
replace 	children32 = child2013 if BYEAR == 1980 & child2011 == . & child2013 != . 
replace 	children32 = child2011 if BYEAR == 1981 & child2013 == . & child2011 != .
replace 	children32 = child2015 if BYEAR == 1981 & child2013 == . & child2015 != .
replace 	children32 = child2015 if BYEAR == 1982 & child2013 == . & child2015 != .
replace 	children32 = child2011 if BYEAR == 1982 & child2013 == . & child2011 != .
replace 	children32 = child2013 if BYEAR == 1983 & child2015 == . & child2013 != .
replace 	children32 = child2017 if BYEAR == 1983 & child2015 == . & child2017 != .
replace 	children32 = child2013 if BYEAR == 1984 & child2015 == . & child2013 != .
replace 	children32 = child2017 if BYEAR == 1984 & child2015 == . & child2017 != .
*/


** R&R 2 -- 1/5/2024


** R&R 2 -- 1/5/2024
gen 		childrenhh23 = .
replace		childrenhh23 = child_hh2003 if BYEAR == 1980
replace		childrenhh23 = child_hh2004 if BYEAR == 1981
replace		childrenhh23 = child_hh2005 if BYEAR == 1982
replace		childrenhh23 = child_hh2006 if BYEAR == 1983
replace		childrenhh23 = child_hh2007 if BYEAR == 1984
label 		define childrenhh23 0 "No child_hh at age 23" 1 "Have childrenhh at age 23"
label 		values childrenhh23 childrenhh23

gen 		childrenhh24 = .
replace		childrenhh24 = child_hh2004 if BYEAR == 1980
replace		childrenhh24 = child_hh2005 if BYEAR == 1981
replace		childrenhh24 = child_hh2006 if BYEAR == 1982
replace		childrenhh24 = child_hh2007 if BYEAR == 1983
replace		childrenhh24 = child_hh2008 if BYEAR == 1984
label 		define childrenhh24 0 "No child_hh at age 24" 1 "Have childrenhh at age 24"
label 		values childrenhh24 childrenhh24

gen 		childrenhh25 = .
replace		childrenhh25 = child_hh2005 if BYEAR == 1980
replace		childrenhh25 = child_hh2006 if BYEAR == 1981
replace		childrenhh25 = child_hh2007 if BYEAR == 1982
replace		childrenhh25 = child_hh2008 if BYEAR == 1983
replace		childrenhh25 = child_hh2009 if BYEAR == 1984
label 		define childrenhh25 0 "No child_hh at age 24" 1 "Have childrenhh at age 24"
label 		values childrenhh25 childrenhh25

gen 		childrenhh30 = .
replace		childrenhh30 = child_hh2010 if BYEAR == 1980
replace		childrenhh30 = child_hh2011 if BYEAR == 1981
replace		childrenhh30 = child_hh2011 if BYEAR == 1982
replace		childrenhh30 = child_hh2013 if BYEAR == 1983
replace		childrenhh30 = child_hh2013 if BYEAR == 1984


gen 		childrenhh31 = .
replace		childrenhh31 = child_hh2011 if BYEAR == 1980
replace		childrenhh31 = child_hh2011 if BYEAR == 1981
replace		childrenhh31 = child_hh2013 if BYEAR == 1982
replace		childrenhh31 = child_hh2013 if BYEAR == 1983
replace		childrenhh31 = child_hh2015 if BYEAR == 1984

gen 		childrenhh32 = .
replace		childrenhh32 = child_hh2011 if BYEAR == 1980
replace		childrenhh32 = child_hh2013 if BYEAR == 1981
replace		childrenhh32 = child_hh2013 if BYEAR == 1982
replace		childrenhh32 = child_hh2015 if BYEAR == 1983
replace		childrenhh32 = child_hh2015 if BYEAR == 1984

label 		define childrenhh32 0 "No childrenhh at 32" 1 "Have childrenhh at 32"
label 		values childrenhh32 childrenhh32

gen 		childrenhh33 = .
replace		childrenhh33 = child_hh2013 if BYEAR == 1980
replace		childrenhh33 = child_hh2013 if BYEAR == 1981
replace		childrenhh33 = child_hh2015 if BYEAR == 1982
replace		childrenhh33 = child_hh2015 if BYEAR == 1983
replace		childrenhh33 = child_hh2017 if BYEAR == 1984

** Replacement/ Substitution - replace childrenhh status 24 with childrenhhstatus at 23 for missings
replace 	childrenhh24 = childrenhh23 if childrenhh24 == . 
replace 	childrenhh24 = childrenhh25 if childrenhh24 == . 
replace 	childrenhh32 = childrenhh30 if childrenhh32 == . 
replace 	childrenhh32 = childrenhh33 if childrenhh32 == .


// I might not use number of children. There is missing data and not sure what to do with it like -5.
// Follow up: For now, I just merged them with zero
// Follow-up: I recoded them to missing.

/*
Maslowsky et al. 2021

Lived in rural community. NLSY coded the county and state of participants'
residences at the Wave 1 interviews as rural or non-rural according to the
percent urban population of the county.

Household composition at year of first birth. Two dichotomous variables
captured whether the mother lived with her parents and whether she lived
with a spouse or romantic partner at the year of her first birth.

Schooling completed by year of first birth. In both surveys, participants
reported how many years of school they had completed. As teen mothers in
the present study were ages 14 to 17 at their first birth, their age at first birth
is controlled for in all models to account for the expected differences in years
of schooling completed between ages 14 and 17.
*/

// WEIGHT???????
// WHAT type of analysis do I need?
// write down your meausures!!! Look at Haley strizel article!!!
// https://journals.sagepub.com/doi/full/10.1177/0044118X211026941?casa_token=uRFh3tRf1u4AAAAA%3ALFnBvn5TUOFUqZvgwrG7NJyqfw_616Nge2vpF1Zn0IuB9VNOtxmUQpxnfK9nGxNozZLWeOKK7mY-CQ
//

*logit employmentstability33 c.totalduration2433 i.SEX i.race i.b2.citizenship i.education i.marstat33 i.children i.sibling i.parenteduc i.livingarrangement1997 [pweight=SAMPLING_PANEL_WEIGHT_1997] // 

*logit employmentstability33 c.totalduration2433 i.SEX i.race i.citizenship i.education i.maritalstat33 c.nsibling i.parenteduc i.livingarrangement1997 [pweight=SAMPLING_PANEL_WEIGHT_1997] // use this with continuous sibling
*outreg2 using model2.xls, replace ctitle(model 1) alpha (0.001, 0.01, 0.05)


/// Previous incarcertaion status

* can I use - INCARC_TOTNUM_XRND - total number of incarcerations XRND for previous incarceration status? This does not take into account the age 24 though.
recode 		INCARC_TOTNUM_XRND (-3 = .)(0=0)(1/20 = 1), gen(incarstat)
label 		define incarstat 0 "Never Incarcerated" 1 "Incarcerated at least once"
label 		val incarstat incarstat
// There are missing to be imputed!


recode INCARC_AGE_FIRST_XRND -4=0 -3=0 12/24=1 25/32=2 33/37=3, gen(incarage)
gen 	incarstat24 = .
replace incarstat24 = 0 if inlist(incarage, 0, 2, 3) // this is coding that if they report 0 (never incarcerated) and incarcerated after 24 they would be coded as 0. so never incarcetaed until 24
replace incarstat24 = 1 if incarage == 1
label 	define incarstat24 0 "never incarcerated until 24" 1 " incarcerated by 24"
label 	val incarstat24 incarstat24


gen incarstat32 = .
replace incarstat32 = 0 if inlist(incarage, 0, 3)
replace incarstat32 = 1 if inlist(incarage, 1, 2)
label 	define incarstat32 0 "never incarcerated until 32" 1 " incarcerated by 32"
label 	val incarstat32 incarstat32


//// Urban-rural
** Create a count of the number of years respondents reported living in the South (Maume & Wilson 2015)
local 		urban CV_URBAN_RURAL_1997 CV_URBAN_RURAL_1998 CV_URBAN_RURAL_1999 CV_URBAN_RURAL_2000 CV_URBAN_RURAL_2001 CV_URBAN_RURAL_2002 CV_URBAN_RURAL_2003 CV_URBAN_RURAL_2004 CV_URBAN_RURAL_2005 CV_URBAN_RURAL_2006 CV_URBAN_RURAL_2007 CV_URBAN_RURAL_2008 CV_URBAN_RURAL_2009 CV_URBAN_RURAL_2010 CV_URBAN_RURAL_2011 CV_URBAN_RURAL_2013 CV_URBAN_RURAL_2015 CV_URBAN_RURAL_2017
 
 

forvalues i=1997/2011 {
	recode CV_URBAN_RURAL_`i'(-5/-3=.)(0=0 "not urban")(2=0 "not urban")(1=1 "urban"), gen(urban`i')
}

egen 		totalurban80 = rowtotal(urban1997 urban1998 urban1999 urban2000 urban2001 urban2002 urban2003 urban2004) if BYEAR == 1980
egen 		totalurban81 = rowtotal(urban1997 urban1998 urban1999 urban2000 urban2001 urban2002 urban2003 urban2004 urban2005) if BYEAR == 1981
egen 		totalurban82 = rowtotal(urban1997 urban1998 urban1999 urban2000 urban2001 urban2002 urban2003 urban2004 urban2005 urban2006) if BYEAR == 1982
egen 		totalurban83 = rowtotal(urban1997 urban1998 urban1999 urban2000 urban2001 urban2002 urban2003 urban2004 urban2005 urban2006 urban2007) if BYEAR == 1983
egen 		totalurban84 = rowtotal(urban1997 urban1998 urban1999 urban2000 urban2001 urban2002 urban2003 urban2004 urban2005 urban2006 urban2007 urban2008) if BYEAR == 1984

// // This following variable indicates the total number of years spend in urban areas until age 24.
generate	totalurban = .
replace		totalurban = totalurban80 if BYEAR == 1980
replace		totalurban = totalurban81 if BYEAR == 1981
replace		totalurban = totalurban82 if BYEAR == 1982
replace		totalurban = totalurban83 if BYEAR == 1983
replace		totalurban = totalurban84 if BYEAR == 1984
*replace 	totalurban = 0.01 if totalurban == 0
*gen 		logturban = log(totalurban) // to deal with skewedness to zero yet this is not skewed towards it so don't need to use the log version!


*************
*** South ***
*************
forvalues i=1997/2011 {
	recode CV_CENSUS_REGION_`i'(1/2=0 "Non-South")(3=1 "South")(-5/-3=.)(4=0 "Non-South"), gen(south`i')
}
recode 		CV_CENSUS_REGION_2013 (1/2=0 "Non-South")(3=1 "South")(-5/-3=.)(4=0 "Non-South"), gen(south2013)
recode 		CV_CENSUS_REGION_2015 (1/2=0 "Non-South")(3=1 "South")(-5/-3=.)(4=0 "Non-South"), gen(south2015)
recode 		CV_CENSUS_REGION_2017 (1/2=0 "Non-South")(3=1 "South")(-5/-3=.)(4=0 "Non-South"), gen(south2017)
*egen		totalsouth = rowtotal(south*)

egen 		totalsouth80 = rowtotal(south1997 south1998 south1999 south2000 south2001 south2002 south2003 south2004) if BYEAR == 1980
egen 		totalsouth81 = rowtotal(south1997 south1998 south1999 south2000 south2001 south2002 south2003 south2004 south2005) if BYEAR == 1981
egen 		totalsouth82 = rowtotal(south1997 south1998 south1999 south2000 south2001 south2002 south2003 south2004 south2005 south2006) if BYEAR == 1982
egen 		totalsouth83 = rowtotal(south1997 south1998 south1999 south2000 south2001 south2002 south2003 south2004 south2005 south2006 south2007) if BYEAR == 1983
egen 		totalsouth84 = rowtotal(south1997 south1998 south1999 south2000 south2001 south2002 south2003 south2004 south2005 south2006 south2007 south2008) if BYEAR == 1984

// This following variable indicates the total number of years spend in the south until age 24.
generate	totalsouth = .
replace		totalsouth = totalsouth80 if BYEAR == 1980
replace		totalsouth = totalsouth81 if BYEAR == 1981
replace		totalsouth = totalsouth82 if BYEAR == 1982
replace		totalsouth = totalsouth83 if BYEAR == 1983
replace		totalsouth = totalsouth84 if BYEAR == 1984

//replace 	totalsouth = 0.01 if totalsouth == 0
//gen 		logtsouth = log(totalsouth) // this variable is not skewed towards zero but I just did this in case

// I decided to dichotomise this variables
generate	south = .
replace 	south = 0 if totalsouth == 0
replace 	south = 1 if totalsouth > 0
label 		define south 0 "Never lived in the South" 1 "Lived in the South"
label 		val south south

// how to handle data with skew: https://towardsdatascience.com/top-3-methods-for-handling-skewed-data-1334e0debf45

 
save 	"$temp/recoding", replace
use 	"$temp/recoding", clear

// Personality traits
// Ten item personality measure 
// Gosling, S. D., Rentfrow, P. J., & Swann, W. B., Jr. (2003). A Very Brief Measure of the Big Five Personality Domains. Journal of Research in Personality, 37, 504-528.
// 

* Extraversion
fre 		YTEL_TIPIA_000001_2008
rename		YTEL_TIPIA_000001_2008 extra1
recode 		extra1 1=1 2=2 3=3 4=4 -2=4 5=5 6=6 7=7 -5=. -1=. -2 =.
rename 		YTEL_TIPIA_000006_2008 extra2
recode		extra2 1=7 2=6 3=5 4=4 -2=. 5=3 6=2 7=1 -5=. -1=. -2 =.
lab define	extra2 1 "Disagree strongly" 2 "Disagree moderately" 3 "Disagree a little" 4 "Neither agree nor disagree" 5 "Agree a little" 6 "Agree moderately" 7 "Agree strongly"
label val	extra2 extra2
replace 	extra2 = extra1 if extra2 == .
generate	aveextra = (extra1 + extra2) / 2


* Agreeableness
rename 		YTEL_TIPIA_000002_2008 agree1
rename 		YTEL_TIPIA_000007_2008 agree2
recode 		agree2 1=1 2=2 3=3 4=4 -2=4 5=5 6=6 7=7 -5=. -1=. -2 =.
recode		agree1 1=7 2=6 3=5 4=4 -2=. 5=3 6=2 7=1 -5=. -1=. -2 =.
lab define	agree1 1 "Disagree strongly" 2 "Disagree moderately" 3 "Disagree a little" 4 "Neither agree nor disagree" 5 "Agree a little" 6 "Agree moderately" 7 "Agree strongly"
label val	agree1 agree1
replace 	agree1 = agree2 if agree1 == .
generate	aveagree = (agree1 + agree2) / 2

* Conscientiousness
rename 		YTEL_TIPIA_000003_2008 consc1
recode 		consc1 1=1 2=2 3=3 4=4 -2=4 5=5 6=6 7=7 -5=. -1=. -2 =.
rename		YTEL_TIPIA_000008_2008 consc2
recode		consc2 1=7 2=6 3=5 4=4 -2=. 5=3 6=2 7=1 -5=. -1=. -2 =.
lab define	consc2 1 "Disagree strongly" 2 "Disagree moderately" 3 "Disagree a little" 4 "Neither agree nor disagree" 5 "Agree a little" 6 "Agree moderately" 7 "Agree strongly"
label val	consc2 consc2
replace 	consc2 = consc1 if consc2 == .
generate	avecons = (consc1 + consc2) / 2

* Emotional Stability
rename 		YTEL_TIPIA_000004_2008 emost1
rename 		YTEL_TIPIA_000009_2008 emost2
recode 		emost2 1=1 2=2 3=3 4=4 -2=4 5=5 6=6 7=7 -5=. -1=. -2 =.
recode		emost1 1=7 2=6 3=5 4=4 -2=. 5=3 6=2 7=1 -5=. -1=. -2 =.
lab define	emost1 1 "Disagree strongly" 2 "Disagree moderately" 3 "Disagree a little" 4 "Neither agree nor disagree" 5 "Agree a little" 6 "Agree moderately" 7 "Agree strongly"
label val	emost1 emost1
replace 	emost1 = emost2 if emost1 == .
generate	aveemost = (emost1 + emost2) / 2

* Openness to Experiences
rename 		YTEL_TIPIA_000005_2008 openx1
recode 		openx1 1=1 2=2 3=3 4=4 -2=4 5=5 6=6 7=7 -5=. -1=. -2 =.
rename		YTEL_TIPIA_000010_2008 openx2
recode		openx2 1=7 2=6 3=5 4=4 -2=. 5=3 6=2 7=1 -5=. -1=. -2 =.
lab define	openx2 1 "Disagree strongly" 2 "Disagree moderately" 3 "Disagree a little" 4 "Neither agree nor disagree" 5 "Agree a little" 6 "Agree moderately" 7 "Agree strongly"
label val	openx2 openx2
replace		openx2 = openx1 if openx2 == .
generate	aveopen = (openx1 + openx2) / 2


*Standardize all the variables
foreach x of varlist extra1 agree1 consc1 emost1 openx1 extra2 agree2 consc2 emost2 openx2 ave*{
egen z_`x'=std(`x')
} 

// "For ease of interpretation, we use standardized personality scores in all subsequent analyses." (Sansale et al. 2019)

// help egen- std(#) creates the standardized values (within varlist) of exp.  The options specify the desired mean and standard deviation.  The default is mean(0) and sd(1), producing a variable with mean 0 and standard deviation 1 (within each group defined by varlist).

sum z_*


alpha z_a*
alpha z_ex*
alpha z_c*
alpha z_o*
alpha z_em*
alpha z_ave*


// recode some Key variables to be able to use later in multiple imputation 
// -2 means refusal, so I can add that to no answer cases.

** Schooltype 97 - categorical 
rename 		KEY_SCHOOLTYPE_1997 schooltype97
recode 		schooltype97 -2=0

** Whether enrolled in 1997 - this is important because they are 12 and should be enrolled
rename 		KEY_ENROLLED_1997 enrolled97
recode 		enrolled97 -2=0

** CV_HH_SIZE_1997 - continuous
rename 		CV_HH_SIZE_1997 hhsize97

** General Health reporting. 
rename    	YHEA_100_1997 genhlth97
replace  	genhlth97 = YHEA_100_1998 if genhlth97 <0
recode 		genhlth97 (-5 = .)(1=5)(2=4)(4=2)(5=1) // from poor to excellent
recode 		genhlth97(.=3)



** General health YHEA_100_2000 YHEA_100_2001 YHEA_100_2002 YHEA_100_2003 YHEA_100_2004 YHEA_100_2005 YHEA_100_2006 YHEA_100_2007 YHEA_100_2008 YHEA_100_2009 YHEA_100_2010 YHEA_100_2011 YHEA_100_2013 YHEA_100_2015 YHEA_100_2017 YHEA_100_2019
*** Health at different ages

forvalues i = 2000/2009 {
  rename YHEA_100_`i' genhlth_`i'
  recode genhlth_`i' (-5/-1 = .) (1 = 5) (2 = 4) (4 = 2) (5 = 1)
  recode genhlth_`i' (1/2=0 "Fair/Poor")(3=1 "Good")(4/5=2 "Very good/Excellent"), gen(genhlth_`i'_cat)
}



	gen 		genhlt24 = . 
	replace		genhlt24 = genhlth_2004 if BYEAR == 1980
	replace		genhlt24 = genhlth_2005 if BYEAR == 1981
	replace		genhlt24 = genhlth_2006 if BYEAR == 1982
	replace		genhlt24 = genhlth_2007 if BYEAR == 1983
	replace		genhlt24 = genhlth_2008 if BYEAR == 1984
	
	replace 	genhlt24 = genhlth_2005 if BYEAR == 1980 & genhlt24 == . 
	replace 	genhlt24 = genhlth_2006 if BYEAR == 1981 & genhlt24 == . 
	replace 	genhlt24 = genhlth_2007 if BYEAR == 1982 & genhlt24 == . 
	replace 	genhlt24 = genhlth_2008 if BYEAR == 1983 & genhlt24 == . 
	replace 	genhlt24 = genhlth_2009 if BYEAR == 1984 & genhlt24 == .

** House dwelling in 97
rename 		KEY_DWELLING_1997 dwelling97
recode 		dwelling97 -2=14

** Parent guardian 97
rename 		KEY_PARENTGUAR_1997 parentguard97

** I had this code in propensity score analysis but carrying it here
recode 		empstatusage32 0=0 1/2=1, gen(emp32_bin) // I need this for teffects ipwra command


**************************************** ***************************************
********************  HOUSEHOLD INCOME/NETWORTH VARIABLES ********************** 
**************************************** *************************************** 
save 	"$temp/recodingx", replace
use 	"$temp/recodingx", clear

// 97 HH income GROSS HH INCOME IN PAST YEAR
/*Gross household income in the previous year.
/*Topcoded at the 2% level.  Truncated values are applied to the top 2 percent 
of respondents with valid non-missing responses.  The average value of the top 2
percent of cases is used as the value.  Negative values of -1, -2, -3, -4, or -5
do not reflect negative monetary amounts; these numbers represent standard 
NLSY97 codes.*/

       3     -999999 TO -3000: < -2999
       0       -2999 TO -2000
       0       -1999 TO -1000
       0        -999 TO -1
     100           0
      71           1 TO 1000
      41        1001 TO 2000
      98        2001 TO 3000
     139        3001 TO 5000
     465        5001 TO 10000
     925       10001 TO 20000
     819       20001 TO 30000
     835       30001 TO 40000
     765       40001 TO 50000
     834       50001 TO 65000
     610       65001 TO 80000
     397       80001 TO 100000
     321      100001 TO 150000
      32      150001 TO 200000
     133      200001 TO 999999: 200001+
  -------
    6588
 */

 
 // What is the household income brackets in 1997 -https://www.census.gov/library/publications/1998/demo/p60-200.html
 // How to classify income brackets?
 // I find another article that looks at the income brackets - Houle 2013 Sociology of education
 // Parents' income is a measure of parent reported 1997 household income and thus a measure of family background. 
 // This article (Houle 2013) updated the parents' income to 2010 by using this: https://www.census.gov/topics/income-poverty/income/guidance/current-vs-constant-dollars.html
 
 /// These theoretical orientations suggest that parents' income and education may both be negatively related to their young-adult children's student loan debt (Houle 2013)
 
 /// This is from Houle 2013 Sixteen percent of data from the National Longitudinal
*Study of Youth 1997 (NLSY97) parents' income measure is missing because NLSY97  
*codes parents' income as missing if parents failed to report any of the sources
*asked in the survey. Following Hill and Michael (2001), if a young adult's parents 
*provided valid information on wages and self-employment income, I retain those cases. 
*I treat missing data on other sources (i.e., social security and bank interest) as zero income.
* Hill, Carolyn J. and Robert T. Michael. 2001. ``Measuring Poverty in the NLSY97.'' The Journal of Human Resources 36:727-61 
 
 
 
 
// Household income from parent or respondent at year 1997 // what does this tell us? This tells us that these youth who are 12-16 are on their own?
tab 		CV_HH_INCOME_SOURCE_1997, m
recode 		CV_HH_INCOME_SOURCE_1997 (1=0)(2=1), gen(incomesource97)
label		define incomesource97 0 "Parental income" 1 "Youth income"
label 		values incomesource97 incomesource97

// CV_INCOME_GROSS_YR == Gross household income in the previous year.

/*Topcoded at the 2% level.  Truncated values are applied to the top 2 
percent of respondents with valid non-missing responses.  The average value of 
the top 2 percent of cases is used as the value.  Negative values of -1, -2, -3,
-4, or -5 do not reflect negative monetary amounts; these numbers represent 
standard NLSY97 codes.*/

recode  	CV_INCOME_GROSS_YR_1997 (-4/-3 =.), gen(hh_income97)
gen 		hhincome97 = hh_income97 + 1 // this is unnecessary if I use the quartiles

****** Alternative Income to be able to follow Houle 2013 who follows hill and michael
*COMPUTE PARENTAL_INCOME = SUM(R0609800, R0610100, R0610500, R0610800, R0611100, R0612700).
* The upper line is from: https://menghublog.wordpress.com/2013/03/22/holes-in-colorism-hypothesis-nlsy97-variables-syntax/
*the last two I don't have it in my data right now: R0611100, R0612700

*R0609800 - TOTAL INCOME FROM PRS WAGES AND SALARY LAST YEAR (TRUNC) 
// During 1996, how much income did you receive from wages, salary, commissions, or tips from all jobs, before deductions for taxes or anything else? P5_016_1997

*R0610100 - PRS TOTAL INCOME FROM BUS OR FARM LAST YEAR  (TRUNC)
// During 1996, how much income did you receive from your own farm, business,  partnership or professional practice AFTER EXPENSES?

*R0610500 - TOTAL INCOME PRS SPOUSE FROM WAGES AND SALARY LAST YEAR (TRUNC)
// During 1996, how much income did your [spouse/partner] receive from wages,  salary, commissions, or tips from all jobs, before deductions for taxes or anything else?

*R0610800 - TOTAL INCOME OF PRS SPOUSE FROM BUS OR FARM LAST YEAR (TRUNC)
// During 1996, how much did your [spouse/partner] receive from [his/her] own farm, business. partnership or professional practice AFTER EXPENSES?

*R0611100 - TOTAL INCOME FROM INTEREST FROM PRS BANK SOURCES AND ACCOUNTS? (TRUNC)
// What was the total amount of interest and dividend payments [you/you or your spouse/partner] received during 1996, including even small amounts and amounts reinvested or credited to the accounts?

*R0612700 - RS TOTAL INCOME FROM SS, PENSION, VETERAN, INSURANCE LAST YEAR (TRUNC)
// What was the total amount [you/you and your spouse/partner] received from all  other sources (e.g., friends, relatives, royalties or any other regular or periodic source of income) during 1996?

fre P5_016_1997 
fre P5_019_1997 
fre P5_028_1997 
fre P5_032_1997 
fre P5_046_1997
fre P5_068_1997

* recode negative values that are from -5 to -1 as missing
foreach x of varlist P5_016_1997 P5_019_1997 P5_028_1997 P5_032_1997 P5_046_1997 P5_068_1997 {
	recode `x' (-5/-1=.)
}

* Create the variable parental_income97 as the sum of the specified variables, ignoring missing values
egen parental_inc97 = rowtotal(P5_016_1997 P5_019_1997 P5_028_1997 P5_032_1997 P5_046_1997 P5_068_1997) // what does this do with missings?

replace parental_inc97 = . if missing(P5_016_1997) & missing(P5_019_1997) & missing(P5_028_1997) & missing(P5_032_1997) & missing(P5_046_1997) & missing(P5_068_1997)

replace hh_income97 = parental_inc97 if hh_income97 == . 

// I learned the following egen function "cut and group" to do quartiles from chatgpt
*egen 		qrt_hhincome97 = cut(hh_income97), group(4)
*label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
*label 		values qrt_hhincome97 qrt_hhincome97
// to see the cut-off points
*sort qrt_hhincome97 
*by qrt_hhincome97: summarize hh_income97




*create a logged version of income
*gen 		ln_hhincome97=log(hhincome97)
*label 		variable ln_hhincome97 "HH income 97(logged)"

*recode  CV_INCOME_GROSS_YR_1997 (-5/-1 =.)(-50000/-6 = 0 "Less than $40,000")(0/39999 = 0 "Less than $40,000")(40000/59999=1 "$40,000 to $59,999")(60000/99999=2 "$60,000 to $99,999")(100000/999999=3 "$100,000 and higher"), gen(hhincome97)





// Household net worth
// Looking for a reference article that i can similarly recode this variable. 
// For nlsy79, Conwell has an article focused on education, they use wealth. Conwell & Zi Ye, 2021 "All Wealth is not created equal:race, parental net worth and children's achievement"
// This is to understand the real value of those topcoded perhaps, but why 1.33? "In some years, wealth is top-coded at $50,000. In these years, we multiplied top-coded values by 1.33." 

// Household net worth and its squared
// child's mother was a teen mother
// whether any grandparent is a college graduate

/*
recode 		CV_HH_NET_WORTH_P_1997 (-5/-1=.), gen(hhnetwrth97)
replace 	hhnetwrth97 = 0.01 if hhnetwrth97 == 0

*create a logged version of net worth
gen 		ln_hhnetwrth97=log(hhnetwrth97)
label 		variable ln_hhnetwrth97 "HH networth(logged)"
*/

/*
**** Household net worth at age 20****
sum CVC_HH_NET_WORTH_20_XRND

recode 	CVC_HH_NET_WORTH_20_XRND (-6/-3 = .), gen(hhnetwrthatage20)
gen 	hhntwrthage20 = hhnetwrthatage20 + 1


*create a logged version of net worth of household at age 20
gen 		ln_hhntwrthatage20=log(hhntwrthage20)
*/


** Debt by 20
recode  	CVC_ASSETS_DEBTS_20_XRND (-4/-3=.), gen(debt20)
gen			debt_20 = debt20 + 1
generate	ln_debt20 = log(debt_20)

generate	havedebt20 = .
replace 	havedebt20 = 0 if debt20 == 0
replace 	havedebt20 = 1 if debt20 > 0 & debt20 != .
label 		define havedebt20 0 "No debt at 20" 1 "Have debt at 20"
label 		values havedebt20 havedebt20

** Debt by 25
recode  	CVC_ASSETS_DEBTS_25_XRND (-4/-3=.), gen(debt25)
generate	havedebt25 = .
replace 	havedebt25 = 0 if debt25 == 0
replace 	havedebt25 = 1 if debt25 > 0 & debt25 != .
label 		define havedebt25 0 "No debt at 25" 1 "Have debt at 25"
label 		values havedebt25 havedebt25

generate	debtat25 = debt25
replace 	debtat25 = 0.01 if debtat25 == 0
generate	ln_debt25 = log(debtat25)


** Debt by 30
recode  	CVC_ASSETS_DEBTS_30_XRND (-4/-3=.), gen(debt30)
generate	havedebt30 = .
replace 	havedebt30 = 0 if debt30 == 0
replace 	havedebt30 = 1 if debt30 > 0 & debt30 != .
label 		define havedebt30 0 "No debt at 30" 1 "Have debt at 30"
label 		values havedebt30 havedebt30


/*
** define a change in debt from 20 to 25
gen 		changedebt2025 = .
replace 	changedebt2025 = 0 if debt20 == debt25 & havedebt20 != . & havedebt25 != . // this indicates that debt did not change whether there was a debt or not
replace 	changedebt2025 = 1 if debt20 < debt25 & havedebt20 != . & havedebt25 != .  // this indicated that debt have increased
replace 	changedebt2025 = 2 if debt20 > debt25  & havedebt20 != . & havedebt25 != . // this indicated that debt has decreased
label 		define changedebt2025 0 "Debt, No change from 20 to 25" 1 "Debt, increased from 20 to 25" 2 "Debt, decreased from 20 to 25"
label 		values changedebt2025 changedebt2025


** define a change in debt from 20 to 25
gen 		changedebt2530 = .
replace 	changedebt2530 = 0 if debt25 == debt30 & havedebt25 != . & havedebt30 != . // this indicates that debt did not change whether there was a debt or not
replace 	changedebt2530 = 1 if debt25 < debt30 & havedebt25 != . & havedebt30 != .  // this indicated that debt have increased
replace 	changedebt2530 = 2 if debt25 > debt30  & havedebt25 != . & havedebt30 != . // this indicated that debt has decreased
label 		define changedebt2530 0 "Debt, No change from 25 to 30" 1 "Debt, increased from 25 to 30" 2 "Debt, decreased from 25 to 30"
label 		values changedebt2530 changedebt2530
*/


*save 	"$temp/recodings", replace
*use 	"$temp/recodings", clear
****************************
** Pschological wellbeing **
****************************
**These questions are a five-item short version of the Mental Health Inventory (MHI-5), developed by Veit and Ware in the late 1970s

* YSAQ_282C_ HOW OFTEN R HAS BEEN A NERVOUS PERSON IN PAST MONTH - neg more dep reverse code
* YSAQ_282D_ HOW OFTEN R FELT CALM AND PEACEFUL IN PAST MONTH - if hig postice, as it is
* YSAQ_282E_ HOW OFTEN R FELT DOWN OR BLUE IN PAST MONTH - neg , more dep, reverse code
* YSAQ_282F_ HOW OFTEN R HAS BEEN A HAPPY PERSON IN PAST MONTH, if high postivive, as it is
* YSAQ_282G_ HOW OFTEN R DEPRESSED IN LAST MONTH - neg , more dep, reverse code

* Load MHI-5 items from dataset for 2000
gen mh1_2000 = YSAQ_282C_2000  
gen mh2_2000 = YSAQ_282D_2000
gen mh3_2000 = YSAQ_282E_2000 
gen mh4_2000 = YSAQ_282F_2000
gen mh5_2000 = YSAQ_282G_2000

 
* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2000
gen mh2_score = mh2_2000
gen mh3_score = 5 - mh3_2000
gen mh4_score = mh4_2000
gen mh5_score = 5 - mh5_2000

* Compute total score
gen sum_mh_2000 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2000

alpha mh1_score mh2_score mh3_score mh4_score mh5_score
/*Average interitem covariance:     5.665111
Number of items in the scale:            5
Scale reliability coefficient:      0.9826*/
drop mh*

* Load MHI-5 items from dataset for 2002
gen mh1_2002 = YSAQ_282C_2002  
gen mh2_2002 = YSAQ_282D_2002
gen mh3_2002 = YSAQ_282E_2002 
gen mh4_2002 = YSAQ_282F_2002
gen mh5_2002 = YSAQ_282G_2002


* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2002
gen mh2_score = mh2_2002
gen mh3_score = 5 - mh3_2002
gen mh4_score = mh4_2002
gen mh5_score = 5 - mh5_2002

* Compute total score
gen sum_mh_2002 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2002
alpha mh1_score mh2_score mh3_score mh4_score mh5_score
drop mh*

* Load MHI-5 items from dataset for 2004
gen mh1_2004 = YSAQ_282C_2004  
gen mh2_2004 = YSAQ_282D_2004
gen mh3_2004 = YSAQ_282E_2004 
gen mh4_2004 = YSAQ_282F_2004
gen mh5_2004 = YSAQ_282G_2004

* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2004
gen mh2_score = mh2_2004
gen mh3_score = 5 - mh3_2004
gen mh4_score = mh4_2004
gen mh5_score = 5 - mh5_2004

* Compute total score
gen sum_mh_2004 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2004
alpha mh1_score mh2_score mh3_score mh4_score mh5_score
drop mh*

* Load MHI-5 items from dataset for 2006
gen mh1_2006 = YSAQ_282C_2006  
gen mh2_2006 = YSAQ_282D_2006
gen mh3_2006 = YSAQ_282E_2006 
gen mh4_2006 = YSAQ_282F_2006
gen mh5_2006 = YSAQ_282G_2006

* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2006
gen mh2_score = mh2_2006
gen mh3_score = 5 - mh3_2006
gen mh4_score = mh4_2006
gen mh5_score = 5 - mh5_2006

* Compute total score
gen sum_mh_2006 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2006
drop mh*

* Load MHI-5 items from dataset for 2008
gen mh1_2008 = YSAQ_282C_2008  
gen mh2_2008 = YSAQ_282D_2008
gen mh3_2008 = YSAQ_282E_2008 
gen mh4_2008 = YSAQ_282F_2008
gen mh5_2008 = YSAQ_282G_2008


* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2008
gen mh2_score = mh2_2008
gen mh3_score = 5 - mh3_2008
gen mh4_score = mh4_2008
gen mh5_score = 5 - mh5_2008

* Compute total score
gen sum_mh_2008 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2008
alpha mh1_score mh2_score mh3_score mh4_score mh5_score
drop mh*

* Load MHI-5 items from dataset for 2010
gen mh1_2010 = YSAQ_282C_2010  
gen mh2_2010 = YSAQ_282D_2010
gen mh3_2010 = YSAQ_282E_2010 
gen mh4_2010 = YSAQ_282F_2010
gen mh5_2010 = YSAQ_282G_2010


* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2010
gen mh2_score = mh2_2010
gen mh3_score = 5- mh3_2010
gen mh4_score = mh4_2010
gen mh5_score = 5 - mh5_2010

* Compute total score
gen sum_mh_2010 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2010
alpha mh1_score mh2_score mh3_score mh4_score mh5_score
drop mh*
	
* Load MHI-5 items from dataset for 2015
gen mh1_2015 = YSAQ_282C_2015  
gen mh2_2015 = YSAQ_282D_2015
gen mh3_2015 = YSAQ_282E_2015 
gen mh4_2015 = YSAQ_282F_2015
gen mh5_2015 = YSAQ_282G_2015



* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2015
gen mh2_score = mh2_2015
gen mh3_score = 5 - mh3_2015
gen mh4_score = mh4_2015
gen mh5_score = 5 - mh5_2015

* Compute total score
gen sum_mh_2015 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2015
 alpha mh1_score mh2_score mh3_score mh4_score mh5_score
drop mh*

* Load MHI-5 items from dataset for 2017
gen mh1_2017 = YHEA_SAQ_282C_2017  
gen mh2_2017 = YHEA_SAQ_282D_2017
gen mh3_2017 = YHEA_SAQ_282E_2017
gen mh4_2017 = YHEA_SAQ_282F_2017
gen mh5_2017 = YHEA_SAQ_282G_2017


* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2017
gen mh2_score = mh2_2017
gen mh3_score = 5 - mh3_2017
gen mh4_score = mh4_2017
gen mh5_score = 5 - mh5_2017

* Compute total score
gen sum_mh_2017 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2017
drop mh*

* Load MHI-5 items from dataset for 2019
gen mh1_2019 = YHEA_SAQ_282C_2019  
gen mh2_2019 = YHEA_SAQ_282D_2019
gen mh3_2019 = YHEA_SAQ_282E_2019
gen mh4_2019 = YHEA_SAQ_282F_2019
gen mh5_2019 = YHEA_SAQ_282G_2019

* Score each item on a 1-4 scale
gen mh1_score = 5 - mh1_2019
gen mh2_score = mh2_2019
gen mh3_score = 5 - mh3_2019
gen mh4_score = mh4_2019
gen mh5_score = 5 - mh5_2019

* Compute total score
gen sum_mh_2019 = mh1_score + mh2_score + mh3_score + mh4_score + mh5_score

* Compute mean and standard deviation of total score
sum sum_mh_2019
drop mh*

// generate a variable with all the mental health variables in a list
local vars "sum_mh_2002 sum_mh_2004 sum_mh_2006 sum_mh_2008 sum_mh_2010 sum_mh_2015 sum_mh_2017 sum_mh_2019"

// use egen function to calculate the first non-missing value for each observation
egen first_mh = rowfirst(`vars')

// replace the missing values in the citizenshipb variable with the corresponding non-missing values from the first_citizenship variable
replace sum_mh_2000 = first_mh if missing(sum_mh_2000) 



** old code:
/*
** reverse code the items so I higher scores include lower 
// 1 was all of the time, now 4 is all of the time, so higher scores
foreach x of varlist YSAQ_282C_2000 YSAQ_282D_2000 YSAQ_282E_2000 YSAQ_282F_2000 YSAQ_282G_2000 YSAQ_282J_2002 YSAQ_282K_2002 YSAQ_282L_2002 YSAQ_282M_2002 YSAQ_282N_2002 YSAQ_2820_2002 YSAQ_282P_2002 YSAQ_282Q_2002 YSAQ_282C_2002 YSAQ_282D_2002 YSAQ_282E_2002 YSAQ_282F_2002 YSAQ_282G_2002 YSAQ_282C_2004 YSAQ_282D_2004 YSAQ_282E_2004 YSAQ_282F_2004 YSAQ_282G_2004 YSAQ_282C_2006 YSAQ_282D_2006 YSAQ_282E_2006 YSAQ_282F_2006 YSAQ_282G_2006 YSAQ_282C_2008 YSAQ_282D_2008 YSAQ_282E_2008 YSAQ_282F_2008 YSAQ_282G_2008 YSAQ_282C_2010 YSAQ_282D_2010 YSAQ_282E_2010 YSAQ_282F_2010 YSAQ_282G_2010 YSAQ_282C_2015 YSAQ_282D_2015 YSAQ_282E_2015 YSAQ_282F_2015 YSAQ_282G_2015 YHEA_SAQ_282C_2017 YHEA_SAQ_282D_2017 YHEA_SAQ_282E_2017 YHEA_SAQ_282F_2017 YHEA_SAQ_282G_2017 YHEA_SAQ_282C_2019 YHEA_SAQ_282D_2019 YHEA_SAQ_282E_2019 YHEA_SAQ_282F_2019 YHEA_SAQ_282G_2019 {
	recode `x' (-5/-1=.)(1=4 "None of the time")(2=3 "Some of the time")(3=2 "Most of the time")(4=1 "All of the time"), gen(new_`x')	
	}*/

	** new_YSAQ_282C_2000 new_YSAQ_282D_2000 new_YSAQ_282E_2000 new_YSAQ_282F_2000 new_YSAQ_282G_2000 
	** new_YSAQ_282C_2002 new_YSAQ_282D_2002 new_YSAQ_282E_2002 new_YSAQ_282F_2002 new_YSAQ_282G_2002 
	** new_YSAQ_282C_2004 new_YSAQ_282D_2004 new_YSAQ_282E_2004 new_YSAQ_282F_2004 new_YSAQ_282G_2004 
	** new_YSAQ_282C_2006 new_YSAQ_282D_2006 new_YSAQ_282E_2006 new_YSAQ_282F_2006 new_YSAQ_282G_2006 
	** new_YSAQ_282C_2008 new_YSAQ_282D_2008 new_YSAQ_282E_2008 new_YSAQ_282F_2008 new_YSAQ_282G_2008 
	** new_YSAQ_282C_2010 new_YSAQ_282D_2010 new_YSAQ_282E_2010 new_YSAQ_282F_2010 new_YSAQ_282G_2010 
	** new_YSAQ_282C_2015 new_YSAQ_282D_2015 new_YSAQ_282E_2015 new_YSAQ_282F_2015 new_YSAQ_282G_2015 
	** new_YHEA_SAQ_282C_2017 new_YHEA_SAQ_282D_2017 new_YHEA_SAQ_282E_2017 new_YHEA_SAQ_282F_2017 new_YHEA_SAQ_282G_2017 
	** new_YHEA_SAQ_282C_2019 new_YHEA_SAQ_282D_2019 new_YHEA_SAQ_282E_2019 new_YHEA_SAQ_282F_2019 new_YHEA_SAQ_282G_2019
	** new_YSAQ_282C_2002 + new_YSAQ_282D_2002 + new_YSAQ_282E_2002 + new_YSAQ_282F_2002 + new_YSAQ_282G_2002 
	** new_YSAQ_282C_2004 + new_YSAQ_282D_2004 + new_YSAQ_282E_2004 + new_YSAQ_282F_2004 + new_YSAQ_282G_2004 
	** new_YSAQ_282C_2006 + new_YSAQ_282D_2006 + new_YSAQ_282E_2006 + new_YSAQ_282F_2006 + new_YSAQ_282G_2006 
	** new_YSAQ_282C_2008 + new_YSAQ_282D_2008 + new_YSAQ_282E_2008 + new_YSAQ_282F_2008 + new_YSAQ_282G_2008 
	** new_YSAQ_282C_2010 + new_YSAQ_282D_2010 + new_YSAQ_282E_2010 + new_YSAQ_282F_2010 + new_YSAQ_282G_2010 
	** new_YSAQ_282C_2015 + new_YSAQ_282D_2015 + new_YSAQ_282E_2015 + new_YSAQ_282F_2015 + new_YSAQ_282G_2015 
	** new_YHEA_SAQ_282C_2017 + new_YHEA_SAQ_282D_2017 + new_YHEA_SAQ_282E_2017 + new_YHEA_SAQ_282F_2017 + new_YHEA_SAQ_282G_2017 
	** new_YHEA_SAQ_282C_2019 + new_YHEA_SAQ_282D_2019 + new_YHEA_SAQ_282E_2019 + new_YHEA_SAQ_282F_2019 + new_YHEA_SAQ_282G_2019
	

** Mental health
/*	
generate sum_mh_2000 = new_YSAQ_282C_2000 + new_YSAQ_282D_2000 + new_YSAQ_282E_2000 + new_YSAQ_282F_2000 + new_YSAQ_282G_2000 // best one to use could be this since it has the many observations
generate sum_mh_2002 = new_YSAQ_282C_2002 + new_YSAQ_282D_2002 + new_YSAQ_282E_2002 + new_YSAQ_282F_2002 + new_YSAQ_282G_2002
generate sum_mh_2004 = new_YSAQ_282C_2004 + new_YSAQ_282D_2004 + new_YSAQ_282E_2004 + new_YSAQ_282F_2004 + new_YSAQ_282G_2004
generate sum_mh_2006 = new_YSAQ_282C_2006 + new_YSAQ_282D_2006 + new_YSAQ_282E_2006 + new_YSAQ_282F_2006 + new_YSAQ_282G_2006
generate sum_mh_2008 = new_YSAQ_282C_2008 + new_YSAQ_282D_2008 + new_YSAQ_282E_2008 + new_YSAQ_282F_2008 + new_YSAQ_282G_2008 
generate sum_mh_2010 = new_YSAQ_282C_2010 + new_YSAQ_282D_2010 + new_YSAQ_282E_2010 + new_YSAQ_282F_2010 + new_YSAQ_282G_2010 
generate sum_mh_2015 = new_YSAQ_282C_2015 + new_YSAQ_282D_2015 + new_YSAQ_282E_2015 + new_YSAQ_282F_2015 + new_YSAQ_282G_2015
generate sum_mh_2017 = new_YHEA_SAQ_282C_2017 + new_YHEA_SAQ_282D_2017 + new_YHEA_SAQ_282E_2017 + new_YHEA_SAQ_282F_2017 + new_YHEA_SAQ_282G_2017 
generate sum_mh_2019 = new_YHEA_SAQ_282C_2019 + new_YHEA_SAQ_282D_2019 + new_YHEA_SAQ_282E_2019 + new_YHEA_SAQ_282F_2019 + new_YHEA_SAQ_282G_2019 // very few observation

// 
alpha new_YSAQ_282C_2000 new_YSAQ_282D_2000 new_YSAQ_282E_2000 new_YSAQ_282F_2000 new_YSAQ_282G_2000 
/*
Average interitem covariance:     .1995812
Number of items in the scale:            5
Scale reliability coefficient:      0.7687
*/
*/



 
**********************
** Cognitive Tests **
**********************

// The only variable that had less missing was ASVAB
// R98296.00    [ASVAB_MATH_VERBAL_SCORE_PCT] Survey Year: 1999 PRIMARY VARIABLE
codebook ASVAB_MATH_VERBAL_SCORE_PCT_1999
recode  ASVAB_MATH_VERBAL_SCORE_PCT_1999 (-5/-4=.), gen(asvabscore)




*recode empdur2531_fulltime (.=0)
*recode  empdur1523 (.=0) 



/// dwelling
gen 	dwelling = dwelling97
drop 	dwelling97
recode 	dwelling (1=0 "House")(2/4=1 "Apartment/Condo")(5/14=2 "Other"), gen(dwelling97)

/// schooltype
gen 	 schooltype =  schooltype97
drop 	 schooltype97
recode 	 schooltype (0=0 "Other")(1=1 "Public School")(2/9=0 "Other"), gen(schooltype97)





save "$temp/hitaNLSY_recode", replace 
log close
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Event analyses
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2023 

********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97eventhist_`logdate'.log", t replace


use  "$temp/mi_datacreated100imp_alt2", clear

duplicates list ID // check which IDs are duplicate
*gen dup2 = _n
*browse ID dup2 if ID == 8455
 /* +-------------+
  |  Obs     ID |
  |-------------|
  | 3672   8455 |
  | 3915   8455 |
  +-------------+
  */

*browse ID if ID == 3672 | ID == 3915 | ID == 8455

*drop if dup2 == 3915
 
 forvalues i=24/29 {
 	drop livingat`i'
	rename livingat_`i' livingat`i'
 }

 

*year, age, ID, sex, totalduration(fix), cumulative for 2004, 2005, .... in wide 


*drop livingat22 livingat23 


// Below we created a variable that creates a cumulative years of coresidence at each age from 24 to 32 but we dont use this necessarily so I am not sure if this is useful anymore. this was basically for everyone.
generate cumulative24 = livingat24 
forvalues y=25/29{
	local x = `y'-1
	egen cumulative`y' = rowtotal(cumulative`x' livingat`y')
}



//duration 
* Below creates almost basically the same thing but only for people who lives with their parents and then replaces missings with zero.
generate duration24 = livingat24
forvalues y=25/29{
	local x = `y'-1
	egen duration`y' = rowtotal(duration`x' livingat`y') if livingat`y' == 1
	replace duration`y' = 0 if duration`y' == .
}
browse duration* livingat* cumulative* if totaldurationinhh2429 > 0
*drop duration
egen maxduration = rowmax(duration*) // this gives the total duration that is in sequence. If someone lived in total 3 years, but one time they lived for a year, and then later for two years, maxduration brings out the 2 years. 

browse duration* maxduration if livingat24 == 0 & totaldurationinhh2429 > 0 & maxduration != totaldurationinhh2429 // Kelly asked to see how many of these people who WERE NOT living with their parents at age 24 went back to living with their parents we want to see if living at24 is 0 but then what happens



************ Person years **************
****************************************

keep cumula* BYEAR ID livingat* totalduration* duration* maxduration SAMPLING_PANEL_WEIGHT_1997 _mi_miss
*mi reshape long cumulative livingat duration, i(ID BYEAR totaldurationinhh2429 maxduration) j(age) // reshaped it for event history
mi reshape long cumulative livingat duration, i(ID BYEAR totaldurationinhh2429 maxduration) j(age)

label var age "Age of the respondent"
save "$temp/reshapedeventhistory", replace
use "$temp/reshapedeventhistory", clear

generate year=BYEAR + age // what year it is when they are age 24,25,26, ...
recode livingat(.=0), gen(livingat_hh) // we recode for those who have missings in the between years (since we dropped in the first place above for age 24, and then generate a new variable with)


gen age_st = age if duration==1  // puts the age when the person is indicated to be living with parents 
bysort ID: egen spellno = rank(age_st) // sorts by ID then creates a new variable called spellno and ranks those age_st variable as 1,2,3,4.
// this code creates a new variable "age_st" that represents the age of the person when they are living with their parents, and then creates a new variable "spellno" that assigns a rank to each observation within each group of observations with the same ID, based on the age at which the person is indicated to be living with their parents.


// Assigning returning ages to one single variable for each returning case.
tab spellno // this shows us that up to 4 returns have happened. 

gen st_1 = age_st if spellno==1 // generates another variable that assigns the age to the spellno that is 1. 
bysort ID (st_1): replace st_1=st_1[1] // sort by ID and replace (basically the age) to the other observations of the ID. these are for people who made
// this code creates a new variable "st_1" that represents the age of the individual when they first experienced a particular event (indicated by "spellno" equal to 1), and then replaces the value of "st_1" with the first value of "st_1" within each group of observations with the same "ID"

gen st_2 = age_st if spellno==2 // if the person has another returning back date, then assign that age to the rest of the st_2 variable. So if a person entered at 24, make it first st_1 all 24 and if the same person came back at age 27, assign its st_2 to 27.
bysort ID (st_2): replace st_2=st_2[1]

gen st_3 = age_st if spellno==3
bysort ID (st_3): replace st_3=st_3[1]

gen st_4 = age_st if spellno==4
bysort ID (st_4): replace st_4=st_4[1]

// not sure what we did afterwards here. 
gen spellno_use=.
replace spellno_use=1 if age >= st_1 & age < st_2 // if age of first return is equal to or bigger than st_1 age and smaller than the 2nd return
replace spellno_use=2 if age >= st_2 & age < st_3
replace spellno_use=3 if age >= st_3 & age < st_4
replace spellno_use=4 if age >= st_4
replace spellno_use=0 if livingat_hh==0

sort ID 
browse ID spellno_use st_* age age_st

bysort ID spellno_use: egen spelldur=max(duration)

generate livingat24 = 1 if age == 24 & livingat == 1
replace livingat24 = 0 if age == 24 & livingat == 0
bysort ID (livingat24): replace livingat24 = livingat24[1] //so helpful*? assings 1 or 0 depending on the living situation at age 24


**********************************************
****** Create a transition variable **********
sort ID age
generate transition = 0
replace transition = 1 if livingat == 1 & livingat[_n-1]==0 & ID==ID[_n-1] // if the ID is equal to the ID before and living with parents in the prior age was equal to 0, create a transition

unique ID, by(transition) // this gives how many transition happens by ID
unique ID, by(maxduration)
unique ID, by(totaldurationinhh2429)


// predict if a transition happened depending on the year. 
*****************************************
*********** Event history by year ********
*****************************************

// for men
eststo: mi estimate, post: logit transition i.year if livingat24 == 0 & year < 2012 & year > 2004
esttab using "$results/eventhistory.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant) replace sca(F) se legend level(90)  
margins year
marginsplot, recast(line) recastci(rarea) addplot(scatter) graphregion(color(white)) title("`Predictions of transition back to parental household by year with 95% CIs, NLSY97 men'", size(small)) name(men, replace) xtitle("Year") ytitle("Transition back to the parental house") noci


unique ID if livingat24 == 0 & year < 2012 & year > 2004

/*unique ID if livingat24 == 0 & year < 2012 & year > 2004
Number of unique values of ID is  2373
Number of records is  12393*/



// for women
/*
logit transition i.year if livingat24 == 0 & year < 2012 & SEX == 1
margins year
marginsplot, graphregion(color(white)) title(`"Adjusted predictions of transition back to parental household by year with 95% CIs, NLSY97 women"', size(small)) name(women, replace) xtitle("Year") ytitle("Transition")

logit transition ib32.age if livingat24 == 0
margins age
marginsplot
*/


*****************************************
*********** Event history by age ********
*****************************************


// Graph of each age 
graph bar (asis) livingat, over(age) percent ytitle("Percent living with parents") legend(off) missing(allow)


// event history analysis part: 
logit livingat_hh i.age if livingat24 == 0 // for people who were NOT living at age 24. This shows the likelihood of living at parents house comparatively. This makes sense because it compares to everyone.  
margins age
marginsplot, graphregion(color(white))  title(`"Unadjusted predictions of living at the parental household by age with 95% CIs, NLSY97 all sample"', size(small)) name(all, replace)

logit livingat_hh i.age if livingat24 == 0 & SEX == 0 // for people who were NOT living at age 24. This shows the likelihood of living at parents house comparatively. This makes sense because it compares to everyone.  
margins age
marginsplot, graphregion(color(white))  title(`"Unadjusted predictions of living at the parental household by age with 95% CIs, NLSY97 men"', size(small)) name(men, replace)


logit livingat_hh i.age if livingat24 == 0 & SEX == 1 // for people who were NOT living at age 24. This shows the likelihood of living at parents house comparatively. This makes sense because it compares to everyone.  
margins age
marginsplot, graphregion(color(white))  title(`"Adjusted predictions of living at the parental household by age with 95% CIs, NLSY97 men"', size(small)) name(women, replace)


logit livingat_hh i.age if livingat24 == 0 & totaldurationinhh2429 > 0 // for people who were NOT living at age 24 but compared to people who lived with their parents (excluding those who hacve never lived parents)
logit livingat_hh ib25.age if livingat24 == 0 & totaldurationinhh2429 > 0




tab transition if livingat24 == 0 // this shows that very few have transition back to the parental house if they were not living with their parents at age 24
tab totaldurationinhh2429
tab age livingat_hh, row
tab age livingat_hh if totaldurationinhh2429 > 0, row
tab age livingat_hh if livingat24 == 0, row
tab age transition if livingat24 == 0, row
unique ID if livingat24==0, by(transition)
tab transition if livingat24==0
tab age transition if livingat24 == 0 & totaldurationinhh2429 >0, row
tab year transition if livingat24 == 0 & totaldurationinhh2429 >0, row // this last one kind of shows the marginsplot command. 



** Plot for each age interval
count if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 24
unique ID if  maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 24  // this shows me those who lived from 24-25
*preserve
*drop if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 24
*drop if totaldurationinhh2429 == 0

count if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 24 
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 24 // this shows me those who lived from 24-26

count if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 24
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 24  // 24-27

unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 24  // 24-28
unique ID if maxduration == 5 & totaldurationinhh2429 == 5 & st_1 == 24  // 24-29
unique ID if maxduration == 6 & totaldurationinhh2429 == 6 & st_1 == 24  // 24-30
unique ID if maxduration == 7 & totaldurationinhh2429 == 7 & st_1 == 24  // 24-31
unique ID if maxduration == 8 & totaldurationinhh2429 == 8 & st_1 == 24  // 24-32
unique ID if maxduration == 9 & totaldurationinhh2429 == 9 & st_1 == 24  // 24-32

forvalues x =1/9 {
	forvalues y=24/32 {
	noisily unique ID if maxduration == `x' & totaldurationinhh2429 == `x' & st_1 == `y'	
	}
}

// As of 25
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 25  // 25-26
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 25  // 25-27
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 25  // 25-28
unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 25  // 25-29
unique ID if maxduration == 5 & totaldurationinhh2429 == 5 & st_1 == 25  // 25-30
unique ID if maxduration == 6 & totaldurationinhh2429 == 6 & st_1 == 25  // 25-31
unique ID if maxduration == 7 & totaldurationinhh2429 == 7 & st_1 == 25  // 25-32
unique ID if maxduration == 8 & totaldurationinhh2429 == 8 & st_1 == 25  // 25-33


// As of 26
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 26  // 26-27
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 26  // 26-28
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 26  // 26-29
unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 26  // 26-30
unique ID if maxduration == 5 & totaldurationinhh2429 == 5 & st_1 == 26  // 26-31
unique ID if maxduration == 6 & totaldurationinhh2429 == 6 & st_1 == 26  // 26-32
unique ID if maxduration == 7 & totaldurationinhh2429 == 7 & st_1 == 26  // 26-33



// As of 27
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 27  // 27-28
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 27  // 27-29
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 27  // 27-30
unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 27  // 27-31
unique ID if maxduration == 5 & totaldurationinhh2429 == 5 & st_1 == 27  // 27-32
unique ID if maxduration == 6 & totaldurationinhh2429 == 6 & st_1 == 27  // 27-33


// As of 28
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 28  // 28-29
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 28  // 28-30
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 28  // 28-31
unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 28  // 28-32
unique ID if maxduration == 5 & totaldurationinhh2429 == 5 & st_1 == 28  // 28-33


// As of 29
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 29  // 29-30
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 29  // 29-31
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 29  // 29-32
unique ID if maxduration == 4 & totaldurationinhh2429 == 4 & st_1 == 29  // 29-33

// As of 30
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 30  // 30-31
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 30  // 30-32
unique ID if maxduration == 3 & totaldurationinhh2429 == 3 & st_1 == 30  // 30-33

// As of 31
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 31  // 31-32
unique ID if maxduration == 2 & totaldurationinhh2429 == 2 & st_1 == 31  // 31-33

// As of 32
unique ID if maxduration == 1 & totaldurationinhh2429 == 1 & st_1 == 32  // 31-32


// duration 0
unique ID if maxduration == 0

// for 4 transaction people - only 5
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3, st_4)

// for 3 transaction - 72
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == .
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24   	// 65
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 25		// 5
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 26	    // 1
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 27 	// 1


// for 2 transaction - 702
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == .




// For 3 transition detail 
// with parents at 24 & 26 block
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 28  
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 28 // 11 ID
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 29
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 29 // 5 ID 
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 30
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 30 // 8 ID
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 31
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 31  //9 ID
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 32 
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 26 & st_3 == 32 // 2 ID

// with parents at 24 & 27 block
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 27 & st_3 == 29  // 5 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 27 & st_3 == 30  // 5 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 27 & st_3 == 31  // 3 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 27 & st_3 == 32  // 9 ID

// with parents at 24 & 28 block
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 28 & st_3 == 30  // 1 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 28 & st_3 == 31  // 2 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 24 & st_2 == 28 & st_3 == 32  // 5 ID


// with parents at 25
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 25 & st_2 == 27 & st_3 == 29  // 1 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 25 & st_2 == 27 & st_3 == 31  // 2 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 25 & st_2 == 28 & st_3 == 31  // 1 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 25 & st_2 == 29 & st_3 == 32  // 1 ID

// with parents at 26
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 26 & st_2 == 28 & st_3 == 31 
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 26 & st_2 == 28 & st_3 == 31 // 1 ID

// with parents at 27
browse if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 27 & st_2 == 29 & st_3 == 32 
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2, st_3) & st_4 == . & st_1 == 27 & st_2 == 29 & st_3 == 32 // 1 ID





// For 2 transition detail 
// with parents at 26
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 26 // 131 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 27 // 137 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 28 // 97 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 29 // 74 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 30 // 57 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 31 // 59 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 24 & st_2 == 32 // 43 ID



// with parents at 24
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 27 // 12 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 28 // 6 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 29 // 16 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 30 // 7 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 31 // 8 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 25 & st_2 == 32 // 7 ID


// with parents at 26
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 26 & st_2 == 28 // 4 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 26 & st_2 == 29 // 6 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 26 & st_2 == 30 // 5 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 26 & st_2 == 31 // 2 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 26 & st_2 == 32 // 6 ID

// with parents at 27
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 27 & st_2 == 29 // 6 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 27 & st_2 == 30 // 6 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 27 & st_2 == 31 // 6 ID

// with parents at 28
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 28 & st_2 == 30 // 2 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 28 & st_2 == 32 // 3 ID

// with parents at 29
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 29 & st_2 == 31 // 1 ID
unique ID if maxduration != totaldurationinhh2429 & totaldurationinhh2429 > 0 & !missing(st_1, st_2) & st_3 == . & st_4 == . & st_1 == 29 & st_2 == 32 // 1 ID












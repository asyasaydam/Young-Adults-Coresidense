********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive Analysis Men
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2022
* I follow Augustine and Raley's 2012 JMF paper
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97psmen_`logdate'.log", t replace



* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* Controls: 				SEX race citizenship education_new2 
* Family/background: 		nsibling97 parenteduc2 momeduc2 intact ln_hhincome97 ln_hhnetwrth97 incomesource97 debt20  ave* (personality traits) 
* Controls at age 24: 		enrolled24_2 maritalstat24 children24_2 empstat24_2 empstatusage_bin2_24_2 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat2 empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_*  

// For propensity score I have to create a treatment and control group. 
// I already have this: livedwpar_bin


use 	"$temp/beforeMI", clear

keep if 	SEX == 1

** Independent variable: livedwpar_bin livedwpar_cat livedwpar_cat12 
** Dependent variables: empstatusage32 occeduc_max 
** Background covariates: race education_new momeduc livingarrangement1997 nsibling97 empdur1523 enrolled24 maritalstat24 children24 empstatge24 totalurban south 
** Additonal characteristics after 24: incarstat maritalstat32  children32 empdur2531_fulltime


*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_DescriptivePropensity.xlsx", sheet("hitaPwomenat24_update") modify

*************************
* Create Table Shell
*************************
putexcel B1:C1 = "Table 1. Analytical Sample", merge bold border(bottom) hcenter italic


putexcel B2 = "Respondent Characteristics", border(bottom double)
putexcel C2 = "Mean (SD) or proportion", border(bottom double)
putexcel B3 = "Social and demographic characteristics", bold
putexcel B4 = "Race/Ethnicity", txtindent(1) 
putexcel B5 = "White, Non-Hispanic", txtindent(2) 
putexcel B6 = "Black, Non-Hispanic", txtindent(2) 
putexcel B7 = "Hispanic", txtindent(2) 
putexcel B8 = "Other", txtindent(2) 
putexcel B9 = "Education", txtindent(1)
putexcel B10 = "Less than HS", txtindent(2)
putexcel B11 = "High School", txtindent(2)
putexcel B12 = "Some College", txtindent(2)
putexcel B13 = "College and more", txtindent(2)
putexcel B14 = "Parental Education", txtindent(1)
putexcel B15 = "Less than HS", txtindent(2)
putexcel B16 = "High School", txtindent(2)
putexcel B17 = "Some College", txtindent(2)
putexcel B18 = "College and more", txtindent(2)
putexcel B19 = "Childhood Household", txtindent(1)
putexcel B20 = "Both parents", txtindent(2)
putexcel B21 = "Single parent", txtindent(2) 
putexcel B22 = "Other arrangements", txtindent(2)
putexcel B23 = "Sibship size", txtindent(1)
putexcel B24 = "Personality Characteristics", txtindent(1)
putexcel B25 = "Agreeableness", txtindent(2)
putexcel B26 = "Extraversion", txtindent(2)
putexcel B27 = "Opennes", txtindent(2)
putexcel B28 = "Emotional Stability", txtindent(2)
putexcel B29 = "Conscientiousness", txtindent(2)
putexcel B30 = "Years spent in urban", txtindent(1)
putexcel B31 = "Ever lived in the South", txtindent(1)
putexcel B32 = "Age 24 characteristics", bold
putexcel B33 = "Single", txtindent(1)
putexcel B34 = "No child", txtindent(1)
putexcel B35 = "Enrolled", txtindent(1)
putexcel B36 = "Total years employed until 24",txtindent(1)
putexcel B37 = "Employed, part-time", txtindent(1)
putexcel B38 = "Employed, full-time", txtindent(1)
putexcel B39 = "Age 30+ characteristics", bold
putexcel B40 = "Ever incarcerated", txtindent(1)
putexcel B41 = "Single", txtindent(1)
putexcel B42 = "Married", txtindent(1)
putexcel B43 = "No child", txtindent(1)
putexcel B44 = "Have debt", txtindent(1)
putexcel B45 = "Full time employed years 25-31", txtindent(1)
putexcel B46 = "Employed, part-time", txtindent(1)
putexcel B47 = "Employed, full-time", txtindent(1)
putexcel B48 = "Occupational Standing", txtindent(1)
putexcel B49 = "Parental Coresidence characteristics", bold
putexcel B50 = "Coresiding with parents at 24", txtindent(1)
putexcel B51 = "Coresiding with parents at 32", txtindent(1)
putexcel B52 = "Never coreside between 24-32", txtindent(1)
putexcel B53 = "Coreside some between 24-32", txtindent(1)
putexcel B54 = "Coreside continously between 24-32", txtindent(1)
putexcel B55 = "Average duration of coresidence", txtindent(1)





*** Race/Ethnicity

tab race [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(race1) m
mata: st_matrix("race1", (st_matrix("race1") :/ colsum(st_matrix("race1"))))
matrix list race1, format("%3.2f")

putexcel C5 = matrix(race1[1,1]), nformat (number_d2) 
putexcel C6 = matrix(race1[2,1]), nformat (number_d2) 
putexcel C7 = matrix(race1[3,1]), nformat (number_d2) 
putexcel C8 = matrix(race1[4,1]), nformat (number_d2) 



*** Education

tab 	education_new [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(edu) m
mata: st_matrix("edu", (st_matrix("edu") :/ colsum(st_matrix("edu"))))
matrix list edu, format("%3.2f")

putexcel C10 =  matrix(edu[1,1]), nformat (number_d2) 
putexcel C11 =  matrix(edu[2,1]), nformat (number_d2) 
putexcel C12 =  matrix(edu[3,1]), nformat (number_d2) 
putexcel C13 =  matrix(edu[4,1]), nformat (number_d2) 


*** Parental education

tab momeduc [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(paredu) m
mata: st_matrix("paredu", (st_matrix("paredu") :/ colsum(st_matrix("paredu"))))
matrix list paredu, format("%3.2f")

putexcel C15 =  matrix(paredu[1,1]), nformat (number_d2) 
putexcel C16 =  matrix(paredu[2,1]), nformat (number_d2) 
putexcel C17 =  matrix(paredu[3,1]), nformat (number_d2) 
putexcel C18 =  matrix(paredu[4,1]), nformat (number_d2)



*** Childhood household
tab livingarrangement1997 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(fch) m
mata: st_matrix("fch", (st_matrix("fch") :/ colsum(st_matrix("fch"))))
matrix list fch, format("%3.2f")

putexcel C20 = matrix(fch[1,1]), nformat (number_d2) 
putexcel C21 = matrix(fch[2,1]), nformat (number_d2) 
putexcel C22 = matrix(fch[3,1]), nformat (number_d2) 

** Sibship size  
sum nsibling97 [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list

putexcel C23 = matrix(r(mean)), nformat("##.#")
putexcel D23 = matrix(r(sd)), nformat("##.#")


*** Personality Characeteristics
***** Agreeableness
sum aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C25 = matrix(r(mean)), nformat("##.#")
putexcel D25 = matrix(r(sd)), nformat("##.#")


***** Extraversion
sum aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C26 = matrix(r(mean)), nformat("##.#")
putexcel D26 = matrix(r(sd)), nformat("##.#")

***** Openness
sum aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C27 = matrix(r(mean)), nformat("##.#")
putexcel D27 = matrix(r(sd)), nformat("##.#")

***** Emotional Stability
sum aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997] 
return list
putexcel C28 = matrix(r(mean)), nformat("##.#")
putexcel D28 = matrix(r(sd)), nformat("##.#")

***** Conscientiousness
sum avecons [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C29 = matrix(r(mean)), nformat("##.#")
putexcel D29 = matrix(r(sd)), nformat("##.#")


***** Total time spent in urban until 24
sum totalurban [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C30 = matrix(r(mean)), nformat("##.#")
putexcel D30 = matrix(r(sd)), nformat("##.#")


***** Lived in south or not until 24
tab south [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(south) m
mata: st_matrix("south", (st_matrix("south") :/ colsum(st_matrix("south"))))
matrix list south, format("%3.2f")
putexcel C31 =  matrix(south[2,1]), nformat (number_d2) 


**** Marital Status at age 24
tab maritalstat24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar24) m
mata: st_matrix("mar24", (st_matrix("mar24") :/ colsum(st_matrix("mar24"))))
matrix list mar24, format("%3.2f")
putexcel C33 = matrix(mar24[1,1]), nformat (number_d2) 


***** children at the age 24
tab children24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children24) m
mata: st_matrix("children24", (st_matrix("children24") :/ colsum(st_matrix("children24"))))
matrix list children24, format("%3.2f")
putexcel C34 =  matrix(children24[1,1]), nformat (number_d2) 


***** Enrolled at 24
tab enrolled24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(enrol) m
mata: st_matrix("enrol", (st_matrix("enrol") :/ colsum(st_matrix("enrol"))))
matrix list enrol, format("%3.2f")
putexcel C35 =  matrix(enrol[1,1]), nformat (number_d2) 


***** Employment Duration btw 15-23
sum empdur1523 [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C36 = matrix(r(mean)), nformat("##.#")
putexcel D36 = matrix(r(sd)), nformat("##.#")


****** employment status at age 24 
tab empstatusage24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(emp24) m 
mata: st_matrix("emp24", (st_matrix("emp24") :/ colsum(st_matrix("emp24"))))
matrix list emp24, format("%3.2f")
putexcel C37 = matrix(emp24[2,1]), nformat (number_d2) 
putexcel C38 = matrix(emp24[3,1]), nformat (number_d2) 


** Incarcerated
tab incarstat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(incar) m
mata: st_matrix("incar", (st_matrix("incar") :/ colsum(st_matrix("incar"))))
matrix list incar, format("%3.2f")
putexcel C40 = matrix(incar[2,1]), nformat (number_d2) 

**** Marital Status at age 32
tab maritalstat32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar32) m
mata: st_matrix("mar32", (st_matrix("mar32") :/ colsum(st_matrix("mar32"))))
matrix list mar32, format("%3.2f")
putexcel C41 = matrix(mar32[1,1]), nformat (number_d2) 
putexcel C42 = matrix(mar32[2,1]), nformat (number_d2) 


***** children at the age 24
tab children32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children32)
mata: st_matrix("children32", (st_matrix("children32") :/ colsum(st_matrix("children32"))))
matrix list children32, format("%3.2f")
putexcel C43 =  matrix(children32[1,1]), nformat (number_d2) 


** Debt
tab havedebt30 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(debt) m
mata: st_matrix("debt", (st_matrix("debt") :/ colsum(st_matrix("debt"))))
matrix list debt, format("%3.2f")
putexcel C44 = matrix(debt[2,1]), nformat (number_d2) 

***** Employment btw 25-31
sum empdur2531_fulltime [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C45 = matrix(r(mean)), nformat("##.#")
putexcel D45 = matrix(r(sd)), nformat("##.#")

***** Outcome 1: Employment Status
tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab) m
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel C46 =  matrix(stab[2,1]), nformat (number_d2)
putexcel C47 =  matrix(stab[3,1]), nformat (number_d2)


***** Outcome 2: Occupational Standing
sum occeduc_max [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C48 = matrix(r(mean)), nformat (number_d2)
putexcel D48 = matrix(r(sd)), nformat (number_d2)

*** Parental coresidence characteristics

** coresiding with parents 24
tab livingat24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at24) m
mata: st_matrix("at24", (st_matrix("at24"):/ colsum(st_matrix("at24"))))
matrix list at24, format("%3.2f")
putexcel C50 =  matrix(at24[2,1]), nformat (number_d2)

** coresiding with parents 32
tab livingat32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at32) m
mata: st_matrix("at32", (st_matrix("at32"):/ colsum(st_matrix("at32"))))
matrix list at32, format("%3.2f")
putexcel C51 =  matrix(at32[2,1]), nformat (number_d2)

** coresiding with parents btw 24-32
tab livedwpar_cat  [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(liv) m
mata: st_matrix("liv", (st_matrix("liv"):/ colsum(st_matrix("liv"))))
matrix list liv, format("%3.2f")

putexcel C52 =  matrix(liv[1,1]), nformat (number_d2)
putexcel C53 =  matrix(liv[2,1]), nformat (number_d2)
putexcel C54 =  matrix(liv[3,1]), nformat (number_d2)



** average duration of those who coreside
sum totaldurationinhh2432 [aweight=SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2432 > 0
return list
putexcel C56 = matrix(r(mean)), nformat (number_d2)
putexcel D56 = matrix(r(sd)), nformat (number_d2)






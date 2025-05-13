********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive Analysis Men - showing all the missing
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2023
********************************************************************************


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97menDesc_`logdate'.log", t replace

use 	"$temp/droppedempstat32", clear

use 	"$temp/predropempstatoccprest", clear


*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_Descriptive_Missings", sheet("hitaPmenat24_update3") replace

*************************
* Create Table Shell
*************************
putexcel B1:C1 = "Table 1. Analytical Sample", merge bold border(bottom) hcenter italic

putexcel B2 = "Respondent Characteristics", border(bottom double)
putexcel C2 = "Mean (SD) or proportion", border(bottom double)
putexcel E2 = "Missing proportion", border(bottom double)
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

putexcel B37 = "Employed, part-time", txtindent(1)
putexcel B38 = "Employed, full-time", txtindent(1)
putexcel B39 = "Age 30+ characteristics", bold
putexcel B40 = "Ever incarcerated", txtindent(1)
putexcel B41 = "Single", txtindent(1)
putexcel B42 = "Married", txtindent(1)
putexcel B43 = "No child", txtindent(1)
putexcel B44 = "Have debt", txtindent(1)

putexcel B45 = "Born in the US", txtindent(1)
putexcel B46 = "Employed, part-time", txtindent(1)
putexcel B47 = "Employed, full-time", txtindent(1)
putexcel B48 = "Occupational Standing", txtindent(1)
putexcel B49 = "Parental Coresidence characteristics", bold
putexcel B50 = "Coresiding with parents at 24", txtindent(1)

putexcel B52 = "Never coreside between 24-29", txtindent(1)
putexcel B53 = "Coreside some between 24-29", txtindent(1)
putexcel B54 = "Coreside continously between 24-29", txtindent(1)
putexcel B55 = "Average duration of coresidence", txtindent(1)

putexcel B58 = "Coresiding with parents at 24", txtindent(1)
putexcel B59 = "Coresiding with parents at 25", txtindent(1)
putexcel B60 = "Coresiding with parents at 26", txtindent(1)
putexcel B61 = "Coresiding with parents at 27", txtindent(1)
putexcel B62 = "Coresiding with parents at 28", txtindent(1)
putexcel B63 = "Coresiding with parents at 29", txtindent(1)






***** Weighted n
putexcel B66 = "Weighted n"

tab SEX [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(n)
mata: st_matrix("n")
matrix list n, format("%9.2f")
putexcel C66 =  matrix(n[1,1]), nformat (number)



*** Race/Ethnicity
mdesc race
tab race [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(race1) m
mata: st_matrix("race1", (st_matrix("race1") :/ colsum(st_matrix("race1"))))
matrix list race1, format("%3.2f")

putexcel C5 = matrix(race1[1,1]), nformat (number_d2) 
putexcel C6 = matrix(race1[2,1]), nformat (number_d2) 
putexcel C7 = matrix(race1[3,1]), nformat (number_d2) 
putexcel C8 = matrix(race1[4,1]), nformat (number_d2) 




*** Education
mdesc education_new
tab 	education_new [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(edu) m
mata: st_matrix("edu", (st_matrix("edu") :/ colsum(st_matrix("edu"))))
matrix list edu, format("%3.2f")

putexcel C10 =  matrix(edu[1,1]), nformat (number_d2) 
putexcel C11 =  matrix(edu[2,1]), nformat (number_d2) 
putexcel C12 =  matrix(edu[3,1]), nformat (number_d2) 
putexcel C13 =  matrix(edu[4,1]), nformat (number_d2) 
putexcel E10 = matrix(edu[5,1]), nformat (number_d2)



*** Parental education
mdesc parenteduc

tab 	parenteduc [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(paredu) m
mata: st_matrix("paredu", (st_matrix("paredu") :/ colsum(st_matrix("paredu"))))
matrix list paredu, format("%3.2f")

putexcel C15 =  matrix(paredu[1,1]), nformat (number_d2) 
putexcel C16 =  matrix(paredu[2,1]), nformat (number_d2) 
putexcel C17 =  matrix(paredu[3,1]), nformat (number_d2) 
putexcel C18 =  matrix(paredu[4,1]), nformat (number_d2)
putexcel E15 = matrix(paredu[5,1]), nformat (number_d2)



*** Childhood household
mdesc livingarrangement1997
tab livingarrangement1997 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(fch) m
mata: st_matrix("fch", (st_matrix("fch") :/ colsum(st_matrix("fch"))))
matrix list fch, format("%3.2f")

putexcel C20 = matrix(fch[1,1]), nformat (number_d2) 
putexcel C21 = matrix(fch[2,1]), nformat (number_d2) 
putexcel C22 = matrix(fch[3,1]), nformat (number_d2) 



** Sibship size 
mdesc nsibling97 
sum nsibling97 [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list

putexcel C23 = matrix(r(mean)), nformat("##.#")
putexcel D23 = matrix(r(sd)), nformat("##.#")


*** Personality Characeteristics
***** Agreeableness
mdesc aveagree
*return list
*local mysca = r(percent)
*putexcel E25=(`mysca')
*mi estimate: mean aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997]

sum aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list

putexcel C25 = matrix(r(mean)), nformat("##.#")
putexcel D25 = matrix(r(sd)), nformat("##.#")

tab aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(agr) m
mata: st_matrix("agr", (st_matrix("agr") :/ colsum(st_matrix("agr"))))
matrix list agr, format("%3.2f")

putexcel E25 = matrix(agr[14,1]), nformat (number_d2) 


***** Extraversion
mdesc aveextra
*return list
*local myscal = r(percent)
*putexcel E26=(`myscal')
*mi estimate: mean aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997]

sum aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997]
putexcel C26 = matrix(r(mean)), nformat("##.#")
putexcel D26 = matrix(r(sd)), nformat("##.#")

tab aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(ext) m
mata: st_matrix("ext", (st_matrix("ext") :/ colsum(st_matrix("ext"))))
matrix list ext, format("%3.2f")
putexcel E26 = matrix(ext[14,1]), nformat (number_d2) 

***** Openness
mdesc aveopen
*return list
*local myscala = r(percent)
*putexcel E27=(`myscala')
*mi estimate: mean aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997]

sum aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C27 = matrix(r(mean)), nformat("##.#")
putexcel D27 = matrix(r(sd)), nformat("##.#")

tab aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(opn) m
mata: st_matrix("opn", (st_matrix("opn") :/ colsum(st_matrix("opn"))))
matrix list opn, format("%3.2f")
putexcel E27 = matrix(opn[14,1]), nformat (number_d2) 

***** Emotional Stability
mdesc aveemost
*return list
*local myscalar = r(percent)
*putexcel E28=(`myscalar')
*mi estimate: mean aveemost [aweight=SAMPLING_PANEL_WEIGHT_1997] 
*ereturn list

sum aveemost [aweight=SAMPLING_PANEL_WEIGHT_1997]
putexcel C28 = matrix(r(mean)), nformat("##.#")
putexcel D28 = matrix(r(sd)), nformat("##.#")

tab aveemost [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(ems) m
mata: st_matrix("ems", (st_matrix("ems") :/ colsum(st_matrix("ems"))))
matrix list ems, format("%3.2f")
putexcel E28 = matrix(ems[14,1]), nformat (number_d2) 

***** Conscientiousness
mdesc avecons
*return list
*local myscalars = r(percent)
*putexcel E29=(`myscalars')
*mi estimate: mean avecons [aweight=SAMPLING_PANEL_WEIGHT_1997]

sum avecons [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C29 = matrix(r(mean)), nformat("##.#")
putexcel D29 = matrix(r(sd)), nformat("##.#")


tab aveemost [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(cos) m
mata: st_matrix("cos", (st_matrix("cos") :/ colsum(st_matrix("cos"))))
matrix list cos, format("%3.2f")
putexcel E29 = matrix(cos[14,1]), nformat (number_d2) 


***** Total time spent in urban until 24
mdesc totalurban
sum totalurban [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C30 = matrix(r(mean)), nformat("##.#")
putexcel D30 = matrix(r(sd)), nformat("##.#")


***** Lived in south or not until 24
mdesc south
tab south [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(south) m
mata: st_matrix("south", (st_matrix("south") :/ colsum(st_matrix("south"))))
matrix list south, format("%3.2f")
putexcel C31 =  matrix(south[2,1]), nformat (number_d2) 


**** Marital Status at age 24
mdesc unionstatus24

*mi estimate: proportion maritalstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab unionstatus24 [fweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar24) m
mata: st_matrix("mar24", (st_matrix("mar24") :/ colsum(st_matrix("mar24"))))
matrix list mar24, format("%3.2f")

putexcel G33 = "Single, Not Cohabiting"
putexcel G34 = "Single, Cohabiting"
putexcel G35 = "Married, Not Cohabiting"
putexcel G36 = "Married, Not Cohabiting"

putexcel H33 = matrix(mar24[1,1]), nformat (number_d2) // single not cohab
putexcel H34 = matrix(mar24[2,1]), nformat (number_d2) // single cohab
putexcel H35 = matrix(mar24[3,1]), nformat (number_d2) // married, not cohab
putexcel H36 = matrix(mar24[4,1]), nformat (number_d2) // married, cohab
putexcel H37 = matrix(mar24[5,1]), nformat (number_d2) // missing


***** children at the age 24
mdesc children24
*mi estimate: proportion children24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab children24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children24) m
mata: st_matrix("children24", (st_matrix("children24") :/ colsum(st_matrix("children24"))))
matrix list children24, format("%3.2f")

putexcel C34 =  matrix(children24[1,1]), nformat (number_d2) // not have child
putexcel F34 =  matrix(children24[2,1]), nformat (number_d2) // have child
putexcel E34 =  matrix(children24[3,1]), nformat (number_d2) // missing


***** Enrolled at 24
mdesc enrolled24
tab enrolled24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(enrol) m
*mi estimate: proportion enrolled24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mata: st_matrix("enrol", (st_matrix("enrol") :/ colsum(st_matrix("enrol"))))
matrix list enrol, format("%3.2f")

putexcel C35 =  matrix(enrol[1,1]), nformat (number_d2) 
putexcel E35 =  matrix(enrol[2,1]), nformat (number_d2)

****** employment status at age 24 
mdesc empstatusage24
*return list
*local myscalars = r(percent)
*putexcel E29=(`myscalars')

tab empstatusage24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(emp24) m 
*mi estimate: proportion empstatusage24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mata: st_matrix("emp24", (st_matrix("emp24") :/ colsum(st_matrix("emp24"))))
matrix list emp24, format("%3.2f")

putexcel C37 = matrix(emp24[2,1]), nformat (number_d2) 
putexcel C38 = matrix(emp24[3,1]), nformat (number_d2) 
putexcel E37 = matrix(emp24[4,1]), nformat (number_d2) 


** Incarcerated
mdesc incarstat
*mi estimate: proportion incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab incarstat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(incar) m
mata: st_matrix("incar", (st_matrix("incar") :/ colsum(st_matrix("incar"))))
matrix list incar, format("%3.2f")
putexcel C40 = matrix(incar[2,1]), nformat (number_d2) 
putexcel E40 = matrix(incar[3,1]), nformat (number_d2) 


**** Marital Status at age 32
mdesc unionstatus32
*mi estimate: proportion maritalstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab unionstatus32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar32) m
mata: st_matrix("mar32", (st_matrix("mar32") :/ colsum(st_matrix("mar32"))))
matrix list mar32, format("%3.2f")


putexcel G41 = "Single, Not Cohabiting"
putexcel G42 = "Single, Cohabiting"
putexcel G43 = "Married, Not Cohabiting"
putexcel G44 = "Married, Not Cohabiting"
putexcel G45 = "Other, Not Cohabiting"
putexcel G46 = "Other, Cohabiting"

putexcel H41 = matrix(mar32[1,1]), nformat (number_d2) 
putexcel H42 = matrix(mar32[2,1]), nformat (number_d2) 
putexcel H43 = matrix(mar32[3,1]), nformat (number_d2) 
putexcel H44 = matrix(mar32[4,1]), nformat (number_d2) 
putexcel H45 = matrix(mar32[5,1]), nformat (number_d2) 
putexcel H46 = matrix(mar32[6,1]), nformat (number_d2) 

putexcel H47 = matrix(mar32[7,1]), nformat (number_d2) 






***** children at the age 32
mdesc children32
*mi estimate: proportion children32 [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab children32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children32) m
mata: st_matrix("children32", (st_matrix("children32") :/ colsum(st_matrix("children32"))))
matrix list children32, format("%3.2f")

putexcel C43 =  matrix(children32[1,1]), nformat (number_d2) 
putexcel E43 = 	matrix(children32[3,1]), nformat (number_d2) 


** Debt
mdesc havedebt30
*mi estimate: proportion havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab havedebt30 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(debt) m
mata: st_matrix("debt", (st_matrix("debt") :/ colsum(st_matrix("debt"))))
matrix list debt, format("%3.2f")
putexcel C44 = matrix(debt[2,1]), nformat (number_d2) 
putexcel E44 = matrix(debt[3,1]), nformat (number_d2) 


*** Citizenship 
mdesc citizenship
*mi estimate: proportion citizenship [pweight=SAMPLING_PANEL_WEIGHT_1997]
tab citizenship [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(nat) m
mata: st_matrix("nat", (st_matrix("nat") :/ colsum(st_matrix("nat"))))
matrix list nat, format("%3.2f")
putexcel C45 =  matrix(nat[2,1]), nformat (number_d2) 
putexcel E45 =  matrix(nat[3,1]), nformat (number_d2) 


*** Asvab score
putexcel B67 = "Cognitive skills(asvab score)"
*mi estimate: mean asvabscore [aweight=SAMPLING_PANEL_WEIGHT_1997] 
sum asvabscore [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C67 = matrix(r(mean)), nformat("##.#")
putexcel D67 = matrix(r(sd)), nformat("##.#")

tab asvabscore [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(asvb) m
mata: st_matrix("asvb", (st_matrix("asvb") :/ colsum(st_matrix("asvb"))))
matrix list asvb, format("%3.2f")
putexcel E67 = matrix(asvb[3029,1]), nformat (number_d2) 



*** General health
mdesc genhlt24
putexcel B68 = "General health"
*mi estimate: mean genhlt24 [aweight=SAMPLING_PANEL_WEIGHT_1997] 
sum genhlt24 [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C68 = matrix(r(mean)), nformat("##.#")
putexcel D68 = matrix(r(sd)), nformat("##.#")

tab genhlt24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(genh) m
mata: st_matrix("genh", (st_matrix("genh") :/ colsum(st_matrix("genh"))))
matrix list genh, format("%3.2f")
putexcel E68 = matrix(genh[6,1]), nformat (number_d2) 



*** mental health
mdesc sum_mh_2000
putexcel B69 = "Mental Health"
*mi estimate: mean sum_mh_2000 [aweight=SAMPLING_PANEL_WEIGHT_1997] 

sum sum_mh_2000[aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C69 = matrix(r(mean)), nformat("##.#")
putexcel D69 = matrix(r(sd)), nformat("##.#")



*** parental income
mdesc qrt_hhincome97 
tab qrt_hhincome97 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(hhinc) m
mata: st_matrix("hhinc", (st_matrix("hhinc") :/ colsum(st_matrix("hhinc"))))
matrix list hhinc, format("%3.2f")

putexcel B71 = "Parental income by quartiles"
putexcel B72 = "1st quartile"
putexcel B73 = "2nd quartile"
putexcel B74 = "3rd quartile"
putexcel B75 = "4th quartile"

putexcel C72 = matrix(hhinc[1,1]), nformat (number_d2) 
putexcel C73 = matrix(hhinc[2,1]), nformat (number_d2)
putexcel C74 = matrix(hhinc[3,1]), nformat (number_d2)
putexcel C75 = matrix(hhinc[4,1]), nformat (number_d2)
putexcel E72 = matrix(hhinc[5,1]), nformat (number_d2) 



***** Outcome 1: Employment Status
tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab) m
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel C46 =  matrix(stab[2,1]), nformat (number_d2)
putexcel C47 =  matrix(stab[3,1]), nformat (number_d2)


***** Outcome 2: Occupational Standing
sum occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C48 = matrix(r(mean)), nformat (number_d2)
putexcel D48 = matrix(r(sd)), nformat (number_d2)

tab occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(occ) m
mata: st_matrix("occ", (st_matrix("occ") :/ colsum(st_matrix("occ"))))
matrix list occ, format("%3.2f")
putexcel E48 = matrix(occ[252,1]), nformat (number_d2) 

*** Parental coresidence characteristics

/*51
52
53
54
*/


** average duration of those who coreside

** total duration including whoever has a missing observation
mdesc totaldurationinhh2429
sum totaldurationinhh2429 [aweight=SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2429 > 0
return list
putexcel C55 = matrix(r(mean)), nformat (number_d2)
putexcel D55 = matrix(r(sd)), nformat (number_d2)

tab totaldurationinhh2429 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(totd) m
mata: st_matrix("totd", (st_matrix("totd") :/ colsum(st_matrix("totd"))))
matrix list totd, format("%3.2f")
putexcel E55 = matrix(totd[8,1]), nformat (number_d2) 


** total duration excluding whoever has a missing observation
putexcel B56 = "Avg duration complete case"
gen total_duration2 = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
mdesc total_duration2
sum total_duration2 [aweight=SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2429 > 0 
return list
putexcel C56 = matrix(r(mean)), nformat (number_d2)
putexcel D56 = matrix(r(sd)), nformat (number_d2)

tab total_duration2 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(totd2) m
mata: st_matrix("totd2", (st_matrix("totd2") :/ colsum(st_matrix("totd2"))))
matrix list totd2, format("%3.2f")
putexcel E56 = matrix(totd2[8,1]), nformat (number_d2) 

** categorization with missings

	 *** categorization of the 24-29 variable with missings on items***
	gen 	livhh_cat3 = .
	replace livhh_cat3 = 0 if totaldurationinhh2429 == 0
	replace livhh_cat3 = 1 if totaldurationinhh2429 == 1
	replace livhh_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	replace livhh_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6 
	label 	define livhh_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livhh_cat3 livhh_cat3
	
	
	tab livhh_cat3  [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(liv3) m
	mata: st_matrix("liv3", (st_matrix("liv3"):/ colsum(st_matrix("liv3"))))
	matrix list liv3, format("%3.2f")
	
	putexcel B77 = "None"
	putexcel B78 = "1 year"
	putexcel B79 = "2-3 years"
	putexcel B80 = "4-6 years"

	putexcel C77 =  matrix(liv3[1,1]), nformat (number_d2)
	putexcel C78 =  matrix(liv3[2,1]), nformat (number_d2)
	putexcel C79 =  matrix(liv3[3,1]), nformat (number_d2)
	putexcel C80 =  matrix(liv3[4,1]), nformat (number_d2)
	putexcel E77 =  matrix(liv3[5,1]), nformat (number_d2)

	
	*** categorization of the 24-29 variable complete case ***
	gen 	livhhcc_cat3 = .
	replace livhhcc_cat3 = 0 if total_duration2 == 0
	replace livhhcc_cat3 = 1 if total_duration2 == 1
	replace livhhcc_cat3 = 2 if total_duration2 == 2 | total_duration2 == 3 
	replace livhhcc_cat3 = 3 if total_duration2 == 4 | total_duration2 == 5 | total_duration2 == 6 
	label 	define livhhcc_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livhhcc_cat3 livhhcc_cat3
	
	tab livhhcc_cat3  [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(livc3) m
	mata: st_matrix("livc3", (st_matrix("livc3"):/ colsum(st_matrix("livc3"))))
	matrix list livc3, format("%3.2f")
	
	putexcel B81 = "None"
	putexcel B82 = "1 year"
	putexcel B83 = "2-3 years"
	putexcel B84 = "4-6 years"

	putexcel C81 =  matrix(livc3[1,1]), nformat (number_d2)
	putexcel C82 =  matrix(livc3[2,1]), nformat (number_d2)
	putexcel C83 =  matrix(livc3[3,1]), nformat (number_d2)
	putexcel C84 =  matrix(livc3[4,1]), nformat (number_d2)
	putexcel E81 =  matrix(livc3[5,1]), nformat (number_d2)

	


** Proportion of living together with parents by age 
mdesc livingat*
tab livingat24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at24) m 
    mata: st_matrix("at24", (st_matrix("at24"):/ colsum(st_matrix("at24"))))
    matrix list at24, format("%3.2f")
	putexcel C58 = matrix(at24[2,1]), nformat(number_d2)
	putexcel E58 = matrix(at24[3,1]), nformat(number_d2)

tab livingat25 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at25) m
    mata: st_matrix("at25", (st_matrix("at25"):/ colsum(st_matrix("at25"))))
    matrix list at25, format("%3.2f")
	putexcel C59 = matrix(at25[2,1]), nformat(number_d2)
	putexcel E59 = matrix(at25[3,1]), nformat(number_d2)

tab livingat26 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at26) m 
    mata: st_matrix("at26", (st_matrix("at26"):/ colsum(st_matrix("at26"))))
    matrix list at26, format("%3.2f")
	putexcel C60 = matrix(at26[2,1]), nformat(number_d2)
	putexcel E60 = matrix(at26[3,1]), nformat(number_d2)

tab livingat27 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at27) m 
    mata: st_matrix("at27", (st_matrix("at27"):/ colsum(st_matrix("at27"))))
    matrix list at27, format("%3.2f")
	putexcel C61 = matrix(at27[2,1]), nformat(number_d2)
	putexcel E61 = matrix(at27[3,1]), nformat(number_d2)
	 
tab livingat28 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at28) m 
    mata: st_matrix("at28", (st_matrix("at28"):/ colsum(st_matrix("at28"))))
    matrix list at28, format("%3.2f")
	putexcel C62 = matrix(at28[2,1]), nformat(number_d2)	
	putexcel E62 = matrix(at28[3,1]), nformat(number_d2)
	
tab livingat29 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(at29) m
    mata: st_matrix("at29", (st_matrix("at29"):/ colsum(st_matrix("at29"))))
    matrix list at29, format("%3.2f")
	putexcel C63 = matrix(at29[2,1]), nformat(number_d2)
	putexcel E63 = matrix(at29[3,1]), nformat(number_d2)

	



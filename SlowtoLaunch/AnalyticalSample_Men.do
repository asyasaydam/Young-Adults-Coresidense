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
log 		using "$logdir/NLSY97men_`logdate'.log", t replace


* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2429 livedwpar_cat livedwpar_bin
* Controls: 				SEX race citizenship education_new
* Family/background: 		nsibling97 momeduc intact livingarrangement1997 incomesource97 ave* (personality traits) genhlt24 sum_mh_2000 asvabscore
* Controls at age 24: 		enrolled24 maritalstat24 children24 empstatusage24 totalurban south 
* Controls at age 32: 		maritalstat32 children32 incarstat
* Endogenous parameters		incarstat2 empdur2431 maritalstat32 havedebt30 
* weights:					SAMPLING_PANEL_WEIGHT_*  

use 	"$temp/mi_datacreated100imp_alt2", clear
mi estimate: proportion livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997]



*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_Descriptive", sheet("hitaPmenat24_update3") replace

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
tab ID [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(n)
mata: st_matrix("n")
matrix list n, format("%9.2f")
putexcel C66 =  matrix(n[1,1]), nformat (number)


*** Race/Ethnicity
mdesc race
tab race [fweight=SAMPLING_PANEL_WEIGHT_1997], matcell(race1)
mata: st_matrix("race1", (st_matrix("race1") :/ colsum(st_matrix("race1"))))
matrix list race1, format("%3.2f")

putexcel C5 = matrix(race1[1,1]), nformat (number_d2) 
putexcel C6 = matrix(race1[2,1]), nformat (number_d2) 
putexcel C7 = matrix(race1[3,1]), nformat (number_d2) 
putexcel C8 = matrix(race1[4,1]), nformat (number_d2) 



*** Education
mdesc education_new
tab education_new [fweight=SAMPLING_PANEL_WEIGHT_1997], matcell(edu)
mata: st_matrix("edu", (st_matrix("edu") :/ colsum(st_matrix("edu"))))
matrix list edu, format("%3.2f")

putexcel C10 =  matrix(edu[1,1]), nformat (number_d2) 
putexcel C11 =  matrix(edu[2,1]), nformat (number_d2) 
putexcel C12 =  matrix(edu[3,1]), nformat (number_d2) 
putexcel C13 =  matrix(edu[4,1]), nformat (number_d2) 

*putexcel E10 = matrix(edu[5,1]), nformat (number_d2)



*** Parental income/education
mdesc parenteduc
mi estimate: proportion parenteduc [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion qrt_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997]

tabstat hh_income97, by(qrt_hhincome97) stats (min max N)

*mata: st_matrix("paredu", (st_matrix("paredu") :/ colsum(st_matrix("paredu"))))
*matrix list paredu, format("%3.2f")

*putexcel C15 =  matrix(paredu[1,1]), nformat (number_d2) 
*putexcel C16 =  matrix(paredu[2,1]), nformat (number_d2) 
*putexcel C17 =  matrix(paredu[3,1]), nformat (number_d2) 
*putexcel C18 =  matrix(paredu[4,1]), nformat (number_d2)
*putexcel E15 = matrix(paredu[5,1]), nformat (number_d2)



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
mi estimate: mean aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997]

***** Extraversion
mdesc aveextra
mi estimate: mean aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997]

***** Openness
mdesc aveopen
mi estimate: mean aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997]

***** Emotional Stability
mdesc aveemost
mi estimate: mean aveemost [aweight=SAMPLING_PANEL_WEIGHT_1997] 

***** Conscientiousness
mdesc avecons
mi estimate: mean avecons [aweight=SAMPLING_PANEL_WEIGHT_1997]

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
mi estimate: proportion unionstatus24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion unionstatus32 [pweight=SAMPLING_PANEL_WEIGHT_1997]

***** children at the age 24
mdesc children24
mi estimate: proportion children24 [pweight=SAMPLING_PANEL_WEIGHT_1997]

***** Enrolled at 24
mdesc enrolled24
mi estimate: proportion enrolled24 [pweight=SAMPLING_PANEL_WEIGHT_1997]

****** Employment status at age 24 
mdesc empstatusage24 
mi estimate: proportion empstatusage24 [pweight=SAMPLING_PANEL_WEIGHT_1997]


** Incarcerated
mdesc incarstat24
tab incarstat24 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(inc24) m
mata: st_matrix("inc24", (st_matrix("inc24") :/ colsum(st_matrix("inc24"))))
matrix list inc24, format("%3.2f")

mdesc incarstat32
tab incarstat32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(inc32) m
mata: st_matrix("inc32", (st_matrix("inc32") :/ colsum(st_matrix("inc32"))))
matrix list inc32, format("%3.2f")



tab incarstat32 race [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(inc24r) m
mata: st_matrix("inc24r", (st_matrix("inc24r") :/ colsum(st_matrix("inc24r"))))
matrix list inc24r, format("%3.2f")




**** Marital Status at age 32
mdesc unionstatus32
mi estimate: proportion unionstatus32 [pweight=SAMPLING_PANEL_WEIGHT_1997]

***** children at the age 32
mdesc children32
mi estimate: proportion children32 [pweight=SAMPLING_PANEL_WEIGHT_1997]


** Debt
mdesc havedebt30
mi estimate: proportion havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997]


*** Citizenship 
mdesc citizenship
mi estimate: proportion citizenship [pweight=SAMPLING_PANEL_WEIGHT_1997]


*** Asvab score
putexcel B67 = "Cognitive skills(asvab score)"
mi estimate: mean asvabscore [aweight=SAMPLING_PANEL_WEIGHT_1997] 
sum asvabscore

*** General health
mdesc genhlt24
putexcel B68 = "General health"
mi estimate: mean genhlt24 [aweight=SAMPLING_PANEL_WEIGHT_1997] 


*** mental health
mdesc sum_mh_2000
putexcel B69 = "Mental Health"
mi estimate: mean sum_mh_2000 [aweight=SAMPLING_PANEL_WEIGHT_1997] 



*** parental income
mdesc qrt_hhincome97 
mi estimate: proportion qrt_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997] 


*** Parental coresidence characteristics
** Proportion of living together with parents by age 
mdesc livingat*
mi estimate: proportion livingat24 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion livingat25 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion livingat26 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion livingat27 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion livingat28 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mi estimate: proportion livingat29 [pweight=SAMPLING_PANEL_WEIGHT_1997]


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


mi estimate: mean totaldurationinhh2429 [pweight=SAMPLING_PANEL_WEIGHT_1997] if totaldurationinhh2429 > 0
** categorization with missings
mi estimate: proportion livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997]



***** Outcome 1: Employment Status
tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab) m
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel C46 =  matrix(stab[2,1]), nformat (number_d2)
putexcel C47 =  matrix(stab[3,1]), nformat (number_d2)


***** Outcome 2: Occupational Standing
use "$temp/mi_datacreated100impOcc", clear 
sum occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997]
return list
putexcel C48 = matrix(r(mean)), nformat (number_d2)
putexcel D48 = matrix(r(sd)), nformat (number_d2)

tab occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(occ) m
mata: st_matrix("occ", (st_matrix("occ") :/ colsum(st_matrix("occ"))))
matrix list occ, format("%3.2f")
putexcel E48 = matrix(occ[252,1]), nformat (number_d2) 

tabstat occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat3)






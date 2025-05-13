********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive Analysis Women
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2022
* I follow Augustine and Raley's 2012 JMF paper
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97pswomen_`logdate'.log", t replace



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


** Used these in the multiple imputation as extra: schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97 incomesource97 *debt* ln_debt25 hhincome97 hhnetwrth97 ln_hhincome97 ln_hhnetwrth97 *debt* BYEAR 

** Used in propensity score analysis but not sure to use in models: c.aveextra c.aveagree c.avecons c.aveemost c.aveopen

** weight: SAMPLING_PANEL_WEIGHT_1997

mdesc race education_new momeduc livingarrangement1997 nsibling97 empdur1523 enrolled24 maritalstat24 children24 empstatge24 totalurban south  incarstat maritalstat32  children32 empdur2531_fulltime

	

** This is to see the odds ratios for selection factors table 2
*eststo: logit livedwpar_bin i.race i.education_new2 i.enrolled24_2 i.maritalstat24_2 i.children24_2 i.empstatusage_bin2_24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban i.south c.empdur1523_fulltime c.aveextra c.aveagree c.avecons c.aveemost c.aveopen  [pweight=SAMPLING_PANEL_WEIGHT_1997], or

** Results: 
*esttab using "$results/NLSYPSA_men_selection.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_DescriptivePropensity.xlsx", sheet("hitaPwomen") modify

*************************
* Create Table Shell
*************************

putexcel B1 = "Characteristics", border(bottom double) hcenter
putexcel G1 = "Never lived with parents between 24-32", border(bottom double) hcenter
putexcel H1 = "Coresided some with parents between 24-32", border(bottom double) hcenter
putexcel I1 = "Coresided all with parents between 24-32", border(bottom double) hcenter

putexcel B2 = "No employment during the year"
putexcel B3 = "Part-time or part year employment"
putexcel B4 = "Fulltime full year employment"
putexcel B5 = "Occupational Standing"

putexcel B7 = "Race", bold
putexcel B8 = "Non-Hispanic White"
putexcel B9 = "Non-Hispanic Black"
putexcel B10 = "Hispanic"
putexcel B11 = "Other"

putexcel B15 = "Education", bold
putexcel B16 = "Less than HS"
putexcel B17 = "High School"
putexcel B18 = "Some College"
putexcel B19 = "College and more"

putexcel B23 = "Childhood Household", bold
putexcel B24 = "Both parents"
putexcel B25 = "Single/Adoptive parent(s)" 
putexcel B26 = "Other arrangements"
putexcel B27 = "Sibship size at childhood(mean)", bold

putexcel B29 = "Parental education", bold
putexcel B30 = "Less than HS"
putexcel B31 = "High School"
putexcel B32 = "Some college"
putexcel B33 = "College and more"
putexcel B34 = "Missing"

putexcel B37 = "Marital Status at age 24", bold
putexcel B38 = "Single"
putexcel B39 = "Married"

putexcel B40 = "Children at age 24", bold
putexcel B41 = "No child"
putexcel B42 = "Have children"

putexcel B44 = "Employment at age 24", bold
putexcel B45 = "Not employed"
putexcel B46 = "Parttime employed"
putexcel B47 = "Full time employed"
putexcel B48 = "Missing"

***** Number of years spent in urban
putexcel B52 = "Number of years spent in urban before age 24", bold


***** Ever lived in south
putexcel B55 = "Lived in the South before age 24"
putexcel B56 = "Never lived in the South before age 24"


***** Weighted percentage
putexcel B12 = "Weighted percentage"

tab livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(perc)
mata: st_matrix("perc", (st_matrix("perc"):/ colsum(st_matrix("perc"))))
matrix list perc, format("%3.2f")

putexcel G12 =  matrix(perc[1,1]), nformat (number_d2)
putexcel H12 =  matrix(perc[2,1]), nformat (number_d2) 
putexcel I12 =  matrix(perc[3,1]), nformat (number_d2)

***** Weighted n
putexcel B13 = "Weighted n"

tab livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(n)
mata: st_matrix("n")
matrix list n, format("%9.2f")

putexcel G13 =  matrix(n[1,1]), nformat (number)
putexcel H13 =  matrix(n[2,1]), nformat (number)
putexcel I13 =  matrix(n[3,1]), nformat (number)


***** Outcome 1: Employment Status

putexcel A2 = "employment status at 32"
tab empstatusage32 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab)
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel G2 =  matrix(stab[1,1]), nformat (number_d2)
putexcel H2 =  matrix(stab[1,2]), nformat (number_d2)
putexcel I2 =  matrix(stab[1,3]), nformat (number_d2)

putexcel G3 =  matrix(stab[2,1]), nformat (number_d2)
putexcel H3 =  matrix(stab[2,2]), nformat (number_d2) 
putexcel I3 =  matrix(stab[2,3]), nformat (number_d2)

putexcel G4 =  matrix(stab[3,1]), nformat (number_d2)
putexcel H4 =  matrix(stab[3,2]), nformat (number_d2)
putexcel I4 =  matrix(stab[3,3]), nformat (number_d2) 


***** Outcome 2: Occupational Standing

  
tabstat occeduc_max [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G5 = matrix(r(Stat1)), nformat (number_d2)
putexcel H5 = matrix(r(Stat2)), nformat (number_d2)
putexcel I5 = matrix(r(Stat2)), nformat (number_d2)


**** race

tab race livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(race1)
mata: st_matrix("race1", (st_matrix("race1") :/ colsum(st_matrix("race1"))))
matrix list race1, format("%3.2f")

putexcel G8 =  matrix(race1[1,1]), nformat (number_d2) 
putexcel G9 =  matrix(race1[2,1]), nformat (number_d2) 
putexcel G10 = matrix(race1[3,1]), nformat (number_d2)
putexcel G11 = matrix(race1[4,1]), nformat (number_d2)
 

putexcel H8 =  matrix(race1[1,2]), nformat (number_d2) 
putexcel H9 =  matrix(race1[2,2]), nformat (number_d2) 
putexcel H10 = matrix(race1[3,2]), nformat (number_d2) 
putexcel H11 = matrix(race1[4,2]), nformat (number_d2) 
 
putexcel I8 =  matrix(race1[1,3]), nformat (number_d2) 
putexcel I9 =  matrix(race1[2,3]), nformat (number_d2) 
putexcel I10 = matrix(race1[3,3]), nformat (number_d2) 
putexcel I11 = matrix(race1[4,3]), nformat (number_d2) 

** Education

tab 	education_new livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(edu) m
mata: st_matrix("edu", (st_matrix("edu") :/ colsum(st_matrix("edu"))))
matrix list edu, format("%3.2f")

putexcel G16 =  matrix(edu[1,1]), nformat (number_d2) 
putexcel G17 =  matrix(edu[2,1]), nformat (number_d2) 
putexcel G18 =  matrix(edu[3,1]), nformat (number_d2) 
putexcel G19 =  matrix(edu[4,1]), nformat (number_d2) 

putexcel H16 =  matrix(edu[1,2]), nformat (number_d2) 
putexcel H17 =  matrix(edu[2,2]), nformat (number_d2) 
putexcel H18 =  matrix(edu[3,2]), nformat (number_d2) 
putexcel H19 =  matrix(edu[4,2]), nformat (number_d2) 

putexcel I16 =  matrix(edu[1,3]), nformat (number_d2) 
putexcel I17 =  matrix(edu[2,3]), nformat (number_d2) 
putexcel I18 =  matrix(edu[3,3]), nformat (number_d2) 
putexcel I19 =  matrix(edu[4,3]), nformat (number_d2) 


*** Childhood household
tab livingarrangement1997 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(fch)
mata: st_matrix("fch", (st_matrix("fch") :/ colsum(st_matrix("fch"))))
matrix list fch, format("%3.2f")

putexcel G24 = matrix(fch[1,1]), nformat (number_d2) 
putexcel G25 = matrix(fch[2,1]), nformat (number_d2) 
putexcel G26 = matrix(fch[3,1]), nformat (number_d2) 


putexcel H24 = matrix(fch[1,2]), nformat (number_d2) 
putexcel H25 = matrix(fch[2,2]), nformat (number_d2) 
putexcel H26 = matrix(fch[3,2]), nformat (number_d2) 

putexcel I24 = matrix(fch[1,3]), nformat (number_d2) 
putexcel I25 = matrix(fch[2,3]), nformat (number_d2) 
putexcel I26 = matrix(fch[3,3]), nformat (number_d2) 

  
tabstat nsibling97 [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G27 = matrix(r(Stat1)), nformat("##.#")
putexcel H27 = matrix(r(Stat2)), nformat("##.#")
putexcel I27 = matrix(r(Stat2)), nformat("##.#")


**** parental education

tab momeduc livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(paredu) m
mata: st_matrix("paredu", (st_matrix("paredu") :/ colsum(st_matrix("paredu"))))
matrix list paredu, format("%3.2f")

putexcel G30 =  matrix(paredu[1,1]), nformat (number_d2) 
putexcel G31 =  matrix(paredu[2,1]), nformat (number_d2) 
putexcel G32 =  matrix(paredu[3,1]), nformat (number_d2) 
putexcel G33 =  matrix(paredu[4,1]), nformat (number_d2)
putexcel G34 =  matrix(paredu[5,1]), nformat (number_d2)

putexcel H30 =  matrix(paredu[1,2]), nformat (number_d2) 
putexcel H31 =  matrix(paredu[2,2]), nformat (number_d2) 
putexcel H32 =  matrix(paredu[3,2]), nformat (number_d2)
putexcel H33 =  matrix(paredu[4,2]), nformat (number_d2)
putexcel H34 =  matrix(paredu[5,2]), nformat (number_d2)  

putexcel I30 =  matrix(paredu[1,3]), nformat (number_d2) 
putexcel I31 =  matrix(paredu[2,3]), nformat (number_d2) 
putexcel I32 =  matrix(paredu[3,3]), nformat (number_d2) 
putexcel I33 =  matrix(paredu[4,3]), nformat (number_d2) 
putexcel I34 =  matrix(paredu[5,3]), nformat (number_d2) 

**** Marital Status at age 24
tab maritalstat24 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar24)
mata: st_matrix("mar24", (st_matrix("mar24") :/ colsum(st_matrix("mar24"))))
matrix list mar24, format("%3.2f")

putexcel G38 = matrix(mar24[1,1]), nformat (number_d2) 
putexcel G39 = matrix(mar24[2,1]), nformat (number_d2) 

putexcel H38 = matrix(mar24[1,2]), nformat (number_d2) 
putexcel H39 = matrix(mar24[2,2]), nformat (number_d2) 

putexcel I38 = matrix(mar24[1,3]), nformat (number_d2) 
putexcel I39 = matrix(mar24[2,3]), nformat (number_d2) 


***** children at the age 24
tab children24 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children24)
mata: st_matrix("children24", (st_matrix("children24") :/ colsum(st_matrix("children24"))))
matrix list children24, format("%3.2f")

putexcel G41 =  matrix(children24[1,1]), nformat (number_d2) 
putexcel G42 =  matrix(children24[2,1]), nformat (number_d2) 

putexcel H41 =  matrix(children24[1,2]), nformat (number_d2) 
putexcel H42 =  matrix(children24[2,2]), nformat (number_d2) 

putexcel I41 =  matrix(children24[1,3]), nformat (number_d2) 
putexcel I42 =  matrix(children24[2,3]), nformat (number_d2) 


****** employment status at age 24 
tab empstatusage24 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(emp24) m 
mata: st_matrix("emp24", (st_matrix("emp24") :/ colsum(st_matrix("emp24"))))
matrix list emp24, format("%3.2f")

putexcel G45 = matrix(emp24[1,1]), nformat (number_d2) 
putexcel G46 = matrix(emp24[2,1]), nformat (number_d2) 
putexcel G47 = matrix(emp24[3,1]), nformat (number_d2) 
putexcel G48 = matrix(emp24[4,1]), nformat (number_d2)

putexcel H45 = matrix(emp24[1,2]), nformat (number_d2) 
putexcel H46 = matrix(emp24[2,2]), nformat (number_d2) 
putexcel H47 = matrix(emp24[3,2]), nformat (number_d2) 
putexcel H48 = matrix(emp24[4,2]), nformat (number_d2)

putexcel I45 = matrix(emp24[1,3]), nformat (number_d2) 
putexcel I46 = matrix(emp24[2,3]), nformat (number_d2) 
putexcel I47 = matrix(emp24[3,3]), nformat (number_d2) 
putexcel I48 = matrix(emp24[4,3]), nformat (number_d2) 

***** total time spent in urban until 24
tabstat totalurban [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G52 = matrix(r(Stat1)), nformat("##.#")
putexcel H52 = matrix(r(Stat2)), nformat("##.#")
putexcel I52 = matrix(r(Stat3)), nformat("##.#")



***** lived in south or not until 24
tab south livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(south)
mata: st_matrix("south", (st_matrix("south") :/ colsum(st_matrix("south"))))
matrix list south, format("%3.2f")


putexcel G55 =  matrix(south[1,1]), nformat (number_d2) 
putexcel G56 =  matrix(south[2,1]), nformat (number_d2) 

putexcel H55 =  matrix(south[1,2]), nformat (number_d2) 
putexcel H56 =  matrix(south[2,2]), nformat (number_d2) 

putexcel I55 =  matrix(south[1,3]), nformat (number_d2) 
putexcel I56 =  matrix(south[2,3]), nformat (number_d2) 



***** Agreeableness
putexcel B58 = "Personality Characeteristics", bold
putexcel B59 = "Agreeableness"
tabstat aveagree [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G59 = matrix(r(Stat1)), nformat("##.#")
putexcel H59 = matrix(r(Stat2)), nformat("##.#")
putexcel I59 = matrix(r(Stat3)), nformat("##.#")

***** Extraversion
putexcel B61 = "Extraversion"
tabstat aveextra [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G61 = matrix(r(Stat1)), nformat("##.#")
putexcel H61 = matrix(r(Stat2)), nformat("##.#")
putexcel I61 = matrix(r(Stat3)), nformat("##.#")

***** Openness
putexcel B63 = "Openness"
tabstat aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G63 = matrix(r(Stat1)), nformat("##.#")
putexcel H63 = matrix(r(Stat2)), nformat("##.#")
putexcel I63 = matrix(r(Stat3)), nformat("##.#")

***** Emotional Stability
putexcel B65 = "Emotional Stability"
tabstat aveopen [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G65 = matrix(r(Stat1)), nformat("##.#")
putexcel H65 = matrix(r(Stat2)), nformat("##.#")
putexcel I65 = matrix(r(Stat3)), nformat("##.#")

***** Conscientiousness
putexcel B67 = "Conscientiousness"
tabstat avecons [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G67 = matrix(r(Stat1)), nformat("##.#")
putexcel H67 = matrix(r(Stat2)), nformat("##.#")
putexcel I67 = matrix(r(Stat3)), nformat("##.#")

***** Employment Duration btw 15-23
putexcel B49 = "Total years of fully employed between ages 15-23"
tabstat empdur1523 [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) columns(statistics) save
return list

putexcel G49 = matrix(r(Stat1)), nformat("##.#")
putexcel H49 = matrix(r(Stat2)), nformat("##.#")
putexcel I49 = matrix(r(Stat3)), nformat("##.#")



***** Enrolled at 24
putexcel B70 = "Enrolment at 24", bold
putexcel B71 = "Not Enrolled at 24"
putexcel B72 = "Enrolled at 24"


tab enrolled24 livedwpar_cat [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(enrol)
mata: st_matrix("enrol", (st_matrix("enrol") :/ colsum(st_matrix("enrol"))))
matrix list enrol, format("%3.2f")


putexcel G71 =  matrix(enrol[1,1]), nformat (number_d2) 
putexcel G72 =  matrix(enrol[2,1]), nformat (number_d2) 

putexcel H71 =  matrix(enrol[1,2]), nformat (number_d2) 
putexcel H72 =  matrix(enrol[2,2]), nformat (number_d2) 

putexcel I71 =  matrix(enrol[1,3]), nformat (number_d2) 
putexcel I72 =  matrix(enrol[2,3]), nformat (number_d2) 




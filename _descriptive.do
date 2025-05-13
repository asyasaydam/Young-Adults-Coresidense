
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive excel
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97describe_`logdate'.log", t replace




*opening final data
use "$temp/NLSY97_Final_sample_with_meanimpu", clear


mdesc empstatusage32 totaldurationinhh2432 livedwparafter24 livingat24 SEX race education2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth nsibling97 parenteduc2 intact incarstat2  


keep BYEAR SAMPLING* empstatus323334 empstatusage32 empstatusage33 empstatusage34 totaldurationinhh2432 livedwparafter24 livingat24 SEX race citizenship education education2 maritalstat24 maritalstat32 children32 children24 children24_2 empstat24_2 totalurban totalsouth nsibling97 parenteduc parenteduc2 momeduc livingarrangement1997 intact hhincome97 incarstat incarstat2 ave*

*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_DescriptiveDROPPEDnew.xlsx", sheet("hitaW") replace

*************************
* Create Table Shell
*************************
putexcel F1 = "Characteristics", border(bottom double) hcenter
putexcel G1 = "No employment during the year", border(bottom double) hcenter
putexcel H1 = "Part-time or part year employment", border(bottom double) hcenter
putexcel I1 = "Fulltime full year employment", border(bottom double) hcenter
putexcel F2 = "Total Sample"
putexcel F3 = "Total duration at parental hh 24-33"
putexcel F4 = "Gender", bold
putexcel F5 = "Female"
putexcel F6 = "Male"
putexcel F7 = "Race", bold
putexcel F8 = "Non-Hispanic White"
putexcel F9 = "Non-Hispanic Black"
putexcel F10 = "Hispanic"
*putexcel F11 = "Citizenship", bold
*putexcel F12 = "US-born"
*putexcel F13 = "Non US-born"
*putexcel F14 = "Unknown"

putexcel F12 = "Ever lived with parents after 24 or not", bold
putexcel F13 = "Never lived after 24 to 32"
putexcel F14 = "Lived with parents after 24 -varying"


putexcel F15 = "Education", bold
putexcel F16 = "Less than HS"
putexcel F17 = "High School"
putexcel F18 = "Associate degree"
putexcel F19 = "College and more"

*putexcel F20 = "Marital Status at age 33", bold
*putexcel F21 = "Married"
*putexcel F22 = "Single"

putexcel F23 = "Childhood Household", bold
putexcel F24 = "Both parents"
putexcel F25 = "Single/Adoptive parent(s)" 
putexcel F26 = "Other arrangements"

putexcel F27 = "Sibship size at childhood(mean)", bold

putexcel F29 = "Parental education", bold
putexcel F30 = "Less than HS"
putexcel F31 = "High School"
putexcel F32 = "Some college and more"

*putexcel F33 = "Children at the age 32", bold
*putexcel F34 = "No child"
*putexcel F35 = "1 children"
*putexcel F36 = "2 and more children"

putexcel F37 = "Marital Status at age 24", bold
putexcel F38 = "Single"
putexcel F39 = "Married"

putexcel F40 = "Children at age 24", bold
putexcel F41 = "No child"
putexcel F42 = "Have children"

putexcel F44 = "Employment at age 24", bold
putexcel F45 = "Not employment"
putexcel F46 = "Part time"
putexcel F47 = "Full year employed"

putexcel F48 = "Living situation at 24", bold
putexcel F49 = "No parents"
putexcel F50 = "With parents"

putexcel F51 = "Incarceration background", bold
putexcel F52 = "Never incarcerated"
putexcel F53 = "Have been incarcerated at least once"

putexcel F55 = "Total time spent in urban before age 24", bold
putexcel F56 = "Total time spent in th South before age 24", bold






** variables list
*mdesc empstatus323334 empstatusage32 empstatusage33 empstatusage34 totaldurationinhh2432 livedwparafter24 livingat24 SEX race citizenship education maritalstat24 children24 employedat24 nsibling97 parenteduc momeduc livingarrangement1997 hhincome97 incarstat totalurban totalsouth



tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab)
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel G2 =  matrix(stab[1,1]), nformat("##.#%")
putexcel H2 =  matrix(stab[2,1]), nformat("##.#%")
putexcel I2 =  matrix(stab[3,1]), nformat("##.#%")


*tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997]

*return list
*putexcel H2 =  matrix(r(N)), nformat("##")
 
 
 
 
 
tabstat totaldurationinhh2432 [aweight=SAMPLING_PANEL_WEIGHT_1997], by (empstatusage32) statistics(mean) columns(statistics) save
return list

putexcel G3 = matrix(r(Stat1)), nformat("##.#")
putexcel H3 = matrix(r(Stat2)), nformat("##.#")
putexcel I3 = matrix(r(Stat3)), nformat("##.#")
 


**** sex
tab SEX empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(sex)
mata: st_matrix("sex", (st_matrix("sex") :/ rowsum(st_matrix("sex"))))
matrix list sex, format("%3.2f")

putexcel G5 =  matrix(sex[2,1]), nformat("##.#%")
putexcel H5 =  matrix(sex[2,2]), nformat("##.#%")
putexcel I5 = matrix(sex[2,3]), nformat("##.#%")

putexcel G6 =  matrix(sex[1,1]), nformat("##.#%")
putexcel H6 =  matrix(sex[1,2]), nformat("##.#%")
putexcel I6 =  matrix(sex[1,3]), nformat("##.#%")


**** race

tab race empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(race1)
mata: st_matrix("race1", (st_matrix("race1") :/ rowsum(st_matrix("race1"))))
matrix list race1, format("%3.2f")

putexcel G8 =  matrix(race1[1,1]), nformat("##.#%")
putexcel G9 =  matrix(race1[2,1]), nformat("##.#%")
putexcel G10 =  matrix(race1[3,1]), nformat("##.#%")

putexcel H8 =  matrix(race1[1,2]), nformat("##.#%")
putexcel H9 =  matrix(race1[2,2]), nformat("##.#%")
putexcel H10 =  matrix(race1[3,2]), nformat("##.#%")
 
putexcel I8 =  matrix(race1[1,3]), nformat("##.#%")
putexcel I9 =  matrix(race1[2,3]), nformat("##.#%")
putexcel I10 =  matrix(race1[3,3]), nformat("##.#%")

/*
**** citizenship
tab citizenship empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(cit)
mata: st_matrix("cit", (st_matrix("cit") :/ rowsum(st_matrix("cit"))))
matrix list cit, format("%3.2f")

putexcel G12 =  matrix(cit[2,1]), nformat("##.#%")
putexcel H12 =  matrix(cit[2,2]), nformat("##.#%")

putexcel G13 =  matrix(cit[1,1]), nformat("##.#%")
putexcel H13 =  matrix(cit[1,2]), nformat("##.#%")

putexcel G14 =  matrix(cit[3,1]), nformat("##.#%")
putexcel H14 =  matrix(cit[3,2]), nformat("##.#%")

*/

***** ever lived with parents after 0 or not
tab livedwparafter24 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(lwp)
mata: st_matrix("lwp", (st_matrix("lwp") :/ rowsum(st_matrix("lwp"))))
matrix list lwp, format("%3.2f")

putexcel G13 =  matrix(lwp[1,1]), nformat("##.#%")
putexcel H13 =  matrix(lwp[1,2]), nformat("##.#%")
putexcel I13 = 	matrix(lwp[1,3]), nformat("##.#%")

putexcel G14 =  matrix(lwp[2,1]), nformat("##.#%")
putexcel H14 =  matrix(lwp[2,2]), nformat("##.#%")
putexcel I14 =  matrix(lwp[2,3]), nformat("##.#%")





*** Education

tab education2 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(edu)
mata: st_matrix("edu", (st_matrix("edu") :/ rowsum(st_matrix("edu"))))
matrix list edu, format("%3.2f")

putexcel G16 =  matrix(edu[1,1]), nformat("##.#%")
putexcel G17 =  matrix(edu[2,1]), nformat("##.#%")
putexcel G18 =  matrix(edu[3,1]), nformat("##.#%")
putexcel G19 =  matrix(edu[4,1]), nformat("##.#%")

putexcel H16 =  matrix(edu[1,2]), nformat("##.#%")
putexcel H17 =  matrix(edu[2,2]), nformat("##.#%")
putexcel H18 =  matrix(edu[3,2]), nformat("##.#%")
putexcel H19 =  matrix(edu[4,2]), nformat("##.#%")

putexcel I16 =  matrix(edu[1,3]), nformat("##.#%")
putexcel I17 =  matrix(edu[2,3]), nformat("##.#%")
putexcel I18 =  matrix(edu[3,3]), nformat("##.#%")
putexcel I19 =  matrix(edu[4,3]), nformat("##.#%")

/*
**** Marital Status at age 32
tab maritalstat32 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar)
mata: st_matrix("mar", (st_matrix("mar") :/ rowsum(st_matrix("mar"))))
matrix list mar, format("%3.2f")

putexcel G21 = matrix(mar[1,1]), nformat("##.#%")
putexcel H21 = matrix(mar[1,2]), nformat("##.#%")
putexcel I21 = matrix(mar[1,3]), nformat("##.#%")

putexcel G22 = matrix(mar[2,1]), nformat("##.#%")
putexcel H22 = matrix(mar[2,2]), nformat("##.#%")
putexcel I22 = matrix(mar[2,3]), nformat("##.#%")
*/

*** Childhood household
tab intact empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(fch)
mata: st_matrix("fch", (st_matrix("fch") :/ rowsum(st_matrix("fch"))))
matrix list fch, format("%3.2f")

putexcel G24 = matrix(fch[1,1]), nformat("##.#%")
putexcel G25 = matrix(fch[2,1]), nformat("##.#%")
putexcel G26 = matrix(fch[3,1]), nformat("##.#%")

putexcel H24 = matrix(fch[1,2]), nformat("##.#%")
putexcel H25 = matrix(fch[2,2]), nformat("##.#%")
putexcel H26 = matrix(fch[3,2]), nformat("##.#%")

putexcel I24 = matrix(fch[1,3]), nformat("##.#%")
putexcel I25 = matrix(fch[2,3]), nformat("##.#%")
putexcel I26 = matrix(fch[3,3]), nformat("##.#%")



*** Sibling size
/*sum nsibling if empstatusage32  == 1 
return list
putexcel G23 =  matrix(r(mean)), nformat("##.#")

sum nsibling if empstatusage32  == 0 
return list
putexcel H23 =  matrix(r(mean)), nformat("##.#")
*/
 
tabstat nsibling97 [aweight=SAMPLING_PANEL_WEIGHT_1997], by (empstatusage32) statistics(mean) columns(statistics) save
return list

putexcel G27 = matrix(r(Stat1)), nformat("##.#")
putexcel H27 = matrix(r(Stat2)), nformat("##.#")
putexcel I27 = matrix(r(Stat2)), nformat("##.#")


**** parental education

tab parenteduc2 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(paredu)
mata: st_matrix("paredu", (st_matrix("paredu") :/ rowsum(st_matrix("paredu"))))
matrix list paredu, format("%3.2f")

putexcel G30 =  matrix(paredu[1,1]), nformat("##.#%")
putexcel G31 =  matrix(paredu[2,1]), nformat("##.#%")
putexcel G32 =  matrix(paredu[3,1]), nformat("##.#%")

putexcel H30 =  matrix(paredu[1,2]), nformat("##.#%")
putexcel H31 =  matrix(paredu[2,2]), nformat("##.#%")
putexcel H32 =  matrix(paredu[3,2]), nformat("##.#%")

putexcel I30 =  matrix(paredu[1,3]), nformat("##.#%")
putexcel I31 =  matrix(paredu[2,3]), nformat("##.#%")
putexcel I32 =  matrix(paredu[3,3]), nformat("##.#%")


/*
***** children at the age 32
tab children32 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children)
mata: st_matrix("children", (st_matrix("children") :/ rowsum(st_matrix("children"))))
matrix list children, format("%3.2f")

putexcel G34 =  matrix(children[1,1]), nformat("##.#%")
putexcel G35 =  matrix(children[2,1]), nformat("##.#%")
putexcel G36 =  matrix(children[3,1]), nformat("##.#%")

putexcel H34 =  matrix(children[1,2]), nformat("##.#%")
putexcel H35 =  matrix(children[2,2]), nformat("##.#%")
putexcel H36 =  matrix(children[3,2]), nformat("##.#%")

putexcel I34 =  matrix(children[1,3]), nformat("##.#%")
putexcel I35 =  matrix(children[2,3]), nformat("##.#%")
putexcel I36 =  matrix(children[3,3]), nformat("##.#%")
*/


**** Marital Status at age 24
tab maritalstat24 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(mar24)
mata: st_matrix("mar24", (st_matrix("mar24") :/ rowsum(st_matrix("mar24"))))
matrix list mar24, format("%3.2f")

putexcel G38 = matrix(mar24[1,1]), nformat("##.#%")
putexcel H38 = matrix(mar24[1,2]), nformat("##.#%")
putexcel I38 = matrix(mar24[1,3]), nformat("##.#%")

putexcel G39 = matrix(mar24[2,1]), nformat("##.#%")
putexcel H39 = matrix(mar24[2,2]), nformat("##.#%")
putexcel I39 = matrix(mar24[2,3]), nformat("##.#%")


***** children at the age 24
tab children24_2 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(children24)
mata: st_matrix("children24", (st_matrix("children24") :/ rowsum(st_matrix("children24"))))
matrix list children24, format("%3.2f")

putexcel G41 =  matrix(children24[1,1]), nformat("##.#%")
putexcel H41 =  matrix(children24[1,2]), nformat("##.#%")
putexcel I41 =  matrix(children24[1,3]), nformat("##.#%")

putexcel G42 =  matrix(children24[2,1]), nformat("##.#%")
putexcel H42 =  matrix(children24[2,2]), nformat("##.#%")
putexcel I42 =  matrix(children24[2,3]), nformat("##.#%")


****** employment status at age 24
tab empstat24_2 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(emp24)
mata: st_matrix("emp24", (st_matrix("emp24") :/ rowsum(st_matrix("emp24"))))
matrix list emp24, format("%3.2f")

putexcel G45 = matrix(emp24[1,1]), nformat("##.#%")
putexcel H45 = matrix(emp24[1,2]), nformat("##.#%")
putexcel I45 = matrix(emp24[1,3]), nformat("##.#%")

putexcel G46 = matrix(emp24[2,1]), nformat("##.#%")
putexcel H46 = matrix(emp24[2,2]), nformat("##.#%")
putexcel I46 = matrix(emp24[2,3]), nformat("##.#%")


putexcel G47 = matrix(emp24[3,1]), nformat("##.#%")
putexcel H47 = matrix(emp24[3,2]), nformat("##.#%")
putexcel I47 = matrix(emp24[3,3]), nformat("##.#%")



**** living situation at 24
tab livingat24 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(liv24)

mata: st_matrix("liv24", (st_matrix("liv24") :/ rowsum(st_matrix("liv24"))))
matrix list liv24, format("%3.2f")

putexcel G49 = matrix(liv24[1,1]), nformat("##.#%")
putexcel H49 = matrix(liv24[1,2]), nformat("##.#%")
putexcel I49 = matrix(liv24[1,3]), nformat("##.#%")

putexcel G50 = matrix(liv24[2,1]), nformat("##.#%")
putexcel H50 = matrix(liv24[2,2]), nformat("##.#%")
putexcel I50 = matrix(liv24[2,3]), nformat("##.#%")

**** incarceration status
tab incarstat2 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(incar)
mata: st_matrix("incar", (st_matrix("incar") :/ rowsum(st_matrix("incar"))))
matrix list incar, format("%3.2f")

putexcel G52 = matrix(incar[1,1]), nformat("##.#%")
putexcel H52 = matrix(incar[1,2]), nformat("##.#%")
putexcel I52 = matrix(incar[1,3]), nformat("##.#%")

putexcel G53 = matrix(incar[2,1]), nformat("##.#%")
putexcel H53 = matrix(incar[2,2]), nformat("##.#%")
putexcel I53 = matrix(incar[2,3]), nformat("##.#%")

***** total time spent in urban until 24
tabstat totalurban [aweight=SAMPLING_PANEL_WEIGHT_1997], by (empstatusage32) statistics(mean) columns(statistics) save
return list

putexcel G55 = matrix(r(Stat1)), nformat("##.#")
putexcel H55 = matrix(r(Stat2)), nformat("##.#")
putexcel I55 = matrix(r(Stat3)), nformat("##.#")

***** total time spent in urban until 24
tabstat totalsouth [aweight=SAMPLING_PANEL_WEIGHT_1997], by (empstatusage32)  statistics(mean) columns(statistics) save
return list

putexcel G56 = matrix(r(Stat1)), nformat("##.#")
putexcel H56 = matrix(r(Stat2)), nformat("##.#")
putexcel I56 = matrix(r(Stat3)), nformat("##.#")




save "$temp/hitaNLSY_descriptive", replace 
log close



sort SEX
by SEX: tab livedwparafter24 empstatusage32[aweight=SAMPLING_PANEL_WEIGHT_1997], nofreq col







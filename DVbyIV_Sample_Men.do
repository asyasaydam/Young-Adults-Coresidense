********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive Analysis Men
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2022
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97-men-desconDVbyIV_`logdate'.log", t replace



use 	"$temp/mi_datacreated100imp", clear

*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_IVbyDV.xlsx", sheet("hitaP-men-DV-by-IV_update") replace

*************************
* Create Table Shell
*************************
putexcel A1:H1 = "Table 2. Distribution of Employment Outcomes of Young Adults by their Coresidence Duration", merge bold border(bottom) hcenter italic
putexcel B2:E2 = "Men (N=3915)", merge bold hcenter
// mean SD
putexcel A5 = "Parental Coresidence", border(bottom double)
putexcel A6 = "None", txtindent(1) 
putexcel A7 = "1 year", txtindent(1)
putexcel A8 = "2-3 years", txtindent(1)
putexcel A9 = "4-5 years", txtindent(1)
putexcel A10 = "6 years", txtindent(1)

putexcel B4 = "Not employed", border(bottom double)
putexcel C4 = "Employed, part-time", border(bottom double)
putexcel D4 = "Employed, full-time", border(bottom double)
putexcel E4 = "Occupational Standing", border(bottom double)




***** Outcome 1: Employment Status

tab livedwpar_cat3 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab) nofreq row m 
mata: st_matrix("stab", (st_matrix("stab"):/ rowsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel B6 =  matrix(stab[1,1]), nformat (number_d2)
putexcel B7 =  matrix(stab[2,1]), nformat (number_d2)
putexcel B8 =  matrix(stab[3,1]), nformat (number_d2)
putexcel B9 =  matrix(stab[4,1]), nformat (number_d2)
putexcel B10 =  matrix(stab[5,1]), nformat (number_d2)

putexcel C6 =  matrix(stab[1,2]), nformat (number_d2)
putexcel C7 =  matrix(stab[2,2]), nformat (number_d2)
putexcel C8 =  matrix(stab[3,2]), nformat (number_d2)
putexcel C9 =  matrix(stab[4,2]), nformat (number_d2)
putexcel C10 =  matrix(stab[5,2]), nformat (number_d2)

putexcel D6 =  matrix(stab[1,3]), nformat (number_d2)
putexcel D7 =  matrix(stab[2,3]), nformat (number_d2)
putexcel D8 =  matrix(stab[3,3]), nformat (number_d2)
putexcel D9 =  matrix(stab[4,3]), nformat (number_d2)
putexcel D10 =  matrix(stab[5,3]), nformat (number_d2)



***** Outcome 2: Occupational Standing
use "$temp/mi_datacreated100impOcc", clear
tabstat occprest_max [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat3) statistics(mean sd n) save
return list

putexcel E6 = matrix(r(Stat1)), nformat (number_d2)
putexcel E7 = matrix(r(Stat2)), nformat (number_d2)
putexcel E8 = matrix(r(Stat3)), nformat (number_d2)
putexcel E9 = matrix(r(Stat4)), nformat (number_d2)
putexcel E10 = matrix(r(Stat5)), nformat (number_d2)



oneway occprest_max empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], tabulate bonf
oneway occprest_max empstatge32 [aweight=SAMPLING_PANEL_WEIGHT_1997], tabulate bonf


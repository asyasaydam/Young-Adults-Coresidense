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
log 		using "$logdir/NLSY97-women-desconDVbyIV_`logdate'.log", t replace




use 	"$temp/beforeMI", clear

keep if 	SEX == 1


** chisquare test
tab livedwpar_cat empstatusage32, chi2
/*Pearson chi2(4) =   2.3592   Pr = 0.670*/


** ttest
ttest occeduc_max, by(livedwpar_bin)
/*Two-sample t test with equal variances
------------------------------------------------------------------------------
   Group |     Obs        Mean    Std. err.   Std. dev.   [95% conf. interval]
---------+--------------------------------------------------------------------
Never li |   1,925    .4511114    .0068487    .3004839    .4376798     .464543
Lived wi |   1,545    .4183495    .0074123    .2913497    .4038104    .4328887
---------+--------------------------------------------------------------------
Combined |   3,470    .4365244    .0050394    .2968563    .4266438    .4464049
---------+--------------------------------------------------------------------
    diff |            .0327619     .010126                .0129083    .0526155
------------------------------------------------------------------------------
    diff = mean(Never li) - mean(Lived wi)                        t =   3.2354
H0: diff = 0                                     Degrees of freedom =     3468

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.9994         Pr(|T| > |t|) = 0.0012          Pr(T > t) = 0.0006
*/

anova occeduc_max livedwpar_cat
                   /*  Number of obs =      3,470    R-squared     =  0.0034
                         Root MSE      =    .296439    Adj R-squared =  0.0028

                  Source | Partial SS         df         MS        F    Prob>F
             ------------+----------------------------------------------------
                   Model |  1.0351748          2    .5175874      5.89  0.0028
                         |
             livedwpar~t |  1.0351748          2    .5175874      5.89  0.0028
                         |
                Residual |  304.66582      3,467   .08787592  
             ------------+----------------------------------------------------
                   Total |    305.701      3,469   .08812367   */
				   
				   
				   





*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_DVbyIV.xlsx", sheet("hitaP-women-by-IV_update") modify

*************************
* Create Table Shell
*************************


putexcel A1:H1 = "Table 2. Distribution of Employment Outcomes of Young Adults by their Coresidence Duration", merge bold border(bottom) hcenter italic
putexcel B2:E2 = "Men (N=3,346)", merge bold hcenter
// mean SD
putexcel A5 = "Parental Coresidence", border(bottom double)
putexcel A6 = "None", txtindent(1) 
putexcel A7 = "1 year", txtindent(1)
putexcel A8 = "2-3 years", txtindent(1)
putexcel A9 = "4-9 years", txtindent(1)

putexcel B4 = "Not employed", border(bottom double)
putexcel C4 = "Employed, part-time", border(bottom double)
putexcel D4 = "Employed, full-time", border(bottom double)
putexcel E4 = "Occupational Standing", border(bottom double)




***** Outcome 1: Employment Status

tab livedwpar_cat12 empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab)
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel B6 =  matrix(stab[1,1]), nformat (number_d2)
putexcel B7 =  matrix(stab[2,1]), nformat (number_d2)
putexcel B8 =  matrix(stab[3,1]), nformat (number_d2)
putexcel B9 =  matrix(stab[4,1]), nformat (number_d2)

putexcel C6 =  matrix(stab[1,2]), nformat (number_d2)
putexcel C7 =  matrix(stab[2,2]), nformat (number_d2)
putexcel C8 =  matrix(stab[3,2]), nformat (number_d2)
putexcel C9 =  matrix(stab[4,2]), nformat (number_d2)

putexcel D6 =  matrix(stab[1,3]), nformat (number_d2)
putexcel D7 =  matrix(stab[2,3]), nformat (number_d2)
putexcel D8 =  matrix(stab[3,3]), nformat (number_d2)
putexcel D9 =  matrix(stab[4,3]), nformat (number_d2)




***** Outcome 2: Occupational Standing
tabstat occeduc_max [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat12) statistics(mean sd) save
return list

putexcel E6 = matrix(r(Stat1)), nformat (number_d2)
putexcel E8 = matrix(r(Stat2)), nformat (number_d2)
putexcel E10 = matrix(r(Stat3)), nformat (number_d2)
putexcel E12 = matrix(r(Stat4)), nformat (number_d2)



***** Weighted n
putexcel A10 = "Weighted n"

tab empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(n)
mata: st_matrix("n")
matrix list n, format("%9.2f")

putexcel B10 =  matrix(n[1,1]), nformat (number)
putexcel C10 =  matrix(n[2,1]), nformat (number)
putexcel D10 =  matrix(n[3,1]), nformat (number)










**** Alternative Parental Coresidence
putexcel A16 = "None", txtindent(1) 
putexcel A17 = "1-8 year", txtindent(1)
putexcel A18 = "9 years", txtindent(1)



***** Outcome 1: Employment Status
tab livedwpar_cat empstatusage32 [aweight=SAMPLING_PANEL_WEIGHT_1997], matcell(stab)
mata: st_matrix("stab", (st_matrix("stab"):/ colsum(st_matrix("stab"))))
matrix list stab, format("%3.2f")

putexcel B16 =  matrix(stab[1,1]), nformat (number_d2)
putexcel B17 =  matrix(stab[2,1]), nformat (number_d2)
putexcel B18 =  matrix(stab[3,1]), nformat (number_d2)

putexcel C16 =  matrix(stab[1,2]), nformat (number_d2)
putexcel C17 =  matrix(stab[2,2]), nformat (number_d2)
putexcel C18 =  matrix(stab[3,2]), nformat (number_d2)

putexcel D16 =  matrix(stab[1,3]), nformat (number_d2)
putexcel D17 =  matrix(stab[2,3]), nformat (number_d2)
putexcel D18 =  matrix(stab[3,3]), nformat (number_d2)





***** Outcome 2: Occupational Standing
tabstat occeduc_max [aweight=SAMPLING_PANEL_WEIGHT_1997], by (livedwpar_cat) statistics(mean sd) save
return list

putexcel E16 = matrix(r(Stat1)), nformat (number_d2)
putexcel E18 = matrix(r(Stat2)), nformat (number_d2)
putexcel E20 = matrix(r(Stat3)), nformat (number_d2)





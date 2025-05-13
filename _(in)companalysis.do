
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97compl_`logdate'.log", t replace


use "$temp/predropempstatoccprest", clear
drop if empstatusage32 == . 
gen total_duration = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29


/*gen completecase = 0
replace completecase = 1 if !missing(education_new, citizenship, hh_income97, parenteduc, aveagree, aveemost, aveopen, avecons, aveextra, genhlt24, asvabscore, incarstat, havedebt30, enrolled24, children24, children32, empstatusage24, unionstatus32, unionstatus24, livingat24, livingat25, livingat26, livingat27, livingat28, livingat29)
label define completecase 0 "incomplete sample" 1 "complete sample"
label values completecase completecase
*/

gen completecase = 0
replace completecase = 1 if !missing(total_duration)
label define completecase 0 "incomplete sample" 1 "complete sample"
label values completecase completecase



tab education_new completecase, nofreq col chi2
tab race completecase, nofreq col chi2
tab citizenship completecase, nof col chi2
tab parenteduc completecase, nof col chi2
tab qrt_hhincome97 completecase, nof col chi2
tab livingarrangement1997 completecase, nofr col chi2
ttest nsibling97, by(completecase) 
tab south completecase, nofreq col chi2
tabstat totalurban, by(completecase)
ttest totalurban, by(completecase)
tabstat sum_mh_2000, by(completecase)
ttest sum_mh_2000, by(completecase)
tab unionstatus24 completecase, nofr col chi2
tab children24 completecase, nofr col chi2
tab enrolled24 completecase, nofr col chi2
tab empstatusage24 completecase, nofr col chi2
tabstat genhlt24, by(completecase)
ttest genhlt24, by(completecase)
tabstat asvabscore, by(completecase)
ttest asvabscore, by(completecase)

tab incarstat completecase, nofr col chi2
tab unionstatus32 completecase, nofr col chi2
tab havedebt30 completecase, nofr col chi2
tab children32 completecase, nofr col chi2

tab empstatusage32 completecase, nofr col chi2 
tabstat occprest_max, by(completecase)
ttest occprest_max, by(completecase)


ttest sum_mh_2000, by(completecase)
oneway education_new completecase, tabulate bonferroni
oneway race completecase
oneway livingarrangement1997 completecase, tabulate bonferroni







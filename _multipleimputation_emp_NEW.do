********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Imputation for hhincome and citizenship
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97imputelog_`logdate'.log", t replace

* DV1: 						empstatusage32 ---> BINARY version: emp32_bin
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* MAIN Controls: 			SEX race citizenship education_new
* Family/background: 		nsibling97 parenteduc momeduc livingarrangement1997
*							ln_hhnetwrth97 incomesource97 ln_hhincome97 ln_debt20 ln_hhntwrthatage20
*							ave* (personality traits) 
*							sum_mh_2002 (psychological wellbeing) asvabscore (cognitive skills-1999)
*							genhlth97 
* Controls at age 24: 		enrolled24 maritalstat24 children24 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		incarstat empdur2431 maritalstat32 havedebt30 debt30
* weights:					SAMPLING_PANEL_WEIGHT_* 
** additional variables to use in multiple imputation: schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 parentguard97

// Before imputation you can test for MCAR, MAR or MNAR

use "$temp/predropempstatoccprest", clear


***** First impute for employment status ****
drop if empstatusage32 == . //
*drop if occprest_max == . // 
count


save "$temp/predropempstatoccprest-emp", replace


mdesc citizenship hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 children24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat24 incarstat32 children32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 //
	
keep SAMPLING_WEIGHT_CC_1997 SAMPLING_PANEL_WEIGHT_1997 ID BYEAR ///
	education_new race citizenship livingarrangement1997 ///
	parenteduc parenteduc_bi ///
	aveagree aveemost aveopen avecons aveextra genhlt24 sum_mh_2000 asvabscore ///
	schooltype97 enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 ///
	south totalurban nsibling97 ///
	enrolled24 empstatusage24 children24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat children32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 empstatge32 ///
	totaldurationinhh2429 education hh_income97 ///
	citizenship hh_income97  ///
	aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
	enrolled24 empstatusage24 childrenhh24 maritalstat24 unionstatus24 ///
	livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 ///
	havedebt30 incarstat24 incarstat32 childrenhh32 maritalstat32 unionstatus32 ///
	occeduc_max occprest_max empstatusage32 ///
	totaldurationinhh2429 ////

	replace education_new = 2 if education_new == . 

******* MI *******
	misstable sum citizenship hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore incarstat havedebt30 enrolled24 children24 children32 empstatusage24 unionstatus32 unionstatus24 livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 
	
	set maxiter 20
	mi set wide
	mi register imputed citizenship hh_income97 parenteduc aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore havedebt30 enrolled24 children24 children32 empstatusage24 unionstatus32 unionstatus24 livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 

	
mi impute chained ////
(truncreg, ll(1) ul(7)) aveagree aveemost aveopen avecons aveextra ///
(truncreg,  ll(1) ul(5)) genhlt24 ///
(truncreg,  ll(0) ul(100000)) asvabscore ///
(truncreg, ll(-48100) ul(246474)) hh_income97 ///
(logit) havedebt30 enrolled24 ///
livingat24 livingat25 livingat26 livingat27 livingat28 livingat29 citizenship ///
(mlogit) parenteduc empstatusage24 unionstatus32 unionstatus24 children24 children32 = ///
BYEAR education_new empstatusage32 livingarrangement1997 incarstat24 incarstat32 race south totalurban enrolled97 hhsize97 genhlth97 dwelling97 incomesource97 schooltype97 sum_mh_2000, add(100) rseed(1234) noisily augment 

	save "$temp/mi_empstat_100.dta", replace
	
***********************************************
******* Create duration variables *************
***********************************************
// For 10 data set
	
forvalues x= 24/29 {
	egen avg_livingat`x' = rowmean(_1_livingat`x' - _100_livingat`x')
	gen livingat_`x' = round(avg_livingat`x')

}
	gen total_duration2 = livingat_24 + livingat_25 + livingat_26 + livingat_27 + livingat_28 + livingat_29
	drop totaldurationinhh2429
	rename total_duration2 totaldurationinhh2429

*** categorization of the variable following a reviewer again ***
	mi passive: gen 	livedwpar_cat4 = .
	mi passive: replace livedwpar_cat4 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat4 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat4 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat4 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5
	mi passive: replace livedwpar_cat4 = 4 if totaldurationinhh2429 == 6
	label 	define livedwpar_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-5 years" 4 "6 years"
	label 	val livedwpar_cat4 livedwpar_cat4
	
*** categorization of the variable following a reviewer again - after R&R ***
	mi passive: gen 	livedwpar_cat3 = .
	mi passive: replace livedwpar_cat3 = 0 if totaldurationinhh2429 == 0
	mi passive: replace livedwpar_cat3 = 1 if totaldurationinhh2429 == 1
	mi passive: replace livedwpar_cat3 = 2 if totaldurationinhh2429 == 2 | totaldurationinhh2429 == 3 
	mi passive: replace livedwpar_cat3 = 3 if totaldurationinhh2429 == 4 | totaldurationinhh2429 == 5 | totaldurationinhh2429 == 6
	label 	define livedwpar_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years" 
	label 	val livedwpar_cat3 livedwpar_cat3
	
*drop qrt_hhincome97
	mi passive: egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	mi passive: egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	mi estimate: proportion livedwpar_cat4


	save "$temp/mi_datacreated100imp_alt2", replace
	
	
	
	
	
********************************************************************************
********************************************************************************	
********************************************************************************
************ Using 4 categorization to address the reviewers *******************
********************************************************************************
********************************************************************************
********************************************************************************		

global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30
	
******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr 

		
******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr
		*mimrgns livedwpar_cat4, cmdmargins predict(outcome(2))
		*marginsplot , graphregion(color(white)) name(g3, replace) noci recast(bar) plot1opts(lcolor(gs8)) ciopt(color(black%20)) title("Predicted probability of full time employment, by parental coresidence duration") xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
		
		
		/*mimrgns using miestfile , dydx(*) predict(outcome(2))
		mimrgns i.livedwpar_cat4, predict(outcome(2)) vce(unconditional) pwcompare cmdmargins 
		mimrgns i.livedwpar_cat4, predict(empstatusage32(2))  post
		marginsplot,noci recast(bar)
		marginsplot empstatusage32, recast(bar) over(livedwpar_cat4) yline(0.5) title("Predicted Probabilities by Employment Status")
		mi estimate, saving(miest, replace):mlogit empstatusage32 i.livedwpar_cat4 $mod2 i.incarstat24  [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr*/
		
		
******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr


******* Resultsvc		
esttab using "$results/100impEmpStat_newcat3_12424.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
    


	
tab empstatusage32 livedwpar_cat3, chi2 col
*oneway empstatusage32 livedwpar_cat3_old, tabulate bonferroni 

oneway occprest_max livedwpar_cat3, tabulate bonferroni

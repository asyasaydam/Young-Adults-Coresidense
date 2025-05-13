********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive Analysis Men - Complete CASE 
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2023
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97menAnalysis_`logdate'.log", t replace

use 	"$temp/predropempstatoccprest", clear

count
drop if empstatusage32 == . 



		
	gen total_duration2 = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
	gen 	livhhcc_cat4 = .
	replace livhhcc_cat4 = 0 if total_duration2 == 0
	replace livhhcc_cat4 = 1 if total_duration2 == 1
	replace livhhcc_cat4 = 2 if total_duration2 == 2 | total_duration2 == 3 
	replace livhhcc_cat4 = 3 if total_duration2 == 4 | total_duration2 == 5 | total_duration2 == 6 

	
	label 	define livhhcc_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livhhcc_cat4 livhhcc_cat4
	rename 	livhhcc_cat4 livedwpar_cat4
	
	
	egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	mdesc education_new citizenship  ///
		parenteduc qrt_hhincome97 med_hhincome97  ///
		aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
		enrolled24 empstatusage24 children24 children32 ///
		havedebt30 incarstat unionstatus24 unionstatus32 ///
		livedwpar_cat4 //

		
	// I deleted them each time looking at the left that is missing
	
	drop if livedwpar_cat4 == .
	drop if asvabscore == .
	drop if qrt_hhincome97 == .
	drop if havedebt30 == .
	drop if parenteduc == . 
	drop if aveagree == .
	drop if enrolled24 == .
	drop if empstatusage24 == .
	drop if children32 == .
	drop if	unionstatus32 == .
	drop if incarstat == .
	drop if genhlt24 == .

	
	
	count
	*1279
	save "$temp/completecase", replace
	
	
		
*** Outcome 1: Employment Statuse
*** IV: 4 categories

		
global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30

		******* Model 1 Bivariate ******
		eststo: mlogit empstatusage32 i.livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) 
			
	******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mlogit empstatusage32 i.livedwpar_cat4 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) 

	******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mlogit empstatusage32 i.livedwpar_cat4 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) 
	

		esttab using "$results/completecase_11824.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
		
		eststo clear
		
		
		
		
		
	
*** Outcome 2: Occupational Standing

use 	"$temp/predropempstatoccprest", clear

count
drop if occprest_max == . 

*** categorization of the 24-29 variable complete case ***
	gen total_duration2 = livingat24 + livingat25 + livingat26 + livingat27 + livingat28 + livingat29
	/*gen 	livhhcc_cat3 = .
	replace livhhcc_cat3 = 0 if total_duration2 == 0
	replace livhhcc_cat3 = 1 if total_duration2 == 1
	replace livhhcc_cat3 = 2 if total_duration2 == 2 | total_duration2 == 3 
	replace livhhcc_cat3 = 3 if total_duration2 == 4 | total_duration2 == 5 | total_duration2 == 6 
	label 	define livhhcc_cat3 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livhhcc_cat3 livhhcc_cat3
	rename 	livhhcc_cat3 livedwpar_cat3 */
	
	gen 	livhhcc_cat4 = .
	replace livhhcc_cat4 = 0 if total_duration2 == 0
	replace livhhcc_cat4 = 1 if total_duration2 == 1
	replace livhhcc_cat4 = 2 if total_duration2 == 2 | total_duration2 == 3 
	replace livhhcc_cat4 = 3 if total_duration2 == 4 | total_duration2 == 5 | total_duration2 == 6 

	
	label 	define livhhcc_cat4 0 "None" 1 "1 year" 2 "2-3 years" 3 "4-6 years"
	label 	val livhhcc_cat4 livhhcc_cat4
	rename 	livhhcc_cat4 livedwpar_cat4
	
	
	egen qrt_hhincome97 = cut(hh_income97), group(4)
	label 		define qrt_hhincome97 0 "1st quartile" 1 "2nd quartile" 2 "3rd quartile" 3 "4th quartile"
	label 		values qrt_hhincome97 qrt_hhincome97
	
	egen med_hhincome97 = cut(hh_income97), group(2)
	label 		define med_hhincome97 0 "Low income" 1 "High income" 
	label 		values med_hhincome97 med_hhincome97

	mdesc education_new citizenship  ///
		parenteduc qrt_hhincome97 med_hhincome97  ///
		aveagree aveemost aveopen avecons aveextra genhlt24 asvabscore ///
		enrolled24 empstatusage24 children24 children32 ///
		havedebt30 incarstat unionstatus24 unionstatus32 ///
		livedwpar_cat4 //
		
		// I deleted them each time looking at the left that is missing
	
	drop if livedwpar_cat4 == .
	drop if asvabscore == .
	drop if qrt_hhincome97 == .
	drop if havedebt30 == .
	drop if parenteduc == . 
	drop if aveagree == .
	drop if enrolled24 == .	
	drop if empstatusage24 == .
	drop if children32 == .	
	drop if genhlt24 == .
	drop if incarstat == .

	count
	*1245

global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30

		******* Model 1 Bivariate ******
		eststo: reg occprest_max i.livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: reg occprest_max i.livedwpar_cat4 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: reg occprest_max i.livedwpar_cat4 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	
		esttab using "$results/completecaseOCC.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
		
		eststo clear
		log close
		
		
		
******************************************************************************** 
******************************************************************************** 		
************************** Standard coeff **************************************
******************************************************************************** 	
******************************************************************************** 		

*** Outcome 2: Occupational Standing wtih alternative variable
egen occprest_max_stdn = std(occprest_max)
		******* Model 1 Bivariate ******
		**** standardized version of occupational prestige 	


global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30

		******* Model 1 Bivariate ******
		eststo: reg occprest_max_stdn i.livedwpar_cat4 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: reg occprest_max_stdn i.livedwpar_cat4 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: reg occprest_max_stdn i.livedwpar_cat4 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	
		esttab using "$results/completecaseOCC_stdn_nost.rtf", b(2) nostar nonotes label varlabels(_cons Constant R1205500 SiblingSize) replace 
		
		
		eststo clear
	
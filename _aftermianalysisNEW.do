********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Analyses with multiple imp on IV items - employment stat
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2023
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/100impEmpparedu_`logdate'.log", t replace
ssc install outreg2

use "$temp/mi_datacreated100imp", clear
eststo clear
** Averaged variable:

******* chi2 analysis with employment status and parental coresidence duration ******

tab empstatusage32 livedwpar_cat3, chi2 col
*oneway empstatusage32 livedwpar_cat3_old, tabulate bonferroni 

oneway occprest_max livedwpar_cat3, tabulate bonferroni

********************************************************************************
********************************************************************************
***************************** Final Analysis ***********************************
********************************************************************************
********************************************************************************
********************************************************************************


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
esttab using "$results/100impEmpStat_newcat3_11824.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
    
log close

********************************************************************************
********************************************************************************	
********************************************************************************
************ Using 4 categorization without debt to address the reviewers *******************
********************************************************************************
********************************************************************************
********************************************************************************		
		
/*global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30

******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr 

******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 $mod2 i.incarstat24  [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr

		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) level(90) rrr
		
******* Resultsvc		
esttab using "$results/100impEmpStat_woutdebt.rtf", ar2(%3.2f) sca(F) se r2 legend level(90) label varlabels(_cons Constant R1205500 SiblingSize) replace, star(* 0.01 ** 0.05 *)*/
		

		
		
		/*
		*********************************************
		***** Parental Income Stratification *****
		*********************************************
	
		** Bivariate interaction with different lived with parents categories
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // the coefficient for  Some#College or more and All#College or more  is insignifcant. 
		*mi estimate: mlogit empstatusage32 i.livedwpar_cat4##i.momeduCol_bi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // the coeffs for these are also insignificant  1 year#College or more, 2-3 years#College or more,  4-6 years#College or more
		
		
		******* Model 2 Background Characteristics ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997  c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // interaction terms are insignificant 
		
			******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997  c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		
		esttab using "$results/EmpStatParIncmod_10_29.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)	
		
		log close
		*/
		
/*
*************************** Model 1 Bivariate **********************************
********************************************************************************
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_old [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
*************  Model 2 Background Characteristics + Statuses at 24 *************
********************************************************************************

		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_old i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)


****** Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
********************************************************************************		

		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_old i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	

		esttab using "$results/100impEmpStat_newcat3.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)

		
		
		
** Non-averaged variable: 
******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		
	******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

	******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	

		esttab using "$results/100impEmpStat_newcat3.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)


		
		*** Using only non imputed hh roster to address ***
		
		* livedwpar_cat3_comp

	******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_comp [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
			
	******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_comp i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

	******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3_comp i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		esttab using "$results/100impEmpStat_compcase.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)



********************************************************************************
********************************************************************************	
********************************************************************************
************************ livedwpar_cat4_comp ***********************************
********************************************************************************
********************************************************************************
********************************************************************************

	
******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4_comp [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
			
******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4_comp i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4_comp i.race i.education_new i.qrt_hhincome97 i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		esttab using "$results/100impEmpStat_compcaseCat4.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)

		*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		
******************************************************************************** 		
******************************************************************************** 		
******************************************************************************** 
******************************************************************************** 		
************************** Occupational prestige *******************************
******************************************************************************** 	
******************************************************************************** 		
******************************************************************************** 		
******************************************************************************** 
******************************************************************************** 



log 		using "$logdir/100impOccprestwthStand_`logdate'.log", t replace
ssc install outreg2

use "$temp/mi_datacreated100impOcc", clear
eststo clear
******* ttest analysis with occ prest and parental coresidence duration ******
oneway occprest_max livedwpar_cat3, tabulate bonferroni



**** standardized version of occupational prestige 
egen occprest_max_std = std(occprest_max)

sum occprest_max
return list
local a = r(mean) 
local b = r(sd) 

/*check:*/ 
di `a'
di `b'
gen std_occprest_max = (occprest_max - r(mean) )/r(sd)


******************************************************************************** 
******************************************************************************** 		
************************** Occupational prestige *******************************
******************************************************************************** 	
******************************************************************************** 		
*********************************************************

		
global mod2 i.race i.citizenship i.education_new i.qrt_hhincome97 i.parenteduc i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 

global mod3 i.unionstatus32 i.children32 i.havedebt30

*global mod4  i.unionstatus32 i.children32

		******* Model 1 Bivariate ******
		eststo: mi estimate, post: reg occprest_max i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		
		******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: reg occprest_max i.livedwpar_cat3 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		*mimrgns i.livedwpar_cat4
		*marginsplot, noci
		mimrgns livedwpar_cat3, cmdmargins
		marginsplot , graphregion(color(white)) name(Occmodel2, replace) noci recast(bar) plot1opts(lcolor(dkblue)) ciopt(color(dkorange%40)) xtitle("Parental Coresidence Duration") ytitle("Predicted occupational standing scores")
		
		
		
		******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: reg occprest_max i.livedwpar_cat3 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		mimrgns livedwpar_cat3, cmdmargins
		marginsplot , graphregion(color(white)) name(Occmodel3, replace) noci recast(bar) plot1opts(lcolor(dkblue)) ciopt(color(dkorange%40)) xtitle("Parental Coresidence Duration") ytitle("Predicted occupational standing scores")

		esttab using "$results/100impOCC_woutdebt.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
		eststo clear
		



******************************************************************************** 
******************************************************************************** 		
************************** Standard coeff **************************************
******************************************************************************** 	
******************************************************************************** 		
*********************************************************

*** Outcome 2: Occupational Standing wtih alternative variable
egen occprest_max_stdn = std(occprest_max)
		******* Model 1 Bivariate ******
		**** standardized version of occupational prestige 


		eststo: mi estimate, post: reg occprest_max_stdn i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: reg occprest_max_stdn i.livedwpar_cat3 $mod2 i.incarstat24 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: reg occprest_max_stdn i.livedwpar_cat3 $mod2 $mod3 i.incarstat32 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	
		esttab using "$results/100impOCC_stdFin_81123.rtf", star(+ 0.1 * 0.05 ** 0.01 *** 0.001) b(2) t(2) label varlabels(_cons Constant R1205500 SiblingSize) replace sca(F) se legend level(90) 
		
log close
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		

		

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/moderationanalysis_`logdate'.log", t replace
ssc install outreg2

use "$temp/mi_datacreated100imp", clear

		*********************************************
		***** Parental Income Stratification *****
		*********************************************
	
		** Bivariate interaction with different lived with parents categories
		eststo: mi estimate: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) 

		******* Model 2 Background Characteristics ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997  c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) 
		
		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997  c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		

		
		*********************************************
		***** Parental Income Stratification *****
		*********************************************
use "$temp/mi_datacreated100impOcc", clear		
		** Occupational 
		
		******* Model 1 Bivariate ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4##i.med_hhincome97 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 2 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
	
		
		******* Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: glm occprest_max i.livedwpar_cat4##i.med_hhincome97 i.race i.citizenship i.education_new i.livingarrangement1997 c.nsibling97 i.enrolled24 i.empstatusage24 i.unionstatus24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.unionstatus32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
			
		esttab using "$results/ModAnalysis.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)	
		
		
		log close	
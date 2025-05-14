********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Analyses after multiple imputation
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2022
********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97MIanalysis_`logdate'.log", t replace
ssc install outreg2


use 	"$temp/mi_datacreated", clear
	
************************************
************* ANALYSES *************
************************************

*keep BYEAR SAMPLING* occeduc_max empstatusage32 empstatusage33 empstatusage34 totaldurationinhh2429 livedwpar_cat livedwpar_cat2 livedwpar_cat3 livedwpar_bin livingat* SEX race citizenship education* maritalstat24 maritalstat32 children32 children24 totalurban totalsouth nsibling97 parenteduc momeduc livingarrangement1997 hhincome97 incarstat ave* sum_mh_2000 sum_mh_2002 dwelling97 schooltype97 genhlth97 asvabscore south havedebt30 enrolled24 empdur1523 empstatusage24 
 

*** Chisquare test
tab livedwpar_cat3 empstatusage32, chi2
// there is significant difference across groups


*Two-sample t test with equal variances		  
ttest occeduc_max, by(livedwpar_bin)
// significant difference between those who never lived and those who lived, those who never lived have a higher occupational score

* Anova
anova occeduc_max livedwpar_cat


**** I will try 3 different things, one of them will be using propenstiy score weight, next one will be normal weight, next one will be no weight. Let me try these all with one model, bivarite, and see the differences. 
****** Using psweight as model analysis

*** Outcome 1: Employment Status
	// Employment Status with categorical duration
	
	** Bivariate
		mlogit empstatusage32 i.livedwpar_cat3, vce(robust) base(0)
		** with weight
		mlogit empstatusage32 i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		** Result: adding weights doesn't change anything. 
	
	
	** Background characteristics *** without the employment related variables
		mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000, vce(robust) base(0)
		
		*** with weight
		mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	
	** Result: adding weights doesn't change anything
	
	** Now I want to run the models with imputed personal characteristics etc. so that I keep the sample size similar
	
		use 	"$temp/mi_datacreated", clear
		
		
		******* Model 1 Bivariate ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		
		******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

	
		******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.maritalstat32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	
	
		esttab using "$results/NLSY2432allsample4modelsimputed33023.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)
	
		** Marginsplot
		** Model 2
		mi estimate: quietly mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		mimrgns livedwpar_cat3, cmdmargins predict(outcome(2))
		marginsplot , graphregion(color(white)) name(g3, replace) noci recast(bar) plot1opts(lcolor(gs8)) ciopt(color(black%20)) title("Predicted probability of full time employment, by parental coresidence duration") xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
		
		mimrgns livedwpar_cat3, cmdmargins predict(outcome(0))
		marginsplot , graphregion(color(white)) name(g4, replace) noci recast(bar) plot1opts(lcolor(gs8)) ciopt(color(black%20)) title("Predicted probability of full time employment, by parental coresidence duration") xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
	
		
		
		** Model 3 Background Characteristics + Statuses at 24 + Statuses all ******
		mi estimate: quietly mlogit empstatusage32 i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.maritalstat32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	
		mimrgns livedwpar_cat3, cmdmargins predict(outcome(2))
		marginsplot , graphregion(color(white)) name(g5, replace) noci recast(bar) plot1opts(lcolor(dknavy)) ciopt(color(dkorange%20))  xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
	
		mimrgns livedwpar_cat3, cmdmargins predict(outcome(0))
		marginsplot , graphregion(color(white)) name(g6, replace) recast(bar) plot1opts(lcolor(dknavy)) ciopt(color(dkorange%20)) title("Predicted probability of full time employment, by parental coresidence duration") xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
	
		mimrgns livedwpar_cat3, cmdmargins predict(outcome(1))
		marginsplot , graphregion(color(white)) name(g7, replace) noci recast(bar) plot1opts(lcolor(dknavy)) ciopt(color(dkorange%20)) title("Predicted probability of full time employment, by parental coresidence duration") xtitle("Parental Coresidence Duration") ytitle("Predicted probability of full time employment") 
	
		

	

*** Outcome 2: Occupational Standing

		******* Model 1 Bivariate ******
		eststo: quietly mi estimate, post: glm occeduc_max i.livedwpar_cat3 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 	
		
		******* Model 3 Background Characteristics + Statuses at 24 ******
		eststo: quietly mi estimate, post: glm occeduc_max i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
		
		******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: quietly mi estimate, post: glm occeduc_max i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.maritalstat32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	
		esttab using "$results/NLSY2432allsample4modelsOCC33023.rtf", ar2(%6.5f) sca(F) se r legend label varlabels(_cons Constant)
	

	** Marginsplot
	
		mi estimate: quietly glm occeduc_max i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	mimrgns livedwpar_cat3, cmdmargins
		marginsplot , graphregion(color(white)) name(g7, replace) noci recast(bar) plot1opts(lcolor(dkblue)) ciopt(color(dkorange%40)) xtitle("Parental Coresidence Duration") ytitle("Predicted occupational standing scores")
		
		
		
	mi estimate: quietly glm occeduc_max i.livedwpar_cat3 i.race i.education_new i.momeduc i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.maritalstat32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
	mimrgns livedwpar_cat3, cmdmargins
		marginsplot , graphregion(color(white)) name(g8, replace) noci recast(bar) plot1opts(lcolor(dkblue)) ciopt(color(dkorange%40)) xtitle("Parental Coresidence Duration") ytitle("Predicted probability of occupational standing")
	
	
	

		*********************************************
		***** Parental Education Stratification *****
		*********************************************
		
		** Bivariate interaction with different lived with parents categories
		mi estimate: mlogit empstatusage32 i.livedwpar_cat##i.momeduCol_bi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // the coefficient for  Some#College or more and All#College or more  is insignifcant. 
		mi estimate: mlogit empstatusage32 i.livedwpar_cat3##i.momeduCol_bi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // the coeffs for these are also insignificant  1 year#College or more, 2-3 years#College or more,  4-6 years#College or more
		
		
		******* Model 2 Background Characteristics ******
		eststo: mi estimate, post: mlogit empstatusage32 i.livedwpar_cat3##i.momeduCol_bi i.race i.education_new i.livingarrangement1997 i.citizenship c.nsibling97 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.sum_mh_2000 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0) // interaction terms are insignificant 
		
		
		
		*********************************************
		** Occupational 
		*********************************************

		******* Model 1 Bivariate ******
		eststo: mi estimate, post: glm occeduc_max i.livedwpar_cat3##i.momeduCol_bi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) // main effect become more negative for 2-3 year, but interaction terms are signficant. 
		
		
		
		******* Model 4 Background Characteristics + Statuses at 24 + Statuses all ******
		eststo: mi estimate, post: glm occeduc_max i.livedwpar_cat3##i.momeduCol_bi i.race i.education_new i.livingarrangement1997 i.citizenship c.nsibling97 i.enrolled24 i.empstatusage24 i.maritalstat24 i.children24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen c.asvabscore c.genhlt24 c.sum_mh_2000 i.maritalstat32 i.children32 i.havedebt30 i.incarstat [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)  // all interaction terms insignifcant
	
			



































*** Outcome 1: Employment Status

	// Employment Status with categorical duration
	
	
	** Bivariate
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

	
	** Background characteristics
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12 i.race i.education_new i.momeduc i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
	
	** All 
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12 i.race i.education_new i.momeduc i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)



*** Outcome 2: Occupational Standing

	** Bivariate
		mi estimate: glm occeduc_max i.livedwpar_cat12 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	
	** Background characteristics
		mi estimate: glm occeduc_max i.livedwpar_cat12 i.race i.education_new i.momeduc i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	
	** All 
		mi estimate: glm occeduc_max i.livedwpar_cat12 i.race i.education_new i.momeduc i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 



*** Moderation Analysis

		** Bivariate interaction
		eststo: mi estimate, post: mi estimate mlogit empstatusage32 i.livedwpar_cat12##i.momeduc [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		
		** No interaction term is significant belwo 0.05 level
		** Negative coef: 4-9 years of coresidence with a high school mom is under 0.10 which is not significant
		** Negative coef: 4-9 years of coresidence with a college degree mom is under 0.10 which is not significant
		ereturn list // shows all values that are being stored with the regression

			
			
	** Background characteristics
		mi estimate mlogit empstatusage32 i.livedwpar_cat12##i.momeduc i.race i.education_new i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		
		
		/*outreg2 r1 using interaction.doc, replace /// file name and option "overwrite"
		nocons noobs /// do not report constant and number of observations
		dec(2) /// decimal places
		alpha(0.001, 0.01, 0.05, 0.1) symbol(***, **, *, +) /// statistical significance symbols
		label ctitle(Model 1) /// column title
		title(Moderation Analysis Results) /// table title
		addnote(Notes: n = `e(N)') // add number of observations below table*/
	
		
	** All 
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12##i.momeduc i.race i.education_new i.livingarrangement1997 c.nsibling97 i.enrolled24 c.empdur1523 i.maritalstat24 i.children24 i.empstatusage24 c.totalurban i.south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen i.incarstat c.empdur2531_fulltime i.maritalstat32 i.children32 i.havedebt30 [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		
		
		

		** Alternative mother education- with high school and more and less than high school
		mi passive: generate momeducbi = .
		mi passive: replace momeducbi = 0 if momeduc == 0
		mi passive: replace momeducbi = 1 if momeduc >0
		
		
		** Alternative mother education- with some college and more and less than some college
		mi passive: generate momeducbisocol = .
		mi passive: replace momeducbisocol = 0 if momeduc <2
		mi passive: replace momeducbisocol = 1 if momeduc >= 2
		
		** Alternative mother education - with college and more and the rest
		mi passive: generate momeducbicol = .
		mi passive: replace momeducbicol = 0 if momeduc < 3
		mi passive: replace momeducbicol = 1 if momeduc == 3
		
		
		** Bivariate interaction - with high school and more and less than high school
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		** Bivariate interaction - with high school and more and less than high school
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12##i.momeducbisocol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		mi estimate: mlogit empstatusage32 i.livedwpar_cat##i.momeducbisocol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		
		** Bivariate interaction
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		** no interaction
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12 i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		mi estimate: mlogit empstatusage32 i.livedwpar_cat12 i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
		** Bivariate interaction with different lived with parents categories
		mi estimate: mlogit empstatusage32 i.livedwpar_cat##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		mi estimate: mlogit empstatusage32 i.livedwpar_cat##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		
	
		** Bivariate interaction with different livedwpar_binary
		mi estimate: mlogit empstatusage32 i.livedwpar_bin##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)
		mi estimate: mlogit empstatusage32 i.livedwpar_bin##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) base(0)

		
		*eststo: mi estimate, post: mi estimate: mlogit empstatusage32 i.livedwpar_cat12##i.momeduc if _mi_m==0

		*esttab, ar2(%6.5f) sca(F) p r
		*esttab using interaction_.rtf, ar2(%6.5f) sca(F) p r
		*eststo clear
	
	
	
	** Occupational moderation
	mi estimate: glm occeduc_max  i.livedwpar_bin##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_bin##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_cat##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_cat##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_bin##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_cat12##i.momeducbi [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_cat12##i.momeducbicol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust)
	mi estimate: glm occeduc_max  i.livedwpar_cat12##i.momeducbicol i.momeducbi[pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) //Adding a dummy
	mi estimate: glm occeduc_max i.livedwpar_cat12##i.momeducbisocol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	mi estimate: glm occeduc_max i.livedwpar_cat##i.momeducbisocol [pweight=SAMPLING_PANEL_WEIGHT_1997], vce(robust) 
	
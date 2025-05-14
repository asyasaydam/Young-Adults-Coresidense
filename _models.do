********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Analysis
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97model_`logdate'.log", t replace


**** Variables ****
* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat
* Controls: 				SEX race citizenship education2 education_new 
* Family/background: 		nsibling97 parenteduc2 intact ln_hhincome97 ln_hhnetwrth97 	incarstat ave* (personality traits) momeduc2
* Controls at age 24: 		enrolled24 maritalstat24 children24 employedat24 totalurban totalsouth


*opening final data
use "$temp/NLSY97_Final_sample_with_meanimpu", clear


mdesc livedwpar_cat empstatusage32 totaldurationinhh2432 livedwparafter24 livingat24 SEX race education2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth nsibling97 parenteduc2 intact incarstat2 SAMPLING_PANEL_WEIGHT_1997

*keep empstatusage32 totaldurationinhh2432 livedwparafter24 livingat24 SEX race education2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth nsibling97 parenteduc2 intact incarstat2 SAMPLING_PANEL_WEIGHT_1997 

******************** Models with Continuous Total Duration *********************
********************************************************************************

// Model 1: Bivariate

eststo: quietly mlogit empstatusage32 c.totaldurationinhh2432 [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 

// Model 2: Background Controls
eststo: quietly mlogit empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 


// Model 3: Full Model
eststo: quietly mlogit empstatusage32 c.totaldurationinhh2432 i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr

// Model 3: Interaction Model
eststo: quietly mlogit empstatusage32 c.totaldurationinhh2432##i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr

*esttab, ar2(%6.5f) sca(F) p r
esttab using "$results/NLSY32.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

*esttab using "$temp/HITA4modelsz.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC)) nobaselevels 




************************* Models with Categorical Duration *********************
********************************************************************************
// Model 1: Bivariate

eststo: quietly mlogit empstatusage32 i.livedwpar_cat [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 


// Model 2: Background Controls
eststo: quietly mlogit empstatusage32 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 


// Model 3: Full Model
eststo: quietly mlogit empstatusage32 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr

// Model 3: Interaction Model
eststo: quietly mlogit empstatusage32 i.livedwpar_cat##i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr

*esttab, ar2(%6.5f) sca(F) p r
esttab using "$results/NLSYcategorical.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)



************ Models with Both Categorical and Continuous Duration **************
********************************************************************************
// Model 1: Bivariate

mlogit empstatusage32 c.totaldurationinhh2432 i.livedwpar_cat [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 
outreg2 using model.xls, replace ctitle(model 1) alpha (0.001, 0.01, 0.05)


// Model 2: Background Controls
mlogit empstatusage32 c.totaldurationinhh2432 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 
outreg2 using model.xls, append ctitle(model 2) alpha (0.001, 0.01, 0.05)


// Model 3: Full Model
mlogit empstatusage32 c.totaldurationinhh2432 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr 
outreg2 using model.xls, append ctitle(model 3) alpha (0.001, 0.01, 0.05)

// Model 4: Interaction Model
eststo: quietly mlogit empstatusage32 i.livedwpar_cat##i.SEX c.totaldurationinhh2432 i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], baseoutcome(0) rrr
outreg2 using model.xls, append ctitle(model 4) alpha (0.001, 0.01, 0.05)

*esttab, label nobaselevels interaction("*") p(4) ar2 nostar wide eform nonumbers mtitles("Model 1" "Model 2" "Model 3" "Model 4") replace
eststo clear



/// Effects of the background characteristics on total duration in parental household

glm totaldurationinhh2432 i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997], eform





******************** Models with Occupational Education ************************
********************************************************************************

/// MEAN occupational eduation

*replace occeduc_max = 0 if occeduc_max == .
*replace occeduc_mean = 0 if occeduc_mean == .


// Model 3: Full Model
eststo: quietly glm occeduc_mean c.totaldurationinhh2432 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 


/// Max occupational eduation

// Model 3: Full Model
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.livedwpar_cat i.SEX i.race i.education2 c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 


esttab using "$results/NLSY32_occeduc.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)


************* Models with Interaction Term with respondent education **********
*******************************************************************************
/// add interaction terms of duration in parental home with R's educational attainment 

// with both duration IVs and interaction of categorized IV and education
// Model 3: Full Model
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.livedwpar_cat##i.education2 i.SEX i.race c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 


// with both duration IVs and interaction of continuous IV and education
// Model 3: Full Model
eststo: quietly glm occeduc_max c.totaldurationinhh2432##i.education2 i.livedwpar_cat i.SEX i.race c.nsibling97 i.parenteduc2 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 

************* Models with Interaction Term with parental education **********
*******************************************************************************

// with both duration IVs and interaction of categorized IV and parental education
// Model 3: Full Model
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.livedwpar_cat##i.parenteduc2 i.education2 i.SEX i.race c.nsibling97 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 


// with both duration IVs and interaction of continuous IV and parental education
// Model 3: Full Model
eststo: quietly glm occeduc_max c.totaldurationinhh2432##i.parenteduc2 i.education2 i.livedwpar_cat i.SEX i.race c.nsibling97 i.intact i.incarstat2 i.children24_2 i.maritalstat24 i.empstat24_2 c.totalurban c.totalsouth [pweight=SAMPLING_PANEL_WEIGHT_1997] 

esttab using "$results/NLSY32_occeduc.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)






// Some analysis


recode empstatusage32 1/2=1, gen(two_empstat32)
ttest totalsouth, by(two_empstat32)

tabstat totalurban, by(two_empstat32)
ttest totalurban, by(two_empstat32)








/*
// Model 1: Bivariate
eststo: mlogit empstatge33 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_1997] // bivariate that is employment stability at 33(1 year) and total coresidence btw 24-33 

// Model 2: Multivariate - Background characteristics and family history
eststo: mlogit empstatge33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact [pweight=SAMPLING_PANEL_WEIGHT_1997], or

// Model 2a: Multivariate - characteristics at age 24
eststo: mlogit empstatge33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 i.maritalstat24 i.children24 i.employmentstability24 [pweight=SAMPLING_PANEL_WEIGHT_1997], or

// Model 3: Multivariate - Background characteristics and family history
eststo: mlogit empstatge33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat24 i.children24 i.employmentstability24 [pweight=SAMPLING_PANEL_WEIGHT_1997], or

// Model 4: Interaction effects
eststo: mlogit empstatge33 c.totalhh2433#i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat24 i.children24 i.employmentstability24 [pweight=SAMPLING_PANEL_WEIGHT_1997], or

esttab using "$temp/HITAmodelesk3334DROPPED.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))nobaselevels title(Odds Ratios)

*/



/*
*gen totdur2433 = (totalhh2433 + totalduration2433)/2

**Tables with odds ratio**

// Model 1: Bivariate
eststo: logit employmentstability33 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 33(1 year) and total coresidence btw 24-33 // 10 years
eststo: logit employmentstability33 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 33(1 year) and total coresidence btw 24-32



**# Bookmark #1

eststo: logit stablemployment3334 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 33-34(2 year) and total coresidence btw 24-33 // 10 years
eststo: logit stablemployment3334 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 33-34(2 year) and total coresidence btw 24-32

**# Bookmark #2

eststo: logit stablemployment3334 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_ALL], or // bivariate that is employment stability at 33-34(2 year) and total coresidence btw 24-33 // 10 years
eststo: logit stablemployment3334 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_ALL], or

**# Bookmark #3





eststo: logit stablemployment3233 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 32-33(2 year) and total coresidence btw 24-32
eststo: logit stablemployment3233 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_1997], or // bivariate that is employment stability at 32-33(2 year) and total coresidence btw 24-33 // 10 years
esttab using "$temp/HITAmodels323334.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))nobaselevels title(Odds Ratios)


// Model 2: Background characteristics
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 [pweight=SAMPLING_PANEL_WEIGHT_1997], or 

// Model 3: Background characteristics and family history
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact [pweight=SAMPLING_PANEL_WEIGHT_1997], or

// Model 4: Background characteristics and family history and current situation at 32
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat32 i.children [pweight=SAMPLING_PANEL_WEIGHT_1997], or 

// Model 5: If female
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat32 i.children [pweight=SAMPLING_PANEL_WEIGHT_1997] if SEX == 2, or

esttab using "$temp/HITAmodels.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))nobaselevels title(Odds Ratios)



// endogenous - control for 24 for now. 
// first model - bivaraite 
// multivaraite - with the controls at the age characteristics 
// last model - with controls for parental/marital status



//tried to create a cumulative weight
*gen SAMPLING_PANEL_WEIGHT_2012 = SAMPLING_PANEL_WEIGHT_2013
*gen SAMPLING_PANEL_WEIGHT_2014 = SAMPLING_PANEL_WEIGHT_2015
*gen SAMPLING_PANEL_WEIGHT_2016 = SAMPLING_PANEL_WEIGHT_2017
*egen SAMPLING_PANEL_WEIGHT_ALL = rowmean( SAMPLING_PANEL_WEIGHT*)
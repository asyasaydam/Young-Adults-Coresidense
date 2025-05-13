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
log 		using "$logdir/NLSY97modelW07_`logdate'.log", t replace



*opening final data
use "$temp/NLSY97_8hhroster", clear







*gen totdur2433 = (totalhh2433 + totalduration2433)/2

**Tables with odds ratio**

// Model 1: Bivariate
eststo: logit employmentstability33 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 33(1 year) and total coresidence btw 24-33 // 10 years
eststo: logit employmentstability33 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 33(1 year) and total coresidence btw 24-32



**# Bookmark #1

eststo: logit stablemployment3334 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 33-34(2 year) and total coresidence btw 24-33 // 10 years
eststo: logit stablemployment3334 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 33-34(2 year) and total coresidence btw 24-32

**# Bookmark #2



eststo: logit stablemployment3233 c.totalhh2432 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 32-33(2 year) and total coresidence btw 24-32
eststo: logit stablemployment3233 c.totalhh2433 [pweight=SAMPLING_PANEL_WEIGHT_2007], or // bivariate that is employment stability at 32-33(2 year) and total coresidence btw 24-33 // 10 years
esttab using "$temp/HITAmodels323334.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))nobaselevels title(Odds Ratios)


// Model 2: Background characteristics
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 [pweight=SAMPLING_PANEL_WEIGHT_2007], or 

// Model 3: Background characteristics and family history
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact [pweight=SAMPLING_PANEL_WEIGHT_2007], or

// Model 4: Background characteristics and family history and current situation at 32
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat32 i.children [pweight=SAMPLING_PANEL_WEIGHT_2007], or 

// Model 5: If female
eststo: logit employmentstability33 c.totalhh2433 i.SEX i.race i.citizenship i.educ2 c.nsibling i.parenteduc2 i.intact i.maritalstat32 i.children [pweight=SAMPLING_PANEL_WEIGHT_2007] if SEX == 2, or

esttab using "$temp/HITAmodels.rtf", cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))nobaselevels title(Odds Ratios)



// endogenous - control for 24 for now. 
// first model - bivaraite 
// multivaraite - with the controls at the age characteristics 
// last model - with controls for parental/marital status
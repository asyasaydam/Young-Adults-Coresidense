********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Analysis
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022

********************************************************************************
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97newmodel_`logdate'.log", t replace


**** Variables ****
* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat
* Controls: 				SEX race citizenship education_new2 
* Family/background: 		nsibling97 parenteduc2 intact ln_hhincome97 ln_hhnetwrth97 	incarstat ave* (personality traits) momeduc2
* Controls at age 24: 		enrolled24_2 maritalstat24 children24_2 empstat24_2 totalurban totalsouth


*opening final data
use "$temp/NLSY97_Final_sample_with_meanimpu", clear

**# Bookmark #1
keep empstatusage32 occeduc_max totaldurationinhh2432 livedwpar_cat livedwpar_bin SEX race citizenship education_new education_new2 nsibling97 parenteduc2 intact ln_hhincome97 ln_hhnetwrth97 *debt* incarstat ave*  momeduc2 enrolled24_2 maritalstat24_2 children24_2 empstat24_2 totalurban totalsouth BYEAR SAMPLING_WEIGHT_CC_1997


// distributions on totalduration by education and sex
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 0, nofreq cell

// predictions of totalduration for supplementary analysis
glm totaldurationinhh2432 i.education_new2 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997]
logit livedwpar_bin  i.education_new2 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997]
mlogit livedwpar_cat  i.education_new2 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997]



********************** Models stratified by education **************************
// modelling only for college educated with continuous total duration
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3

eststo: quietly glm occeduc_max c.totaldurationinhh2432##i.momeduc2 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3


// modelling only for college educated with categorical parental household duration
eststo: quietly glm occeduc_max i.livedwpar_cat i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3

eststo: quietly glm occeduc_max i.livedwpar_cat##i.momeduc2 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 3







// some college
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 2

// highschool
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 1

// highschool
eststo: quietly glm occeduc_max c.totaldurationinhh2432 i.SEX i.race i.maritalstat24_2 i.children24_2 i.empstat24_2 c.totalurban c.totalsouth c.nsibling97 i.momeduc2 i.incarstat2 i.intact i.enrolled24_2 [pweight=SAMPLING_PANEL_WEIGHT_1997] if education_new2 == 0

esttab using "$results/NLSY32_occeducstr.rtf", ar2(%6.5f) sca(F) p r legend label varlabels(_cons Constant)

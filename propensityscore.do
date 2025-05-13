********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Propensity Score matching
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97ps_`logdate'.log", t replace




* DV1: 						empstatusage32
* DV2: 						occeduc_max
* IV: 						totaldurationinhh2432 livedwpar_cat livedwpar_bin
* Controls: 				SEX race citizenship education_new2 
* Family/background: 		nsibling97 parenteduc2 momeduc2 intact ln_hhincome97 ln_hhnetwrth97 incomesource97 debt20 incarstat2 ave* (personality traits) 
* Controls at age 24: 		enrolled24_2 maritalstat24 children24_2 empstatusage24_2 totalurban totalsouth debt25 changedebt2025 changedebt2530 ln_debt25
* Controls at age 32: 		maritalstat32 children32 marchangedetail marchangedetail
* Endogenous parameters		debt30 maritalstat32 maritalstat30  havedebt30
* weights:					SAMPLING_PANEL_WEIGHT_*  


// For propensity score I have to create a treatment and control group. 
// I already have this: livedwpar_bin
// I can do this multiple ways
// 1) control group: never lived with parents after 24 and treatment group: those who live with their parents from 1 to 9 years


use "$temp/NLSY97_Final_sample_with_meanimpu", clear

recode 	empstatusage32 0=0 1/2=1, gen(emp32_bin)


keep ID livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstatusage24_2 momeduc2 intact nsibling97 totalurban totalsouth empstatusage32 BYEAR emp32_bin south logturban livingat24 ave* empdur1523 empdur2431 empdur2432

drop if 	livedwpar_bin == .



* I am following this: http://sites.utexas.edu/prc/files/IPWRA.pdf

// Here I use a probit (why?) model that includes (almost) all the covariates in my outcome model (where I predict employment status) plus incarceration (but this might be incarceration after 24) -  maybe I can add those personality characteristics 

probit livedwpar_bin i.BYEAR i.SEX i.race i.education_new2 i.maritalstat24_2 i.children24_2 i.empstat24_2 i.momeduc2 i.intact c.nsibling97 c.totalurban south c.aveextra c.aveagree c.avecons c.aveemost c.aveopen

// Predict the conditional probability of living with parents after 24 for each young adult in the sample
predict p_livedwpar_bin, pr

// Now we generate the inverse probability weights as P(T=1|covariates) if T = 1 (mother is asmoker), and 1-P(T=1|covariates) if T = 0 (mother is a nonsmoker)




** I experiment here:
// What if I wasusing the living with parents as my outcome variable? Then what would be my treatment variable?

teffects psmatch (livedwpar_bin) (SEX education_new2 race maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban south BYEAR)
teoverlap













* Trying new code from page 47 and onwards: https://www.stata.com/manuals13/te.pdf
* This is also what Augustine and Raley did. 

tab livedwpar_bin, m

logit livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban south

predict ps
gen 	psbeforeinverse = ps
gen 	wps = livedwpar_bin + [(1 - livedwpar_bin) / 1 - ps]
gen		wps_count = livedwpar_bin/ps + 1 - livedwpar_bin










replace ps = 1/ps 		if livedwpar_bin == 1
replace ps = 1/(1-ps) 	if livedwpar_bin == 0
hist	ps, by(livedwpar_bin)
scatter emp32_bin ps


* difference ps scores for men and women
* Men
logistic livedwpar_bin race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban south if SEX == 1

predict ps_men
gen 	psbeforeinverse_men = ps_men
replace ps_men = 1/ps_men 		if livedwpar_bin == 1
replace ps_men = 1/(1-ps_men) 	if livedwpar_bin == 0
hist	ps_men, by(livedwpar_bin)
scatter emp32_bin ps_men

// w(t, x) = t + [(1 − t)/1 − e(x)] : weighting allows us to focus on the effect of coresidence for families with the greatest propensity to coreside.

gen 	weightps = livedwpar_bin + [(1 - livedwpar_bin)/1 - ps_men] if SEX == 1

* Women
logistic livedwpar_bin race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban south if SEX == 2

predict ps_women
gen 	psbeforeinverse_women = ps_women
replace ps_women = 1/ps_women 		if livedwpar_bin == 1
replace ps_women = 1/(1-ps_women) 	if livedwpar_bin == 0
hist	ps_women, by(livedwpar_bin)
scatter emp32_bin ps_women

replace 	weightps = livedwpar_bin + [(1 - livedwpar_bin)/1 - ps_women] if SEX == 2


 * another code
teffects ipwra (emp32_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact nsibling97 totalurban south,logit noconstant) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact nsibling97 totalurban south,logit noconstant), aequations ate

tebalance summarize

foreach var of varlist SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact nsibling97 totalurban south {
 tebalance density `var', saving("$temp\balance_`var'", replace)
}

tebalance overid, nolog

//
/*
Overidentification test for covariate balance
H0: Covariates are balanced

         chi2(11)     =  15.0302
         Prob > chi2  =   0.1811


Since it is above .005 I can say that covariates are balanced based on null here. 
		 */





* Define treatment, outcome, and independent variables
global treatment livedwpar_bin
global y1 empstatusage32
global y2 occeduc_max
mdesc livedwpar_bin empstatusage32 SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact nsibling97 totalurban totalsouth 
*drop if livedwpar_bin == .
global xlist SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact nsibling97 totalurban totalsouth BYEAR
global breps 100


describe $treatment $y1 $xlist
describe $treatment $y2 $xlist

bysort $treatment: summarize $y1 $xlist
bysort $treatment: summarize $y2 $xlist


*regression with a dummy variable for treatment (t-test)
mlogit $y1 $treatment
reg $y2 $treatment

*regression with a dummy variable for treatment controlling for x
mlogit $y1 $treatment $xlist
reg $y2 $treatment $xlist

*Propensity score matching with common support
pscore $treatment $xlist, pscore(myscore) blockid(myblock) comsup

* Matching methods

* Nearest neighbor matching
attnd $y1 $treatment $xlist, pscore(myscore) comsup boot reps($breps) dots
attnd $y2 $treatment $xlist, pscore(myscore) comsup boot reps($breps) dots

* Radius matching
attr $y1 $treatment $xlist, pscore(myscore) comsup boot reps($breps) dots radius(0.1)

* Kernel matching
attk $y1 $treatment $xlist, pscore(myscore) comsup boot reps($breps) dots

* Stratification matching
atts $y1 $treatment $xlist, pscore(myscore) blockid(myblock) comsup boot reps($breps) 


****** Alternative treatment effects assesment
teffects psmatch (occeduc_max) (livedwpar_bin $xlist)

teffects psmatch (empstatusage32) (livedwpar_bin $xlist)

// trying with the adding factor notations
teffects psmatch (empstatusage32) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban c.totalsouth BYEAR)
// this result better but since empstatusage32 is categorical I am not sure if this is helpful. 
// So I will create a binary outcome here:
*recode 	empstatusage32 0=0 1/2=1, gen(emp32_bin)
teffects psmatch (emp32_bin) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban c.totalsouth BYEAR)
teoverlap


// teffects overlap, a postestimation command, plots the estimated densities of the probability of getting each treatment level. These plots can be used to check whether the overlap assumption is violated.


teffects psmatch (emp32_bin) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban c.totalsouth BYEAR)
tebalance summarize
tebalance box

// What about continuous outcomes
teffects psmatch (occeduc_max) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban c.totalsouth BYEAR)
teoverlap
tebalance summarize


****** Alternative propensity score matching

* Estimate propensity score and match
psmatch2 $treatment $xlist, out(empstatusage32) common
psmatch2 $treatment $xlist, out(occeduc_max) common
// We notice that there is a common support. Only about 7 observations were off support 
// which is to say that their propensity scores were not aligned with another observation
// of the other treated category. In large part, we see some evidence of common support. 
// We can see average treatment effect of the difference. And the difference between those 
// who never lived and who lived with parents after 25. 
* Evaluate match graphically
psgraph

// this graph shows some evidence of overlap in propensity scores. 
* Evaluate match with statistical tests
pstest $xlist


// same covariates above, as my matching variables,
//  when I highlight and runpstest command I will see output comparing these covariates, 
//  giving some indicators if bias has been reduced
// if we have achieved a balance between control and estimated group. 
// none of them are statistically significant. 
// what are we looking for? they are not statistically significant. percent bias is less than %5, kind of a traditional threshold. 
// we have done a good 
// observable covariates.



// Dan Powers suggested:
/*Hi Asya - 
Getting the p-score prediction model to produce balanced groups can be a challenge. One alternative to matching is to re-weight the sample, this is what -teffects- does (iptw, iptwa, iptwra).  You still need to specify the model for the propensity scores that form the basis of the weights. I think that it takes care to ensure that the covariates meet the balancing property (in a sense are the means in the treated roughly equal to the means in the controls when reweighting). There are other tweaks to ensure balance that may not be a part of -teffects- (at least my version-15).  Thus, you don't really need separate pscore and psmatch routines. You can request that effects does psmatching (see teffects psmatch), among other things. For example, covariates that don't meet balancing can be included in the outcome model as controls (see teffects ipwra). 

Your application is interesting. We can discuss this more as you work though some options.
*/

** Alternatively I am trying Inverse-probability-weighted (IPW) estimators
teffects ipw (occeduc_max) (livedwpar_bin SEX race education_new2 maritalstat24_2 children24_2 empstat24_2 momeduc2 intact c.nsibling97 c.totalurban c.totalsouth BYEAR)

tebalance overid // this took ages
tebalance summarize, baseline




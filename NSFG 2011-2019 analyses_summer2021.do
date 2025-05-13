
// run do file that merges nsfg data and creates vars
do "C:\Users\bwhitfield\Desktop\NSFG\NSFG variable creation.do"

log using "C:\Users\bwhitfield\Desktop\NSFG\Prelim Analyses.log",replace

// Set weights for analyses

svyset [pweight=WGT2011_2019], strata(sest) psu(secu)

svy, subpop(if wynotuse==. & WGT2015_2019!=. & age_r<=24): tab mostfreqmeth_cat

*******************
* PRELIM ANALYSES *
*******************

// condom use and method type
tab mostfreqmeth_cat condomfreq,row

reg condomfreq12 i.mostfreqmeth_cat
reg condomfreq12 ib4.mostfreqmeth_cat  // method type does seem to predict condom use
margins mostfreqmeth_cat
marginsplot // those using sterilization or non-hormonal less effective methods have sig lower condom use, then LARC and no method users, then hormonal

// condom use and relationship type
tab reltype12 condomfreq ,row

reg condomfreq i.reltype12  // those in more serious relationships have lower condom use
margins reltype12
marginsplot

// condom use and std treatment
tab stdtrt12 condomfreq, row

reg stdtrt12 ib4.condomfreq // makes sense if those using it none of the time are in committed relationships
margins condomfreq
marginsplot

// primary method and std treatment
tab stdtrt12 mostfreqmeth_cat,row

reg stdtrt12 i.mostfreqmeth_cat 
margins mostfreqmeth_cat
marginsplot

// primary method use and std treatment controlling for condom use
reg stdtrt12 i.mostfreqmeth_cat i.condomfreq 

// primary method use and std treatment controlling for relationship status
reg stdtrt12 i.mostfreqmeth_cat i.reltype12 

**************************
* SAMPLE CHARACTERISTICS *
**************************

** updated 5/21/21 to full sample of women using most frequently reported methods
*categorical measures
foreach var in income_cat mostfreqmeth_cat hisprace2 condomfreq reltype12 stdtrt12 {
	svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): tab `var' 
}
*categorical measures (raw)
foreach var in income_cat mostfreqmeth_cat hisprace2 condomfreq reltype12 stdtrt12 {
	tab `var' if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.
}

*continuous measures
recode pst4wksx (998 999 = .)
foreach var in age_r vry1stag lifprtnr pst4wksx {
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): mean `var' 
}

	
************z
* ANALYSES *
************

** Full sample using most frequently reported method used in last year for those <25 **

// Frequency of condom use by method type
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): tab condomfreq mostfreqmeth_cat, col
	// testing for sig differences within categories
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): reg condomfreq b5.mostfreqmeth_cat // no method users and LARC are the same and no method users and coital are the same. All else are sig diff
	
// STD treatment rate by covariates
foreach var in mostfreqmeth_cat condomfreq reltype12 {
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): tab stdtrt12 `var', col
}

	// testing for sig differences within categories
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 i.mostfreqmeth_cat // no sig diff by method type
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 i.condomfreq  // some or half of the time sig diff from all others
	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b2.reltype12 // serious & dating the same; but sig diff from casual and mix; casual sig diff from mix

	
** UDATE TO LOGITS **

// (1) BASE MODEL (JUST CONTROLS)
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b3.mostfreqmeth_cat age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (2) BASE MODEL + RELATIONSHIP STATUS
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b3.mostfreqmeth_cat i.reltype12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wks, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (3) BASE MODEL + CONDOM FREQUENCY
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b3.mostfreqmeth_cat b4.condomfreq12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (4) BASE MODEL + REL STATUS + CONDOM FREQUENCY
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b3.mostfreqmeth_cat i.reltype12 b4.condomfreq12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

/* Export regression tables
eststo: svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1): logit stdtrt12 b3.mostfreqmeth_cat ib2.hisprace2 age_r c.vry1stag c.lifprtnr c.pst4wksx c.totincr, or
eststo: svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1): logit stdtrt12 b3.mostfreqmeth_cat i.reltype12 ib2.hisprace2 age_r c.vry1stag c.lifprtnr c.pst4wksx c.totincr, or
eststo: svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1): logit stdtrt12 b3.mostfreqmeth_cat b4.condomfreq ib2.hisprace2 age_r c.vry1stag c.lifprtnr c.pst4wksx c.totincr, or

*known differences in method type and STI by race/ethnicity but even controlling for that we see...
*/

**********************
* Mediation Analyses *
**********************
	
// Looking at whether rel status mediates rel between condom use and STI treatment
// Have to use gsem because categorical IV and svy weights
// Only interested in "some of the time" since that is the only predictor of STI treatment
// Using khb for mediation analysis


khb logit stdtrt12 i.condomfreq12 || i.reltype12 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. [pweight=WGT2011_2019], concomitant(i.hisprace2 c.age_r c.vry1stag c.lifprtnr c.pst4wksx i.income_cat) summary disentangle   

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1): logit stdtrt12 i.condomfreq12##i.reltype12 i.hisprace2 c.age_r c.vry1stag c.lifprtnr c.pst4wksx i.income_cat
	
************************
* Sensitivity Analyses *
************************

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1): tab samemethod12
 
keep if mostfreqmeth_cat!=.

tab mostfreqmeth_cat, g(methcat)
tab hisprace2, g(racecat)
tab condomfreq12, g(condom)
tab reltype12, g(rel)
tab income_cat, g(inc)

*categorical measures
foreach var in mostfreqmeth_cat hisprace2 condomfreq12 reltype12 stdtrt12 {
	svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & samemethod12==1): tab `var'
}

ttest methcat1 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest methcat2 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest methcat3 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest methcat4 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest methcat5 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

ttest racecat1 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest racecat2 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest racecat3 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest racecat4 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

ttest condom1 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest condom2 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest condom3 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest condom4 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

ttest rel1 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest rel2 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest rel3 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest rel4 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

ttest inc1 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest inc2 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest inc3 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest inc4 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)
ttest inc5 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

ttest stdtrt12 if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=., by(samemethod12)

*continuous measures
fre pstwksx
foreach var in totincr age_r totincr vry1stag lifprtnr pst4wksx {
	svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & samemethod12==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): mean `var'
	ttest `var', by(samemethod12)
}

// (1) BASE MODEL (JUST CONTROLS)
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & samemethod12==1): logit stdtrt12 b3.mostfreqmeth_cat age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (2) BASE MODEL + RELATIONSHIP STATUS
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & samemethod12==1): logit stdtrt12 b3.mostfreqmeth_cat i.reltype12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wks, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (3) BASE MODEL + CONDOM FREQUENCY
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & samemethod12==1): logit stdtrt12 b3.mostfreqmeth_cat b4.condomfreq12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

// (4) BASE MODEL + REL STATUS + CONDOM FREQUENCY
svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & samemethod12==1): logit stdtrt12 b3.mostfreqmeth_cat i.reltype12 b4.condomfreq12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

*******************
* No Method Users *
*******************

gen sexfreq_cat=.
replace sexfreq_cat=1 if pst4wksx==0
replace sexfreq_cat=2 if pst4wksx>0 & pst4wksx<5
replace sexfreq_cat=3 if pst4wksx>=5 & pst4wksx<9
replace sexfreq_cat=4 if pst4wksx>=9 & pst4wksx<13
replace sexfreq_cat=5 if pst4wksx>=13 & pst4wks!=.
tab sexfreq_cat

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab age_r

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab hisprace2

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab sexfreq_cat

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab reltype12

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab condomfreq12 sexfreq_cat,col

svy, subpop(if wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=. & mostfreqmeth_cat==5): tab condomfreq12 reltype12, col


log close

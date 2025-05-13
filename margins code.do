

** Here is coefplot code:
// Overall
	mi estimate, post: mean abort_microcephaly_binary if sample_MI==1 [pweight=W01_raked_weights]
	estimates store CZS

	mi estimate, post: mean abort_zika_binary if sample_MI==1 [pweight=W01_raked_weights]
	estimates store zika

	mi estimate, post: mean abort_covid_binary if sample_MI==1 [pweight=W01_raked_weights]
	estimates store covid

	coefplot CZS zika covid, coeflabels(abort_microcephaly_binary = "Fetal CZS" abort_zika_binary = "Maternal Zika infection" abort_covid_binary = "Maternal Covid-19 infection") xtitle("Proportion agreeing that women should have the right to abortion", size(small)) vertical recast(bar) barwidth(0.4) finten(60) citop ciopt(recast(rcap)) ylabel(0(.1).55) mlabel xla(, nolabels)

	
** margins code
This is the margins code:
// Original models
	// Zika
	mi estimate, or: logit abort_zika_binary i.religion4cat i.W01_income_hilow i.W01_happy_ifpregnant i.W01_municipio_rm W01_age b2.W01_race_cat5 i.W01_momeduc_cat2 i.W01_relationship c.W01_stress_microcephaly c.W01_stress_covidpreg if sample_MI==1 [pweight=W01_raked_weights],vce(robust)
	
	mimrgns, at(W01_religion2=(1 2 3 4 5)) cmdmargins
	mimrgns, at(W01_income_hilow=(1 2 3)) cmdmargins
	
** And an example with an interaction:

// Zika
mi estimate, or: logit abort_zika_binary i.religion4cat##i.W01_income_hilow i.W01_happy_ifpregnant i.W01_municipio_rm W01_age b2.W01_race_cat5 i.W01_momeduc_cat2 i.W01_relationship W01_stress_microcephaly W01_stress_covidpreg if sample_MI==1 [pweight=W01_raked_weights],vce(robust)

	mimrgns, at(W01_income_hilow=(1(1)3) religion4cat=(1 2 3 4)) cmdmargins
	marginsplot, xtitle("") ytitle("Odds of agreeing with right to abortion: Maternal Zika") legend(size(vsmall)) noci
	
//This is all for multiple imputation data, but you should be able to use the margins command instead of mimrgns for non imputed data

	svy, subpop(if  wynotuse!=1 & age_r<=24 & pregnowq!=1 & hadsex12mo==1 & mostfreqmeth_cat!=. & condomfreq12!=. & reltype12!=. & stdtrt12!=.): logit stdtrt12 b3.mostfreqmeth_cat b4.condomfreq12 age_r ib2.hisprace2 i.income_cat c.vry1stag c.lifprtnr c.pst4wksx, or
margins mostfreqmeth_cat, atmeans 
marginsplot, noci

	
	


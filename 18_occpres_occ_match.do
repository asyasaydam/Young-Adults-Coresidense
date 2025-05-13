********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997) 
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2023
********************************************************************************

* This do file recodes for the mismatch between NLSY and ipums and then filters it to occupations at 32, then merges the occupation with the corresponding occupational education score. Assigns occupational education score up to 4 jobs for adults who are 32.


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97IPUMS_`logdate'.log", t replace

use 		 "$temp/hitaNLSY_occupations", clear

keep 		ID SEX BYEAR yearatage32 occupation_*_2011 occupation_*_2013 occupation_*_2015 occupation_*_2017 occupation_*_2019 occupation32_1 occupation32_2 occupation32_3 occupation32_4


********************************* FOR the first jobs ***************************
********************************************************************************



keep ID occupation32_1

// Here I recoded the NLSY variables, for the occupation at age 32, into ipums so that when I later merge to see whic education has what occupational education, I can easily merge.

recode occupation32_1 (40=30)(50=30)(60=30)(200=205)(210=205)(340=310)(1040=1050)(1110=1100)(1340=1530)(1810=1800)(1860=1840)(2110=2100)(2710=2700)(2820=2825)(2830=2810)(3850=3820)(3920=3930)(4020=4000)(4550=9050)(4710=4700)(4960=4965)(5930=5940)(6000=6005)(6020=6050)(6350=6355)(6510=6515)(6760=6765)(6920=6800)(7310=7315)(7520=7630)(7620=7630)(8240=8230)(8260=8230)(8440=8460)(8960=8965)(9120=9100)(9740=9750)(9840=9820)(9990=9920)


rename occupation32_1 occnum


merge		m:m occnum using "$temp/ipumsoccpoolprestfinaltomerge"
// At the end of this merge, there are leftover ipums categories of occupations, which did not match to anyones occupation at age 32, but this doesn't mean that they don't exist in NLSY, so I will keep them, to see maybe someone else might have it as a secondary job. 

// So after this merge, I can have a set where I can identify people's occupational education
drop if 	_merge == 2
drop 		_merge

// I can save this file and later merge using ID and occnum?

rename hwsei occprest_1
rename occnum occnum1
rename occ2010 occ2010_1

save "$temp/firstjobmatchedoccprest", replace



************************** FOR the second jobs *********************************
********************************************************************************
 
use 		 "$temp/hitaNLSY_occupations", clear

keep 		ID SEX BYEAR yearatage32 occupation_*_2011 occupation_*_2013 occupation_*_2015 occupation_*_2017 occupation_*_2019 occupation32_1 occupation32_2 occupation32_3 occupation32_4



keep ID occupation32_2

// Here I recoded the NLSY variables, for the aoccupation at age 32, into ipums so that when I later merge to see whic education has what occupational education, I can easily merge.

recode occupation32_2 (40=30)(50=30)(60=30)(200=205)(210=205)(340=310)(1040=1050)(1110=1100)(1340=1530)(1810=1800)(1860=1840)(2110=2100)(2710=2700)(2820=2825)(2830=2810)(3850=3820)(3920=3930)(4020=4000)(4550=9050)(4710=4700)(4960=4965)(5930=5940)(6000=6005)(6020=6050)(6350=6355)(6510=6515)(6760=6765)(6920=6800)(7310=7315)(7520=7630)(7620=7630)(8240=8230)(8260=8230)(8440=8460)(8960=8965)(9120=9100)(9740=9750)(9840=9820)(9990=9920)(6930=6940)


rename occupation32_2 occnum

merge		m:m occnum using "$temp/ipumsoccpoolprestfinaltomerge"

// At the end of this merge, there are leftover ipums categories of occupations, which did not match to anyones occupation at age 32, but this doesn't mean that they don't exist in NLSY, so I will keep them, to see maybe someone else might have it as a secondary job. 

// So after this merge, I can have a set where I can identify people's occupational education
drop if _merge == 2
drop _merge

// I can save this file and later merge using ID and occnum?

rename hwsei occprest_2
rename occnum occnum2
rename occ2010 occ2010_2
save "$temp/secondjobmatchedoccprest", replace


************************** FOR the third jobs *********************************
********************************************************************************

use 		 "$temp/hitaNLSY_occupations", clear

keep 		ID SEX BYEAR yearatage32 occupation_*_2011 occupation_*_2013 occupation_*_2015 occupation_*_2017 occupation_*_2019 occupation32_1 occupation32_2 occupation32_3 occupation32_4



keep ID occupation32_3

// Here I recoded the NLSY variables, for the aoccupation at age 32, into ipums so that when I later merge to see whic education has what occupational education, I can easily merge.

recode occupation32_3 (40=30)(50=30)(60=30)(200=205)(210=205)(340=310)(1040=1050)(1110=1100)(1340=1530)(1810=1800)(1860=1840)(2110=2100)(2710=2700)(2820=2825)(2830=2810)(3850=3820)(3920=3930)(4020=4000)(4550=9050)(4710=4700)(4960=4965)(5930=5940)(6000=6005)(6020=6050)(6350=6355)(6510=6515)(6760=6765)(6920=6800)(7310=7315)(7520=7630)(7620=7630)(8240=8230)(8260=8230)(8440=8460)(8960=8965)(9120=9100)(9740=9750)(9840=9820)(9990=9920)(6930=6940)


rename occupation32_3 occnum


merge		m:m occnum using "$temp/ipumsoccpoolprestfinaltomerge"


// So after this merge, I can have a set where I can identify people's occupational education
drop if _merge == 2
drop _merge

// I can save this file and later merge using ID and occnum?

rename hwsei occprest_3
rename occnum occnum3
rename occ2010 occ2010_3
save "$temp/thirdjobmatchedoccprest", replace



************************** FOR the fourth jobs *********************************
********************************************************************************

use 		 "$temp/hitaNLSY_occupations", clear

keep 		ID SEX BYEAR yearatage32 occupation_*_2011 occupation_*_2013 occupation_*_2015 occupation_*_2017 occupation_*_2019 occupation32_1 occupation32_2 occupation32_3 occupation32_4



keep ID occupation32_4

// Here I recoded the NLSY variables, for the aoccupation at age 32, into ipums so that when I later merge to see whic education has what occupational education, I can easily merge.

recode occupation32_4 (40=30)(50=30)(60=30)(200=205)(210=205)(340=310)(1040=1050)(1110=1100)(1340=1530)(1810=1800)(1860=1840)(2110=2100)(2710=2700)(2820=2825)(2830=2810)(3850=3820)(3920=3930)(4020=4000)(4550=9050)(4710=4700)(4960=4965)(5930=5940)(6000=6005)(6020=6050)(6350=6355)(6510=6515)(6760=6765)(6920=6800)(7310=7315)(7520=7630)(7620=7630)(8240=8230)(8260=8230)(8440=8460)(8960=8965)(9120=9100)(9740=9750)(9840=9820)(9990=9920)(6930=6940)


rename occupation32_4 occnum

merge		m:m occnum using "$temp/ipumsoccpoolprestfinaltomerge" 


// So after this merge, I can have a set where I can identify people's occupational sei
drop if _merge == 2
drop _merge

// I can save this file and later merge using ID and occnum?

rename hwsei occprest_4
rename occnum occnum4
rename occ2010 occ2010_4
save "$temp/fourthjobmatchedoccprest", replace

log close
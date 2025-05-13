********************************************************************************
* Occupational prestige
* IPUMS 20012-2017 ACS
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2023
********************************************************************************

* Purpose: identify occupational prestige scores
cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/ipumsoccupprest_`logdate'.log", t replace
use 		"$created_data/ipums4_extract", clear


	
contract 	occ2010 hwsei prent
drop if hwsei == 0
generate occnum = occ2010
browse
sort occnum
browse occnum occ2010 hwsei prent
drop _freq
summarize hwsei
egen hwsei_mean = mean(hwsei)



save 		"$temp/ipumsoccpoolprestfinaltomerge", replace
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997) 
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022 (Jan 2022)

********************************************************************************

* Purpose: Merge the previous NLSYs with the occupational educations that are assigned *


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97mergewithIpums_`logdate'.log", t replace


use "$temp/hitaNLSY_occupations", clear
merge 		m:m ID using "$temp/firstjobmatchedoccedu"
drop		_merge
merge 		m:m ID using "$temp/secondjobmatchedoccedu"
drop		_merge
merge 		m:m ID using "$temp/thirdjobmatchedoccedu"
drop		_merge
merge		m:m ID using "$temp/fourthjobmatchedoccedu" 

duplicates list ID
gen dup = _n
browse ID dup occeduc_* hwsei  if ID == 2371 | ID == 3705 | ID == 4092 | ID == 8084 | ID == 7554
drop if inlist(dup, 2369, 3698, 3699, 4087, 7537, 8063)


save 		"$temp/mergedoccedu", replace



/// Estimating correlation coeffcient
use 		"$temp/mergedoccedu", clear
correlate occeduc_1 occeduc_2 						if occeduc_1 != . & occeduc_2 != . & occeduc_3 == . & occeduc_4 == .
correlate occeduc_1 occeduc_2 occeduc_3 			if occeduc_1 != . & occeduc_2 != . & occeduc_3 != . & occeduc_4 == .
correlate occeduc_1 occeduc_2 occeduc_3 occeduc_4 	if occeduc_1 != . & occeduc_2 != . & occeduc_3 != . & occeduc_4 != . 


alpha occeduc_1 occeduc_2 occeduc_3 occeduc_4, std casewise detail


// Create two outcomes to use alternatively
* 1) take the mean of the occupational education
egen occeduc_mean = rowmean(occeduc_1 occeduc_2 occeduc_3 occeduc_4)
egen occeduc_max  = rowmax(occeduc_1 occeduc_2 occeduc_3 occeduc_4)


* Here I replace those who are employed because they indicated a job type (self employed (1) or salary worker (0)) but did not indicate an occupation. If they are self employed, I used the mean educational score from IPUMS, this is such a mean because when I cluster class of wroker variable in ipums, the self employed category had everyone from plummer to aerospace bla bla engineer. Similarly I used the mean education score from again ipums for those who are salary worker identified in NLSY but did not have an occupation in NLSY records.
// I do this calculation in which do file? 15_ipums_occ_pool

replace occeduc_max = .4170913 if occeduc_max == . & jobtype32_1 != . & jobtype32_1 == 1
replace occeduc_max = .4170913 if occeduc_max == . & jobtype32_2 != . & jobtype32_2 == 1 // no change happens
replace occeduc_max = .4170913 if occeduc_max == . & jobtype32_3 != . & jobtype32_3 == 1 // no change happens

replace occeduc_max = .4773635 if occeduc_max == . & jobtype32_1 != . & jobtype32_1 == 0
replace occeduc_max = .4773635 if occeduc_max == . & jobtype32_2 != . & jobtype32_2 == 0 // no change happens
replace occeduc_max = .4773635 if occeduc_max == . & jobtype32_3 != . & jobtype32_3 == 0 // no change happens




save 		"$temp/13_ipums_nlsy_merge", replace

log close
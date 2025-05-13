********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997) 
* by Asya Saydam (asyasaydam@utexas.edu)
* Summer 2023
********************************************************************************

* Purpose: Merge the previous NLSYs with the occupational educations that are assigned *


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97mergewithIpumsPrest_`logdate'.log", t replace


use "$temp/hitaNLSY_occupations", clear
merge 		m:m ID using "$temp/firstjobmatchedoccprest"
drop		_merge
merge 		m:m ID using "$temp/secondjobmatchedoccprest"
drop		_merge
merge 		m:m ID using "$temp/thirdjobmatchedoccprest"
drop		_merge
merge		m:m ID using "$temp/fourthjobmatchedoccprest" 

duplicates list ID
gen dup = _n
browse ID dup if ID == 3118 | ID == 3705 | ID == 4092 | ID == 7554 | ID == 8084 | ID == 8455
drop if inlist(dup, 3114, 3699, 3700, 8990, 8991, 8061, 8431)

save 		"$temp/mergedoccprest", replace




/// Estimating correlation coeffcient
use 		"$temp/mergedoccprest", clear
correlate occprest_1 occprest_2 						if occprest_1 != . & occprest_2 != . & occprest_3 == . & occprest_4 == .
correlate occprest_1 occprest_2 occprest_3 			if occprest_1 != . & occprest_2 != . & occprest_3 != . & occprest_4 == .
correlate occprest_1 occprest_2 occprest_3 occprest_4 	if occprest_1 != . & occprest_2 != . & occprest_3 != . & occprest_4 != . 


alpha occprest_1 occprest_2 occprest_3 occprest_4, std casewise detail


// Create two outcomes to use alternatively
* 1) take the mean of the occupational education
egen occprest_mean = rowmean(occprest_1 occprest_2 occprest_3 occprest_4)
egen occprest_max  = rowmax(occprest_1 occprest_2 occprest_3 occprest_4)



* Here I replace those who are employed because they indicated a job type (self employed (1) or salary worker (0)) but did not indicate an occupation. If they are self employed, I used the mean sei score from IPUMS, this is such a mean because when I cluster class of wroker variable in ipums, the self employed category had everyone from plummer to aerospace bla bla engineer. Similarly I used the mean education score from again ipums for those who are salary worker identified in NLSY but did not have an occupation.

replace occprest_max = 37.443 if occprest_max == . & jobtype32_1 != . & jobtype32_1 == 1
replace occprest_max = 37.443  if occprest_max == . & jobtype32_2 != . & jobtype32_2 == 1 // no change happens
replace occprest_max = 37.443  if occprest_max == . & jobtype32_3 != . & jobtype32_3 == 1 // no change happens

replace occprest_max = 37.443  if occprest_max == . & jobtype32_1 != . & jobtype32_1 == 0
replace occprest_max = 37.443  if occprest_max == . & jobtype32_2 != . & jobtype32_2 == 0 // no change happens
replace occprest_max = 37.443  if occprest_max == . & jobtype32_3 != . & jobtype32_3 == 0 // no change happens


* Here I recode for those who are registered as no employment which is basically not meployed, the occupational education of unemployed in ipums
*replace occeduc_max = .0688115 if occeduc_max == . & empstatge32 == 0
drop		_merge
save 		"$temp/19_ipums_nlsy_merge", replace
log close

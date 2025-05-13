
********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Descriptive excel
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022

********************************************************************************


cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97describe_`logdate'.log", t replace




*opening final data
use "$temp/NLSY97_Final_sample_with_meanimpu", clear



keep empstatusage32 occeduc_max totaldurationinhh2432 livedwpar_cat  SEX race citizenship education_new nsibling97 parenteduc2 intact ln_hhincome97 ln_hhnetwrth97 incarstat ave*  momeduc2 enrolled24 maritalstat24 children24_2 empstat24_2 totalurban totalsouth BYEAR SAMPLING_WEIGHT_CC_1997

*livedwpar_bin

*************************
 *Descriptive Table
*************************

*template
putexcel set "$results/HitaNLSY_Descriptives.xlsx", sheet("hitaW") replace



*************************
* Create Table Shell
*************************
putexcel A2 = "Duration", border(bottom double) hcenter
putexcel B2 = "Sex", border(bottom double) hcenter
putexcel C2 = "Education", border(bottom double) hcenter
putexcel D2 = "Percentage", border(bottom double) hcenter


forvalues n=3/10 {
		putexcel A`n' = "0"		
	}
forvalues n=1/18 {
		putexcel A`n' = "1"		
	}
forvalues n=19/26 {
		putexcel A`n' = "2"		
	}
forvalues n=27/34 {
		putexcel A`n' = "3"		
	}	
forvalues n=35/42 {
		putexcel A`n' = "4"		
	}	
forvalues n=43/50 {
		putexcel A`n' = "5"		
	}		
forvalues n=51/58 {
		putexcel A`n' = "6"		
	}		
forvalues n=59/66 {
		putexcel A`n' = "7"		
	}		
forvalues n=67/74 {
		putexcel A`n' = "8"		
	}		
forvalues n=75/82 {
		putexcel A`n' = "9"		
	}				

	

forvalues n=3/6 {
		putexcel B`n' = "Male"		
	}
forvalues n=11/14 {
		putexcel B`n' = "Male"		
	}
forvalues n=19/22 {
		putexcel B`n' = "Male"		
	}
forvalues n=27/30 {
		putexcel B`n' = "Male"		
	}	
forvalues n=35/38 {
		putexcel B`n' = "Male"		
	}	
forvalues n=43/46 {
		putexcel B`n' = "Male"		
	}		
forvalues n=51/54 {
		putexcel B`n' = "Male"		
	}		
forvalues n=59/62 {
		putexcel B`n' = "Male"		
	}		
forvalues n=67/70 {
		putexcel B`n' = "MAle"		
	}		
forvalues n=75/78 {
		putexcel B`n' = "Male"		
	}	


// distributions on totalduration by education and sex
// 0 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 0, nofreq cell matcell(zero)
mata: st_matrix("zero", (st_matrix("zero"):/ sum(st_matrix("zero"))))
matrix list zero, format("%3.2f") 

putexcel D3 =  matrix(zero[1,1]), nformat("##.#%")
putexcel D4 =  matrix(zero[2,1]), nformat("##.#%")
putexcel D5 =  matrix(zero[3,1]), nformat("##.#%")
putexcel D6 =  matrix(zero[4,1]), nformat("##.#%")
putexcel D7 =  matrix(zero[1,2]), nformat("##.#%")
putexcel D8 =  matrix(zero[2,2]), nformat("##.#%")
putexcel D9 =  matrix(zero[3,2]), nformat("##.#%")
putexcel D10 =  matrix(zero[4,2]), nformat("##.#%")


// 1 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 1, nofreq cell matcell(one)
mata: st_matrix("one", (st_matrix("one"):/ sum(st_matrix("one"))))
matrix list one, format("%3.2f") 

putexcel D11 =  matrix(one[1,1]), nformat("##.#%")
putexcel D12 =  matrix(one[2,1]), nformat("##.#%")
putexcel D13 =  matrix(one[3,1]), nformat("##.#%")
putexcel D14 =  matrix(one[4,1]), nformat("##.#%")
putexcel D15 =  matrix(one[1,2]), nformat("##.#%")
putexcel D16 =  matrix(one[2,2]), nformat("##.#%")
putexcel D17 =  matrix(one[3,2]), nformat("##.#%")
putexcel D18 =  matrix(one[4,2]), nformat("##.#%")


// 2 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 2, nofreq cell matcell(two)
mata: st_matrix("two", (st_matrix("two"):/ sum(st_matrix("two"))))
matrix list two, format("%3.2f") 

putexcel D19 =  matrix(two[1,1]), nformat("##.#%")
putexcel D20 =  matrix(two[2,1]), nformat("##.#%")
putexcel D21 =  matrix(two[3,1]), nformat("##.#%")
putexcel D22 =  matrix(two[4,1]), nformat("##.#%")
putexcel D23 =  matrix(two[1,2]), nformat("##.#%")
putexcel D24 =  matrix(two[2,2]), nformat("##.#%")
putexcel D25 =  matrix(two[3,2]), nformat("##.#%")
putexcel D26 =  matrix(two[4,2]), nformat("##.#%")

// 3 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 3, nofreq cell matcell(three)
mata: st_matrix("three", (st_matrix("three"):/ sum(st_matrix("three"))))
matrix list three, format("%3.2f") 

putexcel D27 =  matrix(three[1,1]), nformat("##.#%")
putexcel D28 =  matrix(three[2,1]), nformat("##.#%")
putexcel D29 =  matrix(three[3,1]), nformat("##.#%")
putexcel D30 =  matrix(three[4,1]), nformat("##.#%")
putexcel D31 =  matrix(three[1,2]), nformat("##.#%")
putexcel D32 =  matrix(three[2,2]), nformat("##.#%")
putexcel D33 =  matrix(three[3,2]), nformat("##.#%")
putexcel D34 =  matrix(three[4,2]), nformat("##.#%")

// 4 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 4, nofreq cell matcell(four)
mata: st_matrix("four", (st_matrix("four"):/ sum(st_matrix("four"))))
matrix list four, format("%3.2f") 

putexcel D35 =  matrix(four[1,1]), nformat("##.#%")
putexcel D36 =  matrix(four[2,1]), nformat("##.#%")
putexcel D37 =  matrix(four[3,1]), nformat("##.#%")
putexcel D38 =  matrix(four[4,1]), nformat("##.#%")
putexcel D39 =  matrix(four[1,2]), nformat("##.#%")
putexcel D40 =  matrix(four[2,2]), nformat("##.#%")
putexcel D41 =  matrix(four[3,2]), nformat("##.#%")
putexcel D42 =  matrix(four[4,2]), nformat("##.#%")


// 5 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 5, nofreq cell matcell(five)
mata: st_matrix("five", (st_matrix("five"):/ sum(st_matrix("five"))))
matrix list five, format("%3.2f") 

putexcel D43 =  matrix(five[1,1]), nformat("##.#%")
putexcel D44 =  matrix(five[2,1]), nformat("##.#%")
putexcel D45 =  matrix(five[3,1]), nformat("##.#%")
putexcel D46 =  matrix(five[4,1]), nformat("##.#%")
putexcel D47 =  matrix(five[1,2]), nformat("##.#%")
putexcel D48 =  matrix(five[2,2]), nformat("##.#%")
putexcel D49 =  matrix(five[3,2]), nformat("##.#%")
putexcel D50 =  matrix(five[4,2]), nformat("##.#%")

// 6 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 6, nofreq cell matcell(six)
mata: st_matrix("six", (st_matrix("six"):/ sum(st_matrix("six"))))
matrix list six, format("%3.2f") 

putexcel D51 =  matrix(six[1,1]), nformat("##.#%")
putexcel D52 =  matrix(six[2,1]), nformat("##.#%")
putexcel D53 =  matrix(six[3,1]), nformat("##.#%")
putexcel D54 =  matrix(six[4,1]), nformat("##.#%")
putexcel D55 =  matrix(six[1,2]), nformat("##.#%")
putexcel D56 =  matrix(six[2,2]), nformat("##.#%")
putexcel D57 =  matrix(six[3,2]), nformat("##.#%")
putexcel D58 =  matrix(six[4,2]), nformat("##.#%")

// 7 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 7, nofreq cell matcell(seven)
mata: st_matrix("seven", (st_matrix("seven"):/ sum(st_matrix("seven"))))
matrix list seven, format("%3.2f") 

putexcel D59 =  matrix(seven[1,1]), nformat("##.#%")
putexcel D60 =  matrix(seven[2,1]), nformat("##.#%")
putexcel D61 =  matrix(seven[3,1]), nformat("##.#%")
putexcel D62 =  matrix(seven[4,1]), nformat("##.#%")
putexcel D63 =  matrix(seven[1,2]), nformat("##.#%")
putexcel D64 =  matrix(seven[2,2]), nformat("##.#%")
putexcel D65 =  matrix(seven[3,2]), nformat("##.#%")
putexcel D66 =  matrix(seven[4,2]), nformat("##.#%")

// 8 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 8, nofreq cell matcell(eight)
mata: st_matrix("eight", (st_matrix("eight"):/ sum(st_matrix("eight"))))
matrix list eight, format("%3.2f") 

putexcel D67 =  matrix(eight[1,1]), nformat("##.#%")
putexcel D68 =  matrix(eight[2,1]), nformat("##.#%")
putexcel D69 =  matrix(eight[3,1]), nformat("##.#%")
putexcel D70 =  matrix(eight[4,1]), nformat("##.#%")
putexcel D71 =  matrix(eight[1,2]), nformat("##.#%")
putexcel D72 =  matrix(eight[2,2]), nformat("##.#%")
putexcel D73 =  matrix(eight[3,2]), nformat("##.#%")
putexcel D74 =  matrix(eight[4,2]), nformat("##.#%")


// 9 year
tab education_new SEX [aw= SAMPLING_WEIGHT_CC_1997] if totaldurationinhh2432 == 9, nofreq cell matcell(nine)
mata: st_matrix("nine", (st_matrix("nine"):/ sum(st_matrix("nine"))))
matrix list nine, format("%3.2f") 

putexcel D75 =  matrix(nine[1,1]), nformat("##.#%")
putexcel D76 =  matrix(nine[2,1]), nformat("##.#%")
putexcel D77 =  matrix(nine[3,1]), nformat("##.#%")
putexcel D78 =  matrix(nine[4,1]), nformat("##.#%")
putexcel D79 =  matrix(nine[1,2]), nformat("##.#%")
putexcel D80 =  matrix(nine[2,2]), nformat("##.#%")
putexcel D81 =  matrix(nine[3,2]), nformat("##.#%")
putexcel D82 =  matrix(nine[4,2]), nformat("##.#%")
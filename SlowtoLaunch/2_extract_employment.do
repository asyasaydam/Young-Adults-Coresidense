********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Extract and Rename employment variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: This file extracts employment related variables 

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_emplo_`logdate'.log", t replace


import delimited "$NLSY1997\HITAemplo.csv"
rename *, upper


label define vlE0011406 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011406 vlE0011406

label define vlE0011407 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011407 vlE0011407

label define vlE0011408 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011408 vlE0011408

label define vlE0011409 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011409 vlE0011409

label define vlE0011410 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011410 vlE0011410

label define vlE0011411 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011411 vlE0011411

label define vlE0011412 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011412 vlE0011412

label define vlE0011413 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011413 vlE0011413

label define vlE0011414 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011414 vlE0011414

label define vlE0011415 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011415 vlE0011415

label define vlE0011416 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011416 vlE0011416

label define vlE0011417 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011417 vlE0011417

label define vlE0011418 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011418 vlE0011418

label define vlE0011419 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011419 vlE0011419

label define vlE0011420 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011420 vlE0011420

label define vlE0011421 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011421 vlE0011421

label define vlE0011422 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011422 vlE0011422

label define vlE0011423 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011423 vlE0011423

label define vlE0011424 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011424 vlE0011424

label define vlE0011425 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011425 vlE0011425

label define vlE0011426 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011426 vlE0011426

label define vlE0011427 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011427 vlE0011427

label define vlE0011428 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011428 vlE0011428

label define vlE0011429 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011429 vlE0011429

label define vlE0011430 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011430 vlE0011430

label define vlE0011431 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011431 vlE0011431

label define vlE0011432 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011432 vlE0011432

label define vlE0011433 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011433 vlE0011433

label define vlE0011434 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011434 vlE0011434

label define vlE0011435 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011435 vlE0011435

label define vlE0011436 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011436 vlE0011436

label define vlE0011437 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011437 vlE0011437

label define vlE0011438 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011438 vlE0011438

label define vlE0011439 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011439 vlE0011439

label define vlE0011440 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011440 vlE0011440

label define vlE0011441 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011441 vlE0011441

label define vlE0011442 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011442 vlE0011442

label define vlE0011443 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011443 vlE0011443

label define vlE0011444 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011444 vlE0011444

label define vlE0011445 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011445 vlE0011445

label define vlE0011446 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011446 vlE0011446

label define vlE0011447 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011447 vlE0011447

label define vlE0011448 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011448 vlE0011448

label define vlE0011449 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011449 vlE0011449

label define vlE0011450 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011450 vlE0011450

label define vlE0011451 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011451 vlE0011451

label define vlE0011452 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011452 vlE0011452

label define vlE0011453 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011453 vlE0011453

label define vlE0011501 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011501 vlE0011501

label define vlE0011502 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011502 vlE0011502

label define vlE0011503 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011503 vlE0011503

label define vlE0011504 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011504 vlE0011504

label define vlE0011505 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011505 vlE0011505

label define vlE0011506 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011506 vlE0011506

label define vlE0011507 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011507 vlE0011507

label define vlE0011508 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011508 vlE0011508

label define vlE0011509 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011509 vlE0011509

label define vlE0011510 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011510 vlE0011510

label define vlE0011511 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011511 vlE0011511

label define vlE0011512 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011512 vlE0011512

label define vlE0011513 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011513 vlE0011513

label define vlE0011514 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011514 vlE0011514

label define vlE0011515 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011515 vlE0011515

label define vlE0011516 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011516 vlE0011516

label define vlE0011517 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011517 vlE0011517

label define vlE0011518 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011518 vlE0011518

label define vlE0011519 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011519 vlE0011519

label define vlE0011520 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011520 vlE0011520

label define vlE0011521 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011521 vlE0011521

label define vlE0011522 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011522 vlE0011522

label define vlE0011523 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011523 vlE0011523

label define vlE0011524 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011524 vlE0011524

label define vlE0011525 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011525 vlE0011525

label define vlE0011526 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011526 vlE0011526

label define vlE0011527 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011527 vlE0011527

label define vlE0011528 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011528 vlE0011528

label define vlE0011529 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011529 vlE0011529

label define vlE0011530 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011530 vlE0011530

label define vlE0011531 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011531 vlE0011531

label define vlE0011532 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011532 vlE0011532

label define vlE0011533 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011533 vlE0011533

label define vlE0011534 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011534 vlE0011534

label define vlE0011535 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011535 vlE0011535

label define vlE0011536 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011536 vlE0011536

label define vlE0011537 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011537 vlE0011537

label define vlE0011538 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011538 vlE0011538

label define vlE0011539 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011539 vlE0011539

label define vlE0011540 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011540 vlE0011540

label define vlE0011541 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011541 vlE0011541

label define vlE0011542 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011542 vlE0011542

label define vlE0011543 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011543 vlE0011543

label define vlE0011544 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011544 vlE0011544

label define vlE0011545 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011545 vlE0011545

label define vlE0011546 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011546 vlE0011546

label define vlE0011547 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011547 vlE0011547

label define vlE0011548 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011548 vlE0011548

label define vlE0011549 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011549 vlE0011549

label define vlE0011550 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011550 vlE0011550

label define vlE0011551 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011551 vlE0011551

label define vlE0011552 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011552 vlE0011552

label define vlE0011601 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011601 vlE0011601

label define vlE0011602 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011602 vlE0011602

label define vlE0011603 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011603 vlE0011603

label define vlE0011604 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011604 vlE0011604

label define vlE0011605 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011605 vlE0011605

label define vlE0011606 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011606 vlE0011606

label define vlE0011607 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011607 vlE0011607

label define vlE0011608 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011608 vlE0011608

label define vlE0011609 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011609 vlE0011609

label define vlE0011610 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011610 vlE0011610

label define vlE0011611 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011611 vlE0011611

label define vlE0011612 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011612 vlE0011612

label define vlE0011613 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011613 vlE0011613

label define vlE0011614 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011614 vlE0011614

label define vlE0011615 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011615 vlE0011615

label define vlE0011616 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011616 vlE0011616

label define vlE0011617 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011617 vlE0011617

label define vlE0011618 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011618 vlE0011618

label define vlE0011619 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011619 vlE0011619

label define vlE0011620 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011620 vlE0011620

label define vlE0011621 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011621 vlE0011621

label define vlE0011622 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011622 vlE0011622

label define vlE0011623 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011623 vlE0011623

label define vlE0011624 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011624 vlE0011624

label define vlE0011625 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011625 vlE0011625

label define vlE0011626 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011626 vlE0011626

label define vlE0011627 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011627 vlE0011627

label define vlE0011628 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011628 vlE0011628

label define vlE0011629 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011629 vlE0011629

label define vlE0011630 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011630 vlE0011630

label define vlE0011631 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011631 vlE0011631

label define vlE0011632 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011632 vlE0011632

label define vlE0011633 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011633 vlE0011633

label define vlE0011634 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011634 vlE0011634

label define vlE0011635 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011635 vlE0011635

label define vlE0011636 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011636 vlE0011636

label define vlE0011637 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011637 vlE0011637

label define vlE0011638 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011638 vlE0011638

label define vlE0011639 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011639 vlE0011639

label define vlE0011640 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011640 vlE0011640

label define vlE0011641 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011641 vlE0011641

label define vlE0011642 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011642 vlE0011642

label define vlE0011643 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011643 vlE0011643

label define vlE0011644 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011644 vlE0011644

label define vlE0011645 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011645 vlE0011645

label define vlE0011646 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011646 vlE0011646

label define vlE0011647 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011647 vlE0011647

label define vlE0011648 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011648 vlE0011648

label define vlE0011649 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011649 vlE0011649

label define vlE0011650 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011650 vlE0011650

label define vlE0011651 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011651 vlE0011651

label define vlE0011652 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011652 vlE0011652

label define vlE0011701 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011701 vlE0011701

label define vlE0011702 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011702 vlE0011702

label define vlE0011703 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011703 vlE0011703

label define vlE0011704 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011704 vlE0011704

label define vlE0011705 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011705 vlE0011705

label define vlE0011706 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011706 vlE0011706

label define vlE0011707 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011707 vlE0011707

label define vlE0011708 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011708 vlE0011708

label define vlE0011709 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011709 vlE0011709

label define vlE0011710 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011710 vlE0011710

label define vlE0011711 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011711 vlE0011711

label define vlE0011712 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011712 vlE0011712

label define vlE0011713 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011713 vlE0011713

label define vlE0011714 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011714 vlE0011714

label define vlE0011715 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011715 vlE0011715

label define vlE0011716 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011716 vlE0011716

label define vlE0011717 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011717 vlE0011717

label define vlE0011718 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011718 vlE0011718

label define vlE0011719 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011719 vlE0011719

label define vlE0011720 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011720 vlE0011720

label define vlE0011721 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011721 vlE0011721

label define vlE0011722 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011722 vlE0011722

label define vlE0011723 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011723 vlE0011723

label define vlE0011724 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011724 vlE0011724

label define vlE0011725 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011725 vlE0011725

label define vlE0011726 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011726 vlE0011726

label define vlE0011727 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011727 vlE0011727

label define vlE0011728 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011728 vlE0011728

label define vlE0011729 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011729 vlE0011729

label define vlE0011730 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011730 vlE0011730

label define vlE0011731 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011731 vlE0011731

label define vlE0011732 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011732 vlE0011732

label define vlE0011733 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011733 vlE0011733

label define vlE0011734 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011734 vlE0011734

label define vlE0011735 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011735 vlE0011735

label define vlE0011736 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011736 vlE0011736

label define vlE0011737 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011737 vlE0011737

label define vlE0011738 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011738 vlE0011738

label define vlE0011739 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011739 vlE0011739

label define vlE0011740 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011740 vlE0011740

label define vlE0011741 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011741 vlE0011741

label define vlE0011742 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011742 vlE0011742

label define vlE0011743 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011743 vlE0011743

label define vlE0011744 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011744 vlE0011744

label define vlE0011745 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011745 vlE0011745

label define vlE0011746 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011746 vlE0011746

label define vlE0011747 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011747 vlE0011747

label define vlE0011748 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011748 vlE0011748

label define vlE0011749 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011749 vlE0011749

label define vlE0011750 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011750 vlE0011750

label define vlE0011751 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011751 vlE0011751

label define vlE0011752 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011752 vlE0011752

label define vlE0011801 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011801 vlE0011801

label define vlE0011802 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011802 vlE0011802

label define vlE0011803 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011803 vlE0011803

label define vlE0011804 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011804 vlE0011804

label define vlE0011805 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011805 vlE0011805

label define vlE0011806 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011806 vlE0011806

label define vlE0011807 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011807 vlE0011807

label define vlE0011808 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011808 vlE0011808

label define vlE0011809 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011809 vlE0011809

label define vlE0011810 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011810 vlE0011810

label define vlE0011811 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011811 vlE0011811

label define vlE0011812 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011812 vlE0011812

label define vlE0011813 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011813 vlE0011813

label define vlE0011814 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011814 vlE0011814

label define vlE0011815 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011815 vlE0011815

label define vlE0011816 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011816 vlE0011816

label define vlE0011817 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011817 vlE0011817

label define vlE0011818 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011818 vlE0011818

label define vlE0011819 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011819 vlE0011819

label define vlE0011820 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011820 vlE0011820

label define vlE0011821 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011821 vlE0011821

label define vlE0011822 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011822 vlE0011822

label define vlE0011823 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011823 vlE0011823

label define vlE0011824 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011824 vlE0011824

label define vlE0011825 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011825 vlE0011825

label define vlE0011826 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011826 vlE0011826

label define vlE0011827 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011827 vlE0011827

label define vlE0011828 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011828 vlE0011828

label define vlE0011829 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011829 vlE0011829

label define vlE0011830 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011830 vlE0011830

label define vlE0011831 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011831 vlE0011831

label define vlE0011832 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011832 vlE0011832

label define vlE0011833 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011833 vlE0011833

label define vlE0011834 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011834 vlE0011834

label define vlE0011835 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011835 vlE0011835

label define vlE0011836 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011836 vlE0011836

label define vlE0011837 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011837 vlE0011837

label define vlE0011838 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011838 vlE0011838

label define vlE0011839 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011839 vlE0011839

label define vlE0011840 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011840 vlE0011840

label define vlE0011841 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011841 vlE0011841

label define vlE0011842 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011842 vlE0011842

label define vlE0011843 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011843 vlE0011843

label define vlE0011844 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011844 vlE0011844

label define vlE0011845 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011845 vlE0011845

label define vlE0011846 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011846 vlE0011846

label define vlE0011847 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011847 vlE0011847

label define vlE0011848 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011848 vlE0011848

label define vlE0011849 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011849 vlE0011849

label define vlE0011850 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011850 vlE0011850

label define vlE0011851 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011851 vlE0011851

label define vlE0011852 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011852 vlE0011852

label define vlE0011901 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011901 vlE0011901

label define vlE0011902 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011902 vlE0011902

label define vlE0011903 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011903 vlE0011903

label define vlE0011904 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011904 vlE0011904

label define vlE0011905 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011905 vlE0011905

label define vlE0011906 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011906 vlE0011906

label define vlE0011907 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011907 vlE0011907

label define vlE0011908 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011908 vlE0011908

label define vlE0011909 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011909 vlE0011909

label define vlE0011910 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011910 vlE0011910

label define vlE0011911 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011911 vlE0011911

label define vlE0011912 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011912 vlE0011912

label define vlE0011913 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011913 vlE0011913

label define vlE0011914 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011914 vlE0011914

label define vlE0011915 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011915 vlE0011915

label define vlE0011916 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011916 vlE0011916

label define vlE0011917 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011917 vlE0011917

label define vlE0011918 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011918 vlE0011918

label define vlE0011919 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011919 vlE0011919

label define vlE0011920 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011920 vlE0011920

label define vlE0011921 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011921 vlE0011921

label define vlE0011922 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011922 vlE0011922

label define vlE0011923 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011923 vlE0011923

label define vlE0011924 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011924 vlE0011924

label define vlE0011925 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011925 vlE0011925

label define vlE0011926 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011926 vlE0011926

label define vlE0011927 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011927 vlE0011927

label define vlE0011928 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011928 vlE0011928

label define vlE0011929 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011929 vlE0011929

label define vlE0011930 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011930 vlE0011930

label define vlE0011931 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011931 vlE0011931

label define vlE0011932 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011932 vlE0011932

label define vlE0011933 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011933 vlE0011933

label define vlE0011934 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011934 vlE0011934

label define vlE0011935 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011935 vlE0011935

label define vlE0011936 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011936 vlE0011936

label define vlE0011937 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011937 vlE0011937

label define vlE0011938 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011938 vlE0011938

label define vlE0011939 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011939 vlE0011939

label define vlE0011940 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011940 vlE0011940

label define vlE0011941 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011941 vlE0011941

label define vlE0011942 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011942 vlE0011942

label define vlE0011943 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011943 vlE0011943

label define vlE0011944 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011944 vlE0011944

label define vlE0011945 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011945 vlE0011945

label define vlE0011946 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011946 vlE0011946

label define vlE0011947 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011947 vlE0011947

label define vlE0011948 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011948 vlE0011948

label define vlE0011949 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011949 vlE0011949

label define vlE0011950 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011950 vlE0011950

label define vlE0011951 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011951 vlE0011951

label define vlE0011952 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0011952 vlE0011952

label define vlE0012001 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012001 vlE0012001

label define vlE0012002 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012002 vlE0012002

label define vlE0012003 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012003 vlE0012003

label define vlE0012004 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012004 vlE0012004

label define vlE0012005 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012005 vlE0012005

label define vlE0012006 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012006 vlE0012006

label define vlE0012007 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012007 vlE0012007

label define vlE0012008 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012008 vlE0012008

label define vlE0012009 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012009 vlE0012009

label define vlE0012010 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012010 vlE0012010

label define vlE0012011 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012011 vlE0012011

label define vlE0012012 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012012 vlE0012012

label define vlE0012013 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012013 vlE0012013

label define vlE0012014 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012014 vlE0012014

label define vlE0012015 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012015 vlE0012015

label define vlE0012016 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012016 vlE0012016

label define vlE0012017 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012017 vlE0012017

label define vlE0012018 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012018 vlE0012018

label define vlE0012019 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012019 vlE0012019

label define vlE0012020 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012020 vlE0012020

label define vlE0012021 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012021 vlE0012021

label define vlE0012022 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012022 vlE0012022

label define vlE0012023 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012023 vlE0012023

label define vlE0012024 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012024 vlE0012024

label define vlE0012025 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012025 vlE0012025

label define vlE0012026 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012026 vlE0012026

label define vlE0012027 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012027 vlE0012027

label define vlE0012028 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012028 vlE0012028

label define vlE0012029 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012029 vlE0012029

label define vlE0012030 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012030 vlE0012030

label define vlE0012031 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012031 vlE0012031

label define vlE0012032 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012032 vlE0012032

label define vlE0012033 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012033 vlE0012033

label define vlE0012034 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012034 vlE0012034

label define vlE0012035 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012035 vlE0012035

label define vlE0012036 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012036 vlE0012036

label define vlE0012037 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012037 vlE0012037

label define vlE0012038 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012038 vlE0012038

label define vlE0012039 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012039 vlE0012039

label define vlE0012040 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012040 vlE0012040

label define vlE0012041 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012041 vlE0012041

label define vlE0012042 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012042 vlE0012042

label define vlE0012043 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012043 vlE0012043

label define vlE0012044 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012044 vlE0012044

label define vlE0012045 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012045 vlE0012045

label define vlE0012046 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012046 vlE0012046

label define vlE0012047 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012047 vlE0012047

label define vlE0012048 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012048 vlE0012048

label define vlE0012049 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012049 vlE0012049

label define vlE0012050 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012050 vlE0012050

label define vlE0012051 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012051 vlE0012051

label define vlE0012052 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012052 vlE0012052

label define vlE0012053 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012053 vlE0012053

label define vlE0012101 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012101 vlE0012101

label define vlE0012102 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012102 vlE0012102

label define vlE0012103 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012103 vlE0012103

label define vlE0012104 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012104 vlE0012104

label define vlE0012105 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012105 vlE0012105

label define vlE0012106 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012106 vlE0012106

label define vlE0012107 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012107 vlE0012107

label define vlE0012108 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012108 vlE0012108

label define vlE0012109 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012109 vlE0012109

label define vlE0012110 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012110 vlE0012110

label define vlE0012111 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012111 vlE0012111

label define vlE0012112 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012112 vlE0012112

label define vlE0012113 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012113 vlE0012113

label define vlE0012114 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012114 vlE0012114

label define vlE0012115 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012115 vlE0012115

label define vlE0012116 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012116 vlE0012116

label define vlE0012117 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012117 vlE0012117

label define vlE0012118 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012118 vlE0012118

label define vlE0012119 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012119 vlE0012119

label define vlE0012120 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012120 vlE0012120

label define vlE0012121 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012121 vlE0012121

label define vlE0012122 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012122 vlE0012122

label define vlE0012123 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012123 vlE0012123

label define vlE0012124 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012124 vlE0012124

label define vlE0012125 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012125 vlE0012125

label define vlE0012126 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012126 vlE0012126

label define vlE0012127 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012127 vlE0012127

label define vlE0012128 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012128 vlE0012128

label define vlE0012129 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012129 vlE0012129

label define vlE0012130 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012130 vlE0012130

label define vlE0012131 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012131 vlE0012131

label define vlE0012132 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012132 vlE0012132

label define vlE0012133 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012133 vlE0012133

label define vlE0012134 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012134 vlE0012134

label define vlE0012135 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012135 vlE0012135

label define vlE0012136 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012136 vlE0012136

label define vlE0012137 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012137 vlE0012137

label define vlE0012138 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012138 vlE0012138

label define vlE0012139 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012139 vlE0012139

label define vlE0012140 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012140 vlE0012140

label define vlE0012141 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012141 vlE0012141

label define vlE0012142 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012142 vlE0012142

label define vlE0012143 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012143 vlE0012143

label define vlE0012144 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012144 vlE0012144

label define vlE0012145 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012145 vlE0012145

label define vlE0012146 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012146 vlE0012146

label define vlE0012147 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012147 vlE0012147

label define vlE0012148 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012148 vlE0012148

label define vlE0012149 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012149 vlE0012149

label define vlE0012150 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012150 vlE0012150

label define vlE0012151 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012151 vlE0012151

label define vlE0012152 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012152 vlE0012152

label define vlE0012201 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012201 vlE0012201

label define vlE0012202 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012202 vlE0012202

label define vlE0012203 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012203 vlE0012203

label define vlE0012204 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012204 vlE0012204

label define vlE0012205 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012205 vlE0012205

label define vlE0012206 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012206 vlE0012206

label define vlE0012207 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012207 vlE0012207

label define vlE0012208 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012208 vlE0012208

label define vlE0012209 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012209 vlE0012209

label define vlE0012210 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012210 vlE0012210

label define vlE0012211 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012211 vlE0012211

label define vlE0012212 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012212 vlE0012212

label define vlE0012213 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012213 vlE0012213

label define vlE0012214 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012214 vlE0012214

label define vlE0012215 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012215 vlE0012215

label define vlE0012216 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012216 vlE0012216

label define vlE0012217 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012217 vlE0012217

label define vlE0012218 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012218 vlE0012218

label define vlE0012219 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012219 vlE0012219

label define vlE0012220 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012220 vlE0012220

label define vlE0012221 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012221 vlE0012221

label define vlE0012222 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012222 vlE0012222

label define vlE0012223 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012223 vlE0012223

label define vlE0012224 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012224 vlE0012224

label define vlE0012225 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012225 vlE0012225

label define vlE0012226 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012226 vlE0012226

label define vlE0012227 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012227 vlE0012227

label define vlE0012228 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012228 vlE0012228

label define vlE0012229 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012229 vlE0012229

label define vlE0012230 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012230 vlE0012230

label define vlE0012231 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012231 vlE0012231

label define vlE0012232 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012232 vlE0012232

label define vlE0012233 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012233 vlE0012233

label define vlE0012234 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012234 vlE0012234

label define vlE0012235 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012235 vlE0012235

label define vlE0012236 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012236 vlE0012236

label define vlE0012237 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012237 vlE0012237

label define vlE0012238 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012238 vlE0012238

label define vlE0012239 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012239 vlE0012239

label define vlE0012240 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012240 vlE0012240

label define vlE0012241 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012241 vlE0012241

label define vlE0012242 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012242 vlE0012242

label define vlE0012243 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012243 vlE0012243

label define vlE0012244 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012244 vlE0012244

label define vlE0012245 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012245 vlE0012245

label define vlE0012246 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012246 vlE0012246

label define vlE0012247 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012247 vlE0012247

label define vlE0012248 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012248 vlE0012248

label define vlE0012249 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012249 vlE0012249

label define vlE0012250 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012250 vlE0012250

label define vlE0012251 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012251 vlE0012251

label define vlE0012252 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012252 vlE0012252

label define vlE0012301 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012301 vlE0012301

label define vlE0012302 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012302 vlE0012302

label define vlE0012303 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012303 vlE0012303

label define vlE0012304 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012304 vlE0012304

label define vlE0012305 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012305 vlE0012305

label define vlE0012306 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012306 vlE0012306

label define vlE0012307 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012307 vlE0012307

label define vlE0012308 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012308 vlE0012308

label define vlE0012309 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012309 vlE0012309

label define vlE0012310 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012310 vlE0012310

label define vlE0012311 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012311 vlE0012311

label define vlE0012312 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012312 vlE0012312

label define vlE0012313 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012313 vlE0012313

label define vlE0012314 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012314 vlE0012314

label define vlE0012315 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012315 vlE0012315

label define vlE0012316 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012316 vlE0012316

label define vlE0012317 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012317 vlE0012317

label define vlE0012318 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012318 vlE0012318

label define vlE0012319 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012319 vlE0012319

label define vlE0012320 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012320 vlE0012320

label define vlE0012321 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012321 vlE0012321

label define vlE0012322 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012322 vlE0012322

label define vlE0012323 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012323 vlE0012323

label define vlE0012324 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012324 vlE0012324

label define vlE0012325 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012325 vlE0012325

label define vlE0012326 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012326 vlE0012326

label define vlE0012327 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012327 vlE0012327

label define vlE0012328 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012328 vlE0012328

label define vlE0012329 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012329 vlE0012329

label define vlE0012330 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012330 vlE0012330

label define vlE0012331 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012331 vlE0012331

label define vlE0012332 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012332 vlE0012332

label define vlE0012333 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012333 vlE0012333

label define vlE0012334 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012334 vlE0012334

label define vlE0012335 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012335 vlE0012335

label define vlE0012336 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012336 vlE0012336

label define vlE0012337 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012337 vlE0012337

label define vlE0012338 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012338 vlE0012338

label define vlE0012339 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012339 vlE0012339

label define vlE0012340 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012340 vlE0012340

label define vlE0012341 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012341 vlE0012341

label define vlE0012342 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012342 vlE0012342

label define vlE0012343 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012343 vlE0012343

label define vlE0012344 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012344 vlE0012344

label define vlE0012345 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012345 vlE0012345

label define vlE0012346 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012346 vlE0012346

label define vlE0012347 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012347 vlE0012347

label define vlE0012348 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012348 vlE0012348

label define vlE0012349 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012349 vlE0012349

label define vlE0012350 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012350 vlE0012350

label define vlE0012351 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012351 vlE0012351

label define vlE0012352 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012352 vlE0012352

label define vlE0012401 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012401 vlE0012401

label define vlE0012402 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012402 vlE0012402

label define vlE0012403 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012403 vlE0012403

label define vlE0012404 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012404 vlE0012404

label define vlE0012405 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012405 vlE0012405

label define vlE0012406 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012406 vlE0012406

label define vlE0012407 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012407 vlE0012407

label define vlE0012408 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012408 vlE0012408

label define vlE0012409 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012409 vlE0012409

label define vlE0012410 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012410 vlE0012410

label define vlE0012411 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012411 vlE0012411

label define vlE0012412 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012412 vlE0012412

label define vlE0012413 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012413 vlE0012413

label define vlE0012414 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012414 vlE0012414

label define vlE0012415 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012415 vlE0012415

label define vlE0012416 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012416 vlE0012416

label define vlE0012417 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012417 vlE0012417

label define vlE0012418 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012418 vlE0012418

label define vlE0012419 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012419 vlE0012419

label define vlE0012420 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012420 vlE0012420

label define vlE0012421 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012421 vlE0012421

label define vlE0012422 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012422 vlE0012422

label define vlE0012423 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012423 vlE0012423

label define vlE0012424 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012424 vlE0012424

label define vlE0012425 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012425 vlE0012425

label define vlE0012426 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012426 vlE0012426

label define vlE0012427 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012427 vlE0012427

label define vlE0012428 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012428 vlE0012428

label define vlE0012429 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012429 vlE0012429

label define vlE0012430 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012430 vlE0012430

label define vlE0012431 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012431 vlE0012431

label define vlE0012432 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012432 vlE0012432

label define vlE0012433 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012433 vlE0012433

label define vlE0012434 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012434 vlE0012434

label define vlE0012435 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012435 vlE0012435

label define vlE0012436 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012436 vlE0012436

label define vlE0012437 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012437 vlE0012437

label define vlE0012438 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012438 vlE0012438

label define vlE0012439 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012439 vlE0012439

label define vlE0012440 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012440 vlE0012440

label define vlE0012441 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012441 vlE0012441

label define vlE0012442 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012442 vlE0012442

label define vlE0012443 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012443 vlE0012443

label define vlE0012444 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012444 vlE0012444

label define vlE0012445 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012445 vlE0012445

label define vlE0012446 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012446 vlE0012446

label define vlE0012447 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012447 vlE0012447

label define vlE0012448 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012448 vlE0012448

label define vlE0012449 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012449 vlE0012449

label define vlE0012450 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012450 vlE0012450

label define vlE0012451 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012451 vlE0012451

label define vlE0012452 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012452 vlE0012452

label define vlE0012501 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012501 vlE0012501

label define vlE0012502 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012502 vlE0012502

label define vlE0012503 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012503 vlE0012503

label define vlE0012504 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012504 vlE0012504

label define vlE0012505 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012505 vlE0012505

label define vlE0012506 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012506 vlE0012506

label define vlE0012507 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012507 vlE0012507

label define vlE0012508 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012508 vlE0012508

label define vlE0012509 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012509 vlE0012509

label define vlE0012510 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012510 vlE0012510

label define vlE0012511 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012511 vlE0012511

label define vlE0012512 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012512 vlE0012512

label define vlE0012513 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012513 vlE0012513

label define vlE0012514 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012514 vlE0012514

label define vlE0012515 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012515 vlE0012515

label define vlE0012516 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012516 vlE0012516

label define vlE0012517 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012517 vlE0012517

label define vlE0012518 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012518 vlE0012518

label define vlE0012519 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012519 vlE0012519

label define vlE0012520 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012520 vlE0012520

label define vlE0012521 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012521 vlE0012521

label define vlE0012522 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012522 vlE0012522

label define vlE0012523 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012523 vlE0012523

label define vlE0012524 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012524 vlE0012524

label define vlE0012525 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012525 vlE0012525

label define vlE0012526 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012526 vlE0012526

label define vlE0012527 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012527 vlE0012527

label define vlE0012528 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012528 vlE0012528

label define vlE0012529 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012529 vlE0012529

label define vlE0012530 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012530 vlE0012530

label define vlE0012531 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012531 vlE0012531

label define vlE0012532 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012532 vlE0012532

label define vlE0012533 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012533 vlE0012533

label define vlE0012534 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012534 vlE0012534

label define vlE0012535 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012535 vlE0012535

label define vlE0012536 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012536 vlE0012536

label define vlE0012537 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012537 vlE0012537

label define vlE0012538 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012538 vlE0012538

label define vlE0012539 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012539 vlE0012539

label define vlE0012540 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012540 vlE0012540

label define vlE0012541 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012541 vlE0012541

label define vlE0012542 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012542 vlE0012542

label define vlE0012543 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012543 vlE0012543

label define vlE0012544 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012544 vlE0012544

label define vlE0012545 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012545 vlE0012545

label define vlE0012546 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012546 vlE0012546

label define vlE0012547 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012547 vlE0012547

label define vlE0012548 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012548 vlE0012548

label define vlE0012549 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012549 vlE0012549

label define vlE0012550 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012550 vlE0012550

label define vlE0012551 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012551 vlE0012551

label define vlE0012552 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012552 vlE0012552

label define vlE0012553 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012553 vlE0012553

label define vlE0012601 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012601 vlE0012601

label define vlE0012602 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012602 vlE0012602

label define vlE0012603 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012603 vlE0012603

label define vlE0012604 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012604 vlE0012604

label define vlE0012605 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012605 vlE0012605

label define vlE0012606 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012606 vlE0012606

label define vlE0012607 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012607 vlE0012607

label define vlE0012608 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012608 vlE0012608

label define vlE0012609 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012609 vlE0012609

label define vlE0012610 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012610 vlE0012610

label define vlE0012611 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012611 vlE0012611

label define vlE0012612 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012612 vlE0012612

label define vlE0012613 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012613 vlE0012613

label define vlE0012614 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012614 vlE0012614

label define vlE0012615 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012615 vlE0012615

label define vlE0012616 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012616 vlE0012616

label define vlE0012617 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012617 vlE0012617

label define vlE0012618 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012618 vlE0012618

label define vlE0012619 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012619 vlE0012619

label define vlE0012620 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012620 vlE0012620

label define vlE0012621 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012621 vlE0012621

label define vlE0012622 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012622 vlE0012622

label define vlE0012623 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012623 vlE0012623

label define vlE0012624 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012624 vlE0012624

label define vlE0012625 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012625 vlE0012625

label define vlE0012626 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012626 vlE0012626

label define vlE0012627 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012627 vlE0012627

label define vlE0012628 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012628 vlE0012628

label define vlE0012629 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012629 vlE0012629

label define vlE0012630 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012630 vlE0012630

label define vlE0012631 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012631 vlE0012631

label define vlE0012632 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012632 vlE0012632

label define vlE0012633 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012633 vlE0012633

label define vlE0012634 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012634 vlE0012634

label define vlE0012635 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012635 vlE0012635

label define vlE0012636 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012636 vlE0012636

label define vlE0012637 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012637 vlE0012637

label define vlE0012638 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012638 vlE0012638

label define vlE0012639 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012639 vlE0012639

label define vlE0012640 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012640 vlE0012640

label define vlE0012641 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012641 vlE0012641

label define vlE0012642 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012642 vlE0012642

label define vlE0012643 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012643 vlE0012643

label define vlE0012644 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012644 vlE0012644

label define vlE0012645 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012645 vlE0012645

label define vlE0012646 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012646 vlE0012646

label define vlE0012647 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012647 vlE0012647

label define vlE0012648 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012648 vlE0012648

label define vlE0012649 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012649 vlE0012649

label define vlE0012650 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012650 vlE0012650

label define vlE0012651 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012651 vlE0012651

label define vlE0012652 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012652 vlE0012652

label define vlE0012701 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012701 vlE0012701

label define vlE0012702 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012702 vlE0012702

label define vlE0012703 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012703 vlE0012703

label define vlE0012704 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012704 vlE0012704

label define vlE0012705 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012705 vlE0012705

label define vlE0012706 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012706 vlE0012706

label define vlE0012707 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012707 vlE0012707

label define vlE0012708 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012708 vlE0012708

label define vlE0012709 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012709 vlE0012709

label define vlE0012710 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012710 vlE0012710

label define vlE0012711 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012711 vlE0012711

label define vlE0012712 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012712 vlE0012712

label define vlE0012713 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012713 vlE0012713

label define vlE0012714 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012714 vlE0012714

label define vlE0012715 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012715 vlE0012715

label define vlE0012716 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012716 vlE0012716

label define vlE0012717 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012717 vlE0012717

label define vlE0012718 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012718 vlE0012718

label define vlE0012719 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012719 vlE0012719

label define vlE0012720 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012720 vlE0012720

label define vlE0012721 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012721 vlE0012721

label define vlE0012722 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012722 vlE0012722

label define vlE0012723 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012723 vlE0012723

label define vlE0012724 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012724 vlE0012724

label define vlE0012725 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012725 vlE0012725

label define vlE0012726 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012726 vlE0012726

label define vlE0012727 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012727 vlE0012727

label define vlE0012728 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012728 vlE0012728

label define vlE0012729 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012729 vlE0012729

label define vlE0012730 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012730 vlE0012730

label define vlE0012731 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012731 vlE0012731

label define vlE0012732 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012732 vlE0012732

label define vlE0012733 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012733 vlE0012733

label define vlE0012734 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012734 vlE0012734

label define vlE0012735 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012735 vlE0012735

label define vlE0012736 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012736 vlE0012736

label define vlE0012737 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012737 vlE0012737

label define vlE0012738 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012738 vlE0012738

label define vlE0012739 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012739 vlE0012739

label define vlE0012740 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012740 vlE0012740

label define vlE0012741 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012741 vlE0012741

label define vlE0012742 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012742 vlE0012742

label define vlE0012743 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012743 vlE0012743

label define vlE0012744 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012744 vlE0012744

label define vlE0012745 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012745 vlE0012745

label define vlE0012746 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012746 vlE0012746

label define vlE0012747 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012747 vlE0012747

label define vlE0012748 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012748 vlE0012748

label define vlE0012749 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012749 vlE0012749

label define vlE0012750 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012750 vlE0012750

label define vlE0012751 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012751 vlE0012751

label define vlE0012752 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012752 vlE0012752

label define vlE0012801 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012801 vlE0012801

label define vlE0012802 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012802 vlE0012802

label define vlE0012803 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012803 vlE0012803

label define vlE0012804 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012804 vlE0012804

label define vlE0012805 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012805 vlE0012805

label define vlE0012806 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012806 vlE0012806

label define vlE0012807 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012807 vlE0012807

label define vlE0012808 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012808 vlE0012808

label define vlE0012809 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012809 vlE0012809

label define vlE0012810 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012810 vlE0012810

label define vlE0012811 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012811 vlE0012811

label define vlE0012812 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012812 vlE0012812

label define vlE0012813 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012813 vlE0012813

label define vlE0012814 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012814 vlE0012814

label define vlE0012815 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012815 vlE0012815

label define vlE0012816 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012816 vlE0012816

label define vlE0012817 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012817 vlE0012817

label define vlE0012818 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012818 vlE0012818

label define vlE0012819 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012819 vlE0012819

label define vlE0012820 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012820 vlE0012820

label define vlE0012821 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012821 vlE0012821

label define vlE0012822 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012822 vlE0012822

label define vlE0012823 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012823 vlE0012823

label define vlE0012824 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012824 vlE0012824

label define vlE0012825 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012825 vlE0012825

label define vlE0012826 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012826 vlE0012826

label define vlE0012827 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012827 vlE0012827

label define vlE0012828 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012828 vlE0012828

label define vlE0012829 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012829 vlE0012829

label define vlE0012830 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012830 vlE0012830

label define vlE0012831 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012831 vlE0012831

label define vlE0012832 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012832 vlE0012832

label define vlE0012833 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012833 vlE0012833

label define vlE0012834 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012834 vlE0012834

label define vlE0012835 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012835 vlE0012835

label define vlE0012836 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012836 vlE0012836

label define vlE0012837 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012837 vlE0012837

label define vlE0012838 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012838 vlE0012838

label define vlE0012839 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012839 vlE0012839

label define vlE0012840 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012840 vlE0012840

label define vlE0012841 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012841 vlE0012841

label define vlE0012842 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012842 vlE0012842

label define vlE0012843 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012843 vlE0012843

label define vlE0012844 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012844 vlE0012844

label define vlE0012845 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012845 vlE0012845

label define vlE0012846 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012846 vlE0012846

label define vlE0012847 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012847 vlE0012847

label define vlE0012848 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012848 vlE0012848

label define vlE0012849 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012849 vlE0012849

label define vlE0012850 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012850 vlE0012850

label define vlE0012851 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012851 vlE0012851

label define vlE0012852 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012852 vlE0012852

label define vlE0012901 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012901 vlE0012901

label define vlE0012902 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012902 vlE0012902

label define vlE0012903 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012903 vlE0012903

label define vlE0012904 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012904 vlE0012904

label define vlE0012905 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012905 vlE0012905

label define vlE0012906 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012906 vlE0012906

label define vlE0012907 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012907 vlE0012907

label define vlE0012908 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012908 vlE0012908

label define vlE0012909 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012909 vlE0012909

label define vlE0012910 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012910 vlE0012910

label define vlE0012911 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012911 vlE0012911

label define vlE0012912 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012912 vlE0012912

label define vlE0012913 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012913 vlE0012913

label define vlE0012914 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012914 vlE0012914

label define vlE0012915 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012915 vlE0012915

label define vlE0012916 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012916 vlE0012916

label define vlE0012917 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012917 vlE0012917

label define vlE0012918 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012918 vlE0012918

label define vlE0012919 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012919 vlE0012919

label define vlE0012920 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012920 vlE0012920

label define vlE0012921 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012921 vlE0012921

label define vlE0012922 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012922 vlE0012922

label define vlE0012923 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012923 vlE0012923

label define vlE0012924 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012924 vlE0012924

label define vlE0012925 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012925 vlE0012925

label define vlE0012926 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012926 vlE0012926

label define vlE0012927 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012927 vlE0012927

label define vlE0012928 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012928 vlE0012928

label define vlE0012929 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012929 vlE0012929

label define vlE0012930 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012930 vlE0012930

label define vlE0012931 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012931 vlE0012931

label define vlE0012932 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012932 vlE0012932

label define vlE0012933 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012933 vlE0012933

label define vlE0012934 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012934 vlE0012934

label define vlE0012935 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012935 vlE0012935

label define vlE0012936 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012936 vlE0012936

label define vlE0012937 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012937 vlE0012937

label define vlE0012938 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012938 vlE0012938

label define vlE0012939 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012939 vlE0012939

label define vlE0012940 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012940 vlE0012940

label define vlE0012941 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012941 vlE0012941

label define vlE0012942 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012942 vlE0012942

label define vlE0012943 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012943 vlE0012943

label define vlE0012944 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012944 vlE0012944

label define vlE0012945 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012945 vlE0012945

label define vlE0012946 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012946 vlE0012946

label define vlE0012947 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012947 vlE0012947

label define vlE0012948 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012948 vlE0012948

label define vlE0012949 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012949 vlE0012949

label define vlE0012950 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012950 vlE0012950

label define vlE0012951 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012951 vlE0012951

label define vlE0012952 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0012952 vlE0012952

label define vlE0013001 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013001 vlE0013001

label define vlE0013002 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013002 vlE0013002

label define vlE0013003 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013003 vlE0013003

label define vlE0013004 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013004 vlE0013004

label define vlE0013005 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013005 vlE0013005

label define vlE0013006 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013006 vlE0013006

label define vlE0013007 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013007 vlE0013007

label define vlE0013008 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013008 vlE0013008

label define vlE0013009 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013009 vlE0013009

label define vlE0013010 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013010 vlE0013010

label define vlE0013011 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013011 vlE0013011

label define vlE0013012 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013012 vlE0013012

label define vlE0013013 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013013 vlE0013013

label define vlE0013014 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013014 vlE0013014

label define vlE0013015 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013015 vlE0013015

label define vlE0013016 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013016 vlE0013016

label define vlE0013017 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013017 vlE0013017

label define vlE0013018 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013018 vlE0013018

label define vlE0013019 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013019 vlE0013019

label define vlE0013020 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013020 vlE0013020

label define vlE0013021 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013021 vlE0013021

label define vlE0013022 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013022 vlE0013022

label define vlE0013023 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013023 vlE0013023

label define vlE0013024 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013024 vlE0013024

label define vlE0013025 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013025 vlE0013025

label define vlE0013026 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013026 vlE0013026

label define vlE0013027 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013027 vlE0013027

label define vlE0013028 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013028 vlE0013028

label define vlE0013029 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013029 vlE0013029

label define vlE0013030 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013030 vlE0013030

label define vlE0013031 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013031 vlE0013031

label define vlE0013032 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013032 vlE0013032

label define vlE0013033 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013033 vlE0013033

label define vlE0013034 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013034 vlE0013034

label define vlE0013035 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013035 vlE0013035

label define vlE0013036 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013036 vlE0013036

label define vlE0013037 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013037 vlE0013037

label define vlE0013038 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013038 vlE0013038

label define vlE0013039 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013039 vlE0013039

label define vlE0013040 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013040 vlE0013040

label define vlE0013041 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013041 vlE0013041

label define vlE0013042 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013042 vlE0013042

label define vlE0013043 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013043 vlE0013043

label define vlE0013044 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013044 vlE0013044

label define vlE0013045 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013045 vlE0013045

label define vlE0013046 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013046 vlE0013046

label define vlE0013047 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013047 vlE0013047

label define vlE0013048 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013048 vlE0013048

label define vlE0013049 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013049 vlE0013049

label define vlE0013050 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013050 vlE0013050

label define vlE0013051 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013051 vlE0013051

label define vlE0013052 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013052 vlE0013052

label define vlE0013101 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013101 vlE0013101

label define vlE0013102 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013102 vlE0013102

label define vlE0013103 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013103 vlE0013103

label define vlE0013104 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013104 vlE0013104

label define vlE0013105 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013105 vlE0013105

label define vlE0013106 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013106 vlE0013106

label define vlE0013107 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013107 vlE0013107

label define vlE0013108 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013108 vlE0013108

label define vlE0013109 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013109 vlE0013109

label define vlE0013110 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013110 vlE0013110

label define vlE0013111 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013111 vlE0013111

label define vlE0013112 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013112 vlE0013112

label define vlE0013113 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013113 vlE0013113

label define vlE0013114 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013114 vlE0013114

label define vlE0013115 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013115 vlE0013115

label define vlE0013116 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013116 vlE0013116

label define vlE0013117 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013117 vlE0013117

label define vlE0013118 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013118 vlE0013118

label define vlE0013119 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013119 vlE0013119

label define vlE0013120 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013120 vlE0013120

label define vlE0013121 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013121 vlE0013121

label define vlE0013122 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013122 vlE0013122

label define vlE0013123 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013123 vlE0013123

label define vlE0013124 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013124 vlE0013124

label define vlE0013125 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013125 vlE0013125

label define vlE0013126 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013126 vlE0013126

label define vlE0013127 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013127 vlE0013127

label define vlE0013128 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013128 vlE0013128

label define vlE0013129 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013129 vlE0013129

label define vlE0013130 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013130 vlE0013130

label define vlE0013131 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013131 vlE0013131

label define vlE0013132 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013132 vlE0013132

label define vlE0013133 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013133 vlE0013133

label define vlE0013134 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013134 vlE0013134

label define vlE0013135 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013135 vlE0013135

label define vlE0013136 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013136 vlE0013136

label define vlE0013137 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013137 vlE0013137

label define vlE0013138 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013138 vlE0013138

label define vlE0013139 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013139 vlE0013139

label define vlE0013140 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013140 vlE0013140

label define vlE0013141 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013141 vlE0013141

label define vlE0013142 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013142 vlE0013142

label define vlE0013143 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013143 vlE0013143

label define vlE0013144 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013144 vlE0013144

label define vlE0013145 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013145 vlE0013145

label define vlE0013146 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013146 vlE0013146

label define vlE0013147 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013147 vlE0013147

label define vlE0013148 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013148 vlE0013148

label define vlE0013149 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013149 vlE0013149

label define vlE0013150 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013150 vlE0013150

label define vlE0013151 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013151 vlE0013151

label define vlE0013152 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013152 vlE0013152

label define vlE0013153 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013153 vlE0013153

label define vlE0013201 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013201 vlE0013201

label define vlE0013202 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013202 vlE0013202

label define vlE0013203 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013203 vlE0013203

label define vlE0013204 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013204 vlE0013204

label define vlE0013205 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013205 vlE0013205

label define vlE0013206 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013206 vlE0013206

label define vlE0013207 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013207 vlE0013207

label define vlE0013208 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013208 vlE0013208

label define vlE0013209 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013209 vlE0013209

label define vlE0013210 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013210 vlE0013210

label define vlE0013211 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013211 vlE0013211

label define vlE0013212 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013212 vlE0013212

label define vlE0013213 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013213 vlE0013213

label define vlE0013214 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013214 vlE0013214

label define vlE0013215 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013215 vlE0013215

label define vlE0013216 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013216 vlE0013216

label define vlE0013217 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013217 vlE0013217

label define vlE0013218 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013218 vlE0013218

label define vlE0013219 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013219 vlE0013219

label define vlE0013220 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013220 vlE0013220

label define vlE0013221 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013221 vlE0013221

label define vlE0013222 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013222 vlE0013222

label define vlE0013223 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013223 vlE0013223

label define vlE0013224 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013224 vlE0013224

label define vlE0013225 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013225 vlE0013225

label define vlE0013226 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013226 vlE0013226

label define vlE0013227 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013227 vlE0013227

label define vlE0013228 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013228 vlE0013228

label define vlE0013229 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013229 vlE0013229

label define vlE0013230 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013230 vlE0013230

label define vlE0013231 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013231 vlE0013231

label define vlE0013232 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013232 vlE0013232

label define vlE0013233 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013233 vlE0013233

label define vlE0013234 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013234 vlE0013234

label define vlE0013235 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013235 vlE0013235

label define vlE0013236 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013236 vlE0013236

label define vlE0013237 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013237 vlE0013237

label define vlE0013238 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013238 vlE0013238

label define vlE0013239 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013239 vlE0013239

label define vlE0013240 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013240 vlE0013240

label define vlE0013241 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013241 vlE0013241

label define vlE0013242 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013242 vlE0013242

label define vlE0013243 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013243 vlE0013243

label define vlE0013244 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013244 vlE0013244

label define vlE0013245 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013245 vlE0013245

label define vlE0013246 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013246 vlE0013246

label define vlE0013247 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013247 vlE0013247

label define vlE0013248 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013248 vlE0013248

label define vlE0013249 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013249 vlE0013249

label define vlE0013250 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013250 vlE0013250

label define vlE0013251 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013251 vlE0013251

label define vlE0013252 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013252 vlE0013252

label define vlE0013301 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013301 vlE0013301

label define vlE0013302 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013302 vlE0013302

label define vlE0013303 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013303 vlE0013303

label define vlE0013304 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013304 vlE0013304

label define vlE0013305 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013305 vlE0013305

label define vlE0013306 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013306 vlE0013306

label define vlE0013307 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013307 vlE0013307

label define vlE0013308 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013308 vlE0013308

label define vlE0013309 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013309 vlE0013309

label define vlE0013310 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013310 vlE0013310

label define vlE0013311 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013311 vlE0013311

label define vlE0013312 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013312 vlE0013312

label define vlE0013313 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013313 vlE0013313

label define vlE0013314 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013314 vlE0013314

label define vlE0013315 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013315 vlE0013315

label define vlE0013316 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013316 vlE0013316

label define vlE0013317 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013317 vlE0013317

label define vlE0013318 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013318 vlE0013318

label define vlE0013319 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013319 vlE0013319

label define vlE0013320 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013320 vlE0013320

label define vlE0013321 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013321 vlE0013321

label define vlE0013322 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013322 vlE0013322

label define vlE0013323 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013323 vlE0013323

label define vlE0013324 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013324 vlE0013324

label define vlE0013325 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013325 vlE0013325

label define vlE0013326 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013326 vlE0013326

label define vlE0013327 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013327 vlE0013327

label define vlE0013328 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013328 vlE0013328

label define vlE0013329 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013329 vlE0013329

label define vlE0013330 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013330 vlE0013330

label define vlE0013331 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013331 vlE0013331

label define vlE0013332 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013332 vlE0013332

label define vlE0013333 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013333 vlE0013333

label define vlE0013334 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013334 vlE0013334

label define vlE0013335 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013335 vlE0013335

label define vlE0013336 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013336 vlE0013336

label define vlE0013337 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013337 vlE0013337

label define vlE0013338 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013338 vlE0013338

label define vlE0013339 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013339 vlE0013339

label define vlE0013340 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013340 vlE0013340

label define vlE0013341 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013341 vlE0013341

label define vlE0013342 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013342 vlE0013342

label define vlE0013343 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013343 vlE0013343

label define vlE0013344 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013344 vlE0013344

label define vlE0013345 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013345 vlE0013345

label define vlE0013346 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013346 vlE0013346

label define vlE0013347 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013347 vlE0013347

label define vlE0013348 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013348 vlE0013348

label define vlE0013349 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013349 vlE0013349

label define vlE0013350 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013350 vlE0013350

label define vlE0013351 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013351 vlE0013351

label define vlE0013352 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013352 vlE0013352

label define vlE0013401 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013401 vlE0013401

label define vlE0013402 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013402 vlE0013402

label define vlE0013403 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013403 vlE0013403

label define vlE0013404 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013404 vlE0013404

label define vlE0013405 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013405 vlE0013405

label define vlE0013406 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013406 vlE0013406

label define vlE0013407 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013407 vlE0013407

label define vlE0013408 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013408 vlE0013408

label define vlE0013409 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013409 vlE0013409

label define vlE0013410 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013410 vlE0013410

label define vlE0013411 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013411 vlE0013411

label define vlE0013412 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013412 vlE0013412

label define vlE0013413 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013413 vlE0013413

label define vlE0013414 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013414 vlE0013414

label define vlE0013415 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013415 vlE0013415

label define vlE0013416 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013416 vlE0013416

label define vlE0013417 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013417 vlE0013417

label define vlE0013418 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013418 vlE0013418

label define vlE0013419 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013419 vlE0013419

label define vlE0013420 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013420 vlE0013420

label define vlE0013421 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013421 vlE0013421

label define vlE0013422 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013422 vlE0013422

label define vlE0013423 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013423 vlE0013423

label define vlE0013424 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013424 vlE0013424

label define vlE0013425 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013425 vlE0013425

label define vlE0013426 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013426 vlE0013426

label define vlE0013427 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013427 vlE0013427

label define vlE0013428 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013428 vlE0013428

label define vlE0013429 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013429 vlE0013429

label define vlE0013430 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013430 vlE0013430

label define vlE0013431 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013431 vlE0013431

label define vlE0013432 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013432 vlE0013432

label define vlE0013433 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013433 vlE0013433

label define vlE0013434 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013434 vlE0013434

label define vlE0013435 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013435 vlE0013435

label define vlE0013436 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013436 vlE0013436

label define vlE0013437 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013437 vlE0013437

label define vlE0013438 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013438 vlE0013438

label define vlE0013439 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013439 vlE0013439

label define vlE0013440 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013440 vlE0013440

label define vlE0013441 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013441 vlE0013441

label define vlE0013442 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013442 vlE0013442

label define vlE0013443 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013443 vlE0013443

label define vlE0013444 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013444 vlE0013444

label define vlE0013445 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013445 vlE0013445

label define vlE0013446 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013446 vlE0013446

label define vlE0013447 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013447 vlE0013447

label define vlE0013448 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013448 vlE0013448

label define vlE0013449 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013449 vlE0013449

label define vlE0013450 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013450 vlE0013450

label define vlE0013451 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013451 vlE0013451

label define vlE0013452 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013452 vlE0013452

label define vlE0013501 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013501 vlE0013501

label define vlE0013502 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013502 vlE0013502

label define vlE0013503 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013503 vlE0013503

label define vlE0013504 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013504 vlE0013504

label define vlE0013505 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013505 vlE0013505

label define vlE0013506 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013506 vlE0013506

label define vlE0013507 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013507 vlE0013507

label define vlE0013508 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013508 vlE0013508

label define vlE0013509 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013509 vlE0013509

label define vlE0013510 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013510 vlE0013510

label define vlE0013511 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013511 vlE0013511

label define vlE0013512 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013512 vlE0013512

label define vlE0013513 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013513 vlE0013513

label define vlE0013514 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013514 vlE0013514

label define vlE0013515 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013515 vlE0013515

label define vlE0013516 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013516 vlE0013516

label define vlE0013517 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013517 vlE0013517

label define vlE0013518 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013518 vlE0013518

label define vlE0013519 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013519 vlE0013519

label define vlE0013520 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013520 vlE0013520

label define vlE0013521 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013521 vlE0013521

label define vlE0013522 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013522 vlE0013522

label define vlE0013523 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013523 vlE0013523

label define vlE0013524 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013524 vlE0013524

label define vlE0013525 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013525 vlE0013525

label define vlE0013526 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013526 vlE0013526

label define vlE0013527 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013527 vlE0013527

label define vlE0013528 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013528 vlE0013528

label define vlE0013529 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013529 vlE0013529

label define vlE0013530 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013530 vlE0013530

label define vlE0013531 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013531 vlE0013531

label define vlE0013532 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013532 vlE0013532

label define vlE0013533 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013533 vlE0013533

label define vlE0013534 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013534 vlE0013534

label define vlE0013535 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013535 vlE0013535

label define vlE0013536 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013536 vlE0013536

label define vlE0013537 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013537 vlE0013537

label define vlE0013538 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013538 vlE0013538

label define vlE0013539 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013539 vlE0013539

label define vlE0013540 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013540 vlE0013540

label define vlE0013541 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013541 vlE0013541

label define vlE0013542 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013542 vlE0013542

label define vlE0013543 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013543 vlE0013543

label define vlE0013544 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013544 vlE0013544

label define vlE0013545 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013545 vlE0013545

label define vlE0013546 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013546 vlE0013546

label define vlE0013547 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013547 vlE0013547

label define vlE0013548 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013548 vlE0013548

label define vlE0013549 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013549 vlE0013549

label define vlE0013550 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013550 vlE0013550

label define vlE0013551 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013551 vlE0013551

label define vlE0013552 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013552 vlE0013552

label define vlE0013601 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013601 vlE0013601

label define vlE0013602 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013602 vlE0013602

label define vlE0013603 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013603 vlE0013603

label define vlE0013604 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013604 vlE0013604

label define vlE0013605 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013605 vlE0013605

label define vlE0013606 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013606 vlE0013606

label define vlE0013607 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013607 vlE0013607

label define vlE0013608 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013608 vlE0013608

label define vlE0013609 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013609 vlE0013609

label define vlE0013610 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013610 vlE0013610

label define vlE0013611 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013611 vlE0013611

label define vlE0013612 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013612 vlE0013612

label define vlE0013613 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013613 vlE0013613

label define vlE0013614 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013614 vlE0013614

label define vlE0013615 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013615 vlE0013615

label define vlE0013616 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013616 vlE0013616

label define vlE0013617 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013617 vlE0013617

label define vlE0013618 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013618 vlE0013618

label define vlE0013619 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013619 vlE0013619

label define vlE0013620 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013620 vlE0013620

label define vlE0013621 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013621 vlE0013621

label define vlE0013622 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013622 vlE0013622

label define vlE0013623 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013623 vlE0013623

label define vlE0013624 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013624 vlE0013624

label define vlE0013625 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013625 vlE0013625

label define vlE0013626 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013626 vlE0013626

label define vlE0013627 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013627 vlE0013627

label define vlE0013628 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013628 vlE0013628

label define vlE0013629 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013629 vlE0013629

label define vlE0013630 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013630 vlE0013630

label define vlE0013631 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013631 vlE0013631

label define vlE0013632 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013632 vlE0013632

label define vlE0013633 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013633 vlE0013633

label define vlE0013634 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013634 vlE0013634

label define vlE0013635 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013635 vlE0013635

label define vlE0013636 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013636 vlE0013636

label define vlE0013637 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013637 vlE0013637

label define vlE0013638 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013638 vlE0013638

label define vlE0013639 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013639 vlE0013639

label define vlE0013640 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013640 vlE0013640

label define vlE0013641 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013641 vlE0013641

label define vlE0013642 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013642 vlE0013642

label define vlE0013643 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013643 vlE0013643

label define vlE0013644 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013644 vlE0013644

label define vlE0013645 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013645 vlE0013645

label define vlE0013646 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013646 vlE0013646

label define vlE0013647 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013647 vlE0013647

label define vlE0013648 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013648 vlE0013648

label define vlE0013649 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013649 vlE0013649

label define vlE0013650 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013650 vlE0013650

label define vlE0013651 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013651 vlE0013651

label define vlE0013652 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013652 vlE0013652

label define vlE0013653 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013653 vlE0013653

label define vlE0013701 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013701 vlE0013701

label define vlE0013702 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013702 vlE0013702

label define vlE0013703 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013703 vlE0013703

label define vlE0013704 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013704 vlE0013704

label define vlE0013705 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013705 vlE0013705

label define vlE0013706 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013706 vlE0013706

label define vlE0013707 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013707 vlE0013707

label define vlE0013708 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013708 vlE0013708

label define vlE0013709 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013709 vlE0013709

label define vlE0013710 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013710 vlE0013710

label define vlE0013711 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013711 vlE0013711

label define vlE0013712 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013712 vlE0013712

label define vlE0013713 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013713 vlE0013713

label define vlE0013714 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013714 vlE0013714

label define vlE0013715 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013715 vlE0013715

label define vlE0013716 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013716 vlE0013716

label define vlE0013717 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013717 vlE0013717

label define vlE0013718 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013718 vlE0013718

label define vlE0013719 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013719 vlE0013719

label define vlE0013720 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013720 vlE0013720

label define vlE0013721 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013721 vlE0013721

label define vlE0013722 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013722 vlE0013722

label define vlE0013723 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013723 vlE0013723

label define vlE0013724 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013724 vlE0013724

label define vlE0013725 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013725 vlE0013725

label define vlE0013726 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013726 vlE0013726

label define vlE0013727 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013727 vlE0013727

label define vlE0013728 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013728 vlE0013728

label define vlE0013729 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013729 vlE0013729

label define vlE0013730 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013730 vlE0013730

label define vlE0013731 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013731 vlE0013731

label define vlE0013732 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013732 vlE0013732

label define vlE0013733 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013733 vlE0013733

label define vlE0013734 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013734 vlE0013734

label define vlE0013735 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013735 vlE0013735

label define vlE0013736 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013736 vlE0013736

label define vlE0013737 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013737 vlE0013737

label define vlE0013738 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013738 vlE0013738

label define vlE0013739 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013739 vlE0013739

label define vlE0013740 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013740 vlE0013740

label define vlE0013741 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013741 vlE0013741

label define vlE0013742 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013742 vlE0013742

label define vlE0013743 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013743 vlE0013743

label define vlE0013744 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013744 vlE0013744

label define vlE0013745 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013745 vlE0013745

label define vlE0013746 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013746 vlE0013746

label define vlE0013747 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013747 vlE0013747

label define vlE0013748 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013748 vlE0013748

label define vlE0013749 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013749 vlE0013749

label define vlE0013750 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013750 vlE0013750

label define vlE0013751 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013751 vlE0013751

label define vlE0013752 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013752 vlE0013752

label define vlE0013801 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013801 vlE0013801

label define vlE0013802 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013802 vlE0013802

label define vlE0013803 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013803 vlE0013803

label define vlE0013804 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013804 vlE0013804

label define vlE0013805 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013805 vlE0013805

label define vlE0013806 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013806 vlE0013806

label define vlE0013807 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013807 vlE0013807

label define vlE0013808 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013808 vlE0013808

label define vlE0013809 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013809 vlE0013809

label define vlE0013810 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013810 vlE0013810

label define vlE0013811 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013811 vlE0013811

label define vlE0013812 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013812 vlE0013812

label define vlE0013813 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013813 vlE0013813

label define vlE0013814 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013814 vlE0013814

label define vlE0013815 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013815 vlE0013815

label define vlE0013816 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013816 vlE0013816

label define vlE0013817 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013817 vlE0013817

label define vlE0013818 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013818 vlE0013818

label define vlE0013819 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013819 vlE0013819

label define vlE0013820 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013820 vlE0013820

label define vlE0013821 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013821 vlE0013821

label define vlE0013822 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013822 vlE0013822

label define vlE0013823 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013823 vlE0013823

label define vlE0013824 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013824 vlE0013824

label define vlE0013825 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013825 vlE0013825

label define vlE0013826 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013826 vlE0013826

label define vlE0013827 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013827 vlE0013827

label define vlE0013828 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013828 vlE0013828

label define vlE0013829 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013829 vlE0013829

label define vlE0013830 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013830 vlE0013830

label define vlE0013831 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013831 vlE0013831

label define vlE0013832 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013832 vlE0013832

label define vlE0013833 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013833 vlE0013833

label define vlE0013834 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013834 vlE0013834

label define vlE0013835 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013835 vlE0013835

label define vlE0013836 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013836 vlE0013836

label define vlE0013837 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013837 vlE0013837

label define vlE0013838 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013838 vlE0013838

label define vlE0013839 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201799: Employer on roster (see YEMP_UID)" 
label values E0013839 vlE0013839

label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename E0011406 EMP_STATUS_1994_06_XRND   // EMP_STATUS_1994.06
  rename E0011407 EMP_STATUS_1994_07_XRND   // EMP_STATUS_1994.07
  rename E0011408 EMP_STATUS_1994_08_XRND   // EMP_STATUS_1994.08
  rename E0011409 EMP_STATUS_1994_09_XRND   // EMP_STATUS_1994.09
  rename E0011410 EMP_STATUS_1994_10_XRND   // EMP_STATUS_1994.10
  rename E0011411 EMP_STATUS_1994_11_XRND   // EMP_STATUS_1994.11
  rename E0011412 EMP_STATUS_1994_12_XRND   // EMP_STATUS_1994.12
  rename E0011413 EMP_STATUS_1994_13_XRND   // EMP_STATUS_1994.13
  rename E0011414 EMP_STATUS_1994_14_XRND   // EMP_STATUS_1994.14
  rename E0011415 EMP_STATUS_1994_15_XRND   // EMP_STATUS_1994.15
  rename E0011416 EMP_STATUS_1994_16_XRND   // EMP_STATUS_1994.16
  rename E0011417 EMP_STATUS_1994_17_XRND   // EMP_STATUS_1994.17
  rename E0011418 EMP_STATUS_1994_18_XRND   // EMP_STATUS_1994.18
  rename E0011419 EMP_STATUS_1994_19_XRND   // EMP_STATUS_1994.19
  rename E0011420 EMP_STATUS_1994_20_XRND   // EMP_STATUS_1994.20
  rename E0011421 EMP_STATUS_1994_21_XRND   // EMP_STATUS_1994.21
  rename E0011422 EMP_STATUS_1994_22_XRND   // EMP_STATUS_1994.22
  rename E0011423 EMP_STATUS_1994_23_XRND   // EMP_STATUS_1994.23
  rename E0011424 EMP_STATUS_1994_24_XRND   // EMP_STATUS_1994.24
  rename E0011425 EMP_STATUS_1994_25_XRND   // EMP_STATUS_1994.25
  rename E0011426 EMP_STATUS_1994_26_XRND   // EMP_STATUS_1994.26
  rename E0011427 EMP_STATUS_1994_27_XRND   // EMP_STATUS_1994.27
  rename E0011428 EMP_STATUS_1994_28_XRND   // EMP_STATUS_1994.28
  rename E0011429 EMP_STATUS_1994_29_XRND   // EMP_STATUS_1994.29
  rename E0011430 EMP_STATUS_1994_30_XRND   // EMP_STATUS_1994.30
  rename E0011431 EMP_STATUS_1994_31_XRND   // EMP_STATUS_1994.31
  rename E0011432 EMP_STATUS_1994_32_XRND   // EMP_STATUS_1994.32
  rename E0011433 EMP_STATUS_1994_33_XRND   // EMP_STATUS_1994.33
  rename E0011434 EMP_STATUS_1994_34_XRND   // EMP_STATUS_1994.34
  rename E0011435 EMP_STATUS_1994_35_XRND   // EMP_STATUS_1994.35
  rename E0011436 EMP_STATUS_1994_36_XRND   // EMP_STATUS_1994.36
  rename E0011437 EMP_STATUS_1994_37_XRND   // EMP_STATUS_1994.37
  rename E0011438 EMP_STATUS_1994_38_XRND   // EMP_STATUS_1994.38
  rename E0011439 EMP_STATUS_1994_39_XRND   // EMP_STATUS_1994.39
  rename E0011440 EMP_STATUS_1994_40_XRND   // EMP_STATUS_1994.40
  rename E0011441 EMP_STATUS_1994_41_XRND   // EMP_STATUS_1994.41
  rename E0011442 EMP_STATUS_1994_42_XRND   // EMP_STATUS_1994.42
  rename E0011443 EMP_STATUS_1994_43_XRND   // EMP_STATUS_1994.43
  rename E0011444 EMP_STATUS_1994_44_XRND   // EMP_STATUS_1994.44
  rename E0011445 EMP_STATUS_1994_45_XRND   // EMP_STATUS_1994.45
  rename E0011446 EMP_STATUS_1994_46_XRND   // EMP_STATUS_1994.46
  rename E0011447 EMP_STATUS_1994_47_XRND   // EMP_STATUS_1994.47
  rename E0011448 EMP_STATUS_1994_48_XRND   // EMP_STATUS_1994.48
  rename E0011449 EMP_STATUS_1994_49_XRND   // EMP_STATUS_1994.49
  rename E0011450 EMP_STATUS_1994_50_XRND   // EMP_STATUS_1994.50
  rename E0011451 EMP_STATUS_1994_51_XRND   // EMP_STATUS_1994.51
  rename E0011452 EMP_STATUS_1994_52_XRND   // EMP_STATUS_1994.52
  rename E0011453 EMP_STATUS_1994_53_XRND   // EMP_STATUS_1994.53
  rename E0011501 EMP_STATUS_1995_01_XRND   // EMP_STATUS_1995.01
  rename E0011502 EMP_STATUS_1995_02_XRND   // EMP_STATUS_1995.02
  rename E0011503 EMP_STATUS_1995_03_XRND   // EMP_STATUS_1995.03
  rename E0011504 EMP_STATUS_1995_04_XRND   // EMP_STATUS_1995.04
  rename E0011505 EMP_STATUS_1995_05_XRND   // EMP_STATUS_1995.05
  rename E0011506 EMP_STATUS_1995_06_XRND   // EMP_STATUS_1995.06
  rename E0011507 EMP_STATUS_1995_07_XRND   // EMP_STATUS_1995.07
  rename E0011508 EMP_STATUS_1995_08_XRND   // EMP_STATUS_1995.08
  rename E0011509 EMP_STATUS_1995_09_XRND   // EMP_STATUS_1995.09
  rename E0011510 EMP_STATUS_1995_10_XRND   // EMP_STATUS_1995.10
  rename E0011511 EMP_STATUS_1995_11_XRND   // EMP_STATUS_1995.11
  rename E0011512 EMP_STATUS_1995_12_XRND   // EMP_STATUS_1995.12
  rename E0011513 EMP_STATUS_1995_13_XRND   // EMP_STATUS_1995.13
  rename E0011514 EMP_STATUS_1995_14_XRND   // EMP_STATUS_1995.14
  rename E0011515 EMP_STATUS_1995_15_XRND   // EMP_STATUS_1995.15
  rename E0011516 EMP_STATUS_1995_16_XRND   // EMP_STATUS_1995.16
  rename E0011517 EMP_STATUS_1995_17_XRND   // EMP_STATUS_1995.17
  rename E0011518 EMP_STATUS_1995_18_XRND   // EMP_STATUS_1995.18
  rename E0011519 EMP_STATUS_1995_19_XRND   // EMP_STATUS_1995.19
  rename E0011520 EMP_STATUS_1995_20_XRND   // EMP_STATUS_1995.20
  rename E0011521 EMP_STATUS_1995_21_XRND   // EMP_STATUS_1995.21
  rename E0011522 EMP_STATUS_1995_22_XRND   // EMP_STATUS_1995.22
  rename E0011523 EMP_STATUS_1995_23_XRND   // EMP_STATUS_1995.23
  rename E0011524 EMP_STATUS_1995_24_XRND   // EMP_STATUS_1995.24
  rename E0011525 EMP_STATUS_1995_25_XRND   // EMP_STATUS_1995.25
  rename E0011526 EMP_STATUS_1995_26_XRND   // EMP_STATUS_1995.26
  rename E0011527 EMP_STATUS_1995_27_XRND   // EMP_STATUS_1995.27
  rename E0011528 EMP_STATUS_1995_28_XRND   // EMP_STATUS_1995.28
  rename E0011529 EMP_STATUS_1995_29_XRND   // EMP_STATUS_1995.29
  rename E0011530 EMP_STATUS_1995_30_XRND   // EMP_STATUS_1995.30
  rename E0011531 EMP_STATUS_1995_31_XRND   // EMP_STATUS_1995.31
  rename E0011532 EMP_STATUS_1995_32_XRND   // EMP_STATUS_1995.32
  rename E0011533 EMP_STATUS_1995_33_XRND   // EMP_STATUS_1995.33
  rename E0011534 EMP_STATUS_1995_34_XRND   // EMP_STATUS_1995.34
  rename E0011535 EMP_STATUS_1995_35_XRND   // EMP_STATUS_1995.35
  rename E0011536 EMP_STATUS_1995_36_XRND   // EMP_STATUS_1995.36
  rename E0011537 EMP_STATUS_1995_37_XRND   // EMP_STATUS_1995.37
  rename E0011538 EMP_STATUS_1995_38_XRND   // EMP_STATUS_1995.38
  rename E0011539 EMP_STATUS_1995_39_XRND   // EMP_STATUS_1995.39
  rename E0011540 EMP_STATUS_1995_40_XRND   // EMP_STATUS_1995.40
  rename E0011541 EMP_STATUS_1995_41_XRND   // EMP_STATUS_1995.41
  rename E0011542 EMP_STATUS_1995_42_XRND   // EMP_STATUS_1995.42
  rename E0011543 EMP_STATUS_1995_43_XRND   // EMP_STATUS_1995.43
  rename E0011544 EMP_STATUS_1995_44_XRND   // EMP_STATUS_1995.44
  rename E0011545 EMP_STATUS_1995_45_XRND   // EMP_STATUS_1995.45
  rename E0011546 EMP_STATUS_1995_46_XRND   // EMP_STATUS_1995.46
  rename E0011547 EMP_STATUS_1995_47_XRND   // EMP_STATUS_1995.47
  rename E0011548 EMP_STATUS_1995_48_XRND   // EMP_STATUS_1995.48
  rename E0011549 EMP_STATUS_1995_49_XRND   // EMP_STATUS_1995.49
  rename E0011550 EMP_STATUS_1995_50_XRND   // EMP_STATUS_1995.50
  rename E0011551 EMP_STATUS_1995_51_XRND   // EMP_STATUS_1995.51
  rename E0011552 EMP_STATUS_1995_52_XRND   // EMP_STATUS_1995.52
  rename E0011601 EMP_STATUS_1996_01_XRND   // EMP_STATUS_1996.01
  rename E0011602 EMP_STATUS_1996_02_XRND   // EMP_STATUS_1996.02
  rename E0011603 EMP_STATUS_1996_03_XRND   // EMP_STATUS_1996.03
  rename E0011604 EMP_STATUS_1996_04_XRND   // EMP_STATUS_1996.04
  rename E0011605 EMP_STATUS_1996_05_XRND   // EMP_STATUS_1996.05
  rename E0011606 EMP_STATUS_1996_06_XRND   // EMP_STATUS_1996.06
  rename E0011607 EMP_STATUS_1996_07_XRND   // EMP_STATUS_1996.07
  rename E0011608 EMP_STATUS_1996_08_XRND   // EMP_STATUS_1996.08
  rename E0011609 EMP_STATUS_1996_09_XRND   // EMP_STATUS_1996.09
  rename E0011610 EMP_STATUS_1996_10_XRND   // EMP_STATUS_1996.10
  rename E0011611 EMP_STATUS_1996_11_XRND   // EMP_STATUS_1996.11
  rename E0011612 EMP_STATUS_1996_12_XRND   // EMP_STATUS_1996.12
  rename E0011613 EMP_STATUS_1996_13_XRND   // EMP_STATUS_1996.13
  rename E0011614 EMP_STATUS_1996_14_XRND   // EMP_STATUS_1996.14
  rename E0011615 EMP_STATUS_1996_15_XRND   // EMP_STATUS_1996.15
  rename E0011616 EMP_STATUS_1996_16_XRND   // EMP_STATUS_1996.16
  rename E0011617 EMP_STATUS_1996_17_XRND   // EMP_STATUS_1996.17
  rename E0011618 EMP_STATUS_1996_18_XRND   // EMP_STATUS_1996.18
  rename E0011619 EMP_STATUS_1996_19_XRND   // EMP_STATUS_1996.19
  rename E0011620 EMP_STATUS_1996_20_XRND   // EMP_STATUS_1996.20
  rename E0011621 EMP_STATUS_1996_21_XRND   // EMP_STATUS_1996.21
  rename E0011622 EMP_STATUS_1996_22_XRND   // EMP_STATUS_1996.22
  rename E0011623 EMP_STATUS_1996_23_XRND   // EMP_STATUS_1996.23
  rename E0011624 EMP_STATUS_1996_24_XRND   // EMP_STATUS_1996.24
  rename E0011625 EMP_STATUS_1996_25_XRND   // EMP_STATUS_1996.25
  rename E0011626 EMP_STATUS_1996_26_XRND   // EMP_STATUS_1996.26
  rename E0011627 EMP_STATUS_1996_27_XRND   // EMP_STATUS_1996.27
  rename E0011628 EMP_STATUS_1996_28_XRND   // EMP_STATUS_1996.28
  rename E0011629 EMP_STATUS_1996_29_XRND   // EMP_STATUS_1996.29
  rename E0011630 EMP_STATUS_1996_30_XRND   // EMP_STATUS_1996.30
  rename E0011631 EMP_STATUS_1996_31_XRND   // EMP_STATUS_1996.31
  rename E0011632 EMP_STATUS_1996_32_XRND   // EMP_STATUS_1996.32
  rename E0011633 EMP_STATUS_1996_33_XRND   // EMP_STATUS_1996.33
  rename E0011634 EMP_STATUS_1996_34_XRND   // EMP_STATUS_1996.34
  rename E0011635 EMP_STATUS_1996_35_XRND   // EMP_STATUS_1996.35
  rename E0011636 EMP_STATUS_1996_36_XRND   // EMP_STATUS_1996.36
  rename E0011637 EMP_STATUS_1996_37_XRND   // EMP_STATUS_1996.37
  rename E0011638 EMP_STATUS_1996_38_XRND   // EMP_STATUS_1996.38
  rename E0011639 EMP_STATUS_1996_39_XRND   // EMP_STATUS_1996.39
  rename E0011640 EMP_STATUS_1996_40_XRND   // EMP_STATUS_1996.40
  rename E0011641 EMP_STATUS_1996_41_XRND   // EMP_STATUS_1996.41
  rename E0011642 EMP_STATUS_1996_42_XRND   // EMP_STATUS_1996.42
  rename E0011643 EMP_STATUS_1996_43_XRND   // EMP_STATUS_1996.43
  rename E0011644 EMP_STATUS_1996_44_XRND   // EMP_STATUS_1996.44
  rename E0011645 EMP_STATUS_1996_45_XRND   // EMP_STATUS_1996.45
  rename E0011646 EMP_STATUS_1996_46_XRND   // EMP_STATUS_1996.46
  rename E0011647 EMP_STATUS_1996_47_XRND   // EMP_STATUS_1996.47
  rename E0011648 EMP_STATUS_1996_48_XRND   // EMP_STATUS_1996.48
  rename E0011649 EMP_STATUS_1996_49_XRND   // EMP_STATUS_1996.49
  rename E0011650 EMP_STATUS_1996_50_XRND   // EMP_STATUS_1996.50
  rename E0011651 EMP_STATUS_1996_51_XRND   // EMP_STATUS_1996.51
  rename E0011652 EMP_STATUS_1996_52_XRND   // EMP_STATUS_1996.52
  rename E0011701 EMP_STATUS_1997_01_XRND   // EMP_STATUS_1997.01
  rename E0011702 EMP_STATUS_1997_02_XRND   // EMP_STATUS_1997.02
  rename E0011703 EMP_STATUS_1997_03_XRND   // EMP_STATUS_1997.03
  rename E0011704 EMP_STATUS_1997_04_XRND   // EMP_STATUS_1997.04
  rename E0011705 EMP_STATUS_1997_05_XRND   // EMP_STATUS_1997.05
  rename E0011706 EMP_STATUS_1997_06_XRND   // EMP_STATUS_1997.06
  rename E0011707 EMP_STATUS_1997_07_XRND   // EMP_STATUS_1997.07
  rename E0011708 EMP_STATUS_1997_08_XRND   // EMP_STATUS_1997.08
  rename E0011709 EMP_STATUS_1997_09_XRND   // EMP_STATUS_1997.09
  rename E0011710 EMP_STATUS_1997_10_XRND   // EMP_STATUS_1997.10
  rename E0011711 EMP_STATUS_1997_11_XRND   // EMP_STATUS_1997.11
  rename E0011712 EMP_STATUS_1997_12_XRND   // EMP_STATUS_1997.12
  rename E0011713 EMP_STATUS_1997_13_XRND   // EMP_STATUS_1997.13
  rename E0011714 EMP_STATUS_1997_14_XRND   // EMP_STATUS_1997.14
  rename E0011715 EMP_STATUS_1997_15_XRND   // EMP_STATUS_1997.15
  rename E0011716 EMP_STATUS_1997_16_XRND   // EMP_STATUS_1997.16
  rename E0011717 EMP_STATUS_1997_17_XRND   // EMP_STATUS_1997.17
  rename E0011718 EMP_STATUS_1997_18_XRND   // EMP_STATUS_1997.18
  rename E0011719 EMP_STATUS_1997_19_XRND   // EMP_STATUS_1997.19
  rename E0011720 EMP_STATUS_1997_20_XRND   // EMP_STATUS_1997.20
  rename E0011721 EMP_STATUS_1997_21_XRND   // EMP_STATUS_1997.21
  rename E0011722 EMP_STATUS_1997_22_XRND   // EMP_STATUS_1997.22
  rename E0011723 EMP_STATUS_1997_23_XRND   // EMP_STATUS_1997.23
  rename E0011724 EMP_STATUS_1997_24_XRND   // EMP_STATUS_1997.24
  rename E0011725 EMP_STATUS_1997_25_XRND   // EMP_STATUS_1997.25
  rename E0011726 EMP_STATUS_1997_26_XRND   // EMP_STATUS_1997.26
  rename E0011727 EMP_STATUS_1997_27_XRND   // EMP_STATUS_1997.27
  rename E0011728 EMP_STATUS_1997_28_XRND   // EMP_STATUS_1997.28
  rename E0011729 EMP_STATUS_1997_29_XRND   // EMP_STATUS_1997.29
  rename E0011730 EMP_STATUS_1997_30_XRND   // EMP_STATUS_1997.30
  rename E0011731 EMP_STATUS_1997_31_XRND   // EMP_STATUS_1997.31
  rename E0011732 EMP_STATUS_1997_32_XRND   // EMP_STATUS_1997.32
  rename E0011733 EMP_STATUS_1997_33_XRND   // EMP_STATUS_1997.33
  rename E0011734 EMP_STATUS_1997_34_XRND   // EMP_STATUS_1997.34
  rename E0011735 EMP_STATUS_1997_35_XRND   // EMP_STATUS_1997.35
  rename E0011736 EMP_STATUS_1997_36_XRND   // EMP_STATUS_1997.36
  rename E0011737 EMP_STATUS_1997_37_XRND   // EMP_STATUS_1997.37
  rename E0011738 EMP_STATUS_1997_38_XRND   // EMP_STATUS_1997.38
  rename E0011739 EMP_STATUS_1997_39_XRND   // EMP_STATUS_1997.39
  rename E0011740 EMP_STATUS_1997_40_XRND   // EMP_STATUS_1997.40
  rename E0011741 EMP_STATUS_1997_41_XRND   // EMP_STATUS_1997.41
  rename E0011742 EMP_STATUS_1997_42_XRND   // EMP_STATUS_1997.42
  rename E0011743 EMP_STATUS_1997_43_XRND   // EMP_STATUS_1997.43
  rename E0011744 EMP_STATUS_1997_44_XRND   // EMP_STATUS_1997.44
  rename E0011745 EMP_STATUS_1997_45_XRND   // EMP_STATUS_1997.45
  rename E0011746 EMP_STATUS_1997_46_XRND   // EMP_STATUS_1997.46
  rename E0011747 EMP_STATUS_1997_47_XRND   // EMP_STATUS_1997.47
  rename E0011748 EMP_STATUS_1997_48_XRND   // EMP_STATUS_1997.48
  rename E0011749 EMP_STATUS_1997_49_XRND   // EMP_STATUS_1997.49
  rename E0011750 EMP_STATUS_1997_50_XRND   // EMP_STATUS_1997.50
  rename E0011751 EMP_STATUS_1997_51_XRND   // EMP_STATUS_1997.51
  rename E0011752 EMP_STATUS_1997_52_XRND   // EMP_STATUS_1997.52
  rename E0011801 EMP_STATUS_1998_01_XRND   // EMP_STATUS_1998.01
  rename E0011802 EMP_STATUS_1998_02_XRND   // EMP_STATUS_1998.02
  rename E0011803 EMP_STATUS_1998_03_XRND   // EMP_STATUS_1998.03
  rename E0011804 EMP_STATUS_1998_04_XRND   // EMP_STATUS_1998.04
  rename E0011805 EMP_STATUS_1998_05_XRND   // EMP_STATUS_1998.05
  rename E0011806 EMP_STATUS_1998_06_XRND   // EMP_STATUS_1998.06
  rename E0011807 EMP_STATUS_1998_07_XRND   // EMP_STATUS_1998.07
  rename E0011808 EMP_STATUS_1998_08_XRND   // EMP_STATUS_1998.08
  rename E0011809 EMP_STATUS_1998_09_XRND   // EMP_STATUS_1998.09
  rename E0011810 EMP_STATUS_1998_10_XRND   // EMP_STATUS_1998.10
  rename E0011811 EMP_STATUS_1998_11_XRND   // EMP_STATUS_1998.11
  rename E0011812 EMP_STATUS_1998_12_XRND   // EMP_STATUS_1998.12
  rename E0011813 EMP_STATUS_1998_13_XRND   // EMP_STATUS_1998.13
  rename E0011814 EMP_STATUS_1998_14_XRND   // EMP_STATUS_1998.14
  rename E0011815 EMP_STATUS_1998_15_XRND   // EMP_STATUS_1998.15
  rename E0011816 EMP_STATUS_1998_16_XRND   // EMP_STATUS_1998.16
  rename E0011817 EMP_STATUS_1998_17_XRND   // EMP_STATUS_1998.17
  rename E0011818 EMP_STATUS_1998_18_XRND   // EMP_STATUS_1998.18
  rename E0011819 EMP_STATUS_1998_19_XRND   // EMP_STATUS_1998.19
  rename E0011820 EMP_STATUS_1998_20_XRND   // EMP_STATUS_1998.20
  rename E0011821 EMP_STATUS_1998_21_XRND   // EMP_STATUS_1998.21
  rename E0011822 EMP_STATUS_1998_22_XRND   // EMP_STATUS_1998.22
  rename E0011823 EMP_STATUS_1998_23_XRND   // EMP_STATUS_1998.23
  rename E0011824 EMP_STATUS_1998_24_XRND   // EMP_STATUS_1998.24
  rename E0011825 EMP_STATUS_1998_25_XRND   // EMP_STATUS_1998.25
  rename E0011826 EMP_STATUS_1998_26_XRND   // EMP_STATUS_1998.26
  rename E0011827 EMP_STATUS_1998_27_XRND   // EMP_STATUS_1998.27
  rename E0011828 EMP_STATUS_1998_28_XRND   // EMP_STATUS_1998.28
  rename E0011829 EMP_STATUS_1998_29_XRND   // EMP_STATUS_1998.29
  rename E0011830 EMP_STATUS_1998_30_XRND   // EMP_STATUS_1998.30
  rename E0011831 EMP_STATUS_1998_31_XRND   // EMP_STATUS_1998.31
  rename E0011832 EMP_STATUS_1998_32_XRND   // EMP_STATUS_1998.32
  rename E0011833 EMP_STATUS_1998_33_XRND   // EMP_STATUS_1998.33
  rename E0011834 EMP_STATUS_1998_34_XRND   // EMP_STATUS_1998.34
  rename E0011835 EMP_STATUS_1998_35_XRND   // EMP_STATUS_1998.35
  rename E0011836 EMP_STATUS_1998_36_XRND   // EMP_STATUS_1998.36
  rename E0011837 EMP_STATUS_1998_37_XRND   // EMP_STATUS_1998.37
  rename E0011838 EMP_STATUS_1998_38_XRND   // EMP_STATUS_1998.38
  rename E0011839 EMP_STATUS_1998_39_XRND   // EMP_STATUS_1998.39
  rename E0011840 EMP_STATUS_1998_40_XRND   // EMP_STATUS_1998.40
  rename E0011841 EMP_STATUS_1998_41_XRND   // EMP_STATUS_1998.41
  rename E0011842 EMP_STATUS_1998_42_XRND   // EMP_STATUS_1998.42
  rename E0011843 EMP_STATUS_1998_43_XRND   // EMP_STATUS_1998.43
  rename E0011844 EMP_STATUS_1998_44_XRND   // EMP_STATUS_1998.44
  rename E0011845 EMP_STATUS_1998_45_XRND   // EMP_STATUS_1998.45
  rename E0011846 EMP_STATUS_1998_46_XRND   // EMP_STATUS_1998.46
  rename E0011847 EMP_STATUS_1998_47_XRND   // EMP_STATUS_1998.47
  rename E0011848 EMP_STATUS_1998_48_XRND   // EMP_STATUS_1998.48
  rename E0011849 EMP_STATUS_1998_49_XRND   // EMP_STATUS_1998.49
  rename E0011850 EMP_STATUS_1998_50_XRND   // EMP_STATUS_1998.50
  rename E0011851 EMP_STATUS_1998_51_XRND   // EMP_STATUS_1998.51
  rename E0011852 EMP_STATUS_1998_52_XRND   // EMP_STATUS_1998.52
  rename E0011901 EMP_STATUS_1999_01_XRND   // EMP_STATUS_1999.01
  rename E0011902 EMP_STATUS_1999_02_XRND   // EMP_STATUS_1999.02
  rename E0011903 EMP_STATUS_1999_03_XRND   // EMP_STATUS_1999.03
  rename E0011904 EMP_STATUS_1999_04_XRND   // EMP_STATUS_1999.04
  rename E0011905 EMP_STATUS_1999_05_XRND   // EMP_STATUS_1999.05
  rename E0011906 EMP_STATUS_1999_06_XRND   // EMP_STATUS_1999.06
  rename E0011907 EMP_STATUS_1999_07_XRND   // EMP_STATUS_1999.07
  rename E0011908 EMP_STATUS_1999_08_XRND   // EMP_STATUS_1999.08
  rename E0011909 EMP_STATUS_1999_09_XRND   // EMP_STATUS_1999.09
  rename E0011910 EMP_STATUS_1999_10_XRND   // EMP_STATUS_1999.10
  rename E0011911 EMP_STATUS_1999_11_XRND   // EMP_STATUS_1999.11
  rename E0011912 EMP_STATUS_1999_12_XRND   // EMP_STATUS_1999.12
  rename E0011913 EMP_STATUS_1999_13_XRND   // EMP_STATUS_1999.13
  rename E0011914 EMP_STATUS_1999_14_XRND   // EMP_STATUS_1999.14
  rename E0011915 EMP_STATUS_1999_15_XRND   // EMP_STATUS_1999.15
  rename E0011916 EMP_STATUS_1999_16_XRND   // EMP_STATUS_1999.16
  rename E0011917 EMP_STATUS_1999_17_XRND   // EMP_STATUS_1999.17
  rename E0011918 EMP_STATUS_1999_18_XRND   // EMP_STATUS_1999.18
  rename E0011919 EMP_STATUS_1999_19_XRND   // EMP_STATUS_1999.19
  rename E0011920 EMP_STATUS_1999_20_XRND   // EMP_STATUS_1999.20
  rename E0011921 EMP_STATUS_1999_21_XRND   // EMP_STATUS_1999.21
  rename E0011922 EMP_STATUS_1999_22_XRND   // EMP_STATUS_1999.22
  rename E0011923 EMP_STATUS_1999_23_XRND   // EMP_STATUS_1999.23
  rename E0011924 EMP_STATUS_1999_24_XRND   // EMP_STATUS_1999.24
  rename E0011925 EMP_STATUS_1999_25_XRND   // EMP_STATUS_1999.25
  rename E0011926 EMP_STATUS_1999_26_XRND   // EMP_STATUS_1999.26
  rename E0011927 EMP_STATUS_1999_27_XRND   // EMP_STATUS_1999.27
  rename E0011928 EMP_STATUS_1999_28_XRND   // EMP_STATUS_1999.28
  rename E0011929 EMP_STATUS_1999_29_XRND   // EMP_STATUS_1999.29
  rename E0011930 EMP_STATUS_1999_30_XRND   // EMP_STATUS_1999.30
  rename E0011931 EMP_STATUS_1999_31_XRND   // EMP_STATUS_1999.31
  rename E0011932 EMP_STATUS_1999_32_XRND   // EMP_STATUS_1999.32
  rename E0011933 EMP_STATUS_1999_33_XRND   // EMP_STATUS_1999.33
  rename E0011934 EMP_STATUS_1999_34_XRND   // EMP_STATUS_1999.34
  rename E0011935 EMP_STATUS_1999_35_XRND   // EMP_STATUS_1999.35
  rename E0011936 EMP_STATUS_1999_36_XRND   // EMP_STATUS_1999.36
  rename E0011937 EMP_STATUS_1999_37_XRND   // EMP_STATUS_1999.37
  rename E0011938 EMP_STATUS_1999_38_XRND   // EMP_STATUS_1999.38
  rename E0011939 EMP_STATUS_1999_39_XRND   // EMP_STATUS_1999.39
  rename E0011940 EMP_STATUS_1999_40_XRND   // EMP_STATUS_1999.40
  rename E0011941 EMP_STATUS_1999_41_XRND   // EMP_STATUS_1999.41
  rename E0011942 EMP_STATUS_1999_42_XRND   // EMP_STATUS_1999.42
  rename E0011943 EMP_STATUS_1999_43_XRND   // EMP_STATUS_1999.43
  rename E0011944 EMP_STATUS_1999_44_XRND   // EMP_STATUS_1999.44
  rename E0011945 EMP_STATUS_1999_45_XRND   // EMP_STATUS_1999.45
  rename E0011946 EMP_STATUS_1999_46_XRND   // EMP_STATUS_1999.46
  rename E0011947 EMP_STATUS_1999_47_XRND   // EMP_STATUS_1999.47
  rename E0011948 EMP_STATUS_1999_48_XRND   // EMP_STATUS_1999.48
  rename E0011949 EMP_STATUS_1999_49_XRND   // EMP_STATUS_1999.49
  rename E0011950 EMP_STATUS_1999_50_XRND   // EMP_STATUS_1999.50
  rename E0011951 EMP_STATUS_1999_51_XRND   // EMP_STATUS_1999.51
  rename E0011952 EMP_STATUS_1999_52_XRND   // EMP_STATUS_1999.52
  rename E0012001 EMP_STATUS_2000_01_XRND   // EMP_STATUS_2000.01
  rename E0012002 EMP_STATUS_2000_02_XRND   // EMP_STATUS_2000.02
  rename E0012003 EMP_STATUS_2000_03_XRND   // EMP_STATUS_2000.03
  rename E0012004 EMP_STATUS_2000_04_XRND   // EMP_STATUS_2000.04
  rename E0012005 EMP_STATUS_2000_05_XRND   // EMP_STATUS_2000.05
  rename E0012006 EMP_STATUS_2000_06_XRND   // EMP_STATUS_2000.06
  rename E0012007 EMP_STATUS_2000_07_XRND   // EMP_STATUS_2000.07
  rename E0012008 EMP_STATUS_2000_08_XRND   // EMP_STATUS_2000.08
  rename E0012009 EMP_STATUS_2000_09_XRND   // EMP_STATUS_2000.09
  rename E0012010 EMP_STATUS_2000_10_XRND   // EMP_STATUS_2000.10
  rename E0012011 EMP_STATUS_2000_11_XRND   // EMP_STATUS_2000.11
  rename E0012012 EMP_STATUS_2000_12_XRND   // EMP_STATUS_2000.12
  rename E0012013 EMP_STATUS_2000_13_XRND   // EMP_STATUS_2000.13
  rename E0012014 EMP_STATUS_2000_14_XRND   // EMP_STATUS_2000.14
  rename E0012015 EMP_STATUS_2000_15_XRND   // EMP_STATUS_2000.15
  rename E0012016 EMP_STATUS_2000_16_XRND   // EMP_STATUS_2000.16
  rename E0012017 EMP_STATUS_2000_17_XRND   // EMP_STATUS_2000.17
  rename E0012018 EMP_STATUS_2000_18_XRND   // EMP_STATUS_2000.18
  rename E0012019 EMP_STATUS_2000_19_XRND   // EMP_STATUS_2000.19
  rename E0012020 EMP_STATUS_2000_20_XRND   // EMP_STATUS_2000.20
  rename E0012021 EMP_STATUS_2000_21_XRND   // EMP_STATUS_2000.21
  rename E0012022 EMP_STATUS_2000_22_XRND   // EMP_STATUS_2000.22
  rename E0012023 EMP_STATUS_2000_23_XRND   // EMP_STATUS_2000.23
  rename E0012024 EMP_STATUS_2000_24_XRND   // EMP_STATUS_2000.24
  rename E0012025 EMP_STATUS_2000_25_XRND   // EMP_STATUS_2000.25
  rename E0012026 EMP_STATUS_2000_26_XRND   // EMP_STATUS_2000.26
  rename E0012027 EMP_STATUS_2000_27_XRND   // EMP_STATUS_2000.27
  rename E0012028 EMP_STATUS_2000_28_XRND   // EMP_STATUS_2000.28
  rename E0012029 EMP_STATUS_2000_29_XRND   // EMP_STATUS_2000.29
  rename E0012030 EMP_STATUS_2000_30_XRND   // EMP_STATUS_2000.30
  rename E0012031 EMP_STATUS_2000_31_XRND   // EMP_STATUS_2000.31
  rename E0012032 EMP_STATUS_2000_32_XRND   // EMP_STATUS_2000.32
  rename E0012033 EMP_STATUS_2000_33_XRND   // EMP_STATUS_2000.33
  rename E0012034 EMP_STATUS_2000_34_XRND   // EMP_STATUS_2000.34
  rename E0012035 EMP_STATUS_2000_35_XRND   // EMP_STATUS_2000.35
  rename E0012036 EMP_STATUS_2000_36_XRND   // EMP_STATUS_2000.36
  rename E0012037 EMP_STATUS_2000_37_XRND   // EMP_STATUS_2000.37
  rename E0012038 EMP_STATUS_2000_38_XRND   // EMP_STATUS_2000.38
  rename E0012039 EMP_STATUS_2000_39_XRND   // EMP_STATUS_2000.39
  rename E0012040 EMP_STATUS_2000_40_XRND   // EMP_STATUS_2000.40
  rename E0012041 EMP_STATUS_2000_41_XRND   // EMP_STATUS_2000.41
  rename E0012042 EMP_STATUS_2000_42_XRND   // EMP_STATUS_2000.42
  rename E0012043 EMP_STATUS_2000_43_XRND   // EMP_STATUS_2000.43
  rename E0012044 EMP_STATUS_2000_44_XRND   // EMP_STATUS_2000.44
  rename E0012045 EMP_STATUS_2000_45_XRND   // EMP_STATUS_2000.45
  rename E0012046 EMP_STATUS_2000_46_XRND   // EMP_STATUS_2000.46
  rename E0012047 EMP_STATUS_2000_47_XRND   // EMP_STATUS_2000.47
  rename E0012048 EMP_STATUS_2000_48_XRND   // EMP_STATUS_2000.48
  rename E0012049 EMP_STATUS_2000_49_XRND   // EMP_STATUS_2000.49
  rename E0012050 EMP_STATUS_2000_50_XRND   // EMP_STATUS_2000.50
  rename E0012051 EMP_STATUS_2000_51_XRND   // EMP_STATUS_2000.51
  rename E0012052 EMP_STATUS_2000_52_XRND   // EMP_STATUS_2000.52
  rename E0012053 EMP_STATUS_2000_53_XRND   // EMP_STATUS_2000.53
  rename E0012101 EMP_STATUS_2001_01_XRND   // EMP_STATUS_2001.01
  rename E0012102 EMP_STATUS_2001_02_XRND   // EMP_STATUS_2001.02
  rename E0012103 EMP_STATUS_2001_03_XRND   // EMP_STATUS_2001.03
  rename E0012104 EMP_STATUS_2001_04_XRND   // EMP_STATUS_2001.04
  rename E0012105 EMP_STATUS_2001_05_XRND   // EMP_STATUS_2001.05
  rename E0012106 EMP_STATUS_2001_06_XRND   // EMP_STATUS_2001.06
  rename E0012107 EMP_STATUS_2001_07_XRND   // EMP_STATUS_2001.07
  rename E0012108 EMP_STATUS_2001_08_XRND   // EMP_STATUS_2001.08
  rename E0012109 EMP_STATUS_2001_09_XRND   // EMP_STATUS_2001.09
  rename E0012110 EMP_STATUS_2001_10_XRND   // EMP_STATUS_2001.10
  rename E0012111 EMP_STATUS_2001_11_XRND   // EMP_STATUS_2001.11
  rename E0012112 EMP_STATUS_2001_12_XRND   // EMP_STATUS_2001.12
  rename E0012113 EMP_STATUS_2001_13_XRND   // EMP_STATUS_2001.13
  rename E0012114 EMP_STATUS_2001_14_XRND   // EMP_STATUS_2001.14
  rename E0012115 EMP_STATUS_2001_15_XRND   // EMP_STATUS_2001.15
  rename E0012116 EMP_STATUS_2001_16_XRND   // EMP_STATUS_2001.16
  rename E0012117 EMP_STATUS_2001_17_XRND   // EMP_STATUS_2001.17
  rename E0012118 EMP_STATUS_2001_18_XRND   // EMP_STATUS_2001.18
  rename E0012119 EMP_STATUS_2001_19_XRND   // EMP_STATUS_2001.19
  rename E0012120 EMP_STATUS_2001_20_XRND   // EMP_STATUS_2001.20
  rename E0012121 EMP_STATUS_2001_21_XRND   // EMP_STATUS_2001.21
  rename E0012122 EMP_STATUS_2001_22_XRND   // EMP_STATUS_2001.22
  rename E0012123 EMP_STATUS_2001_23_XRND   // EMP_STATUS_2001.23
  rename E0012124 EMP_STATUS_2001_24_XRND   // EMP_STATUS_2001.24
  rename E0012125 EMP_STATUS_2001_25_XRND   // EMP_STATUS_2001.25
  rename E0012126 EMP_STATUS_2001_26_XRND   // EMP_STATUS_2001.26
  rename E0012127 EMP_STATUS_2001_27_XRND   // EMP_STATUS_2001.27
  rename E0012128 EMP_STATUS_2001_28_XRND   // EMP_STATUS_2001.28
  rename E0012129 EMP_STATUS_2001_29_XRND   // EMP_STATUS_2001.29
  rename E0012130 EMP_STATUS_2001_30_XRND   // EMP_STATUS_2001.30
  rename E0012131 EMP_STATUS_2001_31_XRND   // EMP_STATUS_2001.31
  rename E0012132 EMP_STATUS_2001_32_XRND   // EMP_STATUS_2001.32
  rename E0012133 EMP_STATUS_2001_33_XRND   // EMP_STATUS_2001.33
  rename E0012134 EMP_STATUS_2001_34_XRND   // EMP_STATUS_2001.34
  rename E0012135 EMP_STATUS_2001_35_XRND   // EMP_STATUS_2001.35
  rename E0012136 EMP_STATUS_2001_36_XRND   // EMP_STATUS_2001.36
  rename E0012137 EMP_STATUS_2001_37_XRND   // EMP_STATUS_2001.37
  rename E0012138 EMP_STATUS_2001_38_XRND   // EMP_STATUS_2001.38
  rename E0012139 EMP_STATUS_2001_39_XRND   // EMP_STATUS_2001.39
  rename E0012140 EMP_STATUS_2001_40_XRND   // EMP_STATUS_2001.40
  rename E0012141 EMP_STATUS_2001_41_XRND   // EMP_STATUS_2001.41
  rename E0012142 EMP_STATUS_2001_42_XRND   // EMP_STATUS_2001.42
  rename E0012143 EMP_STATUS_2001_43_XRND   // EMP_STATUS_2001.43
  rename E0012144 EMP_STATUS_2001_44_XRND   // EMP_STATUS_2001.44
  rename E0012145 EMP_STATUS_2001_45_XRND   // EMP_STATUS_2001.45
  rename E0012146 EMP_STATUS_2001_46_XRND   // EMP_STATUS_2001.46
  rename E0012147 EMP_STATUS_2001_47_XRND   // EMP_STATUS_2001.47
  rename E0012148 EMP_STATUS_2001_48_XRND   // EMP_STATUS_2001.48
  rename E0012149 EMP_STATUS_2001_49_XRND   // EMP_STATUS_2001.49
  rename E0012150 EMP_STATUS_2001_50_XRND   // EMP_STATUS_2001.50
  rename E0012151 EMP_STATUS_2001_51_XRND   // EMP_STATUS_2001.51
  rename E0012152 EMP_STATUS_2001_52_XRND   // EMP_STATUS_2001.52
  rename E0012201 EMP_STATUS_2002_01_XRND   // EMP_STATUS_2002.01
  rename E0012202 EMP_STATUS_2002_02_XRND   // EMP_STATUS_2002.02
  rename E0012203 EMP_STATUS_2002_03_XRND   // EMP_STATUS_2002.03
  rename E0012204 EMP_STATUS_2002_04_XRND   // EMP_STATUS_2002.04
  rename E0012205 EMP_STATUS_2002_05_XRND   // EMP_STATUS_2002.05
  rename E0012206 EMP_STATUS_2002_06_XRND   // EMP_STATUS_2002.06
  rename E0012207 EMP_STATUS_2002_07_XRND   // EMP_STATUS_2002.07
  rename E0012208 EMP_STATUS_2002_08_XRND   // EMP_STATUS_2002.08
  rename E0012209 EMP_STATUS_2002_09_XRND   // EMP_STATUS_2002.09
  rename E0012210 EMP_STATUS_2002_10_XRND   // EMP_STATUS_2002.10
  rename E0012211 EMP_STATUS_2002_11_XRND   // EMP_STATUS_2002.11
  rename E0012212 EMP_STATUS_2002_12_XRND   // EMP_STATUS_2002.12
  rename E0012213 EMP_STATUS_2002_13_XRND   // EMP_STATUS_2002.13
  rename E0012214 EMP_STATUS_2002_14_XRND   // EMP_STATUS_2002.14
  rename E0012215 EMP_STATUS_2002_15_XRND   // EMP_STATUS_2002.15
  rename E0012216 EMP_STATUS_2002_16_XRND   // EMP_STATUS_2002.16
  rename E0012217 EMP_STATUS_2002_17_XRND   // EMP_STATUS_2002.17
  rename E0012218 EMP_STATUS_2002_18_XRND   // EMP_STATUS_2002.18
  rename E0012219 EMP_STATUS_2002_19_XRND   // EMP_STATUS_2002.19
  rename E0012220 EMP_STATUS_2002_20_XRND   // EMP_STATUS_2002.20
  rename E0012221 EMP_STATUS_2002_21_XRND   // EMP_STATUS_2002.21
  rename E0012222 EMP_STATUS_2002_22_XRND   // EMP_STATUS_2002.22
  rename E0012223 EMP_STATUS_2002_23_XRND   // EMP_STATUS_2002.23
  rename E0012224 EMP_STATUS_2002_24_XRND   // EMP_STATUS_2002.24
  rename E0012225 EMP_STATUS_2002_25_XRND   // EMP_STATUS_2002.25
  rename E0012226 EMP_STATUS_2002_26_XRND   // EMP_STATUS_2002.26
  rename E0012227 EMP_STATUS_2002_27_XRND   // EMP_STATUS_2002.27
  rename E0012228 EMP_STATUS_2002_28_XRND   // EMP_STATUS_2002.28
  rename E0012229 EMP_STATUS_2002_29_XRND   // EMP_STATUS_2002.29
  rename E0012230 EMP_STATUS_2002_30_XRND   // EMP_STATUS_2002.30
  rename E0012231 EMP_STATUS_2002_31_XRND   // EMP_STATUS_2002.31
  rename E0012232 EMP_STATUS_2002_32_XRND   // EMP_STATUS_2002.32
  rename E0012233 EMP_STATUS_2002_33_XRND   // EMP_STATUS_2002.33
  rename E0012234 EMP_STATUS_2002_34_XRND   // EMP_STATUS_2002.34
  rename E0012235 EMP_STATUS_2002_35_XRND   // EMP_STATUS_2002.35
  rename E0012236 EMP_STATUS_2002_36_XRND   // EMP_STATUS_2002.36
  rename E0012237 EMP_STATUS_2002_37_XRND   // EMP_STATUS_2002.37
  rename E0012238 EMP_STATUS_2002_38_XRND   // EMP_STATUS_2002.38
  rename E0012239 EMP_STATUS_2002_39_XRND   // EMP_STATUS_2002.39
  rename E0012240 EMP_STATUS_2002_40_XRND   // EMP_STATUS_2002.40
  rename E0012241 EMP_STATUS_2002_41_XRND   // EMP_STATUS_2002.41
  rename E0012242 EMP_STATUS_2002_42_XRND   // EMP_STATUS_2002.42
  rename E0012243 EMP_STATUS_2002_43_XRND   // EMP_STATUS_2002.43
  rename E0012244 EMP_STATUS_2002_44_XRND   // EMP_STATUS_2002.44
  rename E0012245 EMP_STATUS_2002_45_XRND   // EMP_STATUS_2002.45
  rename E0012246 EMP_STATUS_2002_46_XRND   // EMP_STATUS_2002.46
  rename E0012247 EMP_STATUS_2002_47_XRND   // EMP_STATUS_2002.47
  rename E0012248 EMP_STATUS_2002_48_XRND   // EMP_STATUS_2002.48
  rename E0012249 EMP_STATUS_2002_49_XRND   // EMP_STATUS_2002.49
  rename E0012250 EMP_STATUS_2002_50_XRND   // EMP_STATUS_2002.50
  rename E0012251 EMP_STATUS_2002_51_XRND   // EMP_STATUS_2002.51
  rename E0012252 EMP_STATUS_2002_52_XRND   // EMP_STATUS_2002.52
  rename E0012301 EMP_STATUS_2003_01_XRND   // EMP_STATUS_2003.01
  rename E0012302 EMP_STATUS_2003_02_XRND   // EMP_STATUS_2003.02
  rename E0012303 EMP_STATUS_2003_03_XRND   // EMP_STATUS_2003.03
  rename E0012304 EMP_STATUS_2003_04_XRND   // EMP_STATUS_2003.04
  rename E0012305 EMP_STATUS_2003_05_XRND   // EMP_STATUS_2003.05
  rename E0012306 EMP_STATUS_2003_06_XRND   // EMP_STATUS_2003.06
  rename E0012307 EMP_STATUS_2003_07_XRND   // EMP_STATUS_2003.07
  rename E0012308 EMP_STATUS_2003_08_XRND   // EMP_STATUS_2003.08
  rename E0012309 EMP_STATUS_2003_09_XRND   // EMP_STATUS_2003.09
  rename E0012310 EMP_STATUS_2003_10_XRND   // EMP_STATUS_2003.10
  rename E0012311 EMP_STATUS_2003_11_XRND   // EMP_STATUS_2003.11
  rename E0012312 EMP_STATUS_2003_12_XRND   // EMP_STATUS_2003.12
  rename E0012313 EMP_STATUS_2003_13_XRND   // EMP_STATUS_2003.13
  rename E0012314 EMP_STATUS_2003_14_XRND   // EMP_STATUS_2003.14
  rename E0012315 EMP_STATUS_2003_15_XRND   // EMP_STATUS_2003.15
  rename E0012316 EMP_STATUS_2003_16_XRND   // EMP_STATUS_2003.16
  rename E0012317 EMP_STATUS_2003_17_XRND   // EMP_STATUS_2003.17
  rename E0012318 EMP_STATUS_2003_18_XRND   // EMP_STATUS_2003.18
  rename E0012319 EMP_STATUS_2003_19_XRND   // EMP_STATUS_2003.19
  rename E0012320 EMP_STATUS_2003_20_XRND   // EMP_STATUS_2003.20
  rename E0012321 EMP_STATUS_2003_21_XRND   // EMP_STATUS_2003.21
  rename E0012322 EMP_STATUS_2003_22_XRND   // EMP_STATUS_2003.22
  rename E0012323 EMP_STATUS_2003_23_XRND   // EMP_STATUS_2003.23
  rename E0012324 EMP_STATUS_2003_24_XRND   // EMP_STATUS_2003.24
  rename E0012325 EMP_STATUS_2003_25_XRND   // EMP_STATUS_2003.25
  rename E0012326 EMP_STATUS_2003_26_XRND   // EMP_STATUS_2003.26
  rename E0012327 EMP_STATUS_2003_27_XRND   // EMP_STATUS_2003.27
  rename E0012328 EMP_STATUS_2003_28_XRND   // EMP_STATUS_2003.28
  rename E0012329 EMP_STATUS_2003_29_XRND   // EMP_STATUS_2003.29
  rename E0012330 EMP_STATUS_2003_30_XRND   // EMP_STATUS_2003.30
  rename E0012331 EMP_STATUS_2003_31_XRND   // EMP_STATUS_2003.31
  rename E0012332 EMP_STATUS_2003_32_XRND   // EMP_STATUS_2003.32
  rename E0012333 EMP_STATUS_2003_33_XRND   // EMP_STATUS_2003.33
  rename E0012334 EMP_STATUS_2003_34_XRND   // EMP_STATUS_2003.34
  rename E0012335 EMP_STATUS_2003_35_XRND   // EMP_STATUS_2003.35
  rename E0012336 EMP_STATUS_2003_36_XRND   // EMP_STATUS_2003.36
  rename E0012337 EMP_STATUS_2003_37_XRND   // EMP_STATUS_2003.37
  rename E0012338 EMP_STATUS_2003_38_XRND   // EMP_STATUS_2003.38
  rename E0012339 EMP_STATUS_2003_39_XRND   // EMP_STATUS_2003.39
  rename E0012340 EMP_STATUS_2003_40_XRND   // EMP_STATUS_2003.40
  rename E0012341 EMP_STATUS_2003_41_XRND   // EMP_STATUS_2003.41
  rename E0012342 EMP_STATUS_2003_42_XRND   // EMP_STATUS_2003.42
  rename E0012343 EMP_STATUS_2003_43_XRND   // EMP_STATUS_2003.43
  rename E0012344 EMP_STATUS_2003_44_XRND   // EMP_STATUS_2003.44
  rename E0012345 EMP_STATUS_2003_45_XRND   // EMP_STATUS_2003.45
  rename E0012346 EMP_STATUS_2003_46_XRND   // EMP_STATUS_2003.46
  rename E0012347 EMP_STATUS_2003_47_XRND   // EMP_STATUS_2003.47
  rename E0012348 EMP_STATUS_2003_48_XRND   // EMP_STATUS_2003.48
  rename E0012349 EMP_STATUS_2003_49_XRND   // EMP_STATUS_2003.49
  rename E0012350 EMP_STATUS_2003_50_XRND   // EMP_STATUS_2003.50
  rename E0012351 EMP_STATUS_2003_51_XRND   // EMP_STATUS_2003.51
  rename E0012352 EMP_STATUS_2003_52_XRND   // EMP_STATUS_2003.52
  rename E0012401 EMP_STATUS_2004_01_XRND   // EMP_STATUS_2004.01
  rename E0012402 EMP_STATUS_2004_02_XRND   // EMP_STATUS_2004.02
  rename E0012403 EMP_STATUS_2004_03_XRND   // EMP_STATUS_2004.03
  rename E0012404 EMP_STATUS_2004_04_XRND   // EMP_STATUS_2004.04
  rename E0012405 EMP_STATUS_2004_05_XRND   // EMP_STATUS_2004.05
  rename E0012406 EMP_STATUS_2004_06_XRND   // EMP_STATUS_2004.06
  rename E0012407 EMP_STATUS_2004_07_XRND   // EMP_STATUS_2004.07
  rename E0012408 EMP_STATUS_2004_08_XRND   // EMP_STATUS_2004.08
  rename E0012409 EMP_STATUS_2004_09_XRND   // EMP_STATUS_2004.09
  rename E0012410 EMP_STATUS_2004_10_XRND   // EMP_STATUS_2004.10
  rename E0012411 EMP_STATUS_2004_11_XRND   // EMP_STATUS_2004.11
  rename E0012412 EMP_STATUS_2004_12_XRND   // EMP_STATUS_2004.12
  rename E0012413 EMP_STATUS_2004_13_XRND   // EMP_STATUS_2004.13
  rename E0012414 EMP_STATUS_2004_14_XRND   // EMP_STATUS_2004.14
  rename E0012415 EMP_STATUS_2004_15_XRND   // EMP_STATUS_2004.15
  rename E0012416 EMP_STATUS_2004_16_XRND   // EMP_STATUS_2004.16
  rename E0012417 EMP_STATUS_2004_17_XRND   // EMP_STATUS_2004.17
  rename E0012418 EMP_STATUS_2004_18_XRND   // EMP_STATUS_2004.18
  rename E0012419 EMP_STATUS_2004_19_XRND   // EMP_STATUS_2004.19
  rename E0012420 EMP_STATUS_2004_20_XRND   // EMP_STATUS_2004.20
  rename E0012421 EMP_STATUS_2004_21_XRND   // EMP_STATUS_2004.21
  rename E0012422 EMP_STATUS_2004_22_XRND   // EMP_STATUS_2004.22
  rename E0012423 EMP_STATUS_2004_23_XRND   // EMP_STATUS_2004.23
  rename E0012424 EMP_STATUS_2004_24_XRND   // EMP_STATUS_2004.24
  rename E0012425 EMP_STATUS_2004_25_XRND   // EMP_STATUS_2004.25
  rename E0012426 EMP_STATUS_2004_26_XRND   // EMP_STATUS_2004.26
  rename E0012427 EMP_STATUS_2004_27_XRND   // EMP_STATUS_2004.27
  rename E0012428 EMP_STATUS_2004_28_XRND   // EMP_STATUS_2004.28
  rename E0012429 EMP_STATUS_2004_29_XRND   // EMP_STATUS_2004.29
  rename E0012430 EMP_STATUS_2004_30_XRND   // EMP_STATUS_2004.30
  rename E0012431 EMP_STATUS_2004_31_XRND   // EMP_STATUS_2004.31
  rename E0012432 EMP_STATUS_2004_32_XRND   // EMP_STATUS_2004.32
  rename E0012433 EMP_STATUS_2004_33_XRND   // EMP_STATUS_2004.33
  rename E0012434 EMP_STATUS_2004_34_XRND   // EMP_STATUS_2004.34
  rename E0012435 EMP_STATUS_2004_35_XRND   // EMP_STATUS_2004.35
  rename E0012436 EMP_STATUS_2004_36_XRND   // EMP_STATUS_2004.36
  rename E0012437 EMP_STATUS_2004_37_XRND   // EMP_STATUS_2004.37
  rename E0012438 EMP_STATUS_2004_38_XRND   // EMP_STATUS_2004.38
  rename E0012439 EMP_STATUS_2004_39_XRND   // EMP_STATUS_2004.39
  rename E0012440 EMP_STATUS_2004_40_XRND   // EMP_STATUS_2004.40
  rename E0012441 EMP_STATUS_2004_41_XRND   // EMP_STATUS_2004.41
  rename E0012442 EMP_STATUS_2004_42_XRND   // EMP_STATUS_2004.42
  rename E0012443 EMP_STATUS_2004_43_XRND   // EMP_STATUS_2004.43
  rename E0012444 EMP_STATUS_2004_44_XRND   // EMP_STATUS_2004.44
  rename E0012445 EMP_STATUS_2004_45_XRND   // EMP_STATUS_2004.45
  rename E0012446 EMP_STATUS_2004_46_XRND   // EMP_STATUS_2004.46
  rename E0012447 EMP_STATUS_2004_47_XRND   // EMP_STATUS_2004.47
  rename E0012448 EMP_STATUS_2004_48_XRND   // EMP_STATUS_2004.48
  rename E0012449 EMP_STATUS_2004_49_XRND   // EMP_STATUS_2004.49
  rename E0012450 EMP_STATUS_2004_50_XRND   // EMP_STATUS_2004.50
  rename E0012451 EMP_STATUS_2004_51_XRND   // EMP_STATUS_2004.51
  rename E0012452 EMP_STATUS_2004_52_XRND   // EMP_STATUS_2004.52
  rename E0012501 EMP_STATUS_2005_01_XRND   // EMP_STATUS_2005.01
  rename E0012502 EMP_STATUS_2005_02_XRND   // EMP_STATUS_2005.02
  rename E0012503 EMP_STATUS_2005_03_XRND   // EMP_STATUS_2005.03
  rename E0012504 EMP_STATUS_2005_04_XRND   // EMP_STATUS_2005.04
  rename E0012505 EMP_STATUS_2005_05_XRND   // EMP_STATUS_2005.05
  rename E0012506 EMP_STATUS_2005_06_XRND   // EMP_STATUS_2005.06
  rename E0012507 EMP_STATUS_2005_07_XRND   // EMP_STATUS_2005.07
  rename E0012508 EMP_STATUS_2005_08_XRND   // EMP_STATUS_2005.08
  rename E0012509 EMP_STATUS_2005_09_XRND   // EMP_STATUS_2005.09
  rename E0012510 EMP_STATUS_2005_10_XRND   // EMP_STATUS_2005.10
  rename E0012511 EMP_STATUS_2005_11_XRND   // EMP_STATUS_2005.11
  rename E0012512 EMP_STATUS_2005_12_XRND   // EMP_STATUS_2005.12
  rename E0012513 EMP_STATUS_2005_13_XRND   // EMP_STATUS_2005.13
  rename E0012514 EMP_STATUS_2005_14_XRND   // EMP_STATUS_2005.14
  rename E0012515 EMP_STATUS_2005_15_XRND   // EMP_STATUS_2005.15
  rename E0012516 EMP_STATUS_2005_16_XRND   // EMP_STATUS_2005.16
  rename E0012517 EMP_STATUS_2005_17_XRND   // EMP_STATUS_2005.17
  rename E0012518 EMP_STATUS_2005_18_XRND   // EMP_STATUS_2005.18
  rename E0012519 EMP_STATUS_2005_19_XRND   // EMP_STATUS_2005.19
  rename E0012520 EMP_STATUS_2005_20_XRND   // EMP_STATUS_2005.20
  rename E0012521 EMP_STATUS_2005_21_XRND   // EMP_STATUS_2005.21
  rename E0012522 EMP_STATUS_2005_22_XRND   // EMP_STATUS_2005.22
  rename E0012523 EMP_STATUS_2005_23_XRND   // EMP_STATUS_2005.23
  rename E0012524 EMP_STATUS_2005_24_XRND   // EMP_STATUS_2005.24
  rename E0012525 EMP_STATUS_2005_25_XRND   // EMP_STATUS_2005.25
  rename E0012526 EMP_STATUS_2005_26_XRND   // EMP_STATUS_2005.26
  rename E0012527 EMP_STATUS_2005_27_XRND   // EMP_STATUS_2005.27
  rename E0012528 EMP_STATUS_2005_28_XRND   // EMP_STATUS_2005.28
  rename E0012529 EMP_STATUS_2005_29_XRND   // EMP_STATUS_2005.29
  rename E0012530 EMP_STATUS_2005_30_XRND   // EMP_STATUS_2005.30
  rename E0012531 EMP_STATUS_2005_31_XRND   // EMP_STATUS_2005.31
  rename E0012532 EMP_STATUS_2005_32_XRND   // EMP_STATUS_2005.32
  rename E0012533 EMP_STATUS_2005_33_XRND   // EMP_STATUS_2005.33
  rename E0012534 EMP_STATUS_2005_34_XRND   // EMP_STATUS_2005.34
  rename E0012535 EMP_STATUS_2005_35_XRND   // EMP_STATUS_2005.35
  rename E0012536 EMP_STATUS_2005_36_XRND   // EMP_STATUS_2005.36
  rename E0012537 EMP_STATUS_2005_37_XRND   // EMP_STATUS_2005.37
  rename E0012538 EMP_STATUS_2005_38_XRND   // EMP_STATUS_2005.38
  rename E0012539 EMP_STATUS_2005_39_XRND   // EMP_STATUS_2005.39
  rename E0012540 EMP_STATUS_2005_40_XRND   // EMP_STATUS_2005.40
  rename E0012541 EMP_STATUS_2005_41_XRND   // EMP_STATUS_2005.41
  rename E0012542 EMP_STATUS_2005_42_XRND   // EMP_STATUS_2005.42
  rename E0012543 EMP_STATUS_2005_43_XRND   // EMP_STATUS_2005.43
  rename E0012544 EMP_STATUS_2005_44_XRND   // EMP_STATUS_2005.44
  rename E0012545 EMP_STATUS_2005_45_XRND   // EMP_STATUS_2005.45
  rename E0012546 EMP_STATUS_2005_46_XRND   // EMP_STATUS_2005.46
  rename E0012547 EMP_STATUS_2005_47_XRND   // EMP_STATUS_2005.47
  rename E0012548 EMP_STATUS_2005_48_XRND   // EMP_STATUS_2005.48
  rename E0012549 EMP_STATUS_2005_49_XRND   // EMP_STATUS_2005.49
  rename E0012550 EMP_STATUS_2005_50_XRND   // EMP_STATUS_2005.50
  rename E0012551 EMP_STATUS_2005_51_XRND   // EMP_STATUS_2005.51
  rename E0012552 EMP_STATUS_2005_52_XRND   // EMP_STATUS_2005.52
  rename E0012553 EMP_STATUS_2005_53_XRND   // EMP_STATUS_2005.53
  rename E0012601 EMP_STATUS_2006_01_XRND   // EMP_STATUS_2006.01
  rename E0012602 EMP_STATUS_2006_02_XRND   // EMP_STATUS_2006.02
  rename E0012603 EMP_STATUS_2006_03_XRND   // EMP_STATUS_2006.03
  rename E0012604 EMP_STATUS_2006_04_XRND   // EMP_STATUS_2006.04
  rename E0012605 EMP_STATUS_2006_05_XRND   // EMP_STATUS_2006.05
  rename E0012606 EMP_STATUS_2006_06_XRND   // EMP_STATUS_2006.06
  rename E0012607 EMP_STATUS_2006_07_XRND   // EMP_STATUS_2006.07
  rename E0012608 EMP_STATUS_2006_08_XRND   // EMP_STATUS_2006.08
  rename E0012609 EMP_STATUS_2006_09_XRND   // EMP_STATUS_2006.09
  rename E0012610 EMP_STATUS_2006_10_XRND   // EMP_STATUS_2006.10
  rename E0012611 EMP_STATUS_2006_11_XRND   // EMP_STATUS_2006.11
  rename E0012612 EMP_STATUS_2006_12_XRND   // EMP_STATUS_2006.12
  rename E0012613 EMP_STATUS_2006_13_XRND   // EMP_STATUS_2006.13
  rename E0012614 EMP_STATUS_2006_14_XRND   // EMP_STATUS_2006.14
  rename E0012615 EMP_STATUS_2006_15_XRND   // EMP_STATUS_2006.15
  rename E0012616 EMP_STATUS_2006_16_XRND   // EMP_STATUS_2006.16
  rename E0012617 EMP_STATUS_2006_17_XRND   // EMP_STATUS_2006.17
  rename E0012618 EMP_STATUS_2006_18_XRND   // EMP_STATUS_2006.18
  rename E0012619 EMP_STATUS_2006_19_XRND   // EMP_STATUS_2006.19
  rename E0012620 EMP_STATUS_2006_20_XRND   // EMP_STATUS_2006.20
  rename E0012621 EMP_STATUS_2006_21_XRND   // EMP_STATUS_2006.21
  rename E0012622 EMP_STATUS_2006_22_XRND   // EMP_STATUS_2006.22
  rename E0012623 EMP_STATUS_2006_23_XRND   // EMP_STATUS_2006.23
  rename E0012624 EMP_STATUS_2006_24_XRND   // EMP_STATUS_2006.24
  rename E0012625 EMP_STATUS_2006_25_XRND   // EMP_STATUS_2006.25
  rename E0012626 EMP_STATUS_2006_26_XRND   // EMP_STATUS_2006.26
  rename E0012627 EMP_STATUS_2006_27_XRND   // EMP_STATUS_2006.27
  rename E0012628 EMP_STATUS_2006_28_XRND   // EMP_STATUS_2006.28
  rename E0012629 EMP_STATUS_2006_29_XRND   // EMP_STATUS_2006.29
  rename E0012630 EMP_STATUS_2006_30_XRND   // EMP_STATUS_2006.30
  rename E0012631 EMP_STATUS_2006_31_XRND   // EMP_STATUS_2006.31
  rename E0012632 EMP_STATUS_2006_32_XRND   // EMP_STATUS_2006.32
  rename E0012633 EMP_STATUS_2006_33_XRND   // EMP_STATUS_2006.33
  rename E0012634 EMP_STATUS_2006_34_XRND   // EMP_STATUS_2006.34
  rename E0012635 EMP_STATUS_2006_35_XRND   // EMP_STATUS_2006.35
  rename E0012636 EMP_STATUS_2006_36_XRND   // EMP_STATUS_2006.36
  rename E0012637 EMP_STATUS_2006_37_XRND   // EMP_STATUS_2006.37
  rename E0012638 EMP_STATUS_2006_38_XRND   // EMP_STATUS_2006.38
  rename E0012639 EMP_STATUS_2006_39_XRND   // EMP_STATUS_2006.39
  rename E0012640 EMP_STATUS_2006_40_XRND   // EMP_STATUS_2006.40
  rename E0012641 EMP_STATUS_2006_41_XRND   // EMP_STATUS_2006.41
  rename E0012642 EMP_STATUS_2006_42_XRND   // EMP_STATUS_2006.42
  rename E0012643 EMP_STATUS_2006_43_XRND   // EMP_STATUS_2006.43
  rename E0012644 EMP_STATUS_2006_44_XRND   // EMP_STATUS_2006.44
  rename E0012645 EMP_STATUS_2006_45_XRND   // EMP_STATUS_2006.45
  rename E0012646 EMP_STATUS_2006_46_XRND   // EMP_STATUS_2006.46
  rename E0012647 EMP_STATUS_2006_47_XRND   // EMP_STATUS_2006.47
  rename E0012648 EMP_STATUS_2006_48_XRND   // EMP_STATUS_2006.48
  rename E0012649 EMP_STATUS_2006_49_XRND   // EMP_STATUS_2006.49
  rename E0012650 EMP_STATUS_2006_50_XRND   // EMP_STATUS_2006.50
  rename E0012651 EMP_STATUS_2006_51_XRND   // EMP_STATUS_2006.51
  rename E0012652 EMP_STATUS_2006_52_XRND   // EMP_STATUS_2006.52
  rename E0012701 EMP_STATUS_2007_01_XRND   // EMP_STATUS_2007.01
  rename E0012702 EMP_STATUS_2007_02_XRND   // EMP_STATUS_2007.02
  rename E0012703 EMP_STATUS_2007_03_XRND   // EMP_STATUS_2007.03
  rename E0012704 EMP_STATUS_2007_04_XRND   // EMP_STATUS_2007.04
  rename E0012705 EMP_STATUS_2007_05_XRND   // EMP_STATUS_2007.05
  rename E0012706 EMP_STATUS_2007_06_XRND   // EMP_STATUS_2007.06
  rename E0012707 EMP_STATUS_2007_07_XRND   // EMP_STATUS_2007.07
  rename E0012708 EMP_STATUS_2007_08_XRND   // EMP_STATUS_2007.08
  rename E0012709 EMP_STATUS_2007_09_XRND   // EMP_STATUS_2007.09
  rename E0012710 EMP_STATUS_2007_10_XRND   // EMP_STATUS_2007.10
  rename E0012711 EMP_STATUS_2007_11_XRND   // EMP_STATUS_2007.11
  rename E0012712 EMP_STATUS_2007_12_XRND   // EMP_STATUS_2007.12
  rename E0012713 EMP_STATUS_2007_13_XRND   // EMP_STATUS_2007.13
  rename E0012714 EMP_STATUS_2007_14_XRND   // EMP_STATUS_2007.14
  rename E0012715 EMP_STATUS_2007_15_XRND   // EMP_STATUS_2007.15
  rename E0012716 EMP_STATUS_2007_16_XRND   // EMP_STATUS_2007.16
  rename E0012717 EMP_STATUS_2007_17_XRND   // EMP_STATUS_2007.17
  rename E0012718 EMP_STATUS_2007_18_XRND   // EMP_STATUS_2007.18
  rename E0012719 EMP_STATUS_2007_19_XRND   // EMP_STATUS_2007.19
  rename E0012720 EMP_STATUS_2007_20_XRND   // EMP_STATUS_2007.20
  rename E0012721 EMP_STATUS_2007_21_XRND   // EMP_STATUS_2007.21
  rename E0012722 EMP_STATUS_2007_22_XRND   // EMP_STATUS_2007.22
  rename E0012723 EMP_STATUS_2007_23_XRND   // EMP_STATUS_2007.23
  rename E0012724 EMP_STATUS_2007_24_XRND   // EMP_STATUS_2007.24
  rename E0012725 EMP_STATUS_2007_25_XRND   // EMP_STATUS_2007.25
  rename E0012726 EMP_STATUS_2007_26_XRND   // EMP_STATUS_2007.26
  rename E0012727 EMP_STATUS_2007_27_XRND   // EMP_STATUS_2007.27
  rename E0012728 EMP_STATUS_2007_28_XRND   // EMP_STATUS_2007.28
  rename E0012729 EMP_STATUS_2007_29_XRND   // EMP_STATUS_2007.29
  rename E0012730 EMP_STATUS_2007_30_XRND   // EMP_STATUS_2007.30
  rename E0012731 EMP_STATUS_2007_31_XRND   // EMP_STATUS_2007.31
  rename E0012732 EMP_STATUS_2007_32_XRND   // EMP_STATUS_2007.32
  rename E0012733 EMP_STATUS_2007_33_XRND   // EMP_STATUS_2007.33
  rename E0012734 EMP_STATUS_2007_34_XRND   // EMP_STATUS_2007.34
  rename E0012735 EMP_STATUS_2007_35_XRND   // EMP_STATUS_2007.35
  rename E0012736 EMP_STATUS_2007_36_XRND   // EMP_STATUS_2007.36
  rename E0012737 EMP_STATUS_2007_37_XRND   // EMP_STATUS_2007.37
  rename E0012738 EMP_STATUS_2007_38_XRND   // EMP_STATUS_2007.38
  rename E0012739 EMP_STATUS_2007_39_XRND   // EMP_STATUS_2007.39
  rename E0012740 EMP_STATUS_2007_40_XRND   // EMP_STATUS_2007.40
  rename E0012741 EMP_STATUS_2007_41_XRND   // EMP_STATUS_2007.41
  rename E0012742 EMP_STATUS_2007_42_XRND   // EMP_STATUS_2007.42
  rename E0012743 EMP_STATUS_2007_43_XRND   // EMP_STATUS_2007.43
  rename E0012744 EMP_STATUS_2007_44_XRND   // EMP_STATUS_2007.44
  rename E0012745 EMP_STATUS_2007_45_XRND   // EMP_STATUS_2007.45
  rename E0012746 EMP_STATUS_2007_46_XRND   // EMP_STATUS_2007.46
  rename E0012747 EMP_STATUS_2007_47_XRND   // EMP_STATUS_2007.47
  rename E0012748 EMP_STATUS_2007_48_XRND   // EMP_STATUS_2007.48
  rename E0012749 EMP_STATUS_2007_49_XRND   // EMP_STATUS_2007.49
  rename E0012750 EMP_STATUS_2007_50_XRND   // EMP_STATUS_2007.50
  rename E0012751 EMP_STATUS_2007_51_XRND   // EMP_STATUS_2007.51
  rename E0012752 EMP_STATUS_2007_52_XRND   // EMP_STATUS_2007.52
  rename E0012801 EMP_STATUS_2008_01_XRND   // EMP_STATUS_2008.01
  rename E0012802 EMP_STATUS_2008_02_XRND   // EMP_STATUS_2008.02
  rename E0012803 EMP_STATUS_2008_03_XRND   // EMP_STATUS_2008.03
  rename E0012804 EMP_STATUS_2008_04_XRND   // EMP_STATUS_2008.04
  rename E0012805 EMP_STATUS_2008_05_XRND   // EMP_STATUS_2008.05
  rename E0012806 EMP_STATUS_2008_06_XRND   // EMP_STATUS_2008.06
  rename E0012807 EMP_STATUS_2008_07_XRND   // EMP_STATUS_2008.07
  rename E0012808 EMP_STATUS_2008_08_XRND   // EMP_STATUS_2008.08
  rename E0012809 EMP_STATUS_2008_09_XRND   // EMP_STATUS_2008.09
  rename E0012810 EMP_STATUS_2008_10_XRND   // EMP_STATUS_2008.10
  rename E0012811 EMP_STATUS_2008_11_XRND   // EMP_STATUS_2008.11
  rename E0012812 EMP_STATUS_2008_12_XRND   // EMP_STATUS_2008.12
  rename E0012813 EMP_STATUS_2008_13_XRND   // EMP_STATUS_2008.13
  rename E0012814 EMP_STATUS_2008_14_XRND   // EMP_STATUS_2008.14
  rename E0012815 EMP_STATUS_2008_15_XRND   // EMP_STATUS_2008.15
  rename E0012816 EMP_STATUS_2008_16_XRND   // EMP_STATUS_2008.16
  rename E0012817 EMP_STATUS_2008_17_XRND   // EMP_STATUS_2008.17
  rename E0012818 EMP_STATUS_2008_18_XRND   // EMP_STATUS_2008.18
  rename E0012819 EMP_STATUS_2008_19_XRND   // EMP_STATUS_2008.19
  rename E0012820 EMP_STATUS_2008_20_XRND   // EMP_STATUS_2008.20
  rename E0012821 EMP_STATUS_2008_21_XRND   // EMP_STATUS_2008.21
  rename E0012822 EMP_STATUS_2008_22_XRND   // EMP_STATUS_2008.22
  rename E0012823 EMP_STATUS_2008_23_XRND   // EMP_STATUS_2008.23
  rename E0012824 EMP_STATUS_2008_24_XRND   // EMP_STATUS_2008.24
  rename E0012825 EMP_STATUS_2008_25_XRND   // EMP_STATUS_2008.25
  rename E0012826 EMP_STATUS_2008_26_XRND   // EMP_STATUS_2008.26
  rename E0012827 EMP_STATUS_2008_27_XRND   // EMP_STATUS_2008.27
  rename E0012828 EMP_STATUS_2008_28_XRND   // EMP_STATUS_2008.28
  rename E0012829 EMP_STATUS_2008_29_XRND   // EMP_STATUS_2008.29
  rename E0012830 EMP_STATUS_2008_30_XRND   // EMP_STATUS_2008.30
  rename E0012831 EMP_STATUS_2008_31_XRND   // EMP_STATUS_2008.31
  rename E0012832 EMP_STATUS_2008_32_XRND   // EMP_STATUS_2008.32
  rename E0012833 EMP_STATUS_2008_33_XRND   // EMP_STATUS_2008.33
  rename E0012834 EMP_STATUS_2008_34_XRND   // EMP_STATUS_2008.34
  rename E0012835 EMP_STATUS_2008_35_XRND   // EMP_STATUS_2008.35
  rename E0012836 EMP_STATUS_2008_36_XRND   // EMP_STATUS_2008.36
  rename E0012837 EMP_STATUS_2008_37_XRND   // EMP_STATUS_2008.37
  rename E0012838 EMP_STATUS_2008_38_XRND   // EMP_STATUS_2008.38
  rename E0012839 EMP_STATUS_2008_39_XRND   // EMP_STATUS_2008.39
  rename E0012840 EMP_STATUS_2008_40_XRND   // EMP_STATUS_2008.40
  rename E0012841 EMP_STATUS_2008_41_XRND   // EMP_STATUS_2008.41
  rename E0012842 EMP_STATUS_2008_42_XRND   // EMP_STATUS_2008.42
  rename E0012843 EMP_STATUS_2008_43_XRND   // EMP_STATUS_2008.43
  rename E0012844 EMP_STATUS_2008_44_XRND   // EMP_STATUS_2008.44
  rename E0012845 EMP_STATUS_2008_45_XRND   // EMP_STATUS_2008.45
  rename E0012846 EMP_STATUS_2008_46_XRND   // EMP_STATUS_2008.46
  rename E0012847 EMP_STATUS_2008_47_XRND   // EMP_STATUS_2008.47
  rename E0012848 EMP_STATUS_2008_48_XRND   // EMP_STATUS_2008.48
  rename E0012849 EMP_STATUS_2008_49_XRND   // EMP_STATUS_2008.49
  rename E0012850 EMP_STATUS_2008_50_XRND   // EMP_STATUS_2008.50
  rename E0012851 EMP_STATUS_2008_51_XRND   // EMP_STATUS_2008.51
  rename E0012852 EMP_STATUS_2008_52_XRND   // EMP_STATUS_2008.52
  rename E0012901 EMP_STATUS_2009_01_XRND   // EMP_STATUS_2009.01
  rename E0012902 EMP_STATUS_2009_02_XRND   // EMP_STATUS_2009.02
  rename E0012903 EMP_STATUS_2009_03_XRND   // EMP_STATUS_2009.03
  rename E0012904 EMP_STATUS_2009_04_XRND   // EMP_STATUS_2009.04
  rename E0012905 EMP_STATUS_2009_05_XRND   // EMP_STATUS_2009.05
  rename E0012906 EMP_STATUS_2009_06_XRND   // EMP_STATUS_2009.06
  rename E0012907 EMP_STATUS_2009_07_XRND   // EMP_STATUS_2009.07
  rename E0012908 EMP_STATUS_2009_08_XRND   // EMP_STATUS_2009.08
  rename E0012909 EMP_STATUS_2009_09_XRND   // EMP_STATUS_2009.09
  rename E0012910 EMP_STATUS_2009_10_XRND   // EMP_STATUS_2009.10
  rename E0012911 EMP_STATUS_2009_11_XRND   // EMP_STATUS_2009.11
  rename E0012912 EMP_STATUS_2009_12_XRND   // EMP_STATUS_2009.12
  rename E0012913 EMP_STATUS_2009_13_XRND   // EMP_STATUS_2009.13
  rename E0012914 EMP_STATUS_2009_14_XRND   // EMP_STATUS_2009.14
  rename E0012915 EMP_STATUS_2009_15_XRND   // EMP_STATUS_2009.15
  rename E0012916 EMP_STATUS_2009_16_XRND   // EMP_STATUS_2009.16
  rename E0012917 EMP_STATUS_2009_17_XRND   // EMP_STATUS_2009.17
  rename E0012918 EMP_STATUS_2009_18_XRND   // EMP_STATUS_2009.18
  rename E0012919 EMP_STATUS_2009_19_XRND   // EMP_STATUS_2009.19
  rename E0012920 EMP_STATUS_2009_20_XRND   // EMP_STATUS_2009.20
  rename E0012921 EMP_STATUS_2009_21_XRND   // EMP_STATUS_2009.21
  rename E0012922 EMP_STATUS_2009_22_XRND   // EMP_STATUS_2009.22
  rename E0012923 EMP_STATUS_2009_23_XRND   // EMP_STATUS_2009.23
  rename E0012924 EMP_STATUS_2009_24_XRND   // EMP_STATUS_2009.24
  rename E0012925 EMP_STATUS_2009_25_XRND   // EMP_STATUS_2009.25
  rename E0012926 EMP_STATUS_2009_26_XRND   // EMP_STATUS_2009.26
  rename E0012927 EMP_STATUS_2009_27_XRND   // EMP_STATUS_2009.27
  rename E0012928 EMP_STATUS_2009_28_XRND   // EMP_STATUS_2009.28
  rename E0012929 EMP_STATUS_2009_29_XRND   // EMP_STATUS_2009.29
  rename E0012930 EMP_STATUS_2009_30_XRND   // EMP_STATUS_2009.30
  rename E0012931 EMP_STATUS_2009_31_XRND   // EMP_STATUS_2009.31
  rename E0012932 EMP_STATUS_2009_32_XRND   // EMP_STATUS_2009.32
  rename E0012933 EMP_STATUS_2009_33_XRND   // EMP_STATUS_2009.33
  rename E0012934 EMP_STATUS_2009_34_XRND   // EMP_STATUS_2009.34
  rename E0012935 EMP_STATUS_2009_35_XRND   // EMP_STATUS_2009.35
  rename E0012936 EMP_STATUS_2009_36_XRND   // EMP_STATUS_2009.36
  rename E0012937 EMP_STATUS_2009_37_XRND   // EMP_STATUS_2009.37
  rename E0012938 EMP_STATUS_2009_38_XRND   // EMP_STATUS_2009.38
  rename E0012939 EMP_STATUS_2009_39_XRND   // EMP_STATUS_2009.39
  rename E0012940 EMP_STATUS_2009_40_XRND   // EMP_STATUS_2009.40
  rename E0012941 EMP_STATUS_2009_41_XRND   // EMP_STATUS_2009.41
  rename E0012942 EMP_STATUS_2009_42_XRND   // EMP_STATUS_2009.42
  rename E0012943 EMP_STATUS_2009_43_XRND   // EMP_STATUS_2009.43
  rename E0012944 EMP_STATUS_2009_44_XRND   // EMP_STATUS_2009.44
  rename E0012945 EMP_STATUS_2009_45_XRND   // EMP_STATUS_2009.45
  rename E0012946 EMP_STATUS_2009_46_XRND   // EMP_STATUS_2009.46
  rename E0012947 EMP_STATUS_2009_47_XRND   // EMP_STATUS_2009.47
  rename E0012948 EMP_STATUS_2009_48_XRND   // EMP_STATUS_2009.48
  rename E0012949 EMP_STATUS_2009_49_XRND   // EMP_STATUS_2009.49
  rename E0012950 EMP_STATUS_2009_50_XRND   // EMP_STATUS_2009.50
  rename E0012951 EMP_STATUS_2009_51_XRND   // EMP_STATUS_2009.51
  rename E0012952 EMP_STATUS_2009_52_XRND   // EMP_STATUS_2009.52
  rename E0013001 EMP_STATUS_2010_01_XRND   // EMP_STATUS_2010.01
  rename E0013002 EMP_STATUS_2010_02_XRND   // EMP_STATUS_2010.02
  rename E0013003 EMP_STATUS_2010_03_XRND   // EMP_STATUS_2010.03
  rename E0013004 EMP_STATUS_2010_04_XRND   // EMP_STATUS_2010.04
  rename E0013005 EMP_STATUS_2010_05_XRND   // EMP_STATUS_2010.05
  rename E0013006 EMP_STATUS_2010_06_XRND   // EMP_STATUS_2010.06
  rename E0013007 EMP_STATUS_2010_07_XRND   // EMP_STATUS_2010.07
  rename E0013008 EMP_STATUS_2010_08_XRND   // EMP_STATUS_2010.08
  rename E0013009 EMP_STATUS_2010_09_XRND   // EMP_STATUS_2010.09
  rename E0013010 EMP_STATUS_2010_10_XRND   // EMP_STATUS_2010.10
  rename E0013011 EMP_STATUS_2010_11_XRND   // EMP_STATUS_2010.11
  rename E0013012 EMP_STATUS_2010_12_XRND   // EMP_STATUS_2010.12
  rename E0013013 EMP_STATUS_2010_13_XRND   // EMP_STATUS_2010.13
  rename E0013014 EMP_STATUS_2010_14_XRND   // EMP_STATUS_2010.14
  rename E0013015 EMP_STATUS_2010_15_XRND   // EMP_STATUS_2010.15
  rename E0013016 EMP_STATUS_2010_16_XRND   // EMP_STATUS_2010.16
  rename E0013017 EMP_STATUS_2010_17_XRND   // EMP_STATUS_2010.17
  rename E0013018 EMP_STATUS_2010_18_XRND   // EMP_STATUS_2010.18
  rename E0013019 EMP_STATUS_2010_19_XRND   // EMP_STATUS_2010.19
  rename E0013020 EMP_STATUS_2010_20_XRND   // EMP_STATUS_2010.20
  rename E0013021 EMP_STATUS_2010_21_XRND   // EMP_STATUS_2010.21
  rename E0013022 EMP_STATUS_2010_22_XRND   // EMP_STATUS_2010.22
  rename E0013023 EMP_STATUS_2010_23_XRND   // EMP_STATUS_2010.23
  rename E0013024 EMP_STATUS_2010_24_XRND   // EMP_STATUS_2010.24
  rename E0013025 EMP_STATUS_2010_25_XRND   // EMP_STATUS_2010.25
  rename E0013026 EMP_STATUS_2010_26_XRND   // EMP_STATUS_2010.26
  rename E0013027 EMP_STATUS_2010_27_XRND   // EMP_STATUS_2010.27
  rename E0013028 EMP_STATUS_2010_28_XRND   // EMP_STATUS_2010.28
  rename E0013029 EMP_STATUS_2010_29_XRND   // EMP_STATUS_2010.29
  rename E0013030 EMP_STATUS_2010_30_XRND   // EMP_STATUS_2010.30
  rename E0013031 EMP_STATUS_2010_31_XRND   // EMP_STATUS_2010.31
  rename E0013032 EMP_STATUS_2010_32_XRND   // EMP_STATUS_2010.32
  rename E0013033 EMP_STATUS_2010_33_XRND   // EMP_STATUS_2010.33
  rename E0013034 EMP_STATUS_2010_34_XRND   // EMP_STATUS_2010.34
  rename E0013035 EMP_STATUS_2010_35_XRND   // EMP_STATUS_2010.35
  rename E0013036 EMP_STATUS_2010_36_XRND   // EMP_STATUS_2010.36
  rename E0013037 EMP_STATUS_2010_37_XRND   // EMP_STATUS_2010.37
  rename E0013038 EMP_STATUS_2010_38_XRND   // EMP_STATUS_2010.38
  rename E0013039 EMP_STATUS_2010_39_XRND   // EMP_STATUS_2010.39
  rename E0013040 EMP_STATUS_2010_40_XRND   // EMP_STATUS_2010.40
  rename E0013041 EMP_STATUS_2010_41_XRND   // EMP_STATUS_2010.41
  rename E0013042 EMP_STATUS_2010_42_XRND   // EMP_STATUS_2010.42
  rename E0013043 EMP_STATUS_2010_43_XRND   // EMP_STATUS_2010.43
  rename E0013044 EMP_STATUS_2010_44_XRND   // EMP_STATUS_2010.44
  rename E0013045 EMP_STATUS_2010_45_XRND   // EMP_STATUS_2010.45
  rename E0013046 EMP_STATUS_2010_46_XRND   // EMP_STATUS_2010.46
  rename E0013047 EMP_STATUS_2010_47_XRND   // EMP_STATUS_2010.47
  rename E0013048 EMP_STATUS_2010_48_XRND   // EMP_STATUS_2010.48
  rename E0013049 EMP_STATUS_2010_49_XRND   // EMP_STATUS_2010.49
  rename E0013050 EMP_STATUS_2010_50_XRND   // EMP_STATUS_2010.50
  rename E0013051 EMP_STATUS_2010_51_XRND   // EMP_STATUS_2010.51
  rename E0013052 EMP_STATUS_2010_52_XRND   // EMP_STATUS_2010.52
  rename E0013101 EMP_STATUS_2011_01_XRND   // EMP_STATUS_2011.01
  rename E0013102 EMP_STATUS_2011_02_XRND   // EMP_STATUS_2011.02
  rename E0013103 EMP_STATUS_2011_03_XRND   // EMP_STATUS_2011.03
  rename E0013104 EMP_STATUS_2011_04_XRND   // EMP_STATUS_2011.04
  rename E0013105 EMP_STATUS_2011_05_XRND   // EMP_STATUS_2011.05
  rename E0013106 EMP_STATUS_2011_06_XRND   // EMP_STATUS_2011.06
  rename E0013107 EMP_STATUS_2011_07_XRND   // EMP_STATUS_2011.07
  rename E0013108 EMP_STATUS_2011_08_XRND   // EMP_STATUS_2011.08
  rename E0013109 EMP_STATUS_2011_09_XRND   // EMP_STATUS_2011.09
  rename E0013110 EMP_STATUS_2011_10_XRND   // EMP_STATUS_2011.10
  rename E0013111 EMP_STATUS_2011_11_XRND   // EMP_STATUS_2011.11
  rename E0013112 EMP_STATUS_2011_12_XRND   // EMP_STATUS_2011.12
  rename E0013113 EMP_STATUS_2011_13_XRND   // EMP_STATUS_2011.13
  rename E0013114 EMP_STATUS_2011_14_XRND   // EMP_STATUS_2011.14
  rename E0013115 EMP_STATUS_2011_15_XRND   // EMP_STATUS_2011.15
  rename E0013116 EMP_STATUS_2011_16_XRND   // EMP_STATUS_2011.16
  rename E0013117 EMP_STATUS_2011_17_XRND   // EMP_STATUS_2011.17
  rename E0013118 EMP_STATUS_2011_18_XRND   // EMP_STATUS_2011.18
  rename E0013119 EMP_STATUS_2011_19_XRND   // EMP_STATUS_2011.19
  rename E0013120 EMP_STATUS_2011_20_XRND   // EMP_STATUS_2011.20
  rename E0013121 EMP_STATUS_2011_21_XRND   // EMP_STATUS_2011.21
  rename E0013122 EMP_STATUS_2011_22_XRND   // EMP_STATUS_2011.22
  rename E0013123 EMP_STATUS_2011_23_XRND   // EMP_STATUS_2011.23
  rename E0013124 EMP_STATUS_2011_24_XRND   // EMP_STATUS_2011.24
  rename E0013125 EMP_STATUS_2011_25_XRND   // EMP_STATUS_2011.25
  rename E0013126 EMP_STATUS_2011_26_XRND   // EMP_STATUS_2011.26
  rename E0013127 EMP_STATUS_2011_27_XRND   // EMP_STATUS_2011.27
  rename E0013128 EMP_STATUS_2011_28_XRND   // EMP_STATUS_2011.28
  rename E0013129 EMP_STATUS_2011_29_XRND   // EMP_STATUS_2011.29
  rename E0013130 EMP_STATUS_2011_30_XRND   // EMP_STATUS_2011.30
  rename E0013131 EMP_STATUS_2011_31_XRND   // EMP_STATUS_2011.31
  rename E0013132 EMP_STATUS_2011_32_XRND   // EMP_STATUS_2011.32
  rename E0013133 EMP_STATUS_2011_33_XRND   // EMP_STATUS_2011.33
  rename E0013134 EMP_STATUS_2011_34_XRND   // EMP_STATUS_2011.34
  rename E0013135 EMP_STATUS_2011_35_XRND   // EMP_STATUS_2011.35
  rename E0013136 EMP_STATUS_2011_36_XRND   // EMP_STATUS_2011.36
  rename E0013137 EMP_STATUS_2011_37_XRND   // EMP_STATUS_2011.37
  rename E0013138 EMP_STATUS_2011_38_XRND   // EMP_STATUS_2011.38
  rename E0013139 EMP_STATUS_2011_39_XRND   // EMP_STATUS_2011.39
  rename E0013140 EMP_STATUS_2011_40_XRND   // EMP_STATUS_2011.40
  rename E0013141 EMP_STATUS_2011_41_XRND   // EMP_STATUS_2011.41
  rename E0013142 EMP_STATUS_2011_42_XRND   // EMP_STATUS_2011.42
  rename E0013143 EMP_STATUS_2011_43_XRND   // EMP_STATUS_2011.43
  rename E0013144 EMP_STATUS_2011_44_XRND   // EMP_STATUS_2011.44
  rename E0013145 EMP_STATUS_2011_45_XRND   // EMP_STATUS_2011.45
  rename E0013146 EMP_STATUS_2011_46_XRND   // EMP_STATUS_2011.46
  rename E0013147 EMP_STATUS_2011_47_XRND   // EMP_STATUS_2011.47
  rename E0013148 EMP_STATUS_2011_48_XRND   // EMP_STATUS_2011.48
  rename E0013149 EMP_STATUS_2011_49_XRND   // EMP_STATUS_2011.49
  rename E0013150 EMP_STATUS_2011_50_XRND   // EMP_STATUS_2011.50
  rename E0013151 EMP_STATUS_2011_51_XRND   // EMP_STATUS_2011.51
  rename E0013152 EMP_STATUS_2011_52_XRND   // EMP_STATUS_2011.52
  rename E0013153 EMP_STATUS_2011_53_XRND   // EMP_STATUS_2011.53
  rename E0013201 EMP_STATUS_2012_01_XRND   // EMP_STATUS_2012.01
  rename E0013202 EMP_STATUS_2012_02_XRND   // EMP_STATUS_2012.02
  rename E0013203 EMP_STATUS_2012_03_XRND   // EMP_STATUS_2012.03
  rename E0013204 EMP_STATUS_2012_04_XRND   // EMP_STATUS_2012.04
  rename E0013205 EMP_STATUS_2012_05_XRND   // EMP_STATUS_2012.05
  rename E0013206 EMP_STATUS_2012_06_XRND   // EMP_STATUS_2012.06
  rename E0013207 EMP_STATUS_2012_07_XRND   // EMP_STATUS_2012.07
  rename E0013208 EMP_STATUS_2012_08_XRND   // EMP_STATUS_2012.08
  rename E0013209 EMP_STATUS_2012_09_XRND   // EMP_STATUS_2012.09
  rename E0013210 EMP_STATUS_2012_10_XRND   // EMP_STATUS_2012.10
  rename E0013211 EMP_STATUS_2012_11_XRND   // EMP_STATUS_2012.11
  rename E0013212 EMP_STATUS_2012_12_XRND   // EMP_STATUS_2012.12
  rename E0013213 EMP_STATUS_2012_13_XRND   // EMP_STATUS_2012.13
  rename E0013214 EMP_STATUS_2012_14_XRND   // EMP_STATUS_2012.14
  rename E0013215 EMP_STATUS_2012_15_XRND   // EMP_STATUS_2012.15
  rename E0013216 EMP_STATUS_2012_16_XRND   // EMP_STATUS_2012.16
  rename E0013217 EMP_STATUS_2012_17_XRND   // EMP_STATUS_2012.17
  rename E0013218 EMP_STATUS_2012_18_XRND   // EMP_STATUS_2012.18
  rename E0013219 EMP_STATUS_2012_19_XRND   // EMP_STATUS_2012.19
  rename E0013220 EMP_STATUS_2012_20_XRND   // EMP_STATUS_2012.20
  rename E0013221 EMP_STATUS_2012_21_XRND   // EMP_STATUS_2012.21
  rename E0013222 EMP_STATUS_2012_22_XRND   // EMP_STATUS_2012.22
  rename E0013223 EMP_STATUS_2012_23_XRND   // EMP_STATUS_2012.23
  rename E0013224 EMP_STATUS_2012_24_XRND   // EMP_STATUS_2012.24
  rename E0013225 EMP_STATUS_2012_25_XRND   // EMP_STATUS_2012.25
  rename E0013226 EMP_STATUS_2012_26_XRND   // EMP_STATUS_2012.26
  rename E0013227 EMP_STATUS_2012_27_XRND   // EMP_STATUS_2012.27
  rename E0013228 EMP_STATUS_2012_28_XRND   // EMP_STATUS_2012.28
  rename E0013229 EMP_STATUS_2012_29_XRND   // EMP_STATUS_2012.29
  rename E0013230 EMP_STATUS_2012_30_XRND   // EMP_STATUS_2012.30
  rename E0013231 EMP_STATUS_2012_31_XRND   // EMP_STATUS_2012.31
  rename E0013232 EMP_STATUS_2012_32_XRND   // EMP_STATUS_2012.32
  rename E0013233 EMP_STATUS_2012_33_XRND   // EMP_STATUS_2012.33
  rename E0013234 EMP_STATUS_2012_34_XRND   // EMP_STATUS_2012.34
  rename E0013235 EMP_STATUS_2012_35_XRND   // EMP_STATUS_2012.35
  rename E0013236 EMP_STATUS_2012_36_XRND   // EMP_STATUS_2012.36
  rename E0013237 EMP_STATUS_2012_37_XRND   // EMP_STATUS_2012.37
  rename E0013238 EMP_STATUS_2012_38_XRND   // EMP_STATUS_2012.38
  rename E0013239 EMP_STATUS_2012_39_XRND   // EMP_STATUS_2012.39
  rename E0013240 EMP_STATUS_2012_40_XRND   // EMP_STATUS_2012.40
  rename E0013241 EMP_STATUS_2012_41_XRND   // EMP_STATUS_2012.41
  rename E0013242 EMP_STATUS_2012_42_XRND   // EMP_STATUS_2012.42
  rename E0013243 EMP_STATUS_2012_43_XRND   // EMP_STATUS_2012.43
  rename E0013244 EMP_STATUS_2012_44_XRND   // EMP_STATUS_2012.44
  rename E0013245 EMP_STATUS_2012_45_XRND   // EMP_STATUS_2012.45
  rename E0013246 EMP_STATUS_2012_46_XRND   // EMP_STATUS_2012.46
  rename E0013247 EMP_STATUS_2012_47_XRND   // EMP_STATUS_2012.47
  rename E0013248 EMP_STATUS_2012_48_XRND   // EMP_STATUS_2012.48
  rename E0013249 EMP_STATUS_2012_49_XRND   // EMP_STATUS_2012.49
  rename E0013250 EMP_STATUS_2012_50_XRND   // EMP_STATUS_2012.50
  rename E0013251 EMP_STATUS_2012_51_XRND   // EMP_STATUS_2012.51
  rename E0013252 EMP_STATUS_2012_52_XRND   // EMP_STATUS_2012.52
  rename E0013301 EMP_STATUS_2013_01_XRND   // EMP_STATUS_2013.01
  rename E0013302 EMP_STATUS_2013_02_XRND   // EMP_STATUS_2013.02
  rename E0013303 EMP_STATUS_2013_03_XRND   // EMP_STATUS_2013.03
  rename E0013304 EMP_STATUS_2013_04_XRND   // EMP_STATUS_2013.04
  rename E0013305 EMP_STATUS_2013_05_XRND   // EMP_STATUS_2013.05
  rename E0013306 EMP_STATUS_2013_06_XRND   // EMP_STATUS_2013.06
  rename E0013307 EMP_STATUS_2013_07_XRND   // EMP_STATUS_2013.07
  rename E0013308 EMP_STATUS_2013_08_XRND   // EMP_STATUS_2013.08
  rename E0013309 EMP_STATUS_2013_09_XRND   // EMP_STATUS_2013.09
  rename E0013310 EMP_STATUS_2013_10_XRND   // EMP_STATUS_2013.10
  rename E0013311 EMP_STATUS_2013_11_XRND   // EMP_STATUS_2013.11
  rename E0013312 EMP_STATUS_2013_12_XRND   // EMP_STATUS_2013.12
  rename E0013313 EMP_STATUS_2013_13_XRND   // EMP_STATUS_2013.13
  rename E0013314 EMP_STATUS_2013_14_XRND   // EMP_STATUS_2013.14
  rename E0013315 EMP_STATUS_2013_15_XRND   // EMP_STATUS_2013.15
  rename E0013316 EMP_STATUS_2013_16_XRND   // EMP_STATUS_2013.16
  rename E0013317 EMP_STATUS_2013_17_XRND   // EMP_STATUS_2013.17
  rename E0013318 EMP_STATUS_2013_18_XRND   // EMP_STATUS_2013.18
  rename E0013319 EMP_STATUS_2013_19_XRND   // EMP_STATUS_2013.19
  rename E0013320 EMP_STATUS_2013_20_XRND   // EMP_STATUS_2013.20
  rename E0013321 EMP_STATUS_2013_21_XRND   // EMP_STATUS_2013.21
  rename E0013322 EMP_STATUS_2013_22_XRND   // EMP_STATUS_2013.22
  rename E0013323 EMP_STATUS_2013_23_XRND   // EMP_STATUS_2013.23
  rename E0013324 EMP_STATUS_2013_24_XRND   // EMP_STATUS_2013.24
  rename E0013325 EMP_STATUS_2013_25_XRND   // EMP_STATUS_2013.25
  rename E0013326 EMP_STATUS_2013_26_XRND   // EMP_STATUS_2013.26
  rename E0013327 EMP_STATUS_2013_27_XRND   // EMP_STATUS_2013.27
  rename E0013328 EMP_STATUS_2013_28_XRND   // EMP_STATUS_2013.28
  rename E0013329 EMP_STATUS_2013_29_XRND   // EMP_STATUS_2013.29
  rename E0013330 EMP_STATUS_2013_30_XRND   // EMP_STATUS_2013.30
  rename E0013331 EMP_STATUS_2013_31_XRND   // EMP_STATUS_2013.31
  rename E0013332 EMP_STATUS_2013_32_XRND   // EMP_STATUS_2013.32
  rename E0013333 EMP_STATUS_2013_33_XRND   // EMP_STATUS_2013.33
  rename E0013334 EMP_STATUS_2013_34_XRND   // EMP_STATUS_2013.34
  rename E0013335 EMP_STATUS_2013_35_XRND   // EMP_STATUS_2013.35
  rename E0013336 EMP_STATUS_2013_36_XRND   // EMP_STATUS_2013.36
  rename E0013337 EMP_STATUS_2013_37_XRND   // EMP_STATUS_2013.37
  rename E0013338 EMP_STATUS_2013_38_XRND   // EMP_STATUS_2013.38
  rename E0013339 EMP_STATUS_2013_39_XRND   // EMP_STATUS_2013.39
  rename E0013340 EMP_STATUS_2013_40_XRND   // EMP_STATUS_2013.40
  rename E0013341 EMP_STATUS_2013_41_XRND   // EMP_STATUS_2013.41
  rename E0013342 EMP_STATUS_2013_42_XRND   // EMP_STATUS_2013.42
  rename E0013343 EMP_STATUS_2013_43_XRND   // EMP_STATUS_2013.43
  rename E0013344 EMP_STATUS_2013_44_XRND   // EMP_STATUS_2013.44
  rename E0013345 EMP_STATUS_2013_45_XRND   // EMP_STATUS_2013.45
  rename E0013346 EMP_STATUS_2013_46_XRND   // EMP_STATUS_2013.46
  rename E0013347 EMP_STATUS_2013_47_XRND   // EMP_STATUS_2013.47
  rename E0013348 EMP_STATUS_2013_48_XRND   // EMP_STATUS_2013.48
  rename E0013349 EMP_STATUS_2013_49_XRND   // EMP_STATUS_2013.49
  rename E0013350 EMP_STATUS_2013_50_XRND   // EMP_STATUS_2013.50
  rename E0013351 EMP_STATUS_2013_51_XRND   // EMP_STATUS_2013.51
  rename E0013352 EMP_STATUS_2013_52_XRND   // EMP_STATUS_2013.52
  rename E0013401 EMP_STATUS_2014_01_XRND   // EMP_STATUS_2014.01
  rename E0013402 EMP_STATUS_2014_02_XRND   // EMP_STATUS_2014.02
  rename E0013403 EMP_STATUS_2014_03_XRND   // EMP_STATUS_2014.03
  rename E0013404 EMP_STATUS_2014_04_XRND   // EMP_STATUS_2014.04
  rename E0013405 EMP_STATUS_2014_05_XRND   // EMP_STATUS_2014.05
  rename E0013406 EMP_STATUS_2014_06_XRND   // EMP_STATUS_2014.06
  rename E0013407 EMP_STATUS_2014_07_XRND   // EMP_STATUS_2014.07
  rename E0013408 EMP_STATUS_2014_08_XRND   // EMP_STATUS_2014.08
  rename E0013409 EMP_STATUS_2014_09_XRND   // EMP_STATUS_2014.09
  rename E0013410 EMP_STATUS_2014_10_XRND   // EMP_STATUS_2014.10
  rename E0013411 EMP_STATUS_2014_11_XRND   // EMP_STATUS_2014.11
  rename E0013412 EMP_STATUS_2014_12_XRND   // EMP_STATUS_2014.12
  rename E0013413 EMP_STATUS_2014_13_XRND   // EMP_STATUS_2014.13
  rename E0013414 EMP_STATUS_2014_14_XRND   // EMP_STATUS_2014.14
  rename E0013415 EMP_STATUS_2014_15_XRND   // EMP_STATUS_2014.15
  rename E0013416 EMP_STATUS_2014_16_XRND   // EMP_STATUS_2014.16
  rename E0013417 EMP_STATUS_2014_17_XRND   // EMP_STATUS_2014.17
  rename E0013418 EMP_STATUS_2014_18_XRND   // EMP_STATUS_2014.18
  rename E0013419 EMP_STATUS_2014_19_XRND   // EMP_STATUS_2014.19
  rename E0013420 EMP_STATUS_2014_20_XRND   // EMP_STATUS_2014.20
  rename E0013421 EMP_STATUS_2014_21_XRND   // EMP_STATUS_2014.21
  rename E0013422 EMP_STATUS_2014_22_XRND   // EMP_STATUS_2014.22
  rename E0013423 EMP_STATUS_2014_23_XRND   // EMP_STATUS_2014.23
  rename E0013424 EMP_STATUS_2014_24_XRND   // EMP_STATUS_2014.24
  rename E0013425 EMP_STATUS_2014_25_XRND   // EMP_STATUS_2014.25
  rename E0013426 EMP_STATUS_2014_26_XRND   // EMP_STATUS_2014.26
  rename E0013427 EMP_STATUS_2014_27_XRND   // EMP_STATUS_2014.27
  rename E0013428 EMP_STATUS_2014_28_XRND   // EMP_STATUS_2014.28
  rename E0013429 EMP_STATUS_2014_29_XRND   // EMP_STATUS_2014.29
  rename E0013430 EMP_STATUS_2014_30_XRND   // EMP_STATUS_2014.30
  rename E0013431 EMP_STATUS_2014_31_XRND   // EMP_STATUS_2014.31
  rename E0013432 EMP_STATUS_2014_32_XRND   // EMP_STATUS_2014.32
  rename E0013433 EMP_STATUS_2014_33_XRND   // EMP_STATUS_2014.33
  rename E0013434 EMP_STATUS_2014_34_XRND   // EMP_STATUS_2014.34
  rename E0013435 EMP_STATUS_2014_35_XRND   // EMP_STATUS_2014.35
  rename E0013436 EMP_STATUS_2014_36_XRND   // EMP_STATUS_2014.36
  rename E0013437 EMP_STATUS_2014_37_XRND   // EMP_STATUS_2014.37
  rename E0013438 EMP_STATUS_2014_38_XRND   // EMP_STATUS_2014.38
  rename E0013439 EMP_STATUS_2014_39_XRND   // EMP_STATUS_2014.39
  rename E0013440 EMP_STATUS_2014_40_XRND   // EMP_STATUS_2014.40
  rename E0013441 EMP_STATUS_2014_41_XRND   // EMP_STATUS_2014.41
  rename E0013442 EMP_STATUS_2014_42_XRND   // EMP_STATUS_2014.42
  rename E0013443 EMP_STATUS_2014_43_XRND   // EMP_STATUS_2014.43
  rename E0013444 EMP_STATUS_2014_44_XRND   // EMP_STATUS_2014.44
  rename E0013445 EMP_STATUS_2014_45_XRND   // EMP_STATUS_2014.45
  rename E0013446 EMP_STATUS_2014_46_XRND   // EMP_STATUS_2014.46
  rename E0013447 EMP_STATUS_2014_47_XRND   // EMP_STATUS_2014.47
  rename E0013448 EMP_STATUS_2014_48_XRND   // EMP_STATUS_2014.48
  rename E0013449 EMP_STATUS_2014_49_XRND   // EMP_STATUS_2014.49
  rename E0013450 EMP_STATUS_2014_50_XRND   // EMP_STATUS_2014.50
  rename E0013451 EMP_STATUS_2014_51_XRND   // EMP_STATUS_2014.51
  rename E0013452 EMP_STATUS_2014_52_XRND   // EMP_STATUS_2014.52
  rename E0013501 EMP_STATUS_2015_01_XRND   // EMP_STATUS_2015.01
  rename E0013502 EMP_STATUS_2015_02_XRND   // EMP_STATUS_2015.02
  rename E0013503 EMP_STATUS_2015_03_XRND   // EMP_STATUS_2015.03
  rename E0013504 EMP_STATUS_2015_04_XRND   // EMP_STATUS_2015.04
  rename E0013505 EMP_STATUS_2015_05_XRND   // EMP_STATUS_2015.05
  rename E0013506 EMP_STATUS_2015_06_XRND   // EMP_STATUS_2015.06
  rename E0013507 EMP_STATUS_2015_07_XRND   // EMP_STATUS_2015.07
  rename E0013508 EMP_STATUS_2015_08_XRND   // EMP_STATUS_2015.08
  rename E0013509 EMP_STATUS_2015_09_XRND   // EMP_STATUS_2015.09
  rename E0013510 EMP_STATUS_2015_10_XRND   // EMP_STATUS_2015.10
  rename E0013511 EMP_STATUS_2015_11_XRND   // EMP_STATUS_2015.11
  rename E0013512 EMP_STATUS_2015_12_XRND   // EMP_STATUS_2015.12
  rename E0013513 EMP_STATUS_2015_13_XRND   // EMP_STATUS_2015.13
  rename E0013514 EMP_STATUS_2015_14_XRND   // EMP_STATUS_2015.14
  rename E0013515 EMP_STATUS_2015_15_XRND   // EMP_STATUS_2015.15
  rename E0013516 EMP_STATUS_2015_16_XRND   // EMP_STATUS_2015.16
  rename E0013517 EMP_STATUS_2015_17_XRND   // EMP_STATUS_2015.17
  rename E0013518 EMP_STATUS_2015_18_XRND   // EMP_STATUS_2015.18
  rename E0013519 EMP_STATUS_2015_19_XRND   // EMP_STATUS_2015.19
  rename E0013520 EMP_STATUS_2015_20_XRND   // EMP_STATUS_2015.20
  rename E0013521 EMP_STATUS_2015_21_XRND   // EMP_STATUS_2015.21
  rename E0013522 EMP_STATUS_2015_22_XRND   // EMP_STATUS_2015.22
  rename E0013523 EMP_STATUS_2015_23_XRND   // EMP_STATUS_2015.23
  rename E0013524 EMP_STATUS_2015_24_XRND   // EMP_STATUS_2015.24
  rename E0013525 EMP_STATUS_2015_25_XRND   // EMP_STATUS_2015.25
  rename E0013526 EMP_STATUS_2015_26_XRND   // EMP_STATUS_2015.26
  rename E0013527 EMP_STATUS_2015_27_XRND   // EMP_STATUS_2015.27
  rename E0013528 EMP_STATUS_2015_28_XRND   // EMP_STATUS_2015.28
  rename E0013529 EMP_STATUS_2015_29_XRND   // EMP_STATUS_2015.29
  rename E0013530 EMP_STATUS_2015_30_XRND   // EMP_STATUS_2015.30
  rename E0013531 EMP_STATUS_2015_31_XRND   // EMP_STATUS_2015.31
  rename E0013532 EMP_STATUS_2015_32_XRND   // EMP_STATUS_2015.32
  rename E0013533 EMP_STATUS_2015_33_XRND   // EMP_STATUS_2015.33
  rename E0013534 EMP_STATUS_2015_34_XRND   // EMP_STATUS_2015.34
  rename E0013535 EMP_STATUS_2015_35_XRND   // EMP_STATUS_2015.35
  rename E0013536 EMP_STATUS_2015_36_XRND   // EMP_STATUS_2015.36
  rename E0013537 EMP_STATUS_2015_37_XRND   // EMP_STATUS_2015.37
  rename E0013538 EMP_STATUS_2015_38_XRND   // EMP_STATUS_2015.38
  rename E0013539 EMP_STATUS_2015_39_XRND   // EMP_STATUS_2015.39
  rename E0013540 EMP_STATUS_2015_40_XRND   // EMP_STATUS_2015.40
  rename E0013541 EMP_STATUS_2015_41_XRND   // EMP_STATUS_2015.41
  rename E0013542 EMP_STATUS_2015_42_XRND   // EMP_STATUS_2015.42
  rename E0013543 EMP_STATUS_2015_43_XRND   // EMP_STATUS_2015.43
  rename E0013544 EMP_STATUS_2015_44_XRND   // EMP_STATUS_2015.44
  rename E0013545 EMP_STATUS_2015_45_XRND   // EMP_STATUS_2015.45
  rename E0013546 EMP_STATUS_2015_46_XRND   // EMP_STATUS_2015.46
  rename E0013547 EMP_STATUS_2015_47_XRND   // EMP_STATUS_2015.47
  rename E0013548 EMP_STATUS_2015_48_XRND   // EMP_STATUS_2015.48
  rename E0013549 EMP_STATUS_2015_49_XRND   // EMP_STATUS_2015.49
  rename E0013550 EMP_STATUS_2015_50_XRND   // EMP_STATUS_2015.50
  rename E0013551 EMP_STATUS_2015_51_XRND   // EMP_STATUS_2015.51
  rename E0013552 EMP_STATUS_2015_52_XRND   // EMP_STATUS_2015.52
  rename E0013601 EMP_STATUS_2016_01_XRND   // EMP_STATUS_2016.01
  rename E0013602 EMP_STATUS_2016_02_XRND   // EMP_STATUS_2016.02
  rename E0013603 EMP_STATUS_2016_03_XRND   // EMP_STATUS_2016.03
  rename E0013604 EMP_STATUS_2016_04_XRND   // EMP_STATUS_2016.04
  rename E0013605 EMP_STATUS_2016_05_XRND   // EMP_STATUS_2016.05
  rename E0013606 EMP_STATUS_2016_06_XRND   // EMP_STATUS_2016.06
  rename E0013607 EMP_STATUS_2016_07_XRND   // EMP_STATUS_2016.07
  rename E0013608 EMP_STATUS_2016_08_XRND   // EMP_STATUS_2016.08
  rename E0013609 EMP_STATUS_2016_09_XRND   // EMP_STATUS_2016.09
  rename E0013610 EMP_STATUS_2016_10_XRND   // EMP_STATUS_2016.10
  rename E0013611 EMP_STATUS_2016_11_XRND   // EMP_STATUS_2016.11
  rename E0013612 EMP_STATUS_2016_12_XRND   // EMP_STATUS_2016.12
  rename E0013613 EMP_STATUS_2016_13_XRND   // EMP_STATUS_2016.13
  rename E0013614 EMP_STATUS_2016_14_XRND   // EMP_STATUS_2016.14
  rename E0013615 EMP_STATUS_2016_15_XRND   // EMP_STATUS_2016.15
  rename E0013616 EMP_STATUS_2016_16_XRND   // EMP_STATUS_2016.16
  rename E0013617 EMP_STATUS_2016_17_XRND   // EMP_STATUS_2016.17
  rename E0013618 EMP_STATUS_2016_18_XRND   // EMP_STATUS_2016.18
  rename E0013619 EMP_STATUS_2016_19_XRND   // EMP_STATUS_2016.19
  rename E0013620 EMP_STATUS_2016_20_XRND   // EMP_STATUS_2016.20
  rename E0013621 EMP_STATUS_2016_21_XRND   // EMP_STATUS_2016.21
  rename E0013622 EMP_STATUS_2016_22_XRND   // EMP_STATUS_2016.22
  rename E0013623 EMP_STATUS_2016_23_XRND   // EMP_STATUS_2016.23
  rename E0013624 EMP_STATUS_2016_24_XRND   // EMP_STATUS_2016.24
  rename E0013625 EMP_STATUS_2016_25_XRND   // EMP_STATUS_2016.25
  rename E0013626 EMP_STATUS_2016_26_XRND   // EMP_STATUS_2016.26
  rename E0013627 EMP_STATUS_2016_27_XRND   // EMP_STATUS_2016.27
  rename E0013628 EMP_STATUS_2016_28_XRND   // EMP_STATUS_2016.28
  rename E0013629 EMP_STATUS_2016_29_XRND   // EMP_STATUS_2016.29
  rename E0013630 EMP_STATUS_2016_30_XRND   // EMP_STATUS_2016.30
  rename E0013631 EMP_STATUS_2016_31_XRND   // EMP_STATUS_2016.31
  rename E0013632 EMP_STATUS_2016_32_XRND   // EMP_STATUS_2016.32
  rename E0013633 EMP_STATUS_2016_33_XRND   // EMP_STATUS_2016.33
  rename E0013634 EMP_STATUS_2016_34_XRND   // EMP_STATUS_2016.34
  rename E0013635 EMP_STATUS_2016_35_XRND   // EMP_STATUS_2016.35
  rename E0013636 EMP_STATUS_2016_36_XRND   // EMP_STATUS_2016.36
  rename E0013637 EMP_STATUS_2016_37_XRND   // EMP_STATUS_2016.37
  rename E0013638 EMP_STATUS_2016_38_XRND   // EMP_STATUS_2016.38
  rename E0013639 EMP_STATUS_2016_39_XRND   // EMP_STATUS_2016.39
  rename E0013640 EMP_STATUS_2016_40_XRND   // EMP_STATUS_2016.40
  rename E0013641 EMP_STATUS_2016_41_XRND   // EMP_STATUS_2016.41
  rename E0013642 EMP_STATUS_2016_42_XRND   // EMP_STATUS_2016.42
  rename E0013643 EMP_STATUS_2016_43_XRND   // EMP_STATUS_2016.43
  rename E0013644 EMP_STATUS_2016_44_XRND   // EMP_STATUS_2016.44
  rename E0013645 EMP_STATUS_2016_45_XRND   // EMP_STATUS_2016.45
  rename E0013646 EMP_STATUS_2016_46_XRND   // EMP_STATUS_2016.46
  rename E0013647 EMP_STATUS_2016_47_XRND   // EMP_STATUS_2016.47
  rename E0013648 EMP_STATUS_2016_48_XRND   // EMP_STATUS_2016.48
  rename E0013649 EMP_STATUS_2016_49_XRND   // EMP_STATUS_2016.49
  rename E0013650 EMP_STATUS_2016_50_XRND   // EMP_STATUS_2016.50
  rename E0013651 EMP_STATUS_2016_51_XRND   // EMP_STATUS_2016.51
  rename E0013652 EMP_STATUS_2016_52_XRND   // EMP_STATUS_2016.52
  rename E0013653 EMP_STATUS_2016_53_XRND   // EMP_STATUS_2016.53
  rename E0013701 EMP_STATUS_2017_01_XRND   // EMP_STATUS_2017.01
  rename E0013702 EMP_STATUS_2017_02_XRND   // EMP_STATUS_2017.02
  rename E0013703 EMP_STATUS_2017_03_XRND   // EMP_STATUS_2017.03
  rename E0013704 EMP_STATUS_2017_04_XRND   // EMP_STATUS_2017.04
  rename E0013705 EMP_STATUS_2017_05_XRND   // EMP_STATUS_2017.05
  rename E0013706 EMP_STATUS_2017_06_XRND   // EMP_STATUS_2017.06
  rename E0013707 EMP_STATUS_2017_07_XRND   // EMP_STATUS_2017.07
  rename E0013708 EMP_STATUS_2017_08_XRND   // EMP_STATUS_2017.08
  rename E0013709 EMP_STATUS_2017_09_XRND   // EMP_STATUS_2017.09
  rename E0013710 EMP_STATUS_2017_10_XRND   // EMP_STATUS_2017.10
  rename E0013711 EMP_STATUS_2017_11_XRND   // EMP_STATUS_2017.11
  rename E0013712 EMP_STATUS_2017_12_XRND   // EMP_STATUS_2017.12
  rename E0013713 EMP_STATUS_2017_13_XRND   // EMP_STATUS_2017.13
  rename E0013714 EMP_STATUS_2017_14_XRND   // EMP_STATUS_2017.14
  rename E0013715 EMP_STATUS_2017_15_XRND   // EMP_STATUS_2017.15
  rename E0013716 EMP_STATUS_2017_16_XRND   // EMP_STATUS_2017.16
  rename E0013717 EMP_STATUS_2017_17_XRND   // EMP_STATUS_2017.17
  rename E0013718 EMP_STATUS_2017_18_XRND   // EMP_STATUS_2017.18
  rename E0013719 EMP_STATUS_2017_19_XRND   // EMP_STATUS_2017.19
  rename E0013720 EMP_STATUS_2017_20_XRND   // EMP_STATUS_2017.20
  rename E0013721 EMP_STATUS_2017_21_XRND   // EMP_STATUS_2017.21
  rename E0013722 EMP_STATUS_2017_22_XRND   // EMP_STATUS_2017.22
  rename E0013723 EMP_STATUS_2017_23_XRND   // EMP_STATUS_2017.23
  rename E0013724 EMP_STATUS_2017_24_XRND   // EMP_STATUS_2017.24
  rename E0013725 EMP_STATUS_2017_25_XRND   // EMP_STATUS_2017.25
  rename E0013726 EMP_STATUS_2017_26_XRND   // EMP_STATUS_2017.26
  rename E0013727 EMP_STATUS_2017_27_XRND   // EMP_STATUS_2017.27
  rename E0013728 EMP_STATUS_2017_28_XRND   // EMP_STATUS_2017.28
  rename E0013729 EMP_STATUS_2017_29_XRND   // EMP_STATUS_2017.29
  rename E0013730 EMP_STATUS_2017_30_XRND   // EMP_STATUS_2017.30
  rename E0013731 EMP_STATUS_2017_31_XRND   // EMP_STATUS_2017.31
  rename E0013732 EMP_STATUS_2017_32_XRND   // EMP_STATUS_2017.32
  rename E0013733 EMP_STATUS_2017_33_XRND   // EMP_STATUS_2017.33
  rename E0013734 EMP_STATUS_2017_34_XRND   // EMP_STATUS_2017.34
  rename E0013735 EMP_STATUS_2017_35_XRND   // EMP_STATUS_2017.35
  rename E0013736 EMP_STATUS_2017_36_XRND   // EMP_STATUS_2017.36
  rename E0013737 EMP_STATUS_2017_37_XRND   // EMP_STATUS_2017.37
  rename E0013738 EMP_STATUS_2017_38_XRND   // EMP_STATUS_2017.38
  rename E0013739 EMP_STATUS_2017_39_XRND   // EMP_STATUS_2017.39
  rename E0013740 EMP_STATUS_2017_40_XRND   // EMP_STATUS_2017.40
  rename E0013741 EMP_STATUS_2017_41_XRND   // EMP_STATUS_2017.41
  rename E0013742 EMP_STATUS_2017_42_XRND   // EMP_STATUS_2017.42
  rename E0013743 EMP_STATUS_2017_43_XRND   // EMP_STATUS_2017.43
  rename E0013744 EMP_STATUS_2017_44_XRND   // EMP_STATUS_2017.44
  rename E0013745 EMP_STATUS_2017_45_XRND   // EMP_STATUS_2017.45
  rename E0013746 EMP_STATUS_2017_46_XRND   // EMP_STATUS_2017.46
  rename E0013747 EMP_STATUS_2017_47_XRND   // EMP_STATUS_2017.47
  rename E0013748 EMP_STATUS_2017_48_XRND   // EMP_STATUS_2017.48
  rename E0013749 EMP_STATUS_2017_49_XRND   // EMP_STATUS_2017.49
  rename E0013750 EMP_STATUS_2017_50_XRND   // EMP_STATUS_2017.50
  rename E0013751 EMP_STATUS_2017_51_XRND   // EMP_STATUS_2017.51
  rename E0013752 EMP_STATUS_2017_52_XRND   // EMP_STATUS_2017.52
  rename E0013801 EMP_STATUS_2018_01_XRND   // EMP_STATUS_2018.01
  rename E0013802 EMP_STATUS_2018_02_XRND   // EMP_STATUS_2018.02
  rename E0013803 EMP_STATUS_2018_03_XRND   // EMP_STATUS_2018.03
  rename E0013804 EMP_STATUS_2018_04_XRND   // EMP_STATUS_2018.04
  rename E0013805 EMP_STATUS_2018_05_XRND   // EMP_STATUS_2018.05
  rename E0013806 EMP_STATUS_2018_06_XRND   // EMP_STATUS_2018.06
  rename E0013807 EMP_STATUS_2018_07_XRND   // EMP_STATUS_2018.07
  rename E0013808 EMP_STATUS_2018_08_XRND   // EMP_STATUS_2018.08
  rename E0013809 EMP_STATUS_2018_09_XRND   // EMP_STATUS_2018.09
  rename E0013810 EMP_STATUS_2018_10_XRND   // EMP_STATUS_2018.10
  rename E0013811 EMP_STATUS_2018_11_XRND   // EMP_STATUS_2018.11
  rename E0013812 EMP_STATUS_2018_12_XRND   // EMP_STATUS_2018.12
  rename E0013813 EMP_STATUS_2018_13_XRND   // EMP_STATUS_2018.13
  rename E0013814 EMP_STATUS_2018_14_XRND   // EMP_STATUS_2018.14
  rename E0013815 EMP_STATUS_2018_15_XRND   // EMP_STATUS_2018.15
  rename E0013816 EMP_STATUS_2018_16_XRND   // EMP_STATUS_2018.16
  rename E0013817 EMP_STATUS_2018_17_XRND   // EMP_STATUS_2018.17
  rename E0013818 EMP_STATUS_2018_18_XRND   // EMP_STATUS_2018.18
  rename E0013819 EMP_STATUS_2018_19_XRND   // EMP_STATUS_2018.19
  rename E0013820 EMP_STATUS_2018_20_XRND   // EMP_STATUS_2018.20
  rename E0013821 EMP_STATUS_2018_21_XRND   // EMP_STATUS_2018.21
  rename E0013822 EMP_STATUS_2018_22_XRND   // EMP_STATUS_2018.22
  rename E0013823 EMP_STATUS_2018_23_XRND   // EMP_STATUS_2018.23
  rename E0013824 EMP_STATUS_2018_24_XRND   // EMP_STATUS_2018.24
  rename E0013825 EMP_STATUS_2018_25_XRND   // EMP_STATUS_2018.25
  rename E0013826 EMP_STATUS_2018_26_XRND   // EMP_STATUS_2018.26
  rename E0013827 EMP_STATUS_2018_27_XRND   // EMP_STATUS_2018.27
  rename E0013828 EMP_STATUS_2018_28_XRND   // EMP_STATUS_2018.28
  rename E0013829 EMP_STATUS_2018_29_XRND   // EMP_STATUS_2018.29
  rename E0013830 EMP_STATUS_2018_30_XRND   // EMP_STATUS_2018.30
  rename E0013831 EMP_STATUS_2018_31_XRND   // EMP_STATUS_2018.31
  rename E0013832 EMP_STATUS_2018_32_XRND   // EMP_STATUS_2018.32
  rename E0013833 EMP_STATUS_2018_33_XRND   // EMP_STATUS_2018.33
  rename E0013834 EMP_STATUS_2018_34_XRND   // EMP_STATUS_2018.34
  rename E0013835 EMP_STATUS_2018_35_XRND   // EMP_STATUS_2018.35
  rename E0013836 EMP_STATUS_2018_36_XRND   // EMP_STATUS_2018.36
  rename E0013837 EMP_STATUS_2018_37_XRND   // EMP_STATUS_2018.37
  rename E0013838 EMP_STATUS_2018_38_XRND   // EMP_STATUS_2018.38
  rename E0013839 EMP_STATUS_2018_39_XRND   // EMP_STATUS_2018.39
  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save	"$temp/NLSYemp", replace


clear
import   delimited "$NLSY1997\hita_emp1920.csv"
rename *, upper


label define vlE0013901 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013901 vlE0013901

label define vlE0013902 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013902 vlE0013902

label define vlE0013903 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013903 vlE0013903

label define vlE0013904 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013904 vlE0013904

label define vlE0013905 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013905 vlE0013905

label define vlE0013906 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013906 vlE0013906

label define vlE0013907 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013907 vlE0013907

label define vlE0013908 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013908 vlE0013908

label define vlE0013909 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013909 vlE0013909

label define vlE0013910 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013910 vlE0013910

label define vlE0013911 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013911 vlE0013911

label define vlE0013912 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013912 vlE0013912

label define vlE0013913 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013913 vlE0013913

label define vlE0013914 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013914 vlE0013914

label define vlE0013915 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013915 vlE0013915

label define vlE0013916 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013916 vlE0013916

label define vlE0013917 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013917 vlE0013917

label define vlE0013918 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013918 vlE0013918

label define vlE0013919 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013919 vlE0013919

label define vlE0013920 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013920 vlE0013920

label define vlE0013921 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013921 vlE0013921

label define vlE0013922 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013922 vlE0013922

label define vlE0013923 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013923 vlE0013923

label define vlE0013924 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013924 vlE0013924

label define vlE0013925 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013925 vlE0013925

label define vlE0013926 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013926 vlE0013926

label define vlE0013927 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013927 vlE0013927

label define vlE0013928 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013928 vlE0013928

label define vlE0013929 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013929 vlE0013929

label define vlE0013930 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013930 vlE0013930

label define vlE0013931 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013931 vlE0013931

label define vlE0013932 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013932 vlE0013932

label define vlE0013933 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013933 vlE0013933

label define vlE0013934 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013934 vlE0013934

label define vlE0013935 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013935 vlE0013935

label define vlE0013936 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013936 vlE0013936

label define vlE0013937 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013937 vlE0013937

label define vlE0013938 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013938 vlE0013938

label define vlE0013939 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013939 vlE0013939

label define vlE0013940 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013940 vlE0013940

label define vlE0013941 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013941 vlE0013941

label define vlE0013942 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013942 vlE0013942

label define vlE0013943 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013943 vlE0013943

label define vlE0013944 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013944 vlE0013944

label define vlE0013945 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013945 vlE0013945

label define vlE0013946 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013946 vlE0013946

label define vlE0013947 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013947 vlE0013947

label define vlE0013948 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013948 vlE0013948

label define vlE0013949 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013949 vlE0013949

label define vlE0013950 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013950 vlE0013950

label define vlE0013951 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013951 vlE0013951

label define vlE0013952 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013952 vlE0013952

label define vlE0014001 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014001 vlE0014001

label define vlE0014002 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014002 vlE0014002

label define vlE0014003 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014003 vlE0014003

label define vlE0014004 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014004 vlE0014004

label define vlE0014005 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014005 vlE0014005

label define vlE0014006 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014006 vlE0014006

label define vlE0014007 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014007 vlE0014007

label define vlE0014008 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014008 vlE0014008

label define vlE0014009 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014009 vlE0014009

label define vlE0014010 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014010 vlE0014010

label define vlE0014011 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014011 vlE0014011

label define vlE0014012 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014012 vlE0014012

label define vlE0014013 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014013 vlE0014013

label define vlE0014014 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014014 vlE0014014

label define vlE0014015 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014015 vlE0014015

label define vlE0014016 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014016 vlE0014016

label define vlE0014017 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014017 vlE0014017

label define vlE0014018 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014018 vlE0014018

label define vlE0014019 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014019 vlE0014019

label define vlE0014020 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014020 vlE0014020

label define vlE0014021 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014021 vlE0014021

label define vlE0014022 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014022 vlE0014022

label define vlE0014023 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014023 vlE0014023

label define vlE0014024 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014024 vlE0014024

label define vlE0014025 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014025 vlE0014025

label define vlE0014026 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014026 vlE0014026

label define vlE0014027 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014027 vlE0014027

label define vlE0014028 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014028 vlE0014028

label define vlE0014029 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0014029 vlE0014029

label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename E0013901 EMP_STATUS_2019_01_XRND   // EMP_STATUS_2019.01
  rename E0013902 EMP_STATUS_2019_02_XRND   // EMP_STATUS_2019.02
  rename E0013903 EMP_STATUS_2019_03_XRND   // EMP_STATUS_2019.03
  rename E0013904 EMP_STATUS_2019_04_XRND   // EMP_STATUS_2019.04
  rename E0013905 EMP_STATUS_2019_05_XRND   // EMP_STATUS_2019.05
  rename E0013906 EMP_STATUS_2019_06_XRND   // EMP_STATUS_2019.06
  rename E0013907 EMP_STATUS_2019_07_XRND   // EMP_STATUS_2019.07
  rename E0013908 EMP_STATUS_2019_08_XRND   // EMP_STATUS_2019.08
  rename E0013909 EMP_STATUS_2019_09_XRND   // EMP_STATUS_2019.09
  rename E0013910 EMP_STATUS_2019_10_XRND   // EMP_STATUS_2019.10
  rename E0013911 EMP_STATUS_2019_11_XRND   // EMP_STATUS_2019.11
  rename E0013912 EMP_STATUS_2019_12_XRND   // EMP_STATUS_2019.12
  rename E0013913 EMP_STATUS_2019_13_XRND   // EMP_STATUS_2019.13
  rename E0013914 EMP_STATUS_2019_14_XRND   // EMP_STATUS_2019.14
  rename E0013915 EMP_STATUS_2019_15_XRND   // EMP_STATUS_2019.15
  rename E0013916 EMP_STATUS_2019_16_XRND   // EMP_STATUS_2019.16
  rename E0013917 EMP_STATUS_2019_17_XRND   // EMP_STATUS_2019.17
  rename E0013918 EMP_STATUS_2019_18_XRND   // EMP_STATUS_2019.18
  rename E0013919 EMP_STATUS_2019_19_XRND   // EMP_STATUS_2019.19
  rename E0013920 EMP_STATUS_2019_20_XRND   // EMP_STATUS_2019.20
  rename E0013921 EMP_STATUS_2019_21_XRND   // EMP_STATUS_2019.21
  rename E0013922 EMP_STATUS_2019_22_XRND   // EMP_STATUS_2019.22
  rename E0013923 EMP_STATUS_2019_23_XRND   // EMP_STATUS_2019.23
  rename E0013924 EMP_STATUS_2019_24_XRND   // EMP_STATUS_2019.24
  rename E0013925 EMP_STATUS_2019_25_XRND   // EMP_STATUS_2019.25
  rename E0013926 EMP_STATUS_2019_26_XRND   // EMP_STATUS_2019.26
  rename E0013927 EMP_STATUS_2019_27_XRND   // EMP_STATUS_2019.27
  rename E0013928 EMP_STATUS_2019_28_XRND   // EMP_STATUS_2019.28
  rename E0013929 EMP_STATUS_2019_29_XRND   // EMP_STATUS_2019.29
  rename E0013930 EMP_STATUS_2019_30_XRND   // EMP_STATUS_2019.30
  rename E0013931 EMP_STATUS_2019_31_XRND   // EMP_STATUS_2019.31
  rename E0013932 EMP_STATUS_2019_32_XRND   // EMP_STATUS_2019.32
  rename E0013933 EMP_STATUS_2019_33_XRND   // EMP_STATUS_2019.33
  rename E0013934 EMP_STATUS_2019_34_XRND   // EMP_STATUS_2019.34
  rename E0013935 EMP_STATUS_2019_35_XRND   // EMP_STATUS_2019.35
  rename E0013936 EMP_STATUS_2019_36_XRND   // EMP_STATUS_2019.36
  rename E0013937 EMP_STATUS_2019_37_XRND   // EMP_STATUS_2019.37
  rename E0013938 EMP_STATUS_2019_38_XRND   // EMP_STATUS_2019.38
  rename E0013939 EMP_STATUS_2019_39_XRND   // EMP_STATUS_2019.39
  rename E0013940 EMP_STATUS_2019_40_XRND   // EMP_STATUS_2019.40
  rename E0013941 EMP_STATUS_2019_41_XRND   // EMP_STATUS_2019.41
  rename E0013942 EMP_STATUS_2019_42_XRND   // EMP_STATUS_2019.42
  rename E0013943 EMP_STATUS_2019_43_XRND   // EMP_STATUS_2019.43
  rename E0013944 EMP_STATUS_2019_44_XRND   // EMP_STATUS_2019.44
  rename E0013945 EMP_STATUS_2019_45_XRND   // EMP_STATUS_2019.45
  rename E0013946 EMP_STATUS_2019_46_XRND   // EMP_STATUS_2019.46
  rename E0013947 EMP_STATUS_2019_47_XRND   // EMP_STATUS_2019.47
  rename E0013948 EMP_STATUS_2019_48_XRND   // EMP_STATUS_2019.48
  rename E0013949 EMP_STATUS_2019_49_XRND   // EMP_STATUS_2019.49
  rename E0013950 EMP_STATUS_2019_50_XRND   // EMP_STATUS_2019.50
  rename E0013951 EMP_STATUS_2019_51_XRND   // EMP_STATUS_2019.51
  rename E0013952 EMP_STATUS_2019_52_XRND   // EMP_STATUS_2019.52
  rename E0014001 EMP_STATUS_2020_01_XRND   // EMP_STATUS_2020.01
  rename E0014002 EMP_STATUS_2020_02_XRND   // EMP_STATUS_2020.02
  rename E0014003 EMP_STATUS_2020_03_XRND   // EMP_STATUS_2020.03
  rename E0014004 EMP_STATUS_2020_04_XRND   // EMP_STATUS_2020.04
  rename E0014005 EMP_STATUS_2020_05_XRND   // EMP_STATUS_2020.05
  rename E0014006 EMP_STATUS_2020_06_XRND   // EMP_STATUS_2020.06
  rename E0014007 EMP_STATUS_2020_07_XRND   // EMP_STATUS_2020.07
  rename E0014008 EMP_STATUS_2020_08_XRND   // EMP_STATUS_2020.08
  rename E0014009 EMP_STATUS_2020_09_XRND   // EMP_STATUS_2020.09
  rename E0014010 EMP_STATUS_2020_10_XRND   // EMP_STATUS_2020.10
  rename E0014011 EMP_STATUS_2020_11_XRND   // EMP_STATUS_2020.11
  rename E0014012 EMP_STATUS_2020_12_XRND   // EMP_STATUS_2020.12
  rename E0014013 EMP_STATUS_2020_13_XRND   // EMP_STATUS_2020.13
  rename E0014014 EMP_STATUS_2020_14_XRND   // EMP_STATUS_2020.14
  rename E0014015 EMP_STATUS_2020_15_XRND   // EMP_STATUS_2020.15
  rename E0014016 EMP_STATUS_2020_16_XRND   // EMP_STATUS_2020.16
  rename E0014017 EMP_STATUS_2020_17_XRND   // EMP_STATUS_2020.17
  rename E0014018 EMP_STATUS_2020_18_XRND   // EMP_STATUS_2020.18
  rename E0014019 EMP_STATUS_2020_19_XRND   // EMP_STATUS_2020.19
  rename E0014020 EMP_STATUS_2020_20_XRND   // EMP_STATUS_2020.20
  rename E0014021 EMP_STATUS_2020_21_XRND   // EMP_STATUS_2020.21
  rename E0014022 EMP_STATUS_2020_22_XRND   // EMP_STATUS_2020.22
  rename E0014023 EMP_STATUS_2020_23_XRND   // EMP_STATUS_2020.23
  rename E0014024 EMP_STATUS_2020_24_XRND   // EMP_STATUS_2020.24
  rename E0014025 EMP_STATUS_2020_25_XRND   // EMP_STATUS_2020.25
  rename E0014026 EMP_STATUS_2020_26_XRND   // EMP_STATUS_2020.26
  rename E0014027 EMP_STATUS_2020_27_XRND   // EMP_STATUS_2020.27
  rename E0014028 EMP_STATUS_2020_28_XRND   // EMP_STATUS_2020.28
  rename E0014029 EMP_STATUS_2020_29_XRND   // EMP_STATUS_2020.29
  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save		"$temp/NLSYemp1920", replace



clear
import   delimited "$NLSY1997\hita_emp18.csv"
rename *, upper


label define vlE0013801 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013801 vlE0013801

label define vlE0013802 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013802 vlE0013802

label define vlE0013803 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013803 vlE0013803

label define vlE0013804 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013804 vlE0013804

label define vlE0013805 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013805 vlE0013805

label define vlE0013806 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013806 vlE0013806

label define vlE0013807 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013807 vlE0013807

label define vlE0013808 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013808 vlE0013808

label define vlE0013809 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013809 vlE0013809

label define vlE0013810 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013810 vlE0013810

label define vlE0013811 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013811 vlE0013811

label define vlE0013812 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013812 vlE0013812

label define vlE0013813 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013813 vlE0013813

label define vlE0013814 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013814 vlE0013814

label define vlE0013815 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013815 vlE0013815

label define vlE0013816 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013816 vlE0013816

label define vlE0013817 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013817 vlE0013817

label define vlE0013818 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013818 vlE0013818

label define vlE0013819 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013819 vlE0013819

label define vlE0013820 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013820 vlE0013820

label define vlE0013821 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013821 vlE0013821

label define vlE0013822 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013822 vlE0013822

label define vlE0013823 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013823 vlE0013823

label define vlE0013824 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013824 vlE0013824

label define vlE0013825 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013825 vlE0013825

label define vlE0013826 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013826 vlE0013826

label define vlE0013827 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013827 vlE0013827

label define vlE0013828 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013828 vlE0013828

label define vlE0013829 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013829 vlE0013829

label define vlE0013830 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013830 vlE0013830

label define vlE0013831 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013831 vlE0013831

label define vlE0013832 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013832 vlE0013832

label define vlE0013833 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013833 vlE0013833

label define vlE0013834 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013834 vlE0013834

label define vlE0013835 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013835 vlE0013835

label define vlE0013836 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013836 vlE0013836

label define vlE0013837 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013837 vlE0013837

label define vlE0013838 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013838 vlE0013838

label define vlE0013839 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013839 vlE0013839

label define vlE0013840 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013840 vlE0013840

label define vlE0013841 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013841 vlE0013841

label define vlE0013842 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013842 vlE0013842

label define vlE0013843 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013843 vlE0013843

label define vlE0013844 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013844 vlE0013844

label define vlE0013845 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013845 vlE0013845

label define vlE0013846 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013846 vlE0013846

label define vlE0013847 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013847 vlE0013847

label define vlE0013848 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013848 vlE0013848

label define vlE0013849 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013849 vlE0013849

label define vlE0013850 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013850 vlE0013850

label define vlE0013851 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013851 vlE0013851

label define vlE0013852 0 "0: No information reported to account for week; job dates indeterminate"  1 "1: Not associated with an employer, not actively searching for an employer job"  2 "2: Not working (unemployment vs. out of labor force cannot be determined)"  3 "3: Associated with an employer, periods not working for the employer are missing"  4 "4: Unemployed"  5 "5: Out of the labor force"  6 "6: Active military service"  9701 "9701 TO 201999: Employer on roster (see YEMP_UID)" 
label values E0013852 vlE0013852

label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 0 "No Information"  1 "Male"  2 "Female" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 0 "Oversample"  1 "Cross-sectional" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename E0013801 EMP_STATUS_2018_01_XRND   // EMP_STATUS_2018.01
  rename E0013802 EMP_STATUS_2018_02_XRND   // EMP_STATUS_2018.02
  rename E0013803 EMP_STATUS_2018_03_XRND   // EMP_STATUS_2018.03
  rename E0013804 EMP_STATUS_2018_04_XRND   // EMP_STATUS_2018.04
  rename E0013805 EMP_STATUS_2018_05_XRND   // EMP_STATUS_2018.05
  rename E0013806 EMP_STATUS_2018_06_XRND   // EMP_STATUS_2018.06
  rename E0013807 EMP_STATUS_2018_07_XRND   // EMP_STATUS_2018.07
  rename E0013808 EMP_STATUS_2018_08_XRND   // EMP_STATUS_2018.08
  rename E0013809 EMP_STATUS_2018_09_XRND   // EMP_STATUS_2018.09
  rename E0013810 EMP_STATUS_2018_10_XRND   // EMP_STATUS_2018.10
  rename E0013811 EMP_STATUS_2018_11_XRND   // EMP_STATUS_2018.11
  rename E0013812 EMP_STATUS_2018_12_XRND   // EMP_STATUS_2018.12
  rename E0013813 EMP_STATUS_2018_13_XRND   // EMP_STATUS_2018.13
  rename E0013814 EMP_STATUS_2018_14_XRND   // EMP_STATUS_2018.14
  rename E0013815 EMP_STATUS_2018_15_XRND   // EMP_STATUS_2018.15
  rename E0013816 EMP_STATUS_2018_16_XRND   // EMP_STATUS_2018.16
  rename E0013817 EMP_STATUS_2018_17_XRND   // EMP_STATUS_2018.17
  rename E0013818 EMP_STATUS_2018_18_XRND   // EMP_STATUS_2018.18
  rename E0013819 EMP_STATUS_2018_19_XRND   // EMP_STATUS_2018.19
  rename E0013820 EMP_STATUS_2018_20_XRND   // EMP_STATUS_2018.20
  rename E0013821 EMP_STATUS_2018_21_XRND   // EMP_STATUS_2018.21
  rename E0013822 EMP_STATUS_2018_22_XRND   // EMP_STATUS_2018.22
  rename E0013823 EMP_STATUS_2018_23_XRND   // EMP_STATUS_2018.23
  rename E0013824 EMP_STATUS_2018_24_XRND   // EMP_STATUS_2018.24
  rename E0013825 EMP_STATUS_2018_25_XRND   // EMP_STATUS_2018.25
  rename E0013826 EMP_STATUS_2018_26_XRND   // EMP_STATUS_2018.26
  rename E0013827 EMP_STATUS_2018_27_XRND   // EMP_STATUS_2018.27
  rename E0013828 EMP_STATUS_2018_28_XRND   // EMP_STATUS_2018.28
  rename E0013829 EMP_STATUS_2018_29_XRND   // EMP_STATUS_2018.29
  rename E0013830 EMP_STATUS_2018_30_XRND   // EMP_STATUS_2018.30
  rename E0013831 EMP_STATUS_2018_31_XRND   // EMP_STATUS_2018.31
  rename E0013832 EMP_STATUS_2018_32_XRND   // EMP_STATUS_2018.32
  rename E0013833 EMP_STATUS_2018_33_XRND   // EMP_STATUS_2018.33
  rename E0013834 EMP_STATUS_2018_34_XRND   // EMP_STATUS_2018.34
  rename E0013835 EMP_STATUS_2018_35_XRND   // EMP_STATUS_2018.35
  rename E0013836 EMP_STATUS_2018_36_XRND   // EMP_STATUS_2018.36
  rename E0013837 EMP_STATUS_2018_37_XRND   // EMP_STATUS_2018.37
  rename E0013838 EMP_STATUS_2018_38_XRND   // EMP_STATUS_2018.38
  rename E0013839 EMP_STATUS_2018_39_XRND   // EMP_STATUS_2018.39
  rename E0013840 EMP_STATUS_2018_40_XRND   // EMP_STATUS_2018.40
  rename E0013841 EMP_STATUS_2018_41_XRND   // EMP_STATUS_2018.41
  rename E0013842 EMP_STATUS_2018_42_XRND   // EMP_STATUS_2018.42
  rename E0013843 EMP_STATUS_2018_43_XRND   // EMP_STATUS_2018.43
  rename E0013844 EMP_STATUS_2018_44_XRND   // EMP_STATUS_2018.44
  rename E0013845 EMP_STATUS_2018_45_XRND   // EMP_STATUS_2018.45
  rename E0013846 EMP_STATUS_2018_46_XRND   // EMP_STATUS_2018.46
  rename E0013847 EMP_STATUS_2018_47_XRND   // EMP_STATUS_2018.47
  rename E0013848 EMP_STATUS_2018_48_XRND   // EMP_STATUS_2018.48
  rename E0013849 EMP_STATUS_2018_49_XRND   // EMP_STATUS_2018.49
  rename E0013850 EMP_STATUS_2018_50_XRND   // EMP_STATUS_2018.50
  rename E0013851 EMP_STATUS_2018_51_XRND   // EMP_STATUS_2018.51
  rename E0013852 EMP_STATUS_2018_52_XRND   // EMP_STATUS_2018.52
  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save	"$temp/NLSYemp18", replace



use			"$temp/NLSYemp1920", clear 
merge 		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997 using "$temp/NLSYemp18"
drop		_merge
merge		m:m KEY_BDATE_Y_1997 PUBID_1997 KEY_SEX_1997 CV_SAMPLE_TYPE_1997  using "$temp/NLSYemp"
drop		_merge


save "$created_data/NLSY97_extract_emplo", replace

log close
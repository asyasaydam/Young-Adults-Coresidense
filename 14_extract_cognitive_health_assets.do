********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Enrollment variables
* by Asya Saydam (asyasaydam@utexas.edu)
* Spring 2022

********************************************************************************

* Purpose: This file extracts occupational code variables 

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_enrollment_`logdate'.log", t replace



import delimited "$NLSY1997\default_cognitive_health_assets.csv"
rename *, upper



label define vlR0000100 0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999" 
label values R0000100 vlR0000100

label define vlR0536300 1 "Male"  2 "Female"  0 "No Information" 
label values R0536300 vlR0536300

label define vlR0536401 1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December" 
label values R0536401 vlR0536401

label define vlR1235800 1 "Cross-sectional"  0 "Oversample" 
label values R1235800 vlR1235800

label define vlR1482600 1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic" 
label values R1482600 vlR1482600

label define vlR4893600 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values R4893600 vlR4893600

label define vlR4893700 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values R4893700 vlR4893700

label define vlR4893800 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values R4893800 vlR4893800

label define vlR4893900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values R4893900 vlR4893900

label define vlR4894000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values R4894000 vlR4894000

label define vlS0920800 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S0920800 vlS0920800

label define vlS0920900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S0920900 vlS0920900

label define vlS0921000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S0921000 vlS0921000

label define vlS0921100 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S0921100 vlS0921100

label define vlS0921200 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S0921200 vlS0921200

label define vlS1238200 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238200 vlS1238200

label define vlS1238300 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238300 vlS1238300

label define vlS1238400 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238400 vlS1238400

label define vlS1238500 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238500 vlS1238500

label define vlS1238600 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238600 vlS1238600

label define vlS1238700 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238700 vlS1238700

label define vlS1238800 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238800 vlS1238800

label define vlS1238900 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1238900 vlS1238900

label define vlS1239000 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values S1239000 vlS1239000

label define vlS4681900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S4681900 vlS4681900

label define vlS4682000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S4682000 vlS4682000

label define vlS4682100 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S4682100 vlS4682100

label define vlS4682200 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S4682200 vlS4682200

label define vlS4682300 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S4682300 vlS4682300

label define vlS8332300 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S8332300 vlS8332300

label define vlS8332400 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S8332400 vlS8332400

label define vlS8332500 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S8332500 vlS8332500

label define vlS8332600 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S8332600 vlS8332600

label define vlS8332700 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values S8332700 vlS8332700

label define vlT1050400 1 "YES"  0 "NO" 
label values T1050400 vlT1050400

label define vlT1050500 1 "YES"  0 "NO" 
label values T1050500 vlT1050500

label define vlT1050700 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T1050700 vlT1050700

label define vlT1050800 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T1050800 vlT1050800

label define vlT1050900 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T1050900 vlT1050900

label define vlT1051000 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T1051000 vlT1051000

label define vlT1060900 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1060900 vlT1060900

label define vlT1061000 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061000 vlT1061000

label define vlT1061100 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061100 vlT1061100

label define vlT1061200 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061200 vlT1061200

label define vlT1061300 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061300 vlT1061300

label define vlT1061400 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061400 vlT1061400

label define vlT1061500 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061500 vlT1061500

label define vlT1061600 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T1061600 vlT1061600

label define vlT1063100 1 "YES"  0 "NO" 
label values T1063100 vlT1063100

label define vlT2782600 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T2782600 vlT2782600

label define vlT2782700 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T2782700 vlT2782700

label define vlT2782800 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T2782800 vlT2782800

label define vlT2782900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T2782900 vlT2782900

label define vlT2783000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T2783000 vlT2783000

label define vlT3145600 1 "YES"  0 "NO" 
label values T3145600 vlT3145600

label define vlT3145700 1 "YES"  0 "NO" 
label values T3145700 vlT3145700

label define vlT3145900 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T3145900 vlT3145900

label define vlT3146000 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T3146000 vlT3146000

label define vlT3154700 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3154700 vlT3154700

label define vlT3154800 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3154800 vlT3154800

label define vlT3154900 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3154900 vlT3154900

label define vlT3155000 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3155000 vlT3155000

label define vlT3155100 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3155100 vlT3155100

label define vlT3155200 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3155200 vlT3155200

label define vlT3155300 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3155300 vlT3155300

label define vlT3155400 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition" 
label values T3155400 vlT3155400

label define vlT4565900 1 "YES"  0 "NO" 
label values T4565900 vlT4565900

label define vlT4566000 1 "YES"  0 "NO" 
label values T4566000 vlT4566000

label define vlT4566200 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T4566200 vlT4566200

label define vlT6143700 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T6143700 vlT6143700

label define vlT6143800 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T6143800 vlT6143800

label define vlT6143900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T6143900 vlT6143900

label define vlT6144000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T6144000 vlT6144000

label define vlT6144100 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values T6144100 vlT6144100

label define vlT6210100 1 "YES"  0 "NO" 
label values T6210100 vlT6210100

label define vlT6210200 1 "YES"  0 "NO" 
label values T6210200 vlT6210200

label define vlT7707500 1 "YES"  0 "NO" 
label values T7707500 vlT7707500

label define vlT7707600 1 "YES"  0 "NO" 
label values T7707600 vlT7707600

label define vlT9093200 1 "YES"  0 "NO" 
label values T9093200 vlT9093200

label define vlT9093300 1 "YES"  0 "NO" 
label values T9093300 vlT9093300

label define vlT9093500 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T9093500 vlT9093500

label define vlT9093600 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T9093600 vlT9093600

label define vlT9093700 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T9093700 vlT9093700

label define vlT9093800 1 "Yes, limits a little"  2 "Yes, limits a lot"  0 "No, not currently limited by this condition"  3 "Never had this condition"  4 "No longer have this condition" 
label values T9093800 vlT9093800

label define vlU1030700 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values U1030700 vlU1030700

label define vlU1030800 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values U1030800 vlU1030800

label define vlU1030900 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values U1030900 vlU1030900

label define vlU1031000 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values U1031000 vlU1031000

label define vlU1031100 1 "All of the time"  2 "Most of the time"  3 "Some of the time"  4 "None of the time" 
label values U1031100 vlU1031100

label define vlU1100200 1 "YES"  0 "NO" 
label values U1100200 vlU1100200

label define vlU1100300 1 "YES"  0 "NO" 
label values U1100300 vlU1100300

label define vlU2963400 1 "YES"  0 "NO" 
label values U2963400 vlU2963400

label define vlU2963500 1 "YES"  0 "NO" 
label values U2963500 vlU2963500

label define vlU2964800 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U2964800 vlU2964800

label define vlU2964900 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U2964900 vlU2964900

label define vlU2965000 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U2965000 vlU2965000

label define vlU2965100 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U2965100 vlU2965100

label define vlU2965200 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U2965200 vlU2965200

label define vlU4368400 1 "YES"  0 "NO" 
label values U4368400 vlU4368400

label define vlU4368500 1 "YES"  0 "NO" 
label values U4368500 vlU4368500

label define vlU4369900 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U4369900 vlU4369900

label define vlU4370000 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U4370000 vlU4370000

label define vlU4370100 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U4370100 vlU4370100

label define vlU4370200 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U4370200 vlU4370200

label define vlU4370300 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "SOME OF THE TIME"  4 "NONE OF THE TIME" 
label values U4370300 vlU4370300

label define vlZ0529500 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529500 vlZ0529500

label define vlZ0529600 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529600 vlZ0529600

label define vlZ0529700 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529700 vlZ0529700

label define vlZ0529800 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529800 vlZ0529800

label define vlZ0529900 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0529900 vlZ0529900

label define vlZ0530000 1 "YES A LOT"  2 "YES A LITTLE"  3 "NO NOT AT ALL" 
label values Z0530000 vlZ0530000

label define vlZ0530100 1 "A LOT"  2 "A LITTLE"  3 "NOT AT ALL" 
label values Z0530100 vlZ0530100

label define vlZ0530600 1 "ALL OF THE TIME"  2 "MOST OF THE TIME"  3 "A GOOD BIT OF THE TIME"  4 "SOME OF THE TIME"  5 "A LITTLE OF THE TIME"  6 "NONE OF THE TIME" 
label values Z0530600 vlZ0530600

label define vlZ9048900 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9048900 vlZ9048900

label define vlZ9049000 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049000 vlZ9049000

label define vlZ9049100 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049100 vlZ9049100

label define vlZ9049200 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049200 vlZ9049200

label define vlZ9049300 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049300 vlZ9049300

label define vlZ9049400 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049400 vlZ9049400

label define vlZ9049500 1 "House"  2 "Ranch/Farm"  3 "Mobile Home"  4 "Mobile Home and Lot"  5 "Lot for Mobile Home"  6 "R does not own"  7 "Unit"  8 "Building" 
label values Z9049500 vlZ9049500

label define vlZ9049600 1 "House"  2 "Ranch/Farm"  3 "Mobile Home"  4 "Mobile Home and Lot"  5 "Lot for Mobile Home"  6 "R does not own"  7 "Unit"  8 "Building" 
label values Z9049600 vlZ9049600

label define vlZ9049700 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049700 vlZ9049700

label define vlZ9049800 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049800 vlZ9049800

label define vlZ9049900 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9049900 vlZ9049900

label define vlZ9050000 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9050000 vlZ9050000

label define vlZ9050100 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9050100 vlZ9050100

label define vlZ9050200 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9050200 vlZ9050200

label define vlZ9050300 3 "Round 3"  4 "Round 4"  5 "Round 5"  6 "Round 6"  7 "Round 7"  8 "Round 8"  9 "Round 9"  10 "Round 10"  11 "Round 11"  12 "Round 12" 
label values Z9050300 vlZ9050300

label define vlZ9050400 8 "Round 8"  9 "Round 9"  10 "Round 10"  11 "Round 11"  12 "Round 12"  13 "Round 13"  14 "Round 14"  15 "Round 15"  16 "Round 16" 
label values Z9050400 vlZ9050400

label define vlZ9121900 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9121900 vlZ9121900

label define vlZ9122000 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9122000 vlZ9122000

label define vlZ9122100 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9122100 vlZ9122100

label define vlZ9122200 1 "House"  2 "Ranch/Farm"  3 "Mobile Home"  6 "R does not own"  9 "Owns other residence type" 
label values Z9122200 vlZ9122200

label define vlZ9122300 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9122300 vlZ9122300

label define vlZ9122400 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9122400 vlZ9122400

label define vlZ9122500 -9999999 "-9999999 TO -3000: < -2999"  -2999 "-2999 TO -2000"  -1999 "-1999 TO -1000"  -999 "-999 TO -1"  0 "0"  1 "1 TO 1000"  1001 "1001 TO 2000"  2001 "2001 TO 3000"  3001 "3001 TO 5000"  5001 "5001 TO 10000"  10001 "10001 TO 20000"  20001 "20001 TO 30000"  30001 "30001 TO 40000"  40001 "40001 TO 50000"  50001 "50001 TO 65000"  65001 "65001 TO 80000"  80001 "80001 TO 100000"  100001 "100001 TO 150000"  150001 "150001 TO 200000"  200001 "200001 TO 999999999: 200001+" 
label values Z9122500 vlZ9122500

label define vlZ9122600 14 "Round 14"  15 "Round 15"  16 "Round 16"  17 "Round 17"  18 "Round 18" 
label values Z9122600 vlZ9122600
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename R4893600 YSAQ_282C_2000   // YSAQ-282C
  rename R4893700 YSAQ_282D_2000   // YSAQ-282D
  rename R4893800 YSAQ_282E_2000   // YSAQ-282E
  rename R4893900 YSAQ_282F_2000   // YSAQ-282F
  rename R4894000 YSAQ_282G_2000   // YSAQ-282G
  rename S0920800 YSAQ_282C_2002   // YSAQ-282C
  rename S0920900 YSAQ_282D_2002   // YSAQ-282D
  rename S0921000 YSAQ_282E_2002   // YSAQ-282E
  rename S0921100 YSAQ_282F_2002   // YSAQ-282F
  rename S0921200 YSAQ_282G_2002   // YSAQ-282G
  rename S1238200 YHEA_1360_01_2002   // YHEA-1360.01
  rename S1238300 YHEA_1360_02_2002   // YHEA-1360.02
  rename S1238400 YHEA_1360_03_2002   // YHEA-1360.03
  rename S1238500 YHEA_1360_04_2002   // YHEA-1360.04
  rename S1238600 YHEA_1360_05_2002   // YHEA-1360.05
  rename S1238700 YHEA_1360_06_2002   // YHEA-1360.06
  rename S1238800 YHEA_1360_07_2002   // YHEA-1360.07
  rename S1238900 YHEA_1360_08_2002   // YHEA-1360.08
  rename S1239000 YHEA_1360_09_2002   // YHEA-1360.09
  rename S4681900 YSAQ_282C_2004   // YSAQ-282C
  rename S4682000 YSAQ_282D_2004   // YSAQ-282D
  rename S4682100 YSAQ_282E_2004   // YSAQ-282E
  rename S4682200 YSAQ_282F_2004   // YSAQ-282F
  rename S4682300 YSAQ_282G_2004   // YSAQ-282G
  rename S8332300 YSAQ_282C_2006   // YSAQ-282C
  rename S8332400 YSAQ_282D_2006   // YSAQ-282D
  rename S8332500 YSAQ_282E_2006   // YSAQ-282E
  rename S8332600 YSAQ_282F_2006   // YSAQ-282F
  rename S8332700 YSAQ_282G_2006   // YSAQ-282G
  rename T1050400 YHEA_1005_2007   // YHEA-1005
  rename T1050500 YHEA_1006_2007   // YHEA-1006
  rename T1050700 YHEA_1060A_01_2007   // YHEA-1060A.01
  rename T1050800 YHEA_1060A_02_2007   // YHEA-1060A.02
  rename T1050900 YHEA_1060A_03_2007   // YHEA-1060A.03
  rename T1051000 YHEA_1060A_04_2007   // YHEA-1060A.04
  rename T1060900 YHEA_1360_01_2007   // YHEA-1360.01
  rename T1061000 YHEA_1360_02_2007   // YHEA-1360.02
  rename T1061100 YHEA_1360_03_2007   // YHEA-1360.03
  rename T1061200 YHEA_1360_04_2007   // YHEA-1360.04
  rename T1061300 YHEA_1360_05_2007   // YHEA-1360.05
  rename T1061400 YHEA_1360_06_2007   // YHEA-1360.06
  rename T1061500 YHEA_1360_08_2007   // YHEA-1360.08
  rename T1061600 YHEA_1360_09_2007   // YHEA-1360.09
  rename T1063100 YHEA_2310_2007   // YHEA-2310
  rename T2782600 YSAQ_282C_2008   // YSAQ-282C
  rename T2782700 YSAQ_282D_2008   // YSAQ-282D
  rename T2782800 YSAQ_282E_2008   // YSAQ-282E
  rename T2782900 YSAQ_282F_2008   // YSAQ-282F
  rename T2783000 YSAQ_282G_2008   // YSAQ-282G
  rename T3145600 YHEA_1005_2008   // YHEA-1005
  rename T3145700 YHEA_1006_2008   // YHEA-1006
  rename T3145900 YHEA_1060A_01_2008   // YHEA-1060A.01
  rename T3146000 YHEA_1060A_02_2008   // YHEA-1060A.02
  rename T3154700 YHEA_1360_01_2008   // YHEA-1360.01
  rename T3154800 YHEA_1360_02_2008   // YHEA-1360.02
  rename T3154900 YHEA_1360_03_2008   // YHEA-1360.03
  rename T3155000 YHEA_1360_04_2008   // YHEA-1360.04
  rename T3155100 YHEA_1360_05_2008   // YHEA-1360.05
  rename T3155200 YHEA_1360_06_2008   // YHEA-1360.06
  rename T3155300 YHEA_1360_08_2008   // YHEA-1360.08
  rename T3155400 YHEA_1360_09_2008   // YHEA-1360.09
  rename T4565900 YHEA_1005_2009   // YHEA-1005
  rename T4566000 YHEA_1006_2009   // YHEA-1006
  rename T4566200 YHEA_1060A_01_2009   // YHEA-1060A.01
  rename T6143700 YSAQ_282C_2010   // YSAQ-282C
  rename T6143800 YSAQ_282D_2010   // YSAQ-282D
  rename T6143900 YSAQ_282E_2010   // YSAQ-282E
  rename T6144000 YSAQ_282F_2010   // YSAQ-282F
  rename T6144100 YSAQ_282G_2010   // YSAQ-282G
  rename T6210100 YHEA_1005_2010   // YHEA-1005
  rename T6210200 YHEA_1006_2010   // YHEA-1006
  rename T7707500 YHEA_1005_2011   // YHEA-1005
  rename T7707600 YHEA_1006_2011   // YHEA-1006
  rename T9093200 YHEA_1005_2013   // YHEA-1005
  rename T9093300 YHEA_1006_2013   // YHEA-1006
  rename T9093500 YHEA_1060A_01_2013   // YHEA-1060A.01
  rename T9093600 YHEA_1060A_02_2013   // YHEA-1060A.02
  rename T9093700 YHEA_1060A_03_2013   // YHEA-1060A.03
  rename T9093800 YHEA_1060A_04_2013   // YHEA-1060A.04
  rename U1030700 YSAQ_282C_2015   // YSAQ-282C
  rename U1030800 YSAQ_282D_2015   // YSAQ-282D
  rename U1030900 YSAQ_282E_2015   // YSAQ-282E
  rename U1031000 YSAQ_282F_2015   // YSAQ-282F
  rename U1031100 YSAQ_282G_2015   // YSAQ-282G
  rename U1100200 YHEA_1005_2015   // YHEA-1005
  rename U1100300 YHEA_1006_2015   // YHEA-1006
  rename U2963400 YHEA_1005_2017   // YHEA-1005
  rename U2963500 YHEA_1006_2017   // YHEA-1006
  rename U2964800 YHEA_SAQ_282C_2017   // YHEA-SAQ-282C
  rename U2964900 YHEA_SAQ_282D_2017   // YHEA-SAQ-282D
  rename U2965000 YHEA_SAQ_282E_2017   // YHEA-SAQ-282E
  rename U2965100 YHEA_SAQ_282F_2017   // YHEA-SAQ-282F
  rename U2965200 YHEA_SAQ_282G_2017   // YHEA-SAQ-282G
  rename U4368400 YHEA_1005_2019   // YHEA-1005
  rename U4368500 YHEA_1006_2019   // YHEA-1006
  rename U4369900 YHEA_SAQ_282C_2019   // YHEA-SAQ-282C
  rename U4370000 YHEA_SAQ_282D_2019   // YHEA-SAQ-282D
  rename U4370100 YHEA_SAQ_282E_2019   // YHEA-SAQ-282E
  rename U4370200 YHEA_SAQ_282F_2019   // YHEA-SAQ-282F
  rename U4370300 YHEA_SAQ_282G_2019   // YHEA-SAQ-282G
  rename Z0529500 YHEA29_240_COMB_XRND   // YHEA29-240_COMB
  rename Z0529600 YHEA29_245_COMB_XRND   // YHEA29-245_COMB
  rename Z0529700 YHEA29_250_COMB_XRND   // YHEA29-250_COMB
  rename Z0529800 YHEA29_255_COMB_XRND   // YHEA29-255_COMB
  rename Z0529900 YHEA29_260_COMB_XRND   // YHEA29-260_COMB
  rename Z0530000 YHEA29_265_COMB_XRND   // YHEA29-265_COMB
  rename Z0530100 YHEA29_270_COMB_XRND   // YHEA29-270_COMB
  rename Z0530600 YHEA29_290_COMB_XRND   // YHEA29-290_COMB
  rename Z9048900 CVC_HH_NET_WORTH_20_XRND 
  rename Z9049000 CVC_HH_NET_WORTH_25_XRND 
  rename Z9049100 CVC_HOUSE_VALUE_20_XRND 
  rename Z9049200 CVC_HOUSE_VALUE_25_XRND 
  rename Z9049300 CVC_HOUSE_DEBT_20_XRND 
  rename Z9049400 CVC_HOUSE_DEBT_25_XRND 
  rename Z9049500 CVC_HOUSE_TYPE_20_XRND 
  rename Z9049600 CVC_HOUSE_TYPE_25_XRND 
  rename Z9049700 CVC_ASSETS_FINANCIAL_20_XRND 
  rename Z9049800 CVC_ASSETS_FINANCIAL_25_XRND 
  rename Z9049900 CVC_ASSETS_NONFINANCIAL_20_XRND 
  rename Z9050000 CVC_ASSETS_NONFINANCIAL_25_XRND 
  rename Z9050100 CVC_ASSETS_DEBTS_20_XRND 
  rename Z9050200 CVC_ASSETS_DEBTS_25_XRND 
  rename Z9050300 CVC_ASSETS_RND_20_XRND 
  rename Z9050400 CVC_ASSETS_RND_25_XRND 
  rename Z9121900 CVC_HH_NET_WORTH_30_XRND 
  rename Z9122000 CVC_HOUSE_VALUE_30_XRND 
  rename Z9122100 CVC_HOUSE_DEBT_30_XRND 
  rename Z9122200 CVC_HOUSE_TYPE_30_XRND 
  rename Z9122300 CVC_ASSETS_FINANCIAL_30_XRND 
  rename Z9122400 CVC_ASSETS_NONFINANCIAL_30_XRND 
  rename Z9122500 CVC_ASSETS_DEBTS_30_XRND 
  rename Z9122600 CVC_ASSETS_RND_30_XRND 


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */

save "$created_data/NLSY97_extract_cognitive_assets", replace

log close
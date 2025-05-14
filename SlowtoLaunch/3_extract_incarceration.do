********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* Extract and Rename incarceration status
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021

********************************************************************************

* Purpose: This file extracts number of children

cd   		"T:"
clear       all
capture log close
set			maxvar 120000
local 		logdate = string( d(`c(current_date)'), "%dCY.N.D" )
log 		using "$logdir/NLSY97extract_incarc_`logdate'.log", t replace


import delimited "$NLSY1997\hitaincarceration.csv"
rename *, upper


label define vlE8021201 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021201 vlE8021201

label define vlE8021202 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021202 vlE8021202

label define vlE8021203 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021203 vlE8021203

label define vlE8021204 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021204 vlE8021204

label define vlE8021205 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021205 vlE8021205

label define vlE8021206 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021206 vlE8021206

label define vlE8021207 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021207 vlE8021207

label define vlE8021208 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021208 vlE8021208

label define vlE8021209 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021209 vlE8021209

label define vlE8021210 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021210 vlE8021210

label define vlE8021211 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021211 vlE8021211

label define vlE8021212 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021212 vlE8021212

label define vlE8021301 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021301 vlE8021301

label define vlE8021302 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021302 vlE8021302

label define vlE8021303 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021303 vlE8021303

label define vlE8021304 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021304 vlE8021304

label define vlE8021305 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021305 vlE8021305

label define vlE8021306 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021306 vlE8021306

label define vlE8021307 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021307 vlE8021307

label define vlE8021308 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021308 vlE8021308

label define vlE8021309 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021309 vlE8021309

label define vlE8021310 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021310 vlE8021310

label define vlE8021311 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021311 vlE8021311

label define vlE8021312 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021312 vlE8021312

label define vlE8021401 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021401 vlE8021401

label define vlE8021402 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021402 vlE8021402

label define vlE8021403 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021403 vlE8021403

label define vlE8021404 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021404 vlE8021404

label define vlE8021405 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021405 vlE8021405

label define vlE8021406 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021406 vlE8021406

label define vlE8021407 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021407 vlE8021407

label define vlE8021408 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021408 vlE8021408

label define vlE8021409 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021409 vlE8021409

label define vlE8021410 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021410 vlE8021410

label define vlE8021411 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021411 vlE8021411

label define vlE8021412 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021412 vlE8021412

label define vlE8021501 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021501 vlE8021501

label define vlE8021502 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021502 vlE8021502

label define vlE8021503 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021503 vlE8021503

label define vlE8021504 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021504 vlE8021504

label define vlE8021505 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021505 vlE8021505

label define vlE8021506 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021506 vlE8021506

label define vlE8021507 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021507 vlE8021507

label define vlE8021508 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021508 vlE8021508

label define vlE8021509 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021509 vlE8021509

label define vlE8021510 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021510 vlE8021510

label define vlE8021511 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021511 vlE8021511

label define vlE8021512 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021512 vlE8021512

label define vlE8021601 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021601 vlE8021601

label define vlE8021602 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021602 vlE8021602

label define vlE8021603 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021603 vlE8021603

label define vlE8021604 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021604 vlE8021604

label define vlE8021605 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021605 vlE8021605

label define vlE8021606 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021606 vlE8021606

label define vlE8021607 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021607 vlE8021607

label define vlE8021608 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021608 vlE8021608

label define vlE8021609 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021609 vlE8021609

label define vlE8021610 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021610 vlE8021610

label define vlE8021611 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021611 vlE8021611

label define vlE8021612 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021612 vlE8021612

label define vlE8021701 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021701 vlE8021701

label define vlE8021702 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021702 vlE8021702

label define vlE8021703 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021703 vlE8021703

label define vlE8021704 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021704 vlE8021704

label define vlE8021705 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021705 vlE8021705

label define vlE8021706 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021706 vlE8021706

label define vlE8021707 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021707 vlE8021707

label define vlE8021708 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021708 vlE8021708

label define vlE8021709 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021709 vlE8021709

label define vlE8021710 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021710 vlE8021710

label define vlE8021711 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021711 vlE8021711

label define vlE8021712 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021712 vlE8021712

label define vlE8021801 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021801 vlE8021801

label define vlE8021802 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021802 vlE8021802

label define vlE8021803 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021803 vlE8021803

label define vlE8021804 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021804 vlE8021804

label define vlE8021805 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021805 vlE8021805

label define vlE8021806 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021806 vlE8021806

label define vlE8021807 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021807 vlE8021807

label define vlE8021808 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021808 vlE8021808

label define vlE8021809 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021809 vlE8021809

label define vlE8021810 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021810 vlE8021810

label define vlE8021811 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021811 vlE8021811

label define vlE8021812 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021812 vlE8021812

label define vlE8021901 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021901 vlE8021901

label define vlE8021902 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021902 vlE8021902

label define vlE8021903 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021903 vlE8021903

label define vlE8021904 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021904 vlE8021904

label define vlE8021905 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021905 vlE8021905

label define vlE8021906 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021906 vlE8021906

label define vlE8021907 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021907 vlE8021907

label define vlE8021908 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021908 vlE8021908

label define vlE8021909 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021909 vlE8021909

label define vlE8021910 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021910 vlE8021910

label define vlE8021911 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021911 vlE8021911

label define vlE8021912 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8021912 vlE8021912

label define vlE8022001 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022001 vlE8022001

label define vlE8022002 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022002 vlE8022002

label define vlE8022003 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022003 vlE8022003

label define vlE8022004 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022004 vlE8022004

label define vlE8022005 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022005 vlE8022005

label define vlE8022006 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022006 vlE8022006

label define vlE8022007 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022007 vlE8022007

label define vlE8022008 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022008 vlE8022008

label define vlE8022009 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022009 vlE8022009

label define vlE8022010 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022010 vlE8022010

label define vlE8022011 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022011 vlE8022011

label define vlE8022012 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022012 vlE8022012

label define vlE8022101 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022101 vlE8022101

label define vlE8022102 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022102 vlE8022102

label define vlE8022103 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022103 vlE8022103

label define vlE8022104 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022104 vlE8022104

label define vlE8022105 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022105 vlE8022105

label define vlE8022106 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022106 vlE8022106

label define vlE8022107 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022107 vlE8022107

label define vlE8022108 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022108 vlE8022108

label define vlE8022109 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022109 vlE8022109

label define vlE8022110 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022110 vlE8022110

label define vlE8022111 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022111 vlE8022111

label define vlE8022112 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022112 vlE8022112

label define vlE8022201 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022201 vlE8022201

label define vlE8022202 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022202 vlE8022202

label define vlE8022203 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022203 vlE8022203

label define vlE8022204 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022204 vlE8022204

label define vlE8022205 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022205 vlE8022205

label define vlE8022206 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022206 vlE8022206

label define vlE8022207 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022207 vlE8022207

label define vlE8022208 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022208 vlE8022208

label define vlE8022209 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022209 vlE8022209

label define vlE8022210 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022210 vlE8022210

label define vlE8022211 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022211 vlE8022211

label define vlE8022212 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022212 vlE8022212

label define vlE8022301 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022301 vlE8022301

label define vlE8022302 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022302 vlE8022302

label define vlE8022303 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022303 vlE8022303

label define vlE8022304 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022304 vlE8022304

label define vlE8022305 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022305 vlE8022305

label define vlE8022306 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022306 vlE8022306

label define vlE8022307 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022307 vlE8022307

label define vlE8022308 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022308 vlE8022308

label define vlE8022309 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022309 vlE8022309

label define vlE8022310 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022310 vlE8022310

label define vlE8022311 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022311 vlE8022311

label define vlE8022312 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022312 vlE8022312

label define vlE8022401 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022401 vlE8022401

label define vlE8022402 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022402 vlE8022402

label define vlE8022403 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022403 vlE8022403

label define vlE8022404 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022404 vlE8022404

label define vlE8022405 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022405 vlE8022405

label define vlE8022406 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022406 vlE8022406

label define vlE8022407 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022407 vlE8022407

label define vlE8022408 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022408 vlE8022408

label define vlE8022409 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022409 vlE8022409

label define vlE8022410 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022410 vlE8022410

label define vlE8022411 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022411 vlE8022411

label define vlE8022412 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022412 vlE8022412

label define vlE8022501 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022501 vlE8022501

label define vlE8022502 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022502 vlE8022502

label define vlE8022503 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022503 vlE8022503

label define vlE8022504 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022504 vlE8022504

label define vlE8022505 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022505 vlE8022505

label define vlE8022506 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022506 vlE8022506

label define vlE8022507 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022507 vlE8022507

label define vlE8022508 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022508 vlE8022508

label define vlE8022509 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022509 vlE8022509

label define vlE8022510 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022510 vlE8022510

label define vlE8022511 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022511 vlE8022511

label define vlE8022512 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022512 vlE8022512

label define vlE8022601 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022601 vlE8022601

label define vlE8022602 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022602 vlE8022602

label define vlE8022603 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022603 vlE8022603

label define vlE8022604 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022604 vlE8022604

label define vlE8022605 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022605 vlE8022605

label define vlE8022606 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022606 vlE8022606

label define vlE8022607 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022607 vlE8022607

label define vlE8022608 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022608 vlE8022608

label define vlE8022609 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022609 vlE8022609

label define vlE8022610 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022610 vlE8022610

label define vlE8022611 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022611 vlE8022611

label define vlE8022612 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022612 vlE8022612

label define vlE8022701 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022701 vlE8022701

label define vlE8022702 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022702 vlE8022702

label define vlE8022703 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022703 vlE8022703

label define vlE8022704 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022704 vlE8022704

label define vlE8022705 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022705 vlE8022705

label define vlE8022706 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022706 vlE8022706

label define vlE8022707 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022707 vlE8022707

label define vlE8022708 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022708 vlE8022708

label define vlE8022709 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022709 vlE8022709

label define vlE8022710 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022710 vlE8022710

label define vlE8022711 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022711 vlE8022711

label define vlE8022712 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022712 vlE8022712

label define vlE8022801 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022801 vlE8022801

label define vlE8022802 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022802 vlE8022802

label define vlE8022803 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022803 vlE8022803

label define vlE8022804 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022804 vlE8022804

label define vlE8022805 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022805 vlE8022805

label define vlE8022806 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022806 vlE8022806

label define vlE8022807 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022807 vlE8022807

label define vlE8022808 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022808 vlE8022808

label define vlE8022809 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022809 vlE8022809

label define vlE8022810 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022810 vlE8022810

label define vlE8022811 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022811 vlE8022811

label define vlE8022812 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022812 vlE8022812

label define vlE8022901 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022901 vlE8022901

label define vlE8022902 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022902 vlE8022902

label define vlE8022903 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022903 vlE8022903

label define vlE8022904 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022904 vlE8022904

label define vlE8022905 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022905 vlE8022905

label define vlE8022906 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022906 vlE8022906

label define vlE8022907 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022907 vlE8022907

label define vlE8022908 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022908 vlE8022908

label define vlE8022909 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022909 vlE8022909

label define vlE8022910 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022910 vlE8022910

label define vlE8022911 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022911 vlE8022911

label define vlE8022912 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8022912 vlE8022912

label define vlE8023001 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023001 vlE8023001

label define vlE8023002 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023002 vlE8023002

label define vlE8023003 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023003 vlE8023003

label define vlE8023004 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023004 vlE8023004

label define vlE8023005 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023005 vlE8023005

label define vlE8023006 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023006 vlE8023006

label define vlE8023007 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023007 vlE8023007

label define vlE8023008 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023008 vlE8023008

label define vlE8023009 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023009 vlE8023009

label define vlE8023010 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023010 vlE8023010

label define vlE8023011 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023011 vlE8023011

label define vlE8023012 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023012 vlE8023012

label define vlE8023101 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023101 vlE8023101

label define vlE8023102 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023102 vlE8023102

label define vlE8023103 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023103 vlE8023103

label define vlE8023104 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023104 vlE8023104

label define vlE8023105 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023105 vlE8023105

label define vlE8023106 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023106 vlE8023106

label define vlE8023107 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023107 vlE8023107

label define vlE8023108 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023108 vlE8023108

label define vlE8023109 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023109 vlE8023109

label define vlE8023110 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023110 vlE8023110

label define vlE8023111 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023111 vlE8023111

label define vlE8023112 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023112 vlE8023112

label define vlE8023201 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023201 vlE8023201

label define vlE8023202 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023202 vlE8023202

label define vlE8023203 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023203 vlE8023203

label define vlE8023204 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023204 vlE8023204

label define vlE8023205 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023205 vlE8023205

label define vlE8023206 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023206 vlE8023206

label define vlE8023207 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023207 vlE8023207

label define vlE8023208 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023208 vlE8023208

label define vlE8023209 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023209 vlE8023209

label define vlE8023210 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023210 vlE8023210

label define vlE8023211 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023211 vlE8023211

label define vlE8023212 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023212 vlE8023212

label define vlE8023301 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023301 vlE8023301

label define vlE8023302 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023302 vlE8023302

label define vlE8023303 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023303 vlE8023303

label define vlE8023304 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023304 vlE8023304

label define vlE8023305 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023305 vlE8023305

label define vlE8023306 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023306 vlE8023306

label define vlE8023307 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023307 vlE8023307

label define vlE8023308 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023308 vlE8023308

label define vlE8023309 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023309 vlE8023309

label define vlE8023310 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023310 vlE8023310

label define vlE8023311 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023311 vlE8023311

label define vlE8023312 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023312 vlE8023312

label define vlE8023401 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023401 vlE8023401

label define vlE8023402 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023402 vlE8023402

label define vlE8023403 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023403 vlE8023403

label define vlE8023404 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023404 vlE8023404

label define vlE8023405 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023405 vlE8023405

label define vlE8023406 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023406 vlE8023406

label define vlE8023407 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023407 vlE8023407

label define vlE8023408 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023408 vlE8023408

label define vlE8023409 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023409 vlE8023409

label define vlE8023410 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023410 vlE8023410

label define vlE8023411 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023411 vlE8023411

label define vlE8023412 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023412 vlE8023412

label define vlE8023501 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023501 vlE8023501

label define vlE8023502 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023502 vlE8023502

label define vlE8023503 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023503 vlE8023503

label define vlE8023504 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023504 vlE8023504

label define vlE8023505 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023505 vlE8023505

label define vlE8023506 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023506 vlE8023506

label define vlE8023507 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023507 vlE8023507

label define vlE8023508 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023508 vlE8023508

label define vlE8023509 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023509 vlE8023509

label define vlE8023510 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023510 vlE8023510

label define vlE8023511 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023511 vlE8023511

label define vlE8023512 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023512 vlE8023512

label define vlE8023601 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023601 vlE8023601

label define vlE8023602 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023602 vlE8023602

label define vlE8023603 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023603 vlE8023603

label define vlE8023604 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023604 vlE8023604

label define vlE8023605 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023605 vlE8023605

label define vlE8023606 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023606 vlE8023606

label define vlE8023607 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023607 vlE8023607

label define vlE8023608 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023608 vlE8023608

label define vlE8023609 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023609 vlE8023609

label define vlE8023610 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023610 vlE8023610

label define vlE8023611 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023611 vlE8023611

label define vlE8023612 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023612 vlE8023612

label define vlE8023701 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023701 vlE8023701

label define vlE8023702 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023702 vlE8023702

label define vlE8023703 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023703 vlE8023703

label define vlE8023704 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023704 vlE8023704

label define vlE8023705 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023705 vlE8023705

label define vlE8023706 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023706 vlE8023706

label define vlE8023707 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023707 vlE8023707

label define vlE8023708 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023708 vlE8023708

label define vlE8023709 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023709 vlE8023709

label define vlE8023710 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023710 vlE8023710

label define vlE8023711 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023711 vlE8023711

label define vlE8023712 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023712 vlE8023712

label define vlE8023801 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023801 vlE8023801

label define vlE8023802 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023802 vlE8023802

label define vlE8023803 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023803 vlE8023803

label define vlE8023804 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023804 vlE8023804

label define vlE8023805 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023805 vlE8023805

label define vlE8023806 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023806 vlE8023806

label define vlE8023807 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023807 vlE8023807

label define vlE8023808 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023808 vlE8023808

label define vlE8023809 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023809 vlE8023809

label define vlE8023810 0 "0: R not incarcerated in this month and not incarcerated in a previous month"  1 "1: R was incarcerated during all or some of this month"  99 "99: R incarcerated previously but not in this month" 
label values E8023810 vlE8023810

label define vlE8043100 0 "0: No incarcerations"  1 "1 TO 2: incarcerations"  3 "3 TO 4: incarcerations"  5 "5 TO 6: incarcerations"  7 "7 TO 8: incarcerations"  9 "9 TO 10: incarcerations"  11 "11 TO 12: incarcerations"  13 "13 TO 14: incarcerations"  15 "15 TO 16: incarcerations"  17 "17 TO 18: incarcerations"  19 "19 TO 20: incarcerations" 
label values E8043100 vlE8043100

label define vlE8043600 0 "No"  1 "Yes" 
label values E8043600 vlE8043600

label define vlE8043601 0 ">3 arrests/rnd likely complete incarceration history"  1 ">3 arrests/rnd, possible incomplete incarceration history" 
label values E8043601 vlE8043601

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

label define vlT2810100 0 "NO"  1 "YES" 
label values T2810100 vlT2810100


/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */

  rename E8021201 INCARC_STATUS_1992_01_XRND   // INCARC_STATUS_1992.01
  rename E8021202 INCARC_STATUS_1992_02_XRND   // INCARC_STATUS_1992.02
  rename E8021203 INCARC_STATUS_1992_03_XRND   // INCARC_STATUS_1992.03
  rename E8021204 INCARC_STATUS_1992_04_XRND   // INCARC_STATUS_1992.04
  rename E8021205 INCARC_STATUS_1992_05_XRND   // INCARC_STATUS_1992.05
  rename E8021206 INCARC_STATUS_1992_06_XRND   // INCARC_STATUS_1992.06
  rename E8021207 INCARC_STATUS_1992_07_XRND   // INCARC_STATUS_1992.07
  rename E8021208 INCARC_STATUS_1992_08_XRND   // INCARC_STATUS_1992.08
  rename E8021209 INCARC_STATUS_1992_09_XRND   // INCARC_STATUS_1992.09
  rename E8021210 INCARC_STATUS_1992_10_XRND   // INCARC_STATUS_1992.10
  rename E8021211 INCARC_STATUS_1992_11_XRND   // INCARC_STATUS_1992.11
  rename E8021212 INCARC_STATUS_1992_12_XRND   // INCARC_STATUS_1992.12
  rename E8021301 INCARC_STATUS_1993_01_XRND   // INCARC_STATUS_1993.01
  rename E8021302 INCARC_STATUS_1993_02_XRND   // INCARC_STATUS_1993.02
  rename E8021303 INCARC_STATUS_1993_03_XRND   // INCARC_STATUS_1993.03
  rename E8021304 INCARC_STATUS_1993_04_XRND   // INCARC_STATUS_1993.04
  rename E8021305 INCARC_STATUS_1993_05_XRND   // INCARC_STATUS_1993.05
  rename E8021306 INCARC_STATUS_1993_06_XRND   // INCARC_STATUS_1993.06
  rename E8021307 INCARC_STATUS_1993_07_XRND   // INCARC_STATUS_1993.07
  rename E8021308 INCARC_STATUS_1993_08_XRND   // INCARC_STATUS_1993.08
  rename E8021309 INCARC_STATUS_1993_09_XRND   // INCARC_STATUS_1993.09
  rename E8021310 INCARC_STATUS_1993_10_XRND   // INCARC_STATUS_1993.10
  rename E8021311 INCARC_STATUS_1993_11_XRND   // INCARC_STATUS_1993.11
  rename E8021312 INCARC_STATUS_1993_12_XRND   // INCARC_STATUS_1993.12
  rename E8021401 INCARC_STATUS_1994_01_XRND   // INCARC_STATUS_1994.01
  rename E8021402 INCARC_STATUS_1994_02_XRND   // INCARC_STATUS_1994.02
  rename E8021403 INCARC_STATUS_1994_03_XRND   // INCARC_STATUS_1994.03
  rename E8021404 INCARC_STATUS_1994_04_XRND   // INCARC_STATUS_1994.04
  rename E8021405 INCARC_STATUS_1994_05_XRND   // INCARC_STATUS_1994.05
  rename E8021406 INCARC_STATUS_1994_06_XRND   // INCARC_STATUS_1994.06
  rename E8021407 INCARC_STATUS_1994_07_XRND   // INCARC_STATUS_1994.07
  rename E8021408 INCARC_STATUS_1994_08_XRND   // INCARC_STATUS_1994.08
  rename E8021409 INCARC_STATUS_1994_09_XRND   // INCARC_STATUS_1994.09
  rename E8021410 INCARC_STATUS_1994_10_XRND   // INCARC_STATUS_1994.10
  rename E8021411 INCARC_STATUS_1994_11_XRND   // INCARC_STATUS_1994.11
  rename E8021412 INCARC_STATUS_1994_12_XRND   // INCARC_STATUS_1994.12
  rename E8021501 INCARC_STATUS_1995_01_XRND   // INCARC_STATUS_1995.01
  rename E8021502 INCARC_STATUS_1995_02_XRND   // INCARC_STATUS_1995.02
  rename E8021503 INCARC_STATUS_1995_03_XRND   // INCARC_STATUS_1995.03
  rename E8021504 INCARC_STATUS_1995_04_XRND   // INCARC_STATUS_1995.04
  rename E8021505 INCARC_STATUS_1995_05_XRND   // INCARC_STATUS_1995.05
  rename E8021506 INCARC_STATUS_1995_06_XRND   // INCARC_STATUS_1995.06
  rename E8021507 INCARC_STATUS_1995_07_XRND   // INCARC_STATUS_1995.07
  rename E8021508 INCARC_STATUS_1995_08_XRND   // INCARC_STATUS_1995.08
  rename E8021509 INCARC_STATUS_1995_09_XRND   // INCARC_STATUS_1995.09
  rename E8021510 INCARC_STATUS_1995_10_XRND   // INCARC_STATUS_1995.10
  rename E8021511 INCARC_STATUS_1995_11_XRND   // INCARC_STATUS_1995.11
  rename E8021512 INCARC_STATUS_1995_12_XRND   // INCARC_STATUS_1995.12
  rename E8021601 INCARC_STATUS_1996_01_XRND   // INCARC_STATUS_1996.01
  rename E8021602 INCARC_STATUS_1996_02_XRND   // INCARC_STATUS_1996.02
  rename E8021603 INCARC_STATUS_1996_03_XRND   // INCARC_STATUS_1996.03
  rename E8021604 INCARC_STATUS_1996_04_XRND   // INCARC_STATUS_1996.04
  rename E8021605 INCARC_STATUS_1996_05_XRND   // INCARC_STATUS_1996.05
  rename E8021606 INCARC_STATUS_1996_06_XRND   // INCARC_STATUS_1996.06
  rename E8021607 INCARC_STATUS_1996_07_XRND   // INCARC_STATUS_1996.07
  rename E8021608 INCARC_STATUS_1996_08_XRND   // INCARC_STATUS_1996.08
  rename E8021609 INCARC_STATUS_1996_09_XRND   // INCARC_STATUS_1996.09
  rename E8021610 INCARC_STATUS_1996_10_XRND   // INCARC_STATUS_1996.10
  rename E8021611 INCARC_STATUS_1996_11_XRND   // INCARC_STATUS_1996.11
  rename E8021612 INCARC_STATUS_1996_12_XRND   // INCARC_STATUS_1996.12
  rename E8021701 INCARC_STATUS_1997_01_XRND   // INCARC_STATUS_1997.01
  rename E8021702 INCARC_STATUS_1997_02_XRND   // INCARC_STATUS_1997.02
  rename E8021703 INCARC_STATUS_1997_03_XRND   // INCARC_STATUS_1997.03
  rename E8021704 INCARC_STATUS_1997_04_XRND   // INCARC_STATUS_1997.04
  rename E8021705 INCARC_STATUS_1997_05_XRND   // INCARC_STATUS_1997.05
  rename E8021706 INCARC_STATUS_1997_06_XRND   // INCARC_STATUS_1997.06
  rename E8021707 INCARC_STATUS_1997_07_XRND   // INCARC_STATUS_1997.07
  rename E8021708 INCARC_STATUS_1997_08_XRND   // INCARC_STATUS_1997.08
  rename E8021709 INCARC_STATUS_1997_09_XRND   // INCARC_STATUS_1997.09
  rename E8021710 INCARC_STATUS_1997_10_XRND   // INCARC_STATUS_1997.10
  rename E8021711 INCARC_STATUS_1997_11_XRND   // INCARC_STATUS_1997.11
  rename E8021712 INCARC_STATUS_1997_12_XRND   // INCARC_STATUS_1997.12
  rename E8021801 INCARC_STATUS_1998_01_XRND   // INCARC_STATUS_1998.01
  rename E8021802 INCARC_STATUS_1998_02_XRND   // INCARC_STATUS_1998.02
  rename E8021803 INCARC_STATUS_1998_03_XRND   // INCARC_STATUS_1998.03
  rename E8021804 INCARC_STATUS_1998_04_XRND   // INCARC_STATUS_1998.04
  rename E8021805 INCARC_STATUS_1998_05_XRND   // INCARC_STATUS_1998.05
  rename E8021806 INCARC_STATUS_1998_06_XRND   // INCARC_STATUS_1998.06
  rename E8021807 INCARC_STATUS_1998_07_XRND   // INCARC_STATUS_1998.07
  rename E8021808 INCARC_STATUS_1998_08_XRND   // INCARC_STATUS_1998.08
  rename E8021809 INCARC_STATUS_1998_09_XRND   // INCARC_STATUS_1998.09
  rename E8021810 INCARC_STATUS_1998_10_XRND   // INCARC_STATUS_1998.10
  rename E8021811 INCARC_STATUS_1998_11_XRND   // INCARC_STATUS_1998.11
  rename E8021812 INCARC_STATUS_1998_12_XRND   // INCARC_STATUS_1998.12
  rename E8021901 INCARC_STATUS_1999_01_XRND   // INCARC_STATUS_1999.01
  rename E8021902 INCARC_STATUS_1999_02_XRND   // INCARC_STATUS_1999.02
  rename E8021903 INCARC_STATUS_1999_03_XRND   // INCARC_STATUS_1999.03
  rename E8021904 INCARC_STATUS_1999_04_XRND   // INCARC_STATUS_1999.04
  rename E8021905 INCARC_STATUS_1999_05_XRND   // INCARC_STATUS_1999.05
  rename E8021906 INCARC_STATUS_1999_06_XRND   // INCARC_STATUS_1999.06
  rename E8021907 INCARC_STATUS_1999_07_XRND   // INCARC_STATUS_1999.07
  rename E8021908 INCARC_STATUS_1999_08_XRND   // INCARC_STATUS_1999.08
  rename E8021909 INCARC_STATUS_1999_09_XRND   // INCARC_STATUS_1999.09
  rename E8021910 INCARC_STATUS_1999_10_XRND   // INCARC_STATUS_1999.10
  rename E8021911 INCARC_STATUS_1999_11_XRND   // INCARC_STATUS_1999.11
  rename E8021912 INCARC_STATUS_1999_12_XRND   // INCARC_STATUS_1999.12
  rename E8022001 INCARC_STATUS_2000_01_XRND   // INCARC_STATUS_2000.01
  rename E8022002 INCARC_STATUS_2000_02_XRND   // INCARC_STATUS_2000.02
  rename E8022003 INCARC_STATUS_2000_03_XRND   // INCARC_STATUS_2000.03
  rename E8022004 INCARC_STATUS_2000_04_XRND   // INCARC_STATUS_2000.04
  rename E8022005 INCARC_STATUS_2000_05_XRND   // INCARC_STATUS_2000.05
  rename E8022006 INCARC_STATUS_2000_06_XRND   // INCARC_STATUS_2000.06
  rename E8022007 INCARC_STATUS_2000_07_XRND   // INCARC_STATUS_2000.07
  rename E8022008 INCARC_STATUS_2000_08_XRND   // INCARC_STATUS_2000.08
  rename E8022009 INCARC_STATUS_2000_09_XRND   // INCARC_STATUS_2000.09
  rename E8022010 INCARC_STATUS_2000_10_XRND   // INCARC_STATUS_2000.10
  rename E8022011 INCARC_STATUS_2000_11_XRND   // INCARC_STATUS_2000.11
  rename E8022012 INCARC_STATUS_2000_12_XRND   // INCARC_STATUS_2000.12
  rename E8022101 INCARC_STATUS_2001_01_XRND   // INCARC_STATUS_2001.01
  rename E8022102 INCARC_STATUS_2001_02_XRND   // INCARC_STATUS_2001.02
  rename E8022103 INCARC_STATUS_2001_03_XRND   // INCARC_STATUS_2001.03
  rename E8022104 INCARC_STATUS_2001_04_XRND   // INCARC_STATUS_2001.04
  rename E8022105 INCARC_STATUS_2001_05_XRND   // INCARC_STATUS_2001.05
  rename E8022106 INCARC_STATUS_2001_06_XRND   // INCARC_STATUS_2001.06
  rename E8022107 INCARC_STATUS_2001_07_XRND   // INCARC_STATUS_2001.07
  rename E8022108 INCARC_STATUS_2001_08_XRND   // INCARC_STATUS_2001.08
  rename E8022109 INCARC_STATUS_2001_09_XRND   // INCARC_STATUS_2001.09
  rename E8022110 INCARC_STATUS_2001_10_XRND   // INCARC_STATUS_2001.10
  rename E8022111 INCARC_STATUS_2001_11_XRND   // INCARC_STATUS_2001.11
  rename E8022112 INCARC_STATUS_2001_12_XRND   // INCARC_STATUS_2001.12
  rename E8022201 INCARC_STATUS_2002_01_XRND   // INCARC_STATUS_2002.01
  rename E8022202 INCARC_STATUS_2002_02_XRND   // INCARC_STATUS_2002.02
  rename E8022203 INCARC_STATUS_2002_03_XRND   // INCARC_STATUS_2002.03
  rename E8022204 INCARC_STATUS_2002_04_XRND   // INCARC_STATUS_2002.04
  rename E8022205 INCARC_STATUS_2002_05_XRND   // INCARC_STATUS_2002.05
  rename E8022206 INCARC_STATUS_2002_06_XRND   // INCARC_STATUS_2002.06
  rename E8022207 INCARC_STATUS_2002_07_XRND   // INCARC_STATUS_2002.07
  rename E8022208 INCARC_STATUS_2002_08_XRND   // INCARC_STATUS_2002.08
  rename E8022209 INCARC_STATUS_2002_09_XRND   // INCARC_STATUS_2002.09
  rename E8022210 INCARC_STATUS_2002_10_XRND   // INCARC_STATUS_2002.10
  rename E8022211 INCARC_STATUS_2002_11_XRND   // INCARC_STATUS_2002.11
  rename E8022212 INCARC_STATUS_2002_12_XRND   // INCARC_STATUS_2002.12
  rename E8022301 INCARC_STATUS_2003_01_XRND   // INCARC_STATUS_2003.01
  rename E8022302 INCARC_STATUS_2003_02_XRND   // INCARC_STATUS_2003.02
  rename E8022303 INCARC_STATUS_2003_03_XRND   // INCARC_STATUS_2003.03
  rename E8022304 INCARC_STATUS_2003_04_XRND   // INCARC_STATUS_2003.04
  rename E8022305 INCARC_STATUS_2003_05_XRND   // INCARC_STATUS_2003.05
  rename E8022306 INCARC_STATUS_2003_06_XRND   // INCARC_STATUS_2003.06
  rename E8022307 INCARC_STATUS_2003_07_XRND   // INCARC_STATUS_2003.07
  rename E8022308 INCARC_STATUS_2003_08_XRND   // INCARC_STATUS_2003.08
  rename E8022309 INCARC_STATUS_2003_09_XRND   // INCARC_STATUS_2003.09
  rename E8022310 INCARC_STATUS_2003_10_XRND   // INCARC_STATUS_2003.10
  rename E8022311 INCARC_STATUS_2003_11_XRND   // INCARC_STATUS_2003.11
  rename E8022312 INCARC_STATUS_2003_12_XRND   // INCARC_STATUS_2003.12
  rename E8022401 INCARC_STATUS_2004_01_XRND   // INCARC_STATUS_2004.01
  rename E8022402 INCARC_STATUS_2004_02_XRND   // INCARC_STATUS_2004.02
  rename E8022403 INCARC_STATUS_2004_03_XRND   // INCARC_STATUS_2004.03
  rename E8022404 INCARC_STATUS_2004_04_XRND   // INCARC_STATUS_2004.04
  rename E8022405 INCARC_STATUS_2004_05_XRND   // INCARC_STATUS_2004.05
  rename E8022406 INCARC_STATUS_2004_06_XRND   // INCARC_STATUS_2004.06
  rename E8022407 INCARC_STATUS_2004_07_XRND   // INCARC_STATUS_2004.07
  rename E8022408 INCARC_STATUS_2004_08_XRND   // INCARC_STATUS_2004.08
  rename E8022409 INCARC_STATUS_2004_09_XRND   // INCARC_STATUS_2004.09
  rename E8022410 INCARC_STATUS_2004_10_XRND   // INCARC_STATUS_2004.10
  rename E8022411 INCARC_STATUS_2004_11_XRND   // INCARC_STATUS_2004.11
  rename E8022412 INCARC_STATUS_2004_12_XRND   // INCARC_STATUS_2004.12
  rename E8022501 INCARC_STATUS_2005_01_XRND   // INCARC_STATUS_2005.01
  rename E8022502 INCARC_STATUS_2005_02_XRND   // INCARC_STATUS_2005.02
  rename E8022503 INCARC_STATUS_2005_03_XRND   // INCARC_STATUS_2005.03
  rename E8022504 INCARC_STATUS_2005_04_XRND   // INCARC_STATUS_2005.04
  rename E8022505 INCARC_STATUS_2005_05_XRND   // INCARC_STATUS_2005.05
  rename E8022506 INCARC_STATUS_2005_06_XRND   // INCARC_STATUS_2005.06
  rename E8022507 INCARC_STATUS_2005_07_XRND   // INCARC_STATUS_2005.07
  rename E8022508 INCARC_STATUS_2005_08_XRND   // INCARC_STATUS_2005.08
  rename E8022509 INCARC_STATUS_2005_09_XRND   // INCARC_STATUS_2005.09
  rename E8022510 INCARC_STATUS_2005_10_XRND   // INCARC_STATUS_2005.10
  rename E8022511 INCARC_STATUS_2005_11_XRND   // INCARC_STATUS_2005.11
  rename E8022512 INCARC_STATUS_2005_12_XRND   // INCARC_STATUS_2005.12
  rename E8022601 INCARC_STATUS_2006_01_XRND   // INCARC_STATUS_2006.01
  rename E8022602 INCARC_STATUS_2006_02_XRND   // INCARC_STATUS_2006.02
  rename E8022603 INCARC_STATUS_2006_03_XRND   // INCARC_STATUS_2006.03
  rename E8022604 INCARC_STATUS_2006_04_XRND   // INCARC_STATUS_2006.04
  rename E8022605 INCARC_STATUS_2006_05_XRND   // INCARC_STATUS_2006.05
  rename E8022606 INCARC_STATUS_2006_06_XRND   // INCARC_STATUS_2006.06
  rename E8022607 INCARC_STATUS_2006_07_XRND   // INCARC_STATUS_2006.07
  rename E8022608 INCARC_STATUS_2006_08_XRND   // INCARC_STATUS_2006.08
  rename E8022609 INCARC_STATUS_2006_09_XRND   // INCARC_STATUS_2006.09
  rename E8022610 INCARC_STATUS_2006_10_XRND   // INCARC_STATUS_2006.10
  rename E8022611 INCARC_STATUS_2006_11_XRND   // INCARC_STATUS_2006.11
  rename E8022612 INCARC_STATUS_2006_12_XRND   // INCARC_STATUS_2006.12
  rename E8022701 INCARC_STATUS_2007_01_XRND   // INCARC_STATUS_2007.01
  rename E8022702 INCARC_STATUS_2007_02_XRND   // INCARC_STATUS_2007.02
  rename E8022703 INCARC_STATUS_2007_03_XRND   // INCARC_STATUS_2007.03
  rename E8022704 INCARC_STATUS_2007_04_XRND   // INCARC_STATUS_2007.04
  rename E8022705 INCARC_STATUS_2007_05_XRND   // INCARC_STATUS_2007.05
  rename E8022706 INCARC_STATUS_2007_06_XRND   // INCARC_STATUS_2007.06
  rename E8022707 INCARC_STATUS_2007_07_XRND   // INCARC_STATUS_2007.07
  rename E8022708 INCARC_STATUS_2007_08_XRND   // INCARC_STATUS_2007.08
  rename E8022709 INCARC_STATUS_2007_09_XRND   // INCARC_STATUS_2007.09
  rename E8022710 INCARC_STATUS_2007_10_XRND   // INCARC_STATUS_2007.10
  rename E8022711 INCARC_STATUS_2007_11_XRND   // INCARC_STATUS_2007.11
  rename E8022712 INCARC_STATUS_2007_12_XRND   // INCARC_STATUS_2007.12
  rename E8022801 INCARC_STATUS_2008_01_XRND   // INCARC_STATUS_2008.01
  rename E8022802 INCARC_STATUS_2008_02_XRND   // INCARC_STATUS_2008.02
  rename E8022803 INCARC_STATUS_2008_03_XRND   // INCARC_STATUS_2008.03
  rename E8022804 INCARC_STATUS_2008_04_XRND   // INCARC_STATUS_2008.04
  rename E8022805 INCARC_STATUS_2008_05_XRND   // INCARC_STATUS_2008.05
  rename E8022806 INCARC_STATUS_2008_06_XRND   // INCARC_STATUS_2008.06
  rename E8022807 INCARC_STATUS_2008_07_XRND   // INCARC_STATUS_2008.07
  rename E8022808 INCARC_STATUS_2008_08_XRND   // INCARC_STATUS_2008.08
  rename E8022809 INCARC_STATUS_2008_09_XRND   // INCARC_STATUS_2008.09
  rename E8022810 INCARC_STATUS_2008_10_XRND   // INCARC_STATUS_2008.10
  rename E8022811 INCARC_STATUS_2008_11_XRND   // INCARC_STATUS_2008.11
  rename E8022812 INCARC_STATUS_2008_12_XRND   // INCARC_STATUS_2008.12
  rename E8022901 INCARC_STATUS_2009_01_XRND   // INCARC_STATUS_2009.01
  rename E8022902 INCARC_STATUS_2009_02_XRND   // INCARC_STATUS_2009.02
  rename E8022903 INCARC_STATUS_2009_03_XRND   // INCARC_STATUS_2009.03
  rename E8022904 INCARC_STATUS_2009_04_XRND   // INCARC_STATUS_2009.04
  rename E8022905 INCARC_STATUS_2009_05_XRND   // INCARC_STATUS_2009.05
  rename E8022906 INCARC_STATUS_2009_06_XRND   // INCARC_STATUS_2009.06
  rename E8022907 INCARC_STATUS_2009_07_XRND   // INCARC_STATUS_2009.07
  rename E8022908 INCARC_STATUS_2009_08_XRND   // INCARC_STATUS_2009.08
  rename E8022909 INCARC_STATUS_2009_09_XRND   // INCARC_STATUS_2009.09
  rename E8022910 INCARC_STATUS_2009_10_XRND   // INCARC_STATUS_2009.10
  rename E8022911 INCARC_STATUS_2009_11_XRND   // INCARC_STATUS_2009.11
  rename E8022912 INCARC_STATUS_2009_12_XRND   // INCARC_STATUS_2009.12
  rename E8023001 INCARC_STATUS_2010_01_XRND   // INCARC_STATUS_2010.01
  rename E8023002 INCARC_STATUS_2010_02_XRND   // INCARC_STATUS_2010.02
  rename E8023003 INCARC_STATUS_2010_03_XRND   // INCARC_STATUS_2010.03
  rename E8023004 INCARC_STATUS_2010_04_XRND   // INCARC_STATUS_2010.04
  rename E8023005 INCARC_STATUS_2010_05_XRND   // INCARC_STATUS_2010.05
  rename E8023006 INCARC_STATUS_2010_06_XRND   // INCARC_STATUS_2010.06
  rename E8023007 INCARC_STATUS_2010_07_XRND   // INCARC_STATUS_2010.07
  rename E8023008 INCARC_STATUS_2010_08_XRND   // INCARC_STATUS_2010.08
  rename E8023009 INCARC_STATUS_2010_09_XRND   // INCARC_STATUS_2010.09
  rename E8023010 INCARC_STATUS_2010_10_XRND   // INCARC_STATUS_2010.10
  rename E8023011 INCARC_STATUS_2010_11_XRND   // INCARC_STATUS_2010.11
  rename E8023012 INCARC_STATUS_2010_12_XRND   // INCARC_STATUS_2010.12
  rename E8023101 INCARC_STATUS_2011_01_XRND   // INCARC_STATUS_2011.01
  rename E8023102 INCARC_STATUS_2011_02_XRND   // INCARC_STATUS_2011.02
  rename E8023103 INCARC_STATUS_2011_03_XRND   // INCARC_STATUS_2011.03
  rename E8023104 INCARC_STATUS_2011_04_XRND   // INCARC_STATUS_2011.04
  rename E8023105 INCARC_STATUS_2011_05_XRND   // INCARC_STATUS_2011.05
  rename E8023106 INCARC_STATUS_2011_06_XRND   // INCARC_STATUS_2011.06
  rename E8023107 INCARC_STATUS_2011_07_XRND   // INCARC_STATUS_2011.07
  rename E8023108 INCARC_STATUS_2011_08_XRND   // INCARC_STATUS_2011.08
  rename E8023109 INCARC_STATUS_2011_09_XRND   // INCARC_STATUS_2011.09
  rename E8023110 INCARC_STATUS_2011_10_XRND   // INCARC_STATUS_2011.10
  rename E8023111 INCARC_STATUS_2011_11_XRND   // INCARC_STATUS_2011.11
  rename E8023112 INCARC_STATUS_2011_12_XRND   // INCARC_STATUS_2011.12
  rename E8023201 INCARC_STATUS_2012_01_XRND   // INCARC_STATUS_2012.01
  rename E8023202 INCARC_STATUS_2012_02_XRND   // INCARC_STATUS_2012.02
  rename E8023203 INCARC_STATUS_2012_03_XRND   // INCARC_STATUS_2012.03
  rename E8023204 INCARC_STATUS_2012_04_XRND   // INCARC_STATUS_2012.04
  rename E8023205 INCARC_STATUS_2012_05_XRND   // INCARC_STATUS_2012.05
  rename E8023206 INCARC_STATUS_2012_06_XRND   // INCARC_STATUS_2012.06
  rename E8023207 INCARC_STATUS_2012_07_XRND   // INCARC_STATUS_2012.07
  rename E8023208 INCARC_STATUS_2012_08_XRND   // INCARC_STATUS_2012.08
  rename E8023209 INCARC_STATUS_2012_09_XRND   // INCARC_STATUS_2012.09
  rename E8023210 INCARC_STATUS_2012_10_XRND   // INCARC_STATUS_2012.10
  rename E8023211 INCARC_STATUS_2012_11_XRND   // INCARC_STATUS_2012.11
  rename E8023212 INCARC_STATUS_2012_12_XRND   // INCARC_STATUS_2012.12
  rename E8023301 INCARC_STATUS_2013_01_XRND   // INCARC_STATUS_2013.01
  rename E8023302 INCARC_STATUS_2013_02_XRND   // INCARC_STATUS_2013.02
  rename E8023303 INCARC_STATUS_2013_03_XRND   // INCARC_STATUS_2013.03
  rename E8023304 INCARC_STATUS_2013_04_XRND   // INCARC_STATUS_2013.04
  rename E8023305 INCARC_STATUS_2013_05_XRND   // INCARC_STATUS_2013.05
  rename E8023306 INCARC_STATUS_2013_06_XRND   // INCARC_STATUS_2013.06
  rename E8023307 INCARC_STATUS_2013_07_XRND   // INCARC_STATUS_2013.07
  rename E8023308 INCARC_STATUS_2013_08_XRND   // INCARC_STATUS_2013.08
  rename E8023309 INCARC_STATUS_2013_09_XRND   // INCARC_STATUS_2013.09
  rename E8023310 INCARC_STATUS_2013_10_XRND   // INCARC_STATUS_2013.10
  rename E8023311 INCARC_STATUS_2013_11_XRND   // INCARC_STATUS_2013.11
  rename E8023312 INCARC_STATUS_2013_12_XRND   // INCARC_STATUS_2013.12
  rename E8023401 INCARC_STATUS_2014_01_XRND   // INCARC_STATUS_2014.01
  rename E8023402 INCARC_STATUS_2014_02_XRND   // INCARC_STATUS_2014.02
  rename E8023403 INCARC_STATUS_2014_03_XRND   // INCARC_STATUS_2014.03
  rename E8023404 INCARC_STATUS_2014_04_XRND   // INCARC_STATUS_2014.04
  rename E8023405 INCARC_STATUS_2014_05_XRND   // INCARC_STATUS_2014.05
  rename E8023406 INCARC_STATUS_2014_06_XRND   // INCARC_STATUS_2014.06
  rename E8023407 INCARC_STATUS_2014_07_XRND   // INCARC_STATUS_2014.07
  rename E8023408 INCARC_STATUS_2014_08_XRND   // INCARC_STATUS_2014.08
  rename E8023409 INCARC_STATUS_2014_09_XRND   // INCARC_STATUS_2014.09
  rename E8023410 INCARC_STATUS_2014_10_XRND   // INCARC_STATUS_2014.10
  rename E8023411 INCARC_STATUS_2014_11_XRND   // INCARC_STATUS_2014.11
  rename E8023412 INCARC_STATUS_2014_12_XRND   // INCARC_STATUS_2014.12
  rename E8023501 INCARC_STATUS_2015_01_XRND   // INCARC_STATUS_2015.01
  rename E8023502 INCARC_STATUS_2015_02_XRND   // INCARC_STATUS_2015.02
  rename E8023503 INCARC_STATUS_2015_03_XRND   // INCARC_STATUS_2015.03
  rename E8023504 INCARC_STATUS_2015_04_XRND   // INCARC_STATUS_2015.04
  rename E8023505 INCARC_STATUS_2015_05_XRND   // INCARC_STATUS_2015.05
  rename E8023506 INCARC_STATUS_2015_06_XRND   // INCARC_STATUS_2015.06
  rename E8023507 INCARC_STATUS_2015_07_XRND   // INCARC_STATUS_2015.07
  rename E8023508 INCARC_STATUS_2015_08_XRND   // INCARC_STATUS_2015.08
  rename E8023509 INCARC_STATUS_2015_09_XRND   // INCARC_STATUS_2015.09
  rename E8023510 INCARC_STATUS_2015_10_XRND   // INCARC_STATUS_2015.10
  rename E8023511 INCARC_STATUS_2015_11_XRND   // INCARC_STATUS_2015.11
  rename E8023512 INCARC_STATUS_2015_12_XRND   // INCARC_STATUS_2015.12
  rename E8023601 INCARC_STATUS_2016_01_XRND   // INCARC_STATUS_2016.01
  rename E8023602 INCARC_STATUS_2016_02_XRND   // INCARC_STATUS_2016.02
  rename E8023603 INCARC_STATUS_2016_03_XRND   // INCARC_STATUS_2016.03
  rename E8023604 INCARC_STATUS_2016_04_XRND   // INCARC_STATUS_2016.04
  rename E8023605 INCARC_STATUS_2016_05_XRND   // INCARC_STATUS_2016.05
  rename E8023606 INCARC_STATUS_2016_06_XRND   // INCARC_STATUS_2016.06
  rename E8023607 INCARC_STATUS_2016_07_XRND   // INCARC_STATUS_2016.07
  rename E8023608 INCARC_STATUS_2016_08_XRND   // INCARC_STATUS_2016.08
  rename E8023609 INCARC_STATUS_2016_09_XRND   // INCARC_STATUS_2016.09
  rename E8023610 INCARC_STATUS_2016_10_XRND   // INCARC_STATUS_2016.10
  rename E8023611 INCARC_STATUS_2016_11_XRND   // INCARC_STATUS_2016.11
  rename E8023612 INCARC_STATUS_2016_12_XRND   // INCARC_STATUS_2016.12
  rename E8023701 INCARC_STATUS_2017_01_XRND   // INCARC_STATUS_2017.01
  rename E8023702 INCARC_STATUS_2017_02_XRND   // INCARC_STATUS_2017.02
  rename E8023703 INCARC_STATUS_2017_03_XRND   // INCARC_STATUS_2017.03
  rename E8023704 INCARC_STATUS_2017_04_XRND   // INCARC_STATUS_2017.04
  rename E8023705 INCARC_STATUS_2017_05_XRND   // INCARC_STATUS_2017.05
  rename E8023706 INCARC_STATUS_2017_06_XRND   // INCARC_STATUS_2017.06
  rename E8023707 INCARC_STATUS_2017_07_XRND   // INCARC_STATUS_2017.07
  rename E8023708 INCARC_STATUS_2017_08_XRND   // INCARC_STATUS_2017.08
  rename E8023709 INCARC_STATUS_2017_09_XRND   // INCARC_STATUS_2017.09
  rename E8023710 INCARC_STATUS_2017_10_XRND   // INCARC_STATUS_2017.10
  rename E8023711 INCARC_STATUS_2017_11_XRND   // INCARC_STATUS_2017.11
  rename E8023712 INCARC_STATUS_2017_12_XRND   // INCARC_STATUS_2017.12
  rename E8023801 INCARC_STATUS_2018_01_XRND   // INCARC_STATUS_2018.01
  rename E8023802 INCARC_STATUS_2018_02_XRND   // INCARC_STATUS_2018.02
  rename E8023803 INCARC_STATUS_2018_03_XRND   // INCARC_STATUS_2018.03
  rename E8023804 INCARC_STATUS_2018_04_XRND   // INCARC_STATUS_2018.04
  rename E8023805 INCARC_STATUS_2018_05_XRND   // INCARC_STATUS_2018.05
  rename E8023806 INCARC_STATUS_2018_06_XRND   // INCARC_STATUS_2018.06
  rename E8023807 INCARC_STATUS_2018_07_XRND   // INCARC_STATUS_2018.07
  rename E8023808 INCARC_STATUS_2018_08_XRND   // INCARC_STATUS_2018.08
  rename E8023809 INCARC_STATUS_2018_09_XRND   // INCARC_STATUS_2018.09
  rename E8023810 INCARC_STATUS_2018_10_XRND   // INCARC_STATUS_2018.10
  rename E8043000 INCARC_FIRST_XRND 
  rename E8043100 INCARC_TOTNUM_XRND 
  rename E8043200 INCARC_AGE_FIRST_XRND 
  rename E8043300 INCARC_LENGTH_FIRST_XRND 
  rename E8043400 INCARC_LENGTH_LONGEST_XRND 
  rename E8043600 INCARC_CURRENT_XRND 
  rename E8043601 INCARC_INCOMPLETE_XRND 
  rename R0000100 PUBID_1997 
  rename R0536300 KEY_SEX_1997 
  rename R0536401 KEY_BDATE_M_1997 
  rename R0536402 KEY_BDATE_Y_1997 
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1482600 KEY_RACE_ETHNICITY_1997 
  rename T2810100 YSAQ_537A_2008   // YSAQ-537A


  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */



save "$created_data/NLSY97_extract_incarc", replace

log close
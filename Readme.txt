********************************************************************************
* How does parental coresidence impact employment outcomes (NLSY1997)
* by Asya Saydam (asyasaydam@utexas.edu)
* Fall 2021
********************************************************************************

* Purpose: This readme files is to describe how do files are organized and what each file in the NLSY folder has. 

To run the analysis...
1. Set your working directory to Projects/HITA
2. use setup_example.do to set workspace directory, replace the macros with your own directories, and save as setup_<username>.do. 
3. Open master.do 
4. Run master.do

******** master.do ********
***************************
This file runs do files in order. 

*** Explanations for files ***
******************************
* Data files for the whole project are in my own repository and SIPP>data folder now (IPUMS, NLSY97) 
* Do files that has "extract" in the name of it extracts the NLSY data and saves it for proper use.
* 7_rename_merge: merges all the extracted do files and renames some of the variables.
* 8_employment: codes for the employment outcome variable
* 9_recode: recodes for almost all of the control variables
* 10_hhroster: this file codes for the focal independent variable.
* 11_occupations: Recodes for occupations people have at age 32
* 12_occeduc_occ_match: Recodes to have matching occupational names between NLSY and IPUMS
* ipums_occ_pooled: Calculates occupational education scores for years 2012-2016 and 
			for age group 15 to 39
* 13_ipums_nlsy_merge: Merges assigned occupational education scores to the main NLSY file. 
* _beforeanalysisdrop : this file drops for the cases when young adults turn into 24 and 32 and deceased.
* _descriptive: this file gives the descriptives with the distribution on the dependent variable by category of the independent variable.
* _models: this file gives the results for the first outcome: fulltime/parttime/no employment
* _multipleimputation: this file does propensity score and multiple imputation
* _eventhistory: this files sets the data for event history and can produce results for peak years

******************************
Note (January 2023): In local server, there are many trial-error do files that I may clean.


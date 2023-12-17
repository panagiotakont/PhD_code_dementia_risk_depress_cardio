/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY I: Independent and combined effects of depressive symptoms and cardiometabolic risk factors on dementia incidence

DATASET: HRS
baseline: wave 8 (2004) follow-up waves 9-14 (2008-2018)



TIMELINE

DEPRESSIVE SYMPTOMS AND CARDIOMETABOLIC RISK FACTORS: WV8 (BASELINE)
DEMENTIA INCIDENCE: W9 - WV14 (6 TIME POINTS)
COVARIATES ADJUSTMENT FOR HR MODELS: WV8

*/


* KEEP NECESSARY VARIABLES


keep HHID PN RAHHIDPN HHIDPN ///
H_sex H_age H_eduaction_yrs H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_ethnicity H_hispanic_ethnicity ///
H_smoking_2cat H_smoking_3cat H_physicalactivity H_alcohol_freq H_alcohol_status ///
H_cvd_comorbidity Hwv8_cognition Hwv8_memory Hwv8_loneliness_quintiles Hwv12_memory ///
Hwv8_cesd_sumscore Hwv8_depressive_symptoms ///
Hwv9_cesd_sumscore Hwv9_depressive_symptoms ///
Hwv10_cesd_sumscore Hwv10_depressive_symptoms ///
Hwv11_cesd_sumscore Hwv11_depressive_symptoms ///
Hwv12_cesd_sumscore Hwv12_depressive_symptoms /// 
Hwv13_cesd_sumscore Hwv13_depressive_symptoms ///
Hwv14_cesd_sumscore Hwv14_depressive_symptoms ///
Hwv8_crp_level Hwv8_crp Hwv8_hdl_level Hwv8_male_hdl Hwv8_female_hdl ///
Hwv8_meds_hdl Hwv8_hdl_sum Hwv8_hdl ///
Hwv8_waist Hwv8_malewaist_ao Hwv8_femalewaist_ao Hwv8_obesity_waist_sum Hwv8_obesity_waist ///
Hwv8_bmi_score Hwv8_obesity_bmi Hwv8_waist_bmi_sum Hwv8_obesity ///
Hwv8_systolic_mean Hwv8_diastolic_mean Hwv8_systolic_bp Hwv8_diastolic_bp ///
Hwv8_meds_bp Hwv8_bp_before Hwv8_bp_report Hwv8_bpevr ///
Hwv8_bp_reportevr_sum Hwv8_bp_reportevr Hwv8_bp_sum Hwv8_bp ///
Hwv8_diabetes_before Hwv8_diabetes_report Hwv8_diabetesevr ///
Hwv8_diabetes_reportevr_sum Hwv8_diabetes_reportevr ///
Hwv8_meds_diabetes Hwv8_insulin_diabetes ///
Hwv8_diabetes_anymeds_sum Hwv8_diabetes_anymeds ///
Hwv8_HbA1c_level Hwv8_HbA1c Hwv8_diabetes_HbA1c_sum Hwv8_glycemia ///
Hwv8_ao_depress_sum Hwv8_Nao_Ndepress Hwv8_Nao_Ydepress ///
Hwv8_Yao_Ndepress Hwv8_Yao_Ydepress Hwv8_ao_depress_group ///
Hwv8_waist_depress_sum Hwv8_Nwaist_Ndepress Hwv8_Nwaist_Ydepress ///
Hwv8_Ywaist_Ndepress Hwv8_Ywaist_Ydepress Hwv8_waist_depress_group ///
Hwv8_glycemia_depress_sum Hwv8_Nglycemia_Ndepress ///
Hwv8_Nglycemia_Ydepress Hwv8_Yglycemia_Ndepress ///
Hwv8_Yglycemia_Ydepress Hwv8_glycemia_depress_group ///
Hwv8_diabet_depress_sum Hwv8_Ndiabet_Ndepress ///
Hwv8_Ndiabet_Ydepress Hwv8_Ydiabet_Ndepress ///
Hwv8_Ydiabet_Ydepress Hwv8_diabet_depress_group ///
Hwv8_hba1c_depress_sum Hwv8_Nhba1c_Ndepress ///
Hwv8_Nhba1c_Ydepress Hwv8_Yhba1c_Ndepress Hwv8_Yhba1c_Ydepress ///
Hwv8_hba1c_depress_group Hwv8_hdl_depress_sum Hwv8_Nhdl_Ndepress ///
Hwv8_Nhdl_Ydepress Hwv8_Yhdl_Ndepress Hwv8_Yhdl_Ydepress ///
Hwv8_hdl_depress_group Hwv8_bp_depress_sum Hwv8_Nbp_Ndepress ///
Hwv8_Nbp_Ydepress Hwv8_Ybp_Ndepress Hwv8_Ybp_Ydepress ///
Hwv8_bp_depress_group Hwv8_sbp_depress_sum Hwv8_Nsbp_Ndepress ///
Hwv8_Nsbp_Ydepress Hwv8_Ysbp_Ndepress Hwv8_Ysbp_Ydepress ///
Hwv8_sbp_depress_group Hwv8_dbp_depress_sum Hwv8_Ndbp_Ndepress ///
Hwv8_Ndbp_Ydepress Hwv8_Ydbp_Ndepress Hwv8_Ydbp_Ydepress ///
Hwv8_dbp_depress_group Hwv8_crp_depress_sum Hwv8_Ncrp_Ndepress ///
Hwv8_Ncrp_Ydepress Hwv8_Ycrp_Ndepress Hwv8_Ycrp_Ydepress ///
Hwv8_crp_depress_group Hwv8_cardio3_sum Hwv8_cardio3 ///
Hwv8_ca3_depress_sum Hwv8_Nca3_Ndepress Hwv8_Nca3_Ydepress ///
Hwv8_Yca3_Ndepress Hwv8_Yca3_Ydepress Hwv8_ca3_depress_group ///
Hwv8_cardio4_sum Hwv8_cardio4 Hwv8_ca4_depress_sum ///
Hwv8_Nca4_Ndepress Hwv8_Nca4_Ydepress Hwv8_Yca4_Ndepress ///
Hwv8_Yca4_Ydepress Hwv8_ca4_depress_group ///
Hwv8_cardio_number_sum Hwv8_cardio_number ///
Hwv8_cardio2_sum Hwv8_cardio2 Hwv8_ca2_depress_sum ///
Hwv8_Nca2_Ndepress Hwv8_Nca2_Ydepress ///
Hwv8_Yca2_Ndepress Hwv8_Yca2_Ydepress Hwv8_ca2_depress_group ///
Hwv8_memory_report Hwv9_memory_report Hwv10_anydementia_report ///
Hwv11_anydementia_report Hwv12_anydementia_report ///
Hwv13_anydementia_report Hwv14_anydementia_report ///
Hwv8_interview_date Hwv9_interview_date Hwv10_interview_date ///
Hwv11_interview_date Hwv12_interview_date Hwv13_interview_date Hwv14_interview_date ///
Hwv9to14_dementia_sum Hwv9to14_dementia_event ///
Hwv9to14_newdementia_or_lastinte Hwv9to14_dementia_free_date H_time_dementia_months ///
H_time_dementia_midpoint H_time_dementia_midpoint_final H_time_of_event_dementia ///
Hwv12to14_newdementia_or_lastint Hwv12to14_time_dementia_months ///
Hwv12to14_dementia_free_date Hwv12to14_time_dementia_midpoint ///
Hwv12to14_time_dementia_midpoin0 Hwv12to14_time_of_event_dementia




/* ---- MERGE DATA ----

Process to merge 

Open master dataset and run merge two datasets

After merging all data both from master and using will be added
Need to keep if _merge==3
1 means cases from master data
2 means cases from using data
3 means cases from both master and using data

Drop _merge var.
*/


help merge

* Menu > Data > Combine datasets > Merge two datasets
* Choose One to many (key variable)


merge 1:m RAHHIDPN using "S:\Research\pkstudies\Study1_biopsych_risk\HRS\hrs_to_merge_physicalact.dta"

keep if _merge==3

drop _merge




/*

EXPOSURE VARIABLES

Binary variables of depressive symptoms and cardiometabolic markers measured at wave 8


Depression: Hwv8_depressive_symptoms

CRP: Hwv8_crp

HDL cholesterol: Hwv8_hdl

Obesity by waist cir: Hwv8_obesity_waist

systolic Blood pressure: Hwv8_systolic_bp

diastolic Blood pressure: Hwv8_diastolic_bp

Diabetes: Hwv8_diabetes_reportevr

HbA1c: Hwv8_HbA1c


CA number (categ 0,1,2,3,4+): Hwv8_cardio_number

CA mutlimorbidity >= 2 CA conditions

Grouping of Dep-CA: 
Hwv8_waist_depress_group Hwv8_diabet_depress_group Hwv8_hba1c_depress_group Hwv8_hdl_depress_group Hwv8_sbp_depress_group Hwv8_dbp_depress_group Hwv8_crp_depress_group Hwv8_ca3_depress_group Hwv8_ca4_depress_group Hwv8_ca2_depress_group


OUTCOME VARIABLES

Dementia event: Hwv9to14_dementia_event

Time-to-event: H_time_of_event_dementia
 

*/






*** Descriptive stats of var of interest


tabulate Hwv8_depressive_symptoms  
summarize Hwv8_depressive_symptoms

misstable summarize Hwv8_depressive_symptoms
misstable patterns Hwv8_depressive_symptoms


tabulate Hwv8_crp  
summarize Hwv8_crp

misstable summarize Hwv8_crp
misstable patterns Hwv8_crp

tabulate Hwv8_hdl
summarize Hwv8_hdl

misstable summarize Hwv8_hdl
misstable patterns Hwv8_hdl

tabulate Hwv8_obesity_waist
summarize Hwv8_obesity_waist

misstable summarize Hwv8_obesity_waist
misstable patterns Hwv8_obesity_waist

tabulate Hwv8_systolic_bp
summarize Hwv8_systolic_bp

misstable summarize Hwv8_systolic_bp
misstable patterns Hwv8_systolic_bp


tabulate Hwv8_diastolic_bp
summarize Hwv8_diastolic_bp

misstable summarize Hwv8_diastolic_bp
misstable patterns Hwv8_diastolic_bp


tabulate Hwv8_diabetes_reportevr
summarize Hwv8_diabetes_reportevr

misstable summarize Hwv8_diabetes_reportevr
misstable patterns Hwv8_diabetes_reportevr


tabulate Hwv8_HbA1c
summarize Hwv8_HbA1c

misstable summarize Hwv8_HbA1c
misstable patterns Hwv8_HbA1c


tabulate Hwv8_memory_report
summarize Hwv8_memory_report

misstable summarize Hwv8_memory_report
misstable patterns Hwv8_memory_report



	 


*** CLEANING DATA

* 1. drop dementia cases and missing data at baseline

* drop dementia wave 8 missing data
drop if Hwv8_memory_report==1
* (226 observations deleted)

drop if Hwv8_memory_report== .
* (0 observations deleted)



* 2. drop missing values and invalid data of depresssive sym and cardiometabolic markers


drop if Hwv8_depressive_symptoms== .
* (44 observations deleted)

drop if Hwv8_crp== .
* (499 observations deleted)

drop if Hwv8_crp_level > 100 & Hwv8_crp_level < 300
* (1 observations deleted)

 
drop if Hwv8_hdl== .
* (225 observations deleted)

drop if Hwv8_obesity_waist== .
* (188 observations deleted)

drop if Hwv8_systolic_bp== .
* (102 observations deleted)

* drop SBP > 300

drop if Hwv8_systolic_mean > 300 & Hwv8_systolic_mean < 1000
* (81 observations deleted)

drop if Hwv8_diastolic_bp== .
* (0 observations deleted)

* drop DBP > 300

drop if Hwv8_diastolic_mean > 300 & Hwv8_diastolic_mean < 1000
* (17 observations deleted)


drop if Hwv8_diabetes_reportevr== .
* (4 observations deleted)

drop if Hwv8_HbA1c== .
* (74 observations deleted)



* 3. drop obs with no records on dementia at any wave from 9-14 follow-ups


search mdesc
search rmiss2
search mvpatterns

* see number of missing values vs non-missing in each variable
mdesc Hwv9_memory_report Hwv10_anydementia_report Hwv11_anydementia_report ///
Hwv12_anydementia_report Hwv13_anydementia_report Hwv14_anydementia_report



/* number of missing values per observation
* the code below creates a variable called nmisfollowup that gives the number of missing values
for each observation in the variables of interest */
egen nmisfollowup_dementia_wv9to14=rmiss2(Hwv9_memory_report ///
Hwv10_anydementia_report Hwv11_anydementia_report ///
Hwv12_anydementia_report Hwv13_anydementia_report Hwv14_anydementia_report)

tab nmisfollowup_dementia_wv9to14

* drop observations "nmisfollowup_dementia_wv9to14" > 5 (those with 6 missing data = no records at any wave)
drop if nmisfollowup_dementia_wv9to14>5
*(253 observations deleted)


* ANALYTIC SAMPLE -> 5021 





	
  
/* 
---- DESCRIPTIVE STATISTICS ---- 

General characteristics of participnats stratified for study inclusion 

General characteristics of participants stratified for dementia occurence

1. CHI-SQUARE (chi2) for categorical var (crosstabulation)
	Frequency tables -> two-way tables
		using the command tabulate, chi2
		reporting observations, column percentage (N, %) and p-value of Pearson's r


2. one-way ANOVA for continuous var
	check box plot
	using the command oneway
	reporting mean, sd (summary tables) and p-value of F
*/




* General characteristics of HRS participants at baseline


* Socio-demographics
sum H_age
ta H_sex 
ta H_eduaction
ta H_maritalstatus_4cat
ta H_wealthquintiles
* Cardiometabolic risk factors
ta Hwv8_crp  
ta Hwv8_hdl
ta Hwv8_obesity_waist
ta Hwv8_systolic_bp
ta Hwv8_diastolic_bp
ta Hwv8_diabetes_reportevr
ta Hwv8_HbA1c
ta Hwv8_cardio2
* Lifestyle and health indicators
ta H_smoking_3cat
ta H_physicalactivity
ta H_alcohol_status
ta H_cvd_comorbidity
* Depressive symptoms
ta Hwv8_depressive_symptoms
* Memory score 
sum Hwv8_memory




* General characteristics of HRS participants stratified for dementia occurence

* Socio-demographics
ttest H_age, by(Hwv9to14_dementia_event)
ta H_sex Hwv9to14_dementia_event, chi2 column row
ta H_eduaction Hwv9to14_dementia_event, chi2 column row
ta H_maritalstatus_4cat Hwv9to14_dementia_event, chi2 column row
ta H_wealthquintiles Hwv9to14_dementia_event, chi2 column row
* Cardiometabolic risk factors
ta Hwv8_crp Hwv9to14_dementia_event, chi2 column row
ta Hwv8_hdl Hwv9to14_dementia_event, chi2 column row
ta Hwv8_obesity_waist Hwv9to14_dementia_event, chi2 column row
ta Hwv8_systolic_bp Hwv9to14_dementia_event, chi2 column row
ta Hwv8_diastolic_bp Hwv9to14_dementia_event, chi2 column row
ta Hwv8_diabetes_reportevr Hwv9to14_dementia_event, chi2 column row
ta Hwv8_HbA1c Hwv9to14_dementia_event, chi2 column row
ta Hwv8_cardio2 Hwv9to14_dementia_event, chi2 column row
* Lifestyle and health indicators
ta H_smoking_3cat Hwv9to14_dementia_event, chi2 column row
ta H_physicalactivity Hwv9to14_dementia_event, chi2 column row
ta H_alcohol_status Hwv9to14_dementia_event, chi2 column row
ta H_cvd_comorbidity Hwv9to14_dementia_event, chi2 column row
* Depressive symptoms
ta Hwv8_depressive_symptoms Hwv9to14_dementia_event, chi2 column row
* Memory score
ttest Hwv8_memory, by(Hwv9to14_dementia_event)
ta H_age_group Hwv9to14_dementia_event, chi2 column row








/*
---- SURVIVAL ANALYSIS IN COMPLETE DATA ----

Tests of proportional-hazards assumption
Kaplan Meier survival curves
Person-time
Cox proportional regression - Hazard ratios - stcox
Postestimation tools for stcox
Test of Goodness of Fit

*** Cox regression in full data, complete data (listwise deletion of missing data) and imputed data
Cox PH regression in complete data
Cox PH regression model in imputed dataset - mi estimate


*/



* check dataset variables of interest only

codebook H_time_of_event_dementia Hwv9to14_dementia_event ///
Hwv8_depressive_symptoms  Hwv8_crp ///
Hwv8_hdl Hwv8_obesity_waist Hwv8_systolic_bp Hwv8_diastolic_bp ///
Hwv8_diabetes_reportevr Hwv8_HbA1c ///
Hwv8_cardio3 Hwv8_cardio4 ///
Hwv8_cardio_number_sum Hwv8_cardio_number ///
Hwv8_waist_depress_group Hwv8_diabet_depress_group ///
Hwv8_hba1c_depress_group Hwv8_hdl_depress_group ///
Hwv8_sbp_depress_group Hwv8_dbp_depress_group ///
Hwv8_crp_depress_group ///
Hwv8_ca3_depress_group Hwv8_ca4_depress_group ///
H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity,compact



* Declare Data to be Survival Data
* Time to event: H_time_of_event_dementia (months)
* Censoring: Hwv9to14_dementia_event (1=dementia, 0=censored)
* Command is stset TIMETOEVENT, failure(CENSORVARIABLE)


stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)



*describe survival data using commnad stsum

stsum

stsum, by(Hwv8_ca2_depress_group)


* Kaplan Meier Curve estimation

sts list

sts list, by(Hwv8_ca2_depress_group)



* Kaplan Meier Curve Plot
 
* no frills plot 

sts graph

* with frills

sts graph, xtitle("Time in Months") ytitle("Survival Prob") ///
title("Kaplan Meier Curve")


* With Greenwood CI limits

sts graph, gwood legend(off) xtitle("Time in Months") ytitle("Survival Prob") ///
title("Kaplan Meier Curve") 



* Group Kaplan-Meier Curve Estimation
* Command is sts graph, by(GROUPVAR) OPTION OPTION OPTION Note: Must have sorted by GROUPVAR first

sort Hwv8_ca2_depress_group 

sts list, by(Hwv8_ca2_depress_group)

* graph with frills

sts graph, by(Hwv8_ca2_depress_group) xlabel(0(20)180) ylabel(0.80(.05)1) xtitle("Time in Months") ///
ytitle("Survival Prob") title("Kaplan Meier Curve")




* calculate person-time and incidence rates using command ststime

stptime,title(Person-years)

stptime, title(Person-years) per(1000)


/*

Repeat to find incident case per category

Hwv8_depressive_symptoms
Hwv8_crp 
Hwv8_hdl
Hwv8_obesity_waist 
Hwv8_systolic_bp 
Hwv8_diastolic_bp  
Hwv8_diabetes_reportevr 
Hwv8_HbA1c
Hwv8_cardio_number
Hwv8_cardio2

Hwv8_crp_depress_group 
Hwv8_hdl_depress_group
Hwv8_waist_depress_group
Hwv8_sbp_depress_group
Hwv8_dbp_depress_group   
Hwv8_diabet_depress_group
Hwv8_hba1c_depress_group  
Hwv8_ca2_depress_group

*/




ta Hwv8_ca2_depress_group

* calculate person-time  by category

stptime, by(Hwv8_ca2_depress_group)

stptime, by(Hwv8_ca2_depress_group) per(1000)



* mean and median of follow-up
sum H_time_of_event_dementia
sum H_time_of_event_dementia, detail
 
 



/* Log Rank Test of equality of survival distributions 
 (NULL: equality of survival distributions among groups)
 We will consider including the predictor if the test has a p-value of 0.2 – 0.25 or less. 
 If the predictor has a p-value greater than 0.25 in a univariate analysis 
 it is highly unlikely that it will contribute anything to a model which includes other predictors. 
 Command is sts test GROUPVAR
*/


sts test Hwv8_cardio2, logrank

sts test Hwv8_ca2_depress_group, logrank

sts test H_age, logrank

sts test H_sex, logrank

sts test H_eduaction, logrank

sts test H_maritalstatus_4cat, logrank

sts test H_wealthquintiles, logrank

sts test H_smoking_3cat, logrank

sts test H_alcohol_status, logrank

sts test H_cvd_comorbidity, logrank





/* Cox PH regression model

using the command stcox
	
--- Building the model ---

Model 1: unadjusted - single predictor of CM classes
Model 2: model 1 + sociodemographics: age sex education marital status and wealth 
Model 3: model 2 + lifestyle/health indicators: smoking, alcohol consumption, cvd comorbidity



!! I didn't adjust for physical activity because this variable can't be used in CHARLS (missing values)

*/


* Unadjusted model - model 1 - single predictor

stcox Hwv8_ca2_depress_group

* define design var by using i.(by group)

stcox i.Hwv8_ca2_depress_group


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 

stcox i.Hwv8_ca2_depress_group H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles


* model 3: model 2 + adjust for lifestyle/ health indicators

stcox i.Hwv8_ca2_depress_group H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity




* Coefficients instead of hazard ratios by specifing the option nohr 

stcox i.Hwv8_ca2_depress_group, nohr

stcox i.Hwv8_ca2_depress_group H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity, nohr




* Multivariable model development
* Likelihood-ratio tests



*install eststo
findit eststo


* ---- rx controlling for age and sex -----*
quietly: stcox H_age i.H_sex
eststo modelagesex

quietly: stcox H_age i.H_sex i.Hwv8_ca2_depress_group
eststo modelagesex_4group

lrtest modelagesex modelagesex_4group



* ---- rx controlling for sociodemographics -----*
quietly: stcox H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles
eststo modelsociodemo

quietly: stcox H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles i.Hwv8_ca2_depress_group
eststo modelsociodemo_4group

lrtest modelsociodemo modelsociodemo_4group


* ---- rx controlling for lifestyle/health indicators -----*
quietly: stcox i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity
eststo modelcardiovascular

quietly: stcox i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity i.Hwv8_ca2_depress_group
eststo modelcardiovascular_4group

lrtest modelcardiovascular modelcardiovascular_4group




* side-by-side comparison of models


quietly: stcox i.Hwv8_ca2_depress_group
eststo model1


quietly: stcox H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles i.Hwv8_ca2_depress_group
eststo model2


quietly: stcox H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity i.Hwv8_ca2_depress_group 
eststo model3



* Display Betas and Summary Statistics
estout model1 model2 model3, stats(n chi2 bic, star(chi2)) prehead("Betas")

/* Key Interpretattion
Chi2 = Value of LR test comparing the model fit (“full”) to intercept only (“reduced”)
bic = Schwarz’ Bayesian Information Criterion = It is a function of the log-likelihood. 
Smaller values indicate a better fit.
*/

* Display Hazard Ratios and Model Fit Statistics. Option eform produces hazard ratios
estout model1 model2 model3, eform stats(n chi2 bic, star(chi2)) prehead("Hazard Ratios")




* Postestimation tools for stcox

/* Test of proportional hazards

If the tests in the table are not significance (p-values over 0.05) 
 then we can not reject proportionality and we assume 
 that we do not have a violation of the proportional assumption. 
*/

estat phtest, detail


/* Proportionality Assumption - method 1
We will check proportionality by including time-dependent covariates in the model 
by using the tvc and the texp options in the stcox command. 
Time dependent covariates are interactions of the predictors and time. 
In this analysis we choose to use the interactions with log(time) 
because this is the most common function of time used in time-dependent covariates 
but any function of time could be used.
If a time-dependent covariate is significant this indicates 
a violation of the proportionality assumption for that specific predictor.
The conclusion is that all of the time-dependent variables are not significant 
either collectively or individually thus supporting the assumption of proportional hazard.
*/



stcox i.Hwv8_ca4_depress_group H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity, nohr ///
tvc(Hwv8_ca2_depress_group H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity) texp(ln(H_time_of_event_dementia))

 
 
/* Proportionality Assumption - method 2
by using the Schoenfeld and scaled Schoenfeld residuals 
In the stphtest command we test the proportionality of the model as a whole 
and by using the detail option we get a test of proportionality for each predictor.
By using the plot option we can also obtain a graph of the scaled Schoenfeld assumption.  
If the tests in the table are not significance (p-values over 0.05) 
then we can not reject proportionality and we assume 
that we do not have a violation of the proportional assumption.  
The stphplot command uses log-log plots to test proportionality 
and if the lines  in these plots are parallel then we have further indication 
that the predictors do not violate the proportionality assumption.
*/

quietly stcox Hwv8_ca2_depress_group H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity, schoenfeld(sch*) scaledsch(sca*)
stphtest, detail
stphtest, plot(Hwv8_ca2_depress_group) msym(oh)
stphtest, plot(H_age) msym(oh)
stphtest, plot(H_sex) msym(oh)
stphtest, plot(H_eduaction) msym(oh)
stphtest, plot(H_maritalstatus_4cat) msym(oh)
stphtest, plot(H_wealthquintiles) msym(oh)
stphtest, plot(H_smoking_3cat) msym(oh)
stphtest, plot(H_alcohol_status) msym(oh)
stphtest, plot(H_cvd_comorbidity) msym(oh)





stphplot, by(Hwv8_ca2_depress_group) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_age) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_sex) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_eduaction) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_maritalstatus_4cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_wealthquintiles) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_smoking_3cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_alcohol_status) plot1(msym(oh)) plot2(msym(th))
stphplot, by(H_cvd_comorbidity) plot1(msym(oh)) plot2(msym(th))




* Assessment of PH Assumption: adjust for age and sex
stphplot, by(Hwv8_ca2_depress_group) adjust(H_age H_sex) nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Hwv8_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 2
stphplot, by(Hwv8_ca2_depress_group) adjust(H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Hwv8_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 3
stphplot, by(Hwv8_ca2_depress_group) adjust(H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Hwv8_ca4_depress_group") xtitle("months")






/* Test of overall goodness of fit 
Goodness of fit of the final model
2 methods:
 - by using the commnad stcoxgof (good fit = non sig p-value)
 - by using the Cox-Snell residuals
	to create the Nelson-Aalen cumulative hazard function
	If the hazard function follows the 45 degree line then we know that it approximately 
	has an exponential distribution with a hazard rate of one and that the model fits the data well.
	If the model fits the data, the plot of the cumulative hazard versus cs
	should approximate a straight line with slope 1.
*/


* by using the commnad stcoxgof

* install stcoxgof 
findit stcoxgof


stcox Hwv8_ca2_depress_group H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity, mgale(mgale)


stcoxgof



* by using the Cox-Snell residuals 

quietly stcox Hwv8_ca2_depress_group H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_alcohol_status H_cvd_comorbidity
predict cs, csnell

* or

quietly stcox Hwv8_ca2_depress_group
predict cs, csnell


stset cs, failure(Hwv9to14_dementia_event)
sts generate km = s
generate H = -ln(km)
line H cs cs, sort ytitle("") clstyle(. refline)





/* Cox PH regression model for independent depressive symptoms and CA exposure variable

Hwv8_depressive_symptoms 
Hwv8_crp 
Hwv8_hdl 
Hwv8_obesity_waist 
Hwv8_systolic_bp 
Hwv8_diastolic_bp 
Hwv8_diabetes_reportevr 
Hwv8_HbA1c 
Hwv8_cardio_number
Hwv8_cardio2
Hwv8_cardio3
Hwv8_cardio4

*/



stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)




* Unadjusted model 1


stcox i.Hwv8_depressive_symptoms


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 

stcox i.Hwv8_depressive_symptoms H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles


* model 3: model 2 + adjust for lifestyle/health indicators

stcox i.Hwv8_depressive_symptoms H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity



* repeat for each independent variable from the list above





** ----------------------- **





/* MULTIPLE IMPUTATION (MI) 

To handle with missing values of covariates


useful sources for MI and MICE:

https://stats.idre.ucla.edu/stata/seminars/mi_in_stata_pt1_new/
https://www.stata.com/manuals/mi.pdf - see page 139
https://www.stata.com/meeting/switzerland16/slides/medeiros-switzerland16.pdf
https://www.youtube.com/watch?v=i6SOlq0mjuc&ab_channel=StataCorpLLC
https://dss.princeton.edu/training/MIStata.pdf



Preparing to conduct MI 
1. examine the number and proportion of missing values among the variables of interest
	use the mdesc command
2. examine missing data patterns
	use commands mi set and mi misstable patterns
3. identify potential auxiliary variables


Run MI using chained equations (MICE) 
using the commands
1. how (in what style) to store the imputations 
 mi set wide
2. which variables will be imputed
 mi register imputed
3. optionally, which variables will not be imputed
 mi register regular
4. what imputation method is implemented to impute each of var - MICE
 mi impute chained

*/





/* 

1. examining missing values
	install packages: 
	* install mdesc
	* install tabmiss
	* insatll dm31
	* insall mvpatterna

*/

search mdesc
search rmiss2
search mvpatterns






* examining number of missing values vs non-missing in each variable

mdesc H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_physicalactivity H_alcohol_status H_cvd_comorbidity Hwv8_memory





* examining missing data patterns

mi set wide

mi misstable summarize H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_physicalactivity H_alcohol_status H_cvd_comorbidity


mi misstable patterns H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_smoking_3cat H_physicalactivity H_alcohol_status H_cvd_comorbidity  



/*
 identifying potential auxiliary var
* Auxiliary variables are either correlated with a missing variable(s)
(the recommendation is r > 0.4) or are believed to be associated with missingness
- a priori knowledge of var that would make good auxiliary var
- identify potential candidates by examining associations between missing var and other var in the dataset
	running correlation using the command: pwcorr v1 v2 v3, obs
	the recommnedation for good correlation is r > 0.4
	
	
Missing var to be imputed: 

	H_smoking_3cat H_physicalactivity H_alcohol_status

	
Potential auxiliary var: 
DV:  Hwv9to14_dementia_event
IV:  Hwv8_depressive_symptoms Hwv8_crp Hwv8_hdl Hwv8_obesity_waist Hwv8_systolic_bp Hwv8_diastolic_bp Hwv8_diabetes_reportevr Hwv8_HbA1c
other var: 
	H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_cvd_comorbidity

*/


* correlation

pwcorr H_smoking_3cat H_physicalactivity H_alcohol_status ///
	Hwv9to14_dementia_event ///
	Hwv8_depressive_symptoms Hwv8_crp Hwv8_hdl Hwv8_obesity_waist Hwv8_systolic_bp Hwv8_diastolic_bp Hwv8_diabetes_reportevr Hwv8_HbA1c ///
	H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_cvd_comorbidity, obs

	
/* The correlation showed that all the following var are good auxiliary:
Hwv9to14_dementia_event Hwv8_depressive_symptoms Hwv8_diabetes_reportevr Hwv8_HbA1c H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_cvd_comorbidity
 A good auxiliary does not have to be correlated with every variable to be useful
 And it's not problematic if it has missing info of it's own 
*/	
	
	
	
/*
MI by chained equations (MICE)
	see: https://stats.idre.ucla.edu/stata/seminars/mi_in_stata_pt1_new/

MICE is known as the fully conditional specification or sequential generalized regression
does not assume a joint MVN distribution 
but instead uses a separate conditional distribution for each imputed variable.

The multivariate normal (MVN) model - mi imputed mvn - 
assumes multivariate normality of all var

The multivariate imputation by chained equations (MICE) - mi imputed chained - 
offers flexibility in how each var is modeled

mi impute chained allows to specify models for a
variety of variable types, including 
continuous, binary, ordinal, nominal, truncated, and count variables


The MICE distributions available in Stata are:
binary, ordered and multinomial logistic regression for categorical variables, 
linear regression and predictive mean matching (PMM)* for continuous variables, 
and Poisson and negative binomial regression for count variables. 



IMPUTATION PHASES

1. mi set wide	
	style to store imputations

2. mi register imputed
	identifies which variables in the imputation model have missing information.

3. mi register regular (! optional)
	which variables will not be imputed

4. mi impute chained
	where the user specifies the imputation model to be used
	and the number of imputed datasets to be created.
	Example:
		mi impute chained (regress) bmi age (logit) female ///
		(mlogit) race = bpdiast i.region, add(20)

5. mi estimate 
	is used as a prefix to the standard regress command. 
	This executes the specified estimation model within each of the 20 imputed datasets 
	to obtain 20 sets of coefficients and standard errors. 
	Stata then combines these estimates to obtain one set of inferential statistics.
	In the output from mi estimate you will see some metrics: Imputation Diagnostics
	information for RVI (Relative Increase in Variance), 
	FMI (Fraction of Missing Information), 
	DF (Degrees of Freedom) , 
	RE (Relative Efficiency), 
	and the between imputation and the within imputation variance estimates 
	to examine how the standard errors (SEs) are calculated.


----------------	
	
SELECTING MY IMPUTATION MODEL

- MICE -> mi impute chained

- var to be imputed:

	linear regression for continuous var (regress) -> none
	

	logistic for the binary var (logit) -> none

	multinomial logistic for our nominal categorical var (mlogit) -> 
	H_smoking_3cat H_physicalactivity H_alcohol_status



- auxiliary var:

	DV -> Hwv9to14_dementia_event
	IV -> Hwv8_depressive_symptoms Hwv8_diabetes_reportevr Hwv8_HbA1c 
	other covariates -> H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_cvd_comorbidity



- imputation numbers (m) -> 10

	ELSA data were imputed 10 numbers

	White et al. (2010) recommendation: use the rule that m should equal the percentage of incomplete cases

	
- rseed (53421) for reproducability reasons


- (! OPTIONAL) advance impute options -> force
	
	proceed with imputation, even when missing imputed values (e.g. auxiliary have missing data) are encountered

- impute options -> savetrace (trace1)
	
	specifies Stata to save the means and standard deviations of imputed values from each iteration to a Stata dataset named “trace1
*/
	
	
mi set wide


mi register imputed H_smoking_3cat H_physicalactivity H_alcohol_status 

	

mi impute chained (mlogit) H_smoking_3cat H_physicalactivity H_alcohol_status = Hwv8_depressive_symptoms Hwv8_diabetes_reportevr Hwv8_HbA1c H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_cvd_comorbidity, add(10) rseed(53421) savetrace(trace1)


* save imputed data


* plot imputations

*it will open a file named trace1
use trace1,clear
describe
	

reshape wide *mean *sd, i(iter) j(m)
tsset iter	



/* 
The trace plot below graphs the predicted means value produced during the first imputation chain. 
As before, the expectations is that the values would vary randomly to incorporate variation into the predicted values for read.
*/

tsline H_smoking_3cat_mean1, name(mice1,replace)legend(off) ytitle("Mean of smoking")
tsline H_physicalactivity_mean1, name(mice1,replace)legend(off) ytitle("Mean of physical activity")
tsline H_alcohol_status_mean1, name(mice1,replace)legend(off) ytitle("Mean of alcohol status")

	
/* 

All imputation chains can also be graphed simultaneously to make sure that nothing unexpected occurred in a single chain. 
Every chain is obtained using a different set of initial values and this should be unique. 
Each colored line represents a different imputation. 
So all 10 imputation chains are overlaid on top of one another.

*/


tsline H_alcohol_status_mean*, name(mice1,replace)legend(off) ytitle("Mean of alcohol")
tsline H_alcohol_status_sd*, name(mice2, replace) legend(off) ytitle("SD of alcohol")
graph combine mice1 mice2, xcommon cols(1) title(Trace plots of summaries of imputed values)
	
* repeat for each imputed var	
	
	
	
	




* -------- COX PH REGRESSION MODEL IN IMPUTED DATASET --------- *


* Declare Data to be Survival Data by using mi

mi stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)

* Run Cox regression analysis in imputed dataset by using "mi estimate:" 



/*
Independent risk factors

Hwv8_depressive_symptoms 
Hwv8_crp 
Hwv8_hdl 
Hwv8_obesity_waist 
Hwv8_systolic_bp 
Hwv8_diastolic_bp 
Hwv8_diabetes_reportevr
Hwv8_HbA1c 
Hwv8_cardio_number 
Hwv8_cardio2

*/




* Depressive symptoms


* Unadjusted model - model 1 - single predictor

* Model 1 (default coefficents)
mi estimate: stcox Hwv8_depressive_symptoms

* Model 1: define design var by using i.
mi estimate: stcox i.Hwv8_depressive_symptoms


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_depressive_symptoms 


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_depressive_symptoms ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles 


* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_depressive_symptoms ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity



* repeat for each independent variable from the list above





/*
Combined effects Cox regression models 

Hwv8_crp_depress_group 
Hwv8_hdl_depress_group
Hwv8_waist_depress_group
Hwv8_sbp_depress_group
Hwv8_dbp_depress_group   
Hwv8_diabet_depress_group
Hwv8_hba1c_depress_group  
Hwv8_ca2_depress_group

*/


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles 


* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity



* repeat for each variable from the list above




*-------------------------*


/*

*** SENSITIVITY ANALYSES ***


1) interarction effect of gender and age_group

2) survival analysis stratified by age
two age groups: young old <70 and old old >=70

3) depressive symptoms as continuous variable
and >= 3 and >=4 cardiometabolic multimorbidity


4) exclude participants with cvd

5) Complete data

6) survival analysis limiting to 5 year follow-up period



Repeat on all independent and combined variables

Hwv8_depressive_symptoms
Hwv8_crp 
Hwv8_hdl
Hwv8_obesity_waist 
Hwv8_systolic_bp 
Hwv8_diastolic_bp  
Hwv8_diabetes_reportevr 
Hwv8_HbA1c
Hwv8_cardio_number
Hwv8_cardio2


Hwv8_crp_depress_group 
Hwv8_hdl_depress_group
Hwv8_waist_depress_group
Hwv8_sbp_depress_group
Hwv8_dbp_depress_group   
Hwv8_diabet_depress_group
Hwv8_hba1c_depress_group  
Hwv8_ca2_depress_group

 
*/



* 1) Interaction effect 

* sex*risk factor

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio2 i.H_sex#i.Hwv8_cardio2

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio2 ///
H_age i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity ///
 i.H_sex#i.Hwv8_cardio2



* age*risk factor 

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio2 c.H_age#i.Hwv8_cardio2

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio2 ///
H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity ///
 c.H_age#i.Hwv8_cardio2




/* 2) Survival analysis stratified by age

generate age group variable
Age groups: 1) young old (< 70) 2) old old (>= 70)

Kaplan Meier curves 
Cox regression models in imputed data

young old <70
if H_age_group==1

old old >70
if H_age_group==2


*/



gen H_age_group=1 if H_age < 70
replace H_age_group=2 if H_age >=70 & ///
!missing(H_age)

label var H_age_group "Age groups <70 young-old / 70 old-old"
lab def age_group 1 "young old <70" 2 "old old >70"
lab val H_age_group age_group

tab H_age_group





* COX PH REGRESSION MODEL IN IMPUTED DATASET 

* Declare Data to be Survival Data by using mi

mi stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)



* YOUNG OLD <70 Cox regression models

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group if H_age_group==1


 
* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
 i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity if H_age_group==1


* OLD OLD >70 Cox regression models

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group if H_age_group==2


* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity if H_age_group==2






* 3) On depressive symptoms continuous variable


* COX PH REGRESSION MODEL IN IMPUTED DATASET 


* Declare Data to be Survival Data by using mi

mi stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox Hwv8_cesd_sumscore

* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox Hwv8_cesd_sumscore ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox Hwv8_cesd_sumscore ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity





* Cardiometabolic multimorbidty >= 3 



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio3

* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio3 ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio3 ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca3_depress_group

* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca3_depress_group ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca3_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity




* Cardiometabolic multimorbidty >=4

 

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio4

* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio4 ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_cardio4 ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca4_depress_group

* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca4_depress_group ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca4_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity


 
 




/*

4) exclude participants with cvd

use the command if H_cvd_comorbidity==0

*/



* without cvd

* Declare Data to be Survival Data by using mi

mi stset H_time_of_event_dementia, failure (Hwv9to14_dementia_event==1) id(RAHHIDPN)


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group if H_cvd_comorbidity==0


 
* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status if H_cvd_comorbidity==0



 

* 5) On complete cases (see above)



 
/* 
6) survival analysis limiting to 5 year follow-up period

hrs follow-up wave 9-12

*/



merge 1:m RAHHIDPN using "S:\Research\pkstudies\Study3_cardio_lca\HRS\hrs_lca data sensitivity 9to12followup.dta"



* Declare Data to be Survival Data by using mi

mi stset Hwv9to12_time_of_event_dementia, failure (Hwv9to12_dementia_event==1) id(RAHHIDPN)



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
 H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles

 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Hwv8_ca2_depress_group ///
H_age i.H_sex i.H_eduaction i.H_maritalstatus_4cat i.H_wealthquintiles ///
i.H_smoking_3cat i.H_alcohol_status i.H_cvd_comorbidity




 
 
* ------------------------------ *






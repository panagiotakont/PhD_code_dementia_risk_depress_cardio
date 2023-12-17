/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY I: Independent and combined effects of depressive symptoms and cardiometabolic risk factors on dementia incidence


DATASET: CHARLS 
baseline: wave 1 (2011) follow-up waves 2-4 (2013-2018)

4 time points in total: baseline and 3 follow-ups


TIMELINE

DEPRESSIVE SYMPTOMS AND CARDIOMETABOLIC RISK FACTORS: WV1 (BASELINE)
DEMENTIA INCIDENCE: W2 - WV4 (3 TIME POINTS)
COVARIATES ADJUSTMENT FOR HR MODELS: WV1

*/




* KEEP NECESSARY VARIABLES

keep ID id_12char bloodweight ///
C_sex C_age C_eduaction C_maritalstatus_8cat ///
C_maritalstatus_3cat C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_2cat Cwv1_smoking_3cat ///
Cwv1_physicalactivity Cwv1_alcohol_freq Cwv1_alcohol_status ///
C_cvd_comorbidity Cwv1_antidepressant Cwv1_psycholog_treat Cwv1_anytreat_psyche ///
Cwv1_memory_wordrecall Cwv1_cognition Cwv4_memory_wordrecall Cwv4_cognition ///
Cwv1_cesd_score Cwv1_depressive_symptoms ///
Cwv2_cesd_score Cwv2_depressive_symptoms ///
Cwv3_cesd_score Cwv3_depressive_symptoms ///
Cwv4_cesd_sumscore Cwv4_depressive_symptoms ///
Cwv1_crp_level Cwv1_crp Cwv1_hdl_level Cwv1_male_hdl Cwv1_female_hdl ///
Cwv1_meds_dyslipid Cwv1_anymeds_dyslipid Cwv1_dyslipid_evr ///
Cwv1_dyslipid_diagnosed Cwv1_dyslipid_report_sum ///
Cwv1_dyslipid_report Cwv1_hdl_sum Cwv1_hdl_cholesterol ///
Cwv1_waist Cwv1_malewaist_ao ///
Cwv1_femalewaist_ao Cwv1_obesity_waist_sum Cwv1_obesity_waist ///
Cwv1_bmi_score Cwv1_obesity_bmi Cwv1_waist_bmi_sum Cwv1_obesity ///
Cwv1_tg_level Cwv1_tg Cwv1_triglyc_sum Cwv1_triglyc ///
Cwv1_systolic_mean Cwv1_diastolic_mean Cwv1_systolic_bp Cwv1_diastolic_bp ///
Cwv1_meds_bp Cwv1_anymeds_bp Cwv1_bp_evr Cwv1_bp_diagnosed ///
Cwv1_bp_report_sum Cwv1_bp_report Cwv1_bp_sum Cwv1_bp ///
Cwv1_glucose_level Cwv1_glucose Cwv1_HbA1c_level Cwv1_HbA1c ///
Cwv1_diabetes_evr Cwv1_diabetes_diagnosed Cwv1_diabetes_report_sum ///
Cwv1_diabetes_report Cwv1_meds_diabetes Cwv1_anymeds_diabetes ///
Cwv1_glucose_diabetes_sum Cwv1_glycemia ///
Cwv1_ao_depress_sum Cwv1_Nao_Ndepress Cwv1_Nao_Ydepress ///
Cwv1_Yao_Ndepress Cwv1_Yao_Ydepress Cwv1_ao_depress_group ///
Cwv1_waist_depress_sum Cwv1_Nwaist_Ndepress Cwv1_Nwaist_Ydepress ///
Cwv1_Ywaist_Ndepress Cwv1_Ywaist_Ydepress Cwv1_waist_depress_group ///
Cwv1_glycemia_depress_sum Cwv1_Nglycemia_Ndepress ///
Cwv1_Nglycemia_Ydepress Cwv1_Yglycemia_Ndepress ///
Cwv1_Yglycemia_Ydepress Cwv1_glycemia_depress_group ///
Cwv1_diabet_depress_sum Cwv1_Ndiabet_Ndepress ///
Cwv1_Ndiabet_Ydepress Cwv1_Ydiabet_Ndepress ///
Cwv1_Ydiabet_Ydepress Cwv1_diabet_depress_group ///
Cwv1_hba1c_depress_sum Cwv1_Nhba1c_Ndepress Cwv1_Nhba1c_Ydepress ///
Cwv1_Yhba1c_Ndepress Cwv1_Yhba1c_Ydepress Cwv1_hba1c_depress_group ///
Cwv1_hdl_depress_sum Cwv1_Nhdl_Ndepress Cwv1_Nhdl_Ydepress ///
Cwv1_Yhdl_Ndepress Cwv1_Yhdl_Ydepress Cwv1_hdl_depress_group ///
Cwv1_bp_depress_sum Cwv1_Nbp_Ndepress Cwv1_Nbp_Ydepress ///
Cwv1_Ybp_Ndepress Cwv1_Ybp_Ydepress Cwv1_bp_depress_group ///
Cwv1_sbp_depress_sum Cwv1_Nsbp_Ndepress Cwv1_Nsbp_Ydepress ///
Cwv1_Ysbp_Ndepress Cwv1_Ysbp_Ydepress Cwv1_sbp_depress_group ///
Cwv1_dbp_depress_sum Cwv1_Ndbp_Ndepress Cwv1_Ndbp_Ydepress ///
Cwv1_Ydbp_Ndepress Cwv1_Ydbp_Ydepress Cwv1_dbp_depress_group ///
Cwv1_crp_depress_sum Cwv1_Ncrp_Ndepress Cwv1_Ncrp_Ydepress ///
Cwv1_Ycrp_Ndepress Cwv1_Ycrp_Ydepress Cwv1_crp_depress_group ///
Cwv1_tg_depress_sum Cwv1_Ntg_Ndepress Cwv1_Ntg_Ydepress ///
Cwv1_Ytg_Ndepress Cwv1_Ytg_Ydepress Cwv1_tg_depress_group ///
Cwv1_cardio_biomarkers_sum Cwv1_cardio_abnormality ///
Cwv1_ca_depress_sum Cwv1_Nca_Ndepress Cwv1_Nca_Ydepress ///
Cwv1_Yca_Ndepress Cwv1_Yca_Ydepress Cwv1_ca_depress_group ///
Cwv1_cardio3_sum Cwv1_cardio3 Cwv1_ca3_depress_sum ///
Cwv1_Nca3_Ndepress Cwv1_Nca3_Ydepress Cwv1_Yca3_Ndepress ///
Cwv1_Yca3_Ydepress Cwv1_ca3_depress_group Cwv1_cardio4_sum ///
Cwv1_cardio4 Cwv1_ca4_depress_sum Cwv1_Nca4_Ndepress ///
Cwv1_Nca4_Ydepress Cwv1_Yca4_Ndepress Cwv1_Yca4_Ydepress ///
Cwv1_ca4_depress_group Cwv1_cardio_number_sum Cwv1_cardio_number ///
Cwv1_cardio2_sum Cwv1_cardio2 Cwv1_ca2_depress_sum ///
Cwv1_Nca2_Ndepress Cwv1_Nca2_Ydepress ///
Cwv1_Yca2_Ndepress Cwv1_Yca2_Ydepress Cwv1_ca2_depress_group ///
Cwv1_dementia_report Cwv2_dementia_report ///
Cwv3_dementia_report Cwv4_self_info_dementia ///
Cwv1_interview_date Cwv2_interview_date Cwv3_interview_date Cwv4_interview_date ///
Cwv2to4_newdementia_or_lastinter Cwv2to4_dementia_free_date C_time_dementia_months ///
Cwv2to4_dementia_sum Cwv2to4_dementia_event ///
C_time_dementia_midpoint C_time_dementia_midpoint_final C_time_of_event_dementia



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


merge 1:m id_12char using "S:\Research\pkstudies\Study1_biopsych_risk\CHARLS\charls_tomerge_educ.dta"

keep if _merge==3

drop _merge



/*

EXPOSURE VARIABLES


Binary variables of depressive symptoms and cardiometabolic markers measured at wave 1

Depression: Cwv1_depressive_symptoms

CRP: Cwv1_crp

HDL cholesterol: Cwv1_hdl_cholesterol

Obesity by waist cir: Cwv1_obesity_waist

systolic Blood pressure: Cwv1_systolic_bp

diastolic Blood pressure: Cwv1_diastolic_bp

Diabetes: Cwv1_diabetes_report

HbA1c: Cwv1_HbA1c


CA number (categ 0,1,2,3,4+): Cwv1_cardio_number

CA mutlimorbidity >= 2 CA conditions: Cwv1_cardio2

Grouping of Dep-CA: Cwv1_waist_depress_group Cwv1_diabet_depress_group Cwv1_hba1c_depress_group Cwv1_hdl_depress_group Cwv1_sbp_depress_group Cwv1_dbp_depress_group Cwv1_crp_depress_group Cwv1_ca3_depress_group Cwv1_ca4_depress_group Cwv1_ca2_depress_group

OUTCOME VARIABLES

Dementia event: Cwv2to4_dementia_event

Time-to-event: C_time_of_event_dementia

*/






*** Descriptive stats of var of interest


tabulate Cwv1_depressive_symptoms  
summarize Cwv1_depressive_symptoms

misstable summarize Cwv1_depressive_symptoms
misstable patterns Cwv1_depressive_symptoms


tabulate Cwv1_crp  
summarize Cwv1_crp

misstable summarize Cwv1_crp
misstable patterns Cwv1_crp

tabulate Cwv1_hdl_cholesterol
summarize Cwv1_hdl_cholesterol

misstable summarize Cwv1_hdl_cholesterol
misstable patterns Cwv1_hdl_cholesterol

tabulate Cwv1_obesity_waist
summarize Cwv1_obesity_waist

misstable summarize Cwv1_obesity_waist
misstable patterns Cwv1_obesity_waist

tabulate Cwv1_systolic_bp
summarize Cwv1_systolic_bp

misstable summarize Cwv1_systolic_bp
misstable patterns Cwv1_systolic_bp


tabulate Cwv1_diastolic_bp
summarize Cwv1_diastolic_bp

misstable summarize Cwv1_diastolic_bp
misstable patterns Cwv1_diastolic_bp


tabulate Cwv1_diabetes_report
summarize Cwv1_diabetes_report

misstable summarize Cwv1_diabetes_report
misstable patterns Cwv1_diabetes_report


tabulate Cwv1_HbA1c
summarize Cwv1_HbA1c

misstable summarize Cwv1_HbA1c
misstable patterns Cwv1_HbA1c


tabulate Cwv1_dementia_report
summarize Cwv1_dementia_report

misstable summarize Cwv1_dementia_report
misstable patterns Cwv1_dementia_report




 

*** CLEANING DATA


* 1. drop dementia cases and missing data at baseline

* drop dementia wave 2 missing data
drop if Cwv1_dementia_report==1
* (267 observations deleted)
drop if Cwv1_dementia_report== .
* (88 observations deleted)


* 2. drop missing values and invalid data of depresssive sym and cardiometabolic markers


drop if Cwv1_depressive_symptoms== .
* (542 observations deleted)

drop if Cwv1_crp== .
* (175 observations deleted)

* drop CRP > 100 

drop if Cwv1_crp_level > 100 & Cwv1_crp_level < 300
* (13 observations deleted)
 
drop if Cwv1_hdl_cholesterol== .
* (2 observations deleted)

drop if Cwv1_obesity_waist== .
* (1250 observations deleted)

drop if Cwv1_systolic_bp== .
* (81 observations deleted)

* drop sbp > 900 

drop if Cwv1_systolic_mean > 900 & Cwv1_systolic_mean < 999
* (14 observations deleted)

drop if Cwv1_diastolic_bp== .
* (13 observations deleted)

drop if Cwv1_diabetes_report== .
* (90 observations deleted)

drop if Cwv1_HbA1c== .
* (70 observations deleted)



* 3. drop obs with no records on dementia at any wave from 2-4 follow-ups


search mdesc
search rmiss2
search mvpatterns

* see number of missing values vs non-missing in each variable
mdesc Cwv2_dementia_report Cwv3_dementia_report Cwv4_self_info_dementia



/* number of missing values per observation
* the code below creates a variable called nmisfollowup that gives the number of missing values
for each observation in the variables of interest */
egen nmisfollowup_dementia_wv2to4=rmiss2(Cwv2_dementia_report ///
Cwv3_dementia_report Cwv4_self_info_dementia)

tab nmisfollowup_dementia_wv2to4

* drop observations "nmisfollowup_dementia_wv2to4" > 2 (those with 3 missing data = no records at any wave)
drop if nmisfollowup_dementia_wv2to4>2
*(331 observations deleted)


* ANALYTIC SAMPLE -> 8925 




	
  
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




* General characteristics of CHARLS participants at baseline

* Socio-demographics
sum C_age
ta C_sex 
ta C_educ_new
ta C_maritalstatus_4cat
ta Cwv1_netwealth_quintiles
* Cardiometabolic risk factors
ta Cwv1_crp
ta Cwv1_hdl_cholesterol
ta Cwv1_obesity_waist
ta Cwv1_systolic_bp
ta Cwv1_diastolic_bp
ta Cwv1_diabetes_report
ta Cwv1_HbA1c
ta Cwv1_cardio2
* Lifestyle and health indicators
ta Cwv1_smoking_3cat
ta Cwv1_alcohol_status
ta Cwv1_physicalactivity
ta C_cvd_comorbidity
* Depressive symptoms
ta Cwv1_depressive_symptoms
* Memory score 
sum Cwv1_memory_wordrecall



* General characteristics of CHARLS participants stratified for dementia occurence

* Socio-demographics
ttest C_age, by(Cwv2to4_dementia_event)
ta C_sex Cwv2to4_dementia_event, chi2 column row
ta C_educ_new Cwv2to4_dementia_event, chi2 column row
ta C_maritalstatus_4cat Cwv2to4_dementia_event, chi2 column row
ta Cwv1_netwealth_quintiles Cwv2to4_dementia_event, chi2 column row
* Cardiometabolic risk factors
ta Cwv1_crp Cwv2to4_dementia_event, chi2 column row
ta Cwv1_hdl_cholesterol Cwv2to4_dementia_event, chi2 column row
ta Cwv1_obesity_waist Cwv2to4_dementia_event, chi2 column row
ta Cwv1_systolic_bp Cwv2to4_dementia_event, chi2 column row
ta Cwv1_diastolic_bp Cwv2to4_dementia_event, chi2 column row
ta Cwv1_diabetes_report Cwv2to4_dementia_event, chi2 column row
ta Cwv1_HbA1c Cwv2to4_dementia_event, chi2 column row
ta Cwv1_cardio2 Cwv2to4_dementia_event, chi2 column row
* Lifestyle and health indicators
ta Cwv1_smoking_3cat Cwv2to4_dementia_event, chi2 column row
ta Cwv1_alcohol_status Cwv2to4_dementia_event, chi2 column row
ta Cwv1_physicalactivity Cwv2to4_dementia_event, chi2 column row
ta C_cvd_comorbidity Cwv2to4_dementia_event, chi2 column row
* Depressive symptoms 
ta Cwv1_depressive_symptoms Cwv2to4_dementia_event, chi2 column row
* Memory score
ttest Cwv1_memory_wordrecall, by(Cwv2to4_dementia_event)
ta C_age_group Cwv2to4_dementia_event, chi2 column row



		



/*
---- SURVIVAL ANALYSIS AT COMPLETE DATA ----

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

codebook C_time_of_event_dementia Cwv2to4_dementia_event ///
Cwv1_depressive_symptoms Cwv1_crp Cwv1_hdl_cholesterol Cwv1_obesity_waist Cwv1_systolic_bp ///
Cwv1_diastolic_bp Cwv1_diabetes_report Cwv1_HbA1c ///
Cwv1_cardio3 Cwv1_cardio4 ///
Cwv1_cardio_number_sum Cwv1_cardio_number ///
Cwv1_waist_depress_group Cwv1_diabet_depress_group ///
Cwv1_hba1c_depress_group Cwv1_hdl_depress_group ///
Cwv1_sbp_depress_group Cwv1_dbp_depress_group ///
Cwv1_crp_depress_group ///
Cwv1_ca3_depress_group Cwv1_ca4_depress_group ///
C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_physicalactivity Cwv1_alcohol_status C_cvd_comorbidity,compact




* Declare Data to be Survival Data
* Time to event: C_time_of_event_dementia (months)
* Censoring: Cwv2to4_dementia_event (1=dementia, 0=censored)
* Command is stset TIMETOEVENT, failure(CENSORVARIABLE)


stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)



*describe survival data using commnad stsum

stsum

stsum, by(Cwv1_ca2_depress_group)




* Kaplan Meier Curve estimation

sts list

sts list, by(Cwv1_ca2_depress_group)



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

sort Cwv1_ca2_depress_group 

sts list, by(Cwv1_ca2_depress_group)

* graph with frills

sts graph, by(Cwv1_ca2_depress_group) xlabel(0(20)100) ylabel(0.80(.05)1) xtitle("Time in Months") ///
ytitle("Survival Prob") title("Kaplan Meier Curve") 



* calculate person-time and incidence rates using command ststime

stptime,title(Person-years)

stptime, title(Person-years) per(1000)




/*

Repeat to find incident case per category

Cwv1_depressive_symptoms 
Cwv1_crp 
Cwv1_hdl_cholesterol 
Cwv1_obesity_waist 
Cwv1_systolic_bp 
Cwv1_diastolic_bp 
Cwv1_diabetes_report 
Cwv1_HbA1c 
Cwv1_cardio_number 
Cwv1_cardio2

Cwv1_crp_depress_group 
Cwv1_hdl_depress_group
Cwv1_waist_depress_group
Cwv1_sbp_depress_group
Cwv1_dbp_depress_group   
Cwv1_diabet_depress_group
Cwv1_hba1c_depress_group  
Cwv1_ca2_depress_group

*/


ta Cwv1_ca2_depress_group


* calculate person-time  by category

stptime, by(Cwv1_ca2_depress_group)

stptime, by(Cwv1_ca2_depress_group) per(1000)



* mean and median of follow-up
sum C_time_of_event_dementia
sum C_time_of_event_dementia, detail
 
 


/* Log Rank Test of equality of survival distributions 
 (NULL: equality of survival distributions among groups)
 We will consider including the predictor if the test has a p-value of 0.2 – 0.25 or less. 
 If the predictor has a p-value greater than 0.25 in a univariate analysis 
 it is highly unlikely that it will contribute anything to a model which includes other predictors. 
 Command is sts test GROUPVAR
*/


sts test Cwv1_cardio2, logrank

sts test Cwv1_ca2_depress_group, logrank

sts test C_age, logrank

sts test C_sex, logrank

sts test C_eduaction, logrank

sts test C_maritalstatus_4cat, logrank

sts test Cwv1_netwealth_quintiles, logrank

sts test Cwv1_smoking_3cat, logrank

sts test Cwv1_physicalactivity, logrank

sts test Cwv1_alcohol_status, logrank

sts test C_cvd_comorbidity, logrank









/* Cox PH regression model

using the command stcox
	
--- Building the model ---

Model 1: unadjusted - single predictor of group
Model 2: model 1 + sociodemographics: age sex education marital status and wealth 
Model 3: model 2 + lifestyle/health indicators: smoking, alcohol consumption, cvd comorbidity

*/


* Unadjusted model - model 1 - single predictor

stcox Cwv1_ca2_depress_group

* define design var by using i.(by group)

stcox i.Cwv1_ca2_depress_group


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

stcox i.Cwv1_ca2_depress_group C_age C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles

* model 3: model 2 + adjust for lifestyle/health indicators

stcox i.Cwv1_ca2_depress_group C_age C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity 




* Coefficients instead of hazard ratios by specifing the option nohr 

stcox i.Cwv1_ca2_depress_group, nohr


stcox i.Cwv1_ca2_depress_group C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity, nohr




* Multivariable model development
* Likelihood-ratio tests



*install eststo
findit eststo


* ---- rx controlling for age and sex -----*
quietly: stcox C_age i.C_sex
eststo modelagesex

quietly: stcox C_age i.C_sex i.Cwv1_ca2_depress_group
eststo modelagesex_4group

lrtest modelagesex modelagesex_4group



* ---- rx controlling for sociodemographics -----*
quietly: stcox C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles
eststo modelsociodemo

quietly: stcox C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles i.Cwv1_ca2_depress_group
eststo modelsociodemo_4group

lrtest modelsociodemo modelsociodemo_4group


* ---- rx controlling for lifestyle/health indicators -----*
quietly: stcox i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity
eststo modelcardiovascular

quietly: stcox i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity i.Cwv1_ca2_depress_group
eststo modelcardiovascular_4group

lrtest modelcardiovascular modelcardiovascular_4group


* side-by-side comparison of models


quietly: stcox i.Cwv1_ca2_depress_group
eststo model1

quietly: stcox  C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles i.Cwv1_ca2_depress_group
eststo model2

quietly: stcox C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity i.Cwv1_ca2_depress_group
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

* Test of proportional hazards

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



stcox i.Cwv1_ca2_depress_group C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity, nohr ///
tvc(Cwv1_ca2_depress_group C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity) texp(ln(C_time_of_event_dementia))

 
 
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

quietly stcox Cwv1_ca2_depress_group C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity, schoenfeld(sch*) scaledsch(sca*)
stphtest, detail
stphtest, plot(Cwv1_ca2_depress_group) msym(oh)
stphtest, plot(C_age) msym(oh)
stphtest, plot(C_sex) msym(oh)
stphtest, plot(C_eduaction) msym(oh)
stphtest, plot(C_maritalstatus_4cat) msym(oh)
stphtest, plot(Cwv1_netwealth_quintiles) msym(oh)
stphtest, plot(C_cvd_comorbidity) msym(oh)
stphtest, plot(Cwv1_smoking_3cat) msym(oh)
stphtest, plot(Cwv1_alcohol_status) msym(oh)






stphplot, by(Cwv1_ca2_depress_group) plot1(msym(oh)) plot2(msym(th))
stphplot, by(C_age) plot1(msym(oh)) plot2(msym(th))
stphplot, by(C_sex) plot1(msym(oh)) plot2(msym(th))
stphplot, by(C_eduaction) plot1(msym(oh)) plot2(msym(th))
stphplot, by(C_maritalstatus_4cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(Cwv1_netwealth_quintiles) plot1(msym(oh)) plot2(msym(th))
stphplot, by(C_cvd_comorbidity) plot1(msym(oh)) plot2(msym(th))
stphplot, by(Cwv1_smoking_3cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(Cwv1_alcohol_status) plot1(msym(oh)) plot2(msym(th))



* Assessment of PH Assumption: adjust for age and sex
stphplot, by(Cwv1_ca2_depress_group) adjust(C_age C_sex) nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Cwv1_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 2
stphplot, by(Cwv1_ca2_depress_group) adjust(C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Cwv1_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 3
stphplot, by(Cwv1_ca2_depress_group) adjust(C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Cwv1_ca4_depress_group") xtitle("months")





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


stcox Cwv1_ca2_depress_group C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity, mgale(mgale)


stcoxgof



* by using the Cox-Snell residuals 

quietly stcox Cwv1_ca2_depress_group C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity
predict cs, csnell

* or

quietly stcox Cwv1_ca2_depress_group
predict cs, csnell


stset cs, failure(Cwv2to4_dementia_event)
sts generate km = s
generate H = -ln(km)
line H cs cs, sort ytitle("") clstyle(. refline)





/* Cox PH regression model for independent depressive symptoms and CA exposure variable

Cwv1_depressive_symptoms
Cwv1_crp
Cwv1_hdl_cholesterol
Cwv1_obesity_waist
Cwv1_systolic_bp
Cwv1_diastolic_bp
Cwv1_diabetes_report
Cwv1_HbA1c
Cwv1_cardio_number
Cwv1_cardio2
Cwv1_cardio3
Cwv1_cardio4

*/



stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)





* Unadjusted model 1


stcox i.Cwv1_depressive_symptoms


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

stcox i.Cwv1_depressive_symptoms C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles

* model 3: model 2 + adjust for lifestyle / health indicators

stcox i.Cwv1_depressive_symptoms C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity 

* repeat for each independent variable from the list above




** ----------------------- **




 
/* MULTIPLE IMPUTATION (MI) 

To handle with missing values of baseline and time 3 covariates


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

mdesc C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_physicalactivity Cwv1_alcohol_status ///
C_cvd_comorbidity Cwv1_memory_wordrecall




*** physical activity showed > 50% missing values and so cannot be used or imputed as covariates



* examining missing data patterns

mi set wide

mi misstable summarize C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_physicalactivity Cwv1_alcohol_status ///
C_cvd_comorbidity 



mi misstable patterns C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_physicalactivity Cwv1_alcohol_status ///
C_cvd_comorbidity 


/*
 identifying potential auxiliary var
* Auxiliary variables are either correlated with a missing variable(s)
(the recommendation is r > 0.4) or are believed to be associated with missingness
- a priori knowledge of var that would make good auxiliary var
- identify potential candidates by examining associations between missing var and other var in the dataset
	running correlation using the command: pwcorr v1 v2 v3, obs
	the recommnedation for good correlation is r > 0.4
	
	
Missing var to be imputed: 

	Cwv1_netwealth_quintiles
	Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity
	
	
	
	
Potential auxiliary var: 
DV:  Cwv2to4_dementia_event
IV:  Cwv1_depressive_symptoms Cwv1_crp Cwv1_hdl_cholesterol Cwv1_obesity_waist
Cwv1_systolic_bp Cwv1_diastolic_bp Cwv1_diabetes_report Cwv1_HbA1c
other var: C_age C_sex C_eduaction C_maritalstatus_4cat

*/


* correlation

pwcorr Cwv1_netwealth_quintiles ///
	Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity ///
	Cwv2to4_dementia_event Cwv1_depressive_symptoms Cwv1_crp ///
	Cwv1_hdl_cholesterol Cwv1_obesity_waist ///
	Cwv1_systolic_bp Cwv1_diastolic_bp Cwv1_diabetes_report Cwv1_HbA1c ///
	C_age C_sex C_eduaction C_maritalstatus_4cat, obs

	
/* The correlation showed that all the following var are good auxiliary:
Cwv2to4_dementia_event Cwv1_depressive_symptoms Cwv1_hdl_cholesterol Cwv1_obesity_waist
Cwv1_diabetes_report C_age C_sex C_eduaction
* A good auxiliary does not have to be correlated with every variable to be useful
* And it's not problematic if it has missing info of it's own 
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

	logistic for the binary var (logit) -> 
	C_cvd_comorbidity
	
	multinomial logistic for our nominal categorical var (mlogit) -> 
	Cwv1_netwealth_quintiles
	Cwv1_smoking_3cat Cwv1_alcohol_status



- auxiliary var:

	DV -> Cwv2to4_dementia_event
	IV -> Cwv1_depressive_symptoms Cwv1_hdl_cholesterol Cwv1_obesity_waist
Cwv1_diabetes_report 
	other covariates -> C_age C_sex C_eduaction



- imputation numbers (m) -> 10

	White et al. (2010) recommendation: use the rule that m should equal the percentage of incomplete cases

	
- rseed (53421) for reproducability reasons


- (! OPTIONAL) advance impute options -> force
	
	proceed with imputation, even when missing imputed values (e.g. auxiliary have missing data) are encountered

- impute options -> savetrace (trace1)
	
	specifies Stata to save the means and standard deviations of imputed values from each iteration to a Stata dataset named “trace1
*/
	
	
	
mi set wide


mi register imputed Cwv1_netwealth_quintiles ///
	Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity
	

	
mi impute chained (logit) C_cvd_comorbidity ///
(mlogit) Cwv1_netwealth_quintiles Cwv1_smoking_3cat Cwv1_alcohol_status = Cwv2to4_dementia_event Cwv1_depressive_symptoms ///
Cwv1_hdl_cholesterol Cwv1_obesity_waist Cwv1_diabetes_report ///
C_age C_sex C_eduaction, add(10) rseed(53421) savetrace(trace1)


* save imputed data

* plot imputations


*it will open a file named trace1
use trace1, clear

describe
	
	
reshape wide *mean *sd, i(iter) j(m)
	
tsset iter	




/* 
The trace plot below graphs the predicted means value produced during the first imputation chain. 
As before, the expectations is that the values would vary randomly to incorporate variation into the predicted values for read.
*/

tsline Cwv1_netwealth_quintiles_mean1, name(mice1,replace)legend(off) ytitle("Mean of wealth")
tsline Cwv1_smoking_3cat_mean1, name(mice1,replace)legend(off) ytitle("Mean of smoking")
tsline Cwv1_alcohol_status_mean1, name(mice1,replace)legend(off) ytitle("Mean of alcohol")
tsline C_cvd_comorbidity_mean1, name(mice1,replace)legend(off) ytitle("Mean of cvd")

	
/* 

All 10 imputation chains can also be graphed simultaneously to make sure that nothing unexpected occurred in a single chain. 
Every chain is obtained using a different set of initial values and this should be unique. 
Each colored line represents a different imputation. 
So all 10 imputation chains are overlaid on top of one another.

*/


tsline C_cvd_comorbidity_mean*, name(mice1,replace)legend(off) ytitle("Mean of cvd")
tsline C_cvd_comorbidity_sd*, name(mice2, replace) legend(off) ytitle("SD of cvd")
graph combine mice1 mice2, xcommon cols(1) title(Trace plots of summaries of imputed values)
	
* repeat for each imputed var	
	
	
	
	


* -------- COX PH REGRESSION MODEL IN IMPUTED DATASET --------- *


* Declare Data to be Survival Data by using mi

mi stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)


* Run Cox regression analysis in imputed dataset by using "mi estimate:" 

/*
Independent risk factors

Cwv1_depressive_symptoms 
Cwv1_crp 
Cwv1_hdl_cholesterol 
Cwv1_obesity_waist 
Cwv1_systolic_bp 
Cwv1_diastolic_bp 
Cwv1_diabetes_report 
Cwv1_HbA1c 
Cwv1_cardio_number 
Cwv1_cardio2

*/



* Depressive symptoms

* Unadjusted model - model 1 - single predictor

* Model 1 (default coefficents)
mi estimate: stcox Cwv1_depressive_symptoms

* Model 1: define design var by using i.
mi estimate: stcox i.Cwv1_depressive_symptoms


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_depressive_symptoms 

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_depressive_symptoms ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_depressive_symptoms ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity




* repeat for each independent variable from the list above






/*
Combined effects Cox regression models 

Cwv1_crp_depress_group 
Cwv1_hdl_depress_group
Cwv1_waist_depress_group
Cwv1_sbp_depress_group
Cwv1_dbp_depress_group   
Cwv1_diabet_depress_group
Cwv1_hba1c_depress_group  
Cwv1_ca2_depress_group

*/



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity



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







Repeat on all independent and combined variables

Cwv1_depressive_symptoms 
Cwv1_crp 
Cwv1_hdl_cholesterol 
Cwv1_obesity_waist 
Cwv1_systolic_bp 
Cwv1_diastolic_bp 
Cwv1_diabetes_report 
Cwv1_HbA1c 
Cwv1_cardio_number 
Cwv1_cardio2

Cwv1_crp_depress_group 
Cwv1_hdl_depress_group
Cwv1_waist_depress_group
Cwv1_sbp_depress_group
Cwv1_dbp_depress_group   
Cwv1_diabet_depress_group
Cwv1_hba1c_depress_group  
Cwv1_ca2_depress_group



 
*/



* 1) Interaction effect 

* sex*risk factor


mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio2 i.C_sex#i.Cwv1_cardio2

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio2 ///
C_age i.C_educ_new i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity ///
 i.C_sex#i.Cwv1_cardio2



* age*risk factor 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio2 c.C_age#i.Cwv1_cardio2

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio2 ///
C_sex i.C_educ_new i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity ///
c.C_age#i.Cwv1_cardio2




/* 2) Survival analysis stratified by age

generate age group variable
Age groups: 1) young old (< 70) 2) old old (>= 70)

Kaplan Meier curves 
Cox regression models in imputed data

young old <70
if C_age_group==1

old old >70
if C_age_group==2


*/


gen C_age_group=1 if C_age < 70
replace C_age_group=2 if C_age >=70 & ///
!missing(C_age)

label var C_age_group "Age groups <70 young-old / 70 old-old"
lab def age_group 1 "young old <70" 2 "old old >70"
lab val C_age_group age_group

tab C_age_group




* COX PH REGRESSION MODEL IN IMPUTED DATASET 


* Declare Data to be Survival Data by using mi

mi stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)



* YOUNG OLD <70 Cox regression models

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group if C_age_group==1


* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group ///
i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity if C_age_group==1



* OLD OLD >70 Cox regression models

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group if C_age_group==2

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca2_depress_group ///
i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity if C_age_group==2






* 3) On depressive symptoms continuous variable



* COX PH REGRESSION MODEL IN COMPLETE DATASET 

* Declare Data to be Survival Data by using mi

mi stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox Cwv1_cesd_score

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox Cwv1_cesd_score ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox Cwv1_cesd_score ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity






* Cardiometabolic multimorbidty >= 3 


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio3

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio3 ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio3 ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca3_depress_group

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca3_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca3_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity




* Cardiometabolic multimorbidty >=4



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio4

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio4 ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_cardio4 ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca4_depress_group

* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca4_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles 

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Cwv1_ca4_depress_group ///
C_age i.C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status i.C_cvd_comorbidity


 
 


/*

4) exclude participants with cvd

use the command if C_cvd_comorbidity==0

*/


* COX PH REGRESSION MODEL IN COMPLETE DATASET 


* Declare Data to be Survival Data by using mi

stset C_time_of_event_dementia, failure (Cwv2to4_dementia_event==1) id(id_12char)



* define design var by using i.(3 classes)

stcox i.Cwv1_ca2_depress_group if C_cvd_comorbidity==0


* Adjusted models - multivariable Cox model
* controlling for covariates


* model 3: model 2 + adjust for lifestyle/health indicators

stcox i.Cwv1_ca2_depress_group C_age C_sex i.C_eduaction i.C_maritalstatus_4cat i.Cwv1_netwealth_quintiles ///
i.Cwv1_smoking_3cat i.Cwv1_alcohol_status if C_cvd_comorbidity==0




* 4) On complete cases (see above)





 
 
* ------------------------------ *






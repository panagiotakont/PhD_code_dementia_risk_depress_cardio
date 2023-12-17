/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY I: Independent and combined effects of depressive symptoms and cardiometabolic risk factors on dementia incidence


DATASET: ELSA 
baseline: wave 2 (2004) follow-up waves 3-9 (2006-2018)


TIMELINE

DEPRESSIVE SYMPTOMS AND CARDIOMETABOLIC RISK FACTORS: WV2 (BASELINE)
DEMENTIA INCIDENCE: W3 - WV9 (7 TIME POINTS)
COVARIATES ADJUSTMENT FOR HR MODELS: WV2

*/



* KEEP NECESSARY VARIABLES

keep idauniq w2wtnur w2wtbld ///
E_sex E_age E_eduaction_yrs E_eduaction E_maritalstatus_3cat E_maritalstatus_4cat ///
E_wealthquintiles E_smoking_3cat E_physicalactivity E_alcohol_freq E_alcohol_status ///
E_cvd_comorbidity E_cognitive_index E_memory_wordrecall Ewv6_memory_wordrecall ///
Ewv2_loneliness_quintiles ///
Ewv2_cesd_score Ewv2_depressive_symptoms ///
Ewv3_cesd_sumscore_rand Ewv3_depressive_symptoms ///
Ewv4_cesd_sumscore_rand Ewv4_depressive_symptoms ///
Ewv5_cesd_sumscore_rand Ewv5_depressive_symptoms ///
Ewv6_cesd_sumscore_rand Ewv6_depressive_symptoms /// 
Ewv7_cesd_sumscore_rand Ewv7_depressive_symptoms ///
Ewv8_cesd_sumscore Ewv8_depressive_symptoms ///
Ewv9_cesd_sumscore Ewv9_depressive_symptoms ///
Ewv2_crp_level Ewv2_crp Ewv2_fibrinogen_level Ewv2_fibrinogen ///
Ewv2_hdl_level Ewv2_male_hdl Ewv2_female_hdl ///
Ewv2_meds_hdl Ewv2_cholesterol_evr Ewv2_hdl_sum Ewv2_hdl_cholesterol ///
Ewv2_waist Ewv2_malewaist_ao Ewv2_femalewaist_ao Ewv2_obesity_waist_sum Ewv2_obesity_waist ///
Ewv2_bmi_score Ewv2_obesity_bmi Ewv2_waist_bmi_sum Ewv2_obesity ///
Ewv2_tg_level Ewv2_tg ///
Ewv2_systolic_mean Ewv2_diastolic_mean Ewv2_systolic_bp Ewv2_diastolic_bp ///
Ewv2_meds_bp Ewv2_bp_reportevr Ewv2_bp_before Ewv2_bp_diagnosed_sum Ewv2_bp_diagnosed Ewv2_bp_sum Ewv2_bp ///
Ewv2_diabetes_evr Ewv2_diabetes_before Ewv2_diabetes_diagnosed_sum Ewv2_diabetes_diagnosed ///
Ewv2_glucose_level Ewv2_glucose Ewv2_HbA1c_level Ewv2_HbA1c ///
Ewv2_meds1_diabetes Ewv2_meds2_diabetes Ewv2_insulin_diabetes ///
Ewv2_diabetes_anymeds_sum Ewv2_diabetes_anymeds ///
Ewv2_diabetes_glucose_sum Ewv2_glycemia ///
Ewv2_ao_depress_sum Ewv2_Nao_Ndepress Ewv2_Nao_Ydepress Ewv2_Yao_Ndepress Ewv2_Yao_Ydepress ///
Ewv2_ao_depress_group Ewv2_waist_depress_sum Ewv2_Nwaist_Ndepress Ewv2_Nwaist_Ydepress ///
Ewv2_Ywaist_Ndepress Ewv2_Ywaist_Ydepress Ewv2_waist_depress_group Ewv2_glycemia_depress_sum ///
Ewv2_Nglycemia_Ndepress Ewv2_Nglycemia_Ydepress Ewv2_Yglycemia_Ndepress Ewv2_Yglycemia_Ydepress ///
Ewv2_glycemia_depress_group Ewv2_diabet_depress_sum Ewv2_Ndiabet_Ndepress Ewv2_Ndiabet_Ydepress ///
Ewv2_Ydiabet_Ndepress Ewv2_Ydiabet_Ydepress Ewv2_diabet_depress_group Ewv2_hba1c_depress_sum ///
Ewv2_Nhba1c_Ndepress Ewv2_Nhba1c_Ydepress Ewv2_Yhba1c_Ndepress Ewv2_Yhba1c_Ydepress ///
Ewv2_hba1c_depress_group Ewv2_hdl_depress_sum Ewv2_Nhdl_Ndepress Ewv2_Nhdl_Ydepress ///
Ewv2_Yhdl_Ndepress Ewv2_Yhdl_Ydepress Ewv2_hdl_depress_group Ewv2_bp_depress_sum Ewv2_Nbp_Ndepres ///
Ewv2_Nbp_Ydepress Ewv2_Ybp_Ndepress Ewv2_Ybp_Ydepress Ewv2_bp_depress_group Ewv2_sbp_depress_sum ///
Ewv2_Nsbp_Ndepress Ewv2_Nsbp_Ydepress Ewv2_Ysbp_Ndepress Ewv2_Ysbp_Ydepress Ewv2_sbp_depress_group ///
Ewv2_dbp_depress_sum Ewv2_Ndbp_Ndepress Ewv2_Ndbp_Ydepress Ewv2_Ydbp_Ndepress Ewv2_Ydbp_Ydepress ///
Ewv2_dbp_depress_group Ewv2_crp_depress_sum ///
Ewv2_Ncrp_Ndepress Ewv2_Ncrp_Ydepress ///
Ewv2_Ycrp_Ndepress Ewv2_Ycrp_Ydepress ///
Ewv2_crp_depress_group Ewv2_tg_depress_sum ///
Ewv2_Ntg_Ndepress Ewv2_Ntg_Ydepress Ewv2_Ytg_Ndepress Ewv2_Ytg_Ydepress ///
Ewv2_tg_depress_group Ewv2_fibr_depress_sum Ewv2_Nfibr_Ndepress ///
Ewv2_Nfibr_Ydepress Ewv2_Yfibr_Ndepress ///
Ewv2_Yfibr_Ydepress Ewv2_fibr_depress_group ///
Ewv2_cardio3 Ewv2_ca3_depress_sum Ewv2_Nca3_Ndepress Ewv2_Nca3_Ydepress /// 
Ewv2_Yca3_Ndepress Ewv2_Yca3_Ydepress Ewv2_ca3_depress_group ///
Ewv2_cardio4 Ewv2_ca4_depress_sum Ewv2_Nca4_Ndepress Ewv2_Nca4_Ydepress ///
Ewv2_Yca4_Ndepress Ewv2_Yca4_Ydepress Ewv2_ca4_depress_group ///
Ewv2_cardio_number_sum Ewv2_cardio_number ///
Ewv2_cardio2 Ewv2_ca2_depress_sum ///
Ewv2_Nca2_Ndepress Ewv2_Nca2_Ydepress ///
Ewv2_Yca2_Ndepress Ewv2_Yca2_Ydepress Ewv2_ca2_depress_group ///
Ewv2_anydementia_iqcode_report ///
Ewv3_anydementia_iqcode_report ///
Ewv4_anydementia_iqcode_report Ewv6to9_dementia_event ///
Ewv5_anydementia_iqcode_report Ewv6_anydementia_iqcode_report Ewv7_anydementia_iqcode_report ///
Ewv8_anydementia_iqcode_report Ewv9_anydementia_iqcode_report ///
Ewv2_interview_date Ewv3_interview_date Ewv4_interview_date ///
Ewv5_interview_date Ewv6_interview_date Ewv7_interview_date ///
Ewv8_interview_date Ewv9_interview_date ///
Ewv3to9_dementia_sum Ewv3to9_dementia_sum_no_iqcode ///
Ewv3to9_dementia_event Ewv3to9_dementia_event_no_iqcode ///
Ewv3to9_dementia_report_or_lasti Ewv3to9_dementia_report_free_dat ///
Ewv3to9_newdementia_or_lastinter Ewv3to9_dementia_free_date E_time_dementia_months ///
E_time_dementia_report_months_no E_time_dementia_midpoint ///
E_time_dementia_midpoint_final E_time_event_dementia E_time_dementia_report_midpoint_ ///
E_time_dementia_midpoint_no_iqco E_time_event_dementia_report_no_ ///
Ewv6to9_dementia_free_date Ewv6to9_newdementia_or_lastinter ///
Ewv6to9_time_dementia_months Ewv6to9_time_dementia_midpoint ///
Ewv6to9_time_dementia_midpoint_f Ewv6to9_time_event_dementia





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



merge 1:m idauniq using "S:\Research\pkstudies\Study1_biopsych_risk\ELSA\elsa_to_merge_physicalact.dta"

keep if _merge==3

drop _merge


/*

EXPOSURE VARIABLES


Binary variables of depressive symptoms and cardiometabolic markers measured at wave 2

Depression: Ewv2_depressive_symptoms

CRP: Ewv2_crp

HDL cholesterol: Ewv2_hdl_cholesterol

Obesity by waist cir: Ewv2_obesity_waist

systolic Blood pressure: Ewv2_systolic_bp

diastolic Blood pressure: Ewv2_diastolic_bp

Diabetes: Ewv2_diabetes_diagnosed

HbA1c: Ewv2_HbA1c

CA number (categ 0,1,2,3,4+): Ewv2_cardio_number

CA mutlimorbidity >= 2 CA conditions: Ewv2_cardio2

Grouping of Dep-CA: Ewv2_waist_depress_group Ewv2_diabet_depress_group Ewv2_hba1c_depress_group Ewv2_hdl_depress_group Ewv2_sbp_depress_group Ewv2_dbp_depress_group Ewv2_crp_depress_group Ewv2_ca3_depress_group Ewv2_ca4_depress_group Ewv2_ca2_depress_group


OUTCOME VARIABLES

Dementia event: Ewv3to9_dementia_event

Time-to-event: E_time_event_dementia
 

*/






*** Descriptive stats of var of interest


tabulate Ewv2_depressive_symptoms  
summarize Ewv2_depressive_symptoms

misstable summarize Ewv2_depressive_symptoms
misstable patterns Ewv2_depressive_symptoms

tabulate Ewv2_crp  
summarize Ewv2_crp

misstable summarize Ewv2_crp
misstable patterns Ewv2_crp

tabulate Ewv2_hdl_cholesterol
summarize Ewv2_hdl_cholesterol

misstable summarize Ewv2_hdl_cholesterol
misstable patterns Ewv2_hdl_cholesterol

tabulate Ewv2_obesity_waist
summarize Ewv2_obesity_waist

misstable summarize Ewv2_obesity_waist
misstable patterns Ewv2_obesity_waist

tabulate Ewv2_systolic_bp
summarize Ewv2_systolic_bp

misstable summarize Ewv2_systolic_bp
misstable patterns Ewv2_systolic_bp


tabulate Ewv2_diastolic_bp
summarize Ewv2_diastolic_bp

misstable summarize Ewv2_diastolic_bp
misstable patterns Ewv2_diastolic_bp


tabulate Ewv2_diabetes_diagnosed
summarize Ewv2_diabetes_diagnosed

misstable summarize Ewv2_diabetes_diagnosed
misstable patterns Ewv2_diabetes_diagnosed


tabulate Ewv2_HbA1c
summarize Ewv2_HbA1c

misstable summarize Ewv2_HbA1c
misstable patterns Ewv2_HbA1c


tabulate Ewv2_anydementia_iqcode_report
summarize Ewv2_anydementia_iqcode_report

misstable summarize Ewv2_anydementia_iqcode_report
misstable patterns Ewv2_anydementia_iqcode_report



	 


*** CLEANING DATA


* 1. drop dementia cases and missing data at baseline

drop if Ewv2_anydementia_iqcode_report==1
* (50 observations deleted)

drop if Ewv2_anydementia_iqcode_report== .
* (0 observations deleted)


* 2. drop missing values of depresssive symptoms and cardiometabolic markers and invalid ca cases 

drop if Ewv2_depressive_symptoms== .
* (73 observations deleted)

drop if Ewv2_crp_level > 100 & Ewv2_crp_level < 300
* (9 observations deleted)

drop if Ewv2_crp== .
* (1,733 observations deleted)
 
drop if Ewv2_hdl_cholesterol== .
* (6 observations deleted)

drop if Ewv2_obesity_waist== .
* (131 observations deleted)

drop if Ewv2_systolic_bp== .
* (650 observations deleted)

drop if Ewv2_diastolic_bp== .
* (0 observations deleted)

drop if Ewv2_diabetes_diagnosed== .
* (0 observations deleted)

drop if Ewv2_HbA1c== .
* (102 observations deleted)



* 3. drop obs with no records on dementia at any wave from 3-9 follow-ups


search mdesc
search rmiss2
search mvpatterns

* see number of missing values vs non-missing in each variable
mdesc Ewv3_anydementia_iqcode_report Ewv4_anydementia_iqcode_report ///
Ewv5_anydementia_iqcode_report Ewv6_anydementia_iqcode_report ///
Ewv7_anydementia_iqcode_report ///
Ewv8_anydementia_iqcode_report Ewv9_anydementia_iqcode_report



/* number of missing values per observation
* the code below creates a variable called nmisfollowup that gives the number of missing values
for each observation in the variables of interest */
egen nmisfollowup_dementia_wv3to9=rmiss2(Ewv3_anydementia_iqcode_report ///
Ewv4_anydementia_iqcode_report Ewv5_anydementia_iqcode_report ///
Ewv6_anydementia_iqcode_report Ewv7_anydementia_iqcode_report ///
Ewv8_anydementia_iqcode_report Ewv9_anydementia_iqcode_report)

tab nmisfollowup_dementia_wv3to9

* drop observations "nmisfollowup_dementia_wv3to9" > 6 (those with 7 missing data = no records at any wave)
drop if nmisfollowup_dementia_wv3to9>6
*(440 observations deleted)


* ANALYTIC SAMPLE -> 4472 


/* 
---- DESCRIPTIVE STATISTICS ---- 

General characteristics of participnats stratified for study inclusion 

General characteristics of participants stratified for dementia occurence

CHI-SQUARE (chi2) for categorical var (crosstabulation)
	Frequency tables -> two-way tables
		using the command tabulate, chi2
		reporting observations, column percentage (N, %) and p-value of Pearson's r

one-way ANOVA for continuous var
	check box plot
	using the command oneway
	reporting mean, sd (summary tables) and p-value of F
*/


* General characteristics of ELSA participants at baseline

* Socio-demographics
sum E_age
ta E_sex 
ta E_eduaction
ta E_maritalstatus_4cat
ta E_wealthquintiles
* Cardiometabolic risk factors
ta Ewv2_crp
ta Ewv2_hdl_cholesterol
ta Ewv2_obesity_waist
ta Ewv2_systolic_bp
ta Ewv2_diastolic_bp
ta Ewv2_diabetes_diagnosed
ta Ewv2_HbA1c
ta Ewv2_cardio2
* Lifestyle and health indicators
ta E_smoking_3cat
ta E_physicalactivity
ta E_alcohol_status
ta E_cvd_comorbidity
* Depressive symptoms (categ)
ta Ewv2_depressive_symptoms
* Memory score
sum E_memory_wordrecall


* General characteristics of ELSA participants stratified for dementia occurence

* Socio-demographics
ttest E_age, by(Ewv3to9_dementia_event)
ta E_sex Ewv3to9_dementia_event, chi2 column row 
ta E_eduaction Ewv3to9_dementia_event, chi2 column row
ta E_maritalstatus_4cat Ewv3to9_dementia_event, chi2 column row
ta E_wealthquintiles Ewv3to9_dementia_event, chi2 column row
* Cardiometabolic risk factors
ta Ewv2_crp Ewv3to9_dementia_event, chi2 column row
ta Ewv2_hdl_cholesterol Ewv3to9_dementia_event, chi2 column row
ta Ewv2_obesity_waist Ewv3to9_dementia_event, chi2 column row
ta Ewv2_systolic_bp Ewv3to9_dementia_event, chi2 column row
ta Ewv2_diastolic_bp Ewv3to9_dementia_event, chi2 column row
ta Ewv2_diabetes_diagnosed Ewv3to9_dementia_event, chi2 column row
ta Ewv2_HbA1c Ewv3to9_dementia_event, chi2 column row
ta Ewv2_cardio2 Ewv3to9_dementia_event, chi2 column row
* Lifestyle and health indicators
ta E_smoking_3cat Ewv3to9_dementia_event, chi2 column row
ta E_physicalactivity Ewv3to9_dementia_event, chi2 column row
ta E_alcohol_status Ewv3to9_dementia_event, chi2 column row
ta E_cvd_comorbidity Ewv3to9_dementia_event, chi2 column row
* Depressive symptoms
ta Ewv2_depressive_symptoms Ewv3to9_dementia_event, chi2 column row
* Memory score
ttest E_memory_wordrecall, by(Ewv3to9_dementia_event)
ta E_age_group Ewv3to9_dementia_event, chi2 column row

		

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

codebook E_time_event_dementia Ewv3to9_dementia_event ///
Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol ///
Ewv2_obesity_waist Ewv2_systolic_bp Ewv2_diastolic_bp ///
Ewv2_diabetes_diagnosed Ewv2_HbA1c ///
Ewv2_cardio2 Ewv2_cardio3 Ewv2_cardio4 Ewv2_cardio_number ///
Ewv2_waist_depress_group Ewv2_diabet_depress_group ///
Ewv2_hba1c_depress_group Ewv2_hdl_depress_group ///
Ewv2_sbp_depress_group Ewv2_dbp_depress_group ///
Ewv2_crp_depress_group Ewv2_ca2_depress_group ///
Ewv2_ca3_depress_group Ewv2_ca4_depress_group ///
E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity,compact



* Declare Data to be Survival Data
* Time to event: E_time_event_dementia (months)
* Censoring: Ewv3to9_dementia_event (1=dementia, 0=censored)
* Command is stset TIMETOEVENT, failure(CENSORVARIABLE)


stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)


*describe survival data using commnad stsum

stsum

stsum, by(Ewv2_ca2_depress_group)



* Kaplan Meier Curve estimation

sts list

sts list, by(Ewv2_ca2_depress_group)



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

sort Ewv2_ca2_depress_group 

sts list, by(Ewv2_ca2_depress_group)

* graph with frills

sts graph, by(Ewv2_ca2_depress_group) xlabel(0(20)180) ylabel(0.80(.05)1) xtitle("Time in Months") ///
ytitle("Survival Prob") title("Kaplan Meier Curve")



* calculate person-time and incidence rates using command ststime

stptime,title(Person-years)

stptime, title(Person-years) per(1000)



/*

Repeat to find incident case per category

Ewv2_depressive_symptoms
Ewv2_crp 
Ewv2_hdl_cholesterol
Ewv2_obesity_waist
Ewv2_systolic_bp
Ewv2_diastolic_bp
Ewv2_diabetes_diagnosed
Ewv2_HbA1c
Ewv2_cardio_number
Ewv2_cardio2


Ewv2_crp_depress_group 
Ewv2_hdl_depress_group
Ewv2_waist_depress_group
Ewv2_sbp_depress_group
Ewv2_dbp_depress_group   
Ewv2_diabet_depress_group
Ewv2_hba1c_depress_group  
Ewv2_ca2_depress_group


*/


ta Ewv2_ca2_depress_group

* calculate person-time  by category

stptime, by(Ewv2_ca2_depress_group)

stptime, by(Ewv2_ca2_depress_group) per(1000)



* mean and median of follow-up
sum E_time_event_dementia
sum E_time_event_dementia, detail
 
 




/* Log Rank Test of equality of survival distributions 
 (NULL: equality of survival distributions among groups)
 We will consider including the predictor if the test has a p-value of 0.2 – 0.25 or less. 
 If the predictor has a p-value greater than 0.25 in a univariate analysis 
 it is highly unlikely that it will contribute anything to a model which includes other predictors. 
 Command is sts test GROUPVAR
*/


sts test Ewv2_ca2_depress_group, logrank

sts test E_age, logrank

sts test E_sex, logrank

sts test E_eduaction, logrank

sts test E_maritalstatus_4cat, logrank

sts test E_wealthquintiles, logrank

sts test E_smoking_3cat, logrank

sts test E_alcohol_status, logrank

sts test E_cvd_comorbidity, logrank






/* Cox PH regression model

using the command stcox
	
--- Building the model ---

Model 1: unadjusted - single predictor of group
Model 2: model 1 + sociodemographics: age sex education marital status and wealth 
Model 3: model 2 + lifestyle/health indicators: smoking, alcohol consumption, cvd comorbidity


!! I didn't adjust for physical activity because this variable can't be used in CHARLS (missing values)

*/


* Unadjusted model - model 1 - single predictor

stcox Ewv2_ca2_depress_group

* define design var by using i.(by group)

stcox i.Ewv2_ca2_depress_group


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

stcox i.Ewv2_ca2_depress_group E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles


* model 3: model 2 + adjust for lifestyle/ health indicators

stcox i.Ewv2_depressive_symptoms E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity





* Coefficients instead of hazard ratios by specifing the option nohr 

stcox i.Ewv2_ca2_depress_group, nohr


stcox i.Ewv2_ca2_depress_group E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity, nohr





* Multivariable model development
* Likelihood-ratio tests



*install eststo
findit eststo


* ---- rx controlling for age and sex -----*
quietly: stcox E_age i.E_sex
eststo modelagesex

quietly: stcox E_age i.E_sex i.Ewv2_ca2_depress_group
eststo modelagesex_4group

lrtest modelagesex modelagesex_4group



* ---- rx controlling for sociodemographics -----*
quietly: stcox E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
eststo modelsociodemo

quietly: stcox E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles i.Ewv2_ca2_depress_group
eststo modelsociodemo_4group

lrtest modelsociodemo modelsociodemo_4group


* ---- rx controlling for lifestyle/health indicators-----*
quietly: stcox i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity
eststo modelcardiovascular

quietly: stcox i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity i.Ewv2_ca2_depress_group
eststo modelcardiovascular_4group

lrtest modelcardiovascular modelcardiovascular_4group



* side-by-side comparison of models


quietly: stcox i.Ewv2_ca2_depress_group
eststo model1


quietly: stcox E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles i.Ewv2_ca2_depress_group
eststo model2


quietly: stcox E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity i.Ewv2_ca2_depress_group 
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



stcox i.Ewv2_ca2_depress_group E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity, nohr ///
tvc(Ewv2_ca2_depress_group E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity texp(ln(E_time_event_dementia))


 
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

quietly stcox Ewv2_ca2_depress_group E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity, schoenfeld(sch*) scaledsch(sca*)
stphtest, detail
stphtest, plot(Ewv2_ca2_depress_group) msym(oh)
stphtest, plot(E_age) msym(oh)
stphtest, plot(E_sex) msym(oh)
stphtest, plot(E_eduaction) msym(oh)
stphtest, plot(E_maritalstatus_4cat) msym(oh)
stphtest, plot(E_wealthquintiles) msym(oh)
stphtest, plot(E_smoking_3cat) msym(oh)
stphtest, plot(E_alcohol_status) msym(oh)
stphtest, plot(E_cvd_comorbidity) msym(oh)





stphplot, by(Ewv2_ca2_depress_group) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_age) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_sex) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_eduaction) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_maritalstatus_4cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_wealthquintiles) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_smoking_3cat) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_alcohol_status) plot1(msym(oh)) plot2(msym(th))
stphplot, by(E_cvd_comorbidity) plot1(msym(oh)) plot2(msym(th))



* Assessment of PH Assumption: adjust for age and sex
stphplot, by(Ewv2_ca2_depress_group) adjust(E_age E_sex) nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Ewv2_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 2
stphplot, by(Ewv2_ca2_depress_group) adjust(E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Ewv2_ca4_depress_group") xtitle("months")



* Assessment of PH Assumption: adjust for model 3
stphplot, by(Ewv2_ca2_depress_group) adjust(E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity) ///
nolntime plot1opts(symbol(none) color(black) lpattern(dash)) ///
plot2opts(symbol(none) color(green)) plot3opts(symbol(none) color(red)) ///
title("Assessment of PH Assumption") subtitle(" Predictor is Ewv2_ca4_depress_group") xtitle("months")





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


stcox Ewv2_ca2_depress_group E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity, mgale(mgale)


stcoxgof





* by using the Cox-Snell residuals 

quietly stcox Ewv2_ca2_depress_group E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_alcohol_status E_cvd_comorbidity
predict cs, csnell

* or

quietly stcox Ewv2_ca2_depress_group
predict cs, csnell


stset cs, failure(Ewv3to9_dementia_event)
sts generate km = s
generate H = -ln(km)
line H cs cs, sort ytitle("") clstyle(. refline)







/* Cox PH regression model for independent depressive symptoms and CA exposure variables

Ewv2_depressive_symptoms 
Ewv2_crp 
Ewv2_hdl_cholesterol 
Ewv2_obesity_waist 
Ewv2_systolic_bp 
Ewv2_diastolic_bp 
Ewv2_diabetes_diagnosed 
Ewv2_HbA1c 
Ewv2_cardio_number
Ewv2_cardio2
Ewv2_cardio3
Ewv2_cardio4

*/




stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)



* Unadjusted model 1

stcox i.Ewv2_depressive_symptoms


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

stcox i.Ewv2_depressive_symptoms E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles


* model 3: model 2 + adjust for lifestyle / health indicators

stcox i.Ewv2_depressive_symptoms E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity


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

mdesc E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_physicalactivity E_alcohol_status E_cvd_comorbidity E_memory_wordrecall




* examining missing data patterns

mi set wide

mi misstable summarize E_age E_sex E_eduaction E_maritalstatus_4cat ///
E_wealthquintiles E_smoking_3cat E_physicalactivity ///
E_alcohol_status E_cvd_comorbidity ///

mi misstable patterns E_age E_sex E_eduaction ///
E_maritalstatus_4cat E_wealthquintiles ///
E_smoking_3cat E_physicalactivity E_alcohol_status E_cvd_comorbidity


/*
 identifying potential auxiliary var
* Auxiliary variables are either correlated with a missing variable(s)
(the recommendation is r > 0.4) or are believed to be associated with missingness
- a priori knowledge of var that would make good auxiliary var
- identify potential candidates by examining associations between missing var and other var in the dataset
	running correlation using the command: pwcorr v1 v2 v3, obs
	the recommnedation for good correlation is r > 0.4
	
	
Missing var to be imputed: 

	E_eduaction E_wealthquintiles
	E_smoking_3cat E_physicalactivity E_alcohol_status
	


	
	
Potential auxiliary var: 
DV:  Ewv3to9_dementia_event
IV:  Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol
Ewv2_obesity_waist Ewv2_systolic_bp Ewv2_diastolic_bp
Ewv2_diabetes_diagnosed Ewv2_HbA1c
other var: 
	E_age E_sex E_maritalstatus_4cat E_cvd_comorbidity

*/


* correlation

pwcorr E_eduaction E_wealthquintiles ///
	E_smoking_3cat E_physicalactivity E_alcohol_status ///
	Ewv3to9_dementia_event Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol ///
	Ewv2_obesity_waist Ewv2_systolic_bp Ewv2_diastolic_bp ///
	Ewv2_diabetes_diagnosed Ewv2_HbA1c ///
	E_age E_sex E_maritalstatus_4cat E_cvd_comorbidity, obs

	
/* The correlation showed that all the following var are good auxiliary:
	Ewv3to9_dementia_event Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol
	Ewv2_systolic_bp Ewv2_diabetes_diagnosed E_age E_sex E_cvd_comorbidity
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
	E_eduaction E_wealthquintiles
	E_smoking_3cat E_physicalactivity E_alcohol_status 



- auxiliary var:

	DV -> Ewv3to9_dementia_event 
	IV -> Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol
	Ewv2_systolic_bp Ewv2_diabetes_diagnosed
	other covariates -> E_age E_sex E_cvd_comorbidity 



- imputation numbers (m) -> 10

	White et al. (2010) recommendation: use the rule that m should equal the percentage of incomplete cases

	
- rseed (53421) for reproducability reasons


- (! OPTIONAL) advance impute options -> force
	
	proceed with imputation, even when missing imputed values (e.g. auxiliary have missing data) are encountered

- impute options -> savetrace (trace1)
	
	specifies Stata to save the means and standard deviations of imputed values from each iteration to a Stata dataset named “trace1
*/
	
	
mi set wide


mi register imputed E_eduaction E_wealthquintiles ///
	E_smoking_3cat E_physicalactivity E_alcohol_status 

	

mi impute chained (mlogit) E_eduaction E_wealthquintiles E_smoking_3cat E_physicalactivity E_alcohol_status = Ewv3to9_dementia_event Ewv2_depressive_symptoms Ewv2_crp Ewv2_hdl_cholesterol Ewv2_systolic_bp Ewv2_diabetes_diagnosed E_age E_sex E_cvd_comorbidity, add(10) rseed(53421) savetrace(trace1)




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

tsline E_eduaction_mean1, name(mice1,replace)legend(off) ytitle("Mean of education")
tsline E_wealthquintiles_mean1, name(mice1,replace)legend(off) ytitle("Mean of wealth")
tsline E_smoking_3cat_mean1, name(mice1,replace)legend(off) ytitle("Mean of smoking")
tsline E_physicalactivity_mean1, name(mice1,replace)legend(off) ytitle("Mean of physical activity")
tsline E_alcohol_status_mean1, name(mice1,replace)legend(off) ytitle("Mean of alcohol status")

	
/* 

All 10 imputation chains can also be graphed simultaneously to make sure that nothing unexpected occurred in a single chain. 
Every chain is obtained using a different set of initial values and this should be unique. 
Each colored line represents a different imputation. 
So all 10 imputation chains are overlaid on top of one another.

*/


tsline E_alcohol_status_mean*, name(mice1,replace)legend(off) ytitle("Mean of alcohol")
tsline E_alcohol_status_sd*, name(mice2, replace) legend(off) ytitle("SD of alcohol")
graph combine mice1 mice2, xcommon cols(1) title(Trace plots of summaries of imputed values)
	
* repeat for each imputed var	
	
	

	
	



* -------- COX PH REGRESSION MODEL IN IMPUTED DATASET --------- *


* Declare Data to be Survival Data by using mi

mi stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)


* Run Cox regression analysis in imputed dataset by using "mi estimate:" 




/*
Independent risk factors

Ewv2_depressive_symptoms 
Ewv2_crp 
Ewv2_hdl_cholesterol
Ewv2_obesity_waist 
Ewv2_systolic_bp 
Ewv2_diastolic_bp 
Ewv2_diabetes_diagnosed 
Ewv2_HbA1c 
Ewv2_cardio_number 
Ewv2_cardio2 

*/



* Depressive symptoms

* Unadjusted model - model 1 - single predictor

* Model 1 (default coefficents)
mi estimate: stcox Ewv2_depressive_symptoms

* Model 1: define design var by using i.
mi estimate: stcox i.Ewv2_depressive_symptoms


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_depressive_symptoms



* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_depressive_symptoms /// 
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles


* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_depressive_symptoms /// 
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity



* repeat for each independent variable from the list above





/*
Combined effects Cox regression models 

Ewv2_crp_depress_group 
Ewv2_hdl_depress_group
Ewv2_waist_depress_group
Ewv2_sbp_depress_group 
Ewv2_dbp_depress_group   
Ewv2_diabet_depress_group
Ewv2_hba1c_depress_group  
Ewv2_ca2_depress_group

*/




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group


* Adjusted models - multivariable Cox model
* controlling for covariates

* model 2: model 1 + adjust for sociodemographics: age sex education marital status and wealth 

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group /// 
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles

* model 3: model 2 + adjust for lifestyle/ health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group /// 
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity


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
	
5) survival analysis without IQCODE

6) Complete data

7) survival analysis limiting to 5 year follow-up period



Repeat on all independent and combined variables

Ewv2_depressive_symptoms
Ewv2_crp 
Ewv2_hdl_cholesterol
Ewv2_obesity_waist
Ewv2_systolic_bp
Ewv2_diastolic_bp
Ewv2_diabetes_diagnosed
Ewv2_HbA1c
Ewv2_cardio_number
Ewv2_cardio2


Ewv2_crp_depress_group 
Ewv2_hdl_depress_group
Ewv2_waist_depress_group
Ewv2_sbp_depress_group
Ewv2_dbp_depress_group   
Ewv2_diabet_depress_group
Ewv2_hba1c_depress_group  
Ewv2_ca2_depress_group


*/




* 1) Interaction effect 

* sex*risk factor

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio2 i.E_sex#i.Ewv2_cardio2


mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio2 ///
E_age i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity ///
i.E_sex#i.Ewv2_cardio2


* age*risk factor 

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio2 c.E_age#i.Ewv2_cardio2


mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio2 ///
E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity ///
 c.E_age#i.Ewv2_cardio2




/* 2) Survival analysis stratified by age

generate age group variable
Age groups: 1) young old (< 70) 2) old old (>= 70)

Kaplan Meier curves 
Cox regression models in imputed data

young old <70
if E_age_group==1

old old >70
if E_age_group==2

*/




gen E_age_group=1 if E_age < 70
replace E_age_group=2 if E_age >=70 & !missing(E_age)

label var E_age_group "Age groups <70 young-old / 70 old-old"
lab def age_group 1 "young old <70" 2 "old old >70"
lab val E_age_group age_group

tab E_age_group



* COX PH REGRESSION MODEL IN IMPUTED DATASET 


* Declare Data to be Survival Data by using mi

mi stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)



* YOUNG OLD <70 Cox regression models

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group if E_age_group==1


* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity if E_age_group==1




* OLD OLD >70 Cox regression models


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group if E_age_group==2


* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity if E_age_group==2


 



* 3) On depressive symptom continuous variable


* COX PH REGRESSION MODEL IN IMPUTED DATASET 

* Declare Data to be Survival Data by using mi

mi stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)



* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox Ewv2_cesd_score 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox Ewv2_cesd_score ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox Ewv2_cesd_score ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity






* Cardiometabolic multimorbidty >= 3 


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio3 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio3 ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio3 ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca3_depress_group 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca3_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca3_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity




* Cardiometabolic multimorbidty >=4


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio4 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio4 ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_cardio4 ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity




* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca4_depress_group 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca4_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles
 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca4_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity






/*

4) exclude participants with cvd

use the command if E_cvd_comorbidity==0

*/


* COX PH REGRESSION MODEL IN IMPUTED DATASET 


* Declare Data to be Survival Data by using mi

mi stset E_time_event_dementia, failure (Ewv3to9_dementia_event==1) id(idauniq)


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group if E_cvd_comorbidity==0



* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status if E_cvd_comorbidity==0





* 5) Exclude dementia cases identified with IQCODE


* Declare Data to be Survival Data by using mi

mi stset E_time_event_dementia_report_no_, failure (Ewv3to9_dementia_event_no_iqcode==1) id(idauniq)

 

* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")


mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group


* Model 3: model 2 + adjust for cvd health

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity



* 6) On complete cases (see above)



/* 
7) survival analysis limiting to 5 year follow-up period

elsa follow-up wave 3-6

*/



merge 1:m RAHHIDPN using "S:\Research\pkstudies\Study3_cardio_lca\HRS\hrs_lca data sensitivity 9to12followup.dta"



* Declare Data to be Survival Data by using mi

mi stset Ewv3to6_time_event_dementia, failure (Ewv3to6_dementia_event==1) id(idauniq)


* Model 1 ask for hazard ratio by using the option eform("Haz.Ratio")

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group 


* Adjusted models - multivariable Cox model
* controlling for covariates

* Model 2: model 1 + adjust for socio-demographics: age sex education marital status and wealth 
mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles


 

* Model 3: model 2 + adjust for lifestyle/health indicators

mi estimate, eform("Haz. Ratio"): stcox i.Ewv2_ca2_depress_group ///
E_age i.E_sex i.E_eduaction i.E_maritalstatus_4cat i.E_wealthquintiles ///
i.E_smoking_3cat i.E_alcohol_status i.E_cvd_comorbidity






 
* ------------------------------ *







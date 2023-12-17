/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY 2: Mediating effects of depressive symptoms and cardiometabolic health on dementia development

Method of analysis: 
Path Analysis (SEM) 


MODEL 

T1: EXPOSURE: DEPRESSIVE SYMPTOMS WV2 (BASELINE, 2004)
              CARDIOMETABOLIC RISK WV2 (BASELINE, 2004)
T2: MEDIATOR: DEPRESSIVE SYMPTOMS WV4 (2008)
              CARDIOMETABOLIC RISK: WV4 (2008)
T3: OUTCOME: DEMENTIA WV6 (2012)

COVARIATES ADJUSTMENT FOR PATH MODELS: WV2


*/



* KEEP NECESSARY VARIABLES

keep idauniq w2wtnur w2wtbld ///
E_sex E_age E_eduaction_yrs E_eduaction E_maritalstatus_3cat E_maritalstatus_4cat ///
E_wealthquintiles E_smoking_3cat E_physicalactivity E_alcohol_freq E_alcohol_status ///
E_cvd_comorbidity E_cognitive_index E_memory_wordrecall ///
Ewv2_loneliness_quintiles Ewv6_memory_wordrecall ///
Ewv2_cesd_happy_rand Ewv2_cesd_enlife_rand Ewv2_cesd_depressed_rand ///
Ewv2_cesd_effort_rand Ewv2_cesd_sleep_rand Ewv2_cesd_lonely_rand ///
Ewv2_cesd_sad_rand Ewv2_cesd_going_rand ///
Ewv2_cesd_score Ewv2_depressive_symptoms ///
Ewv3_cesd_sumscore_rand Ewv3_depressive_symptoms ///
Ewv4_cesd_happy_rand Ewv4_cesd_enlife_rand ///
Ewv4_cesd_depressed_rand Ewv4_cesd_effort_rand ///
Ewv4_cesd_sleep_rand Ewv4_cesd_lonely_rand ///
Ewv4_cesd_sad_rand Ewv4_cesd_going_rand ///
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
Ewv2_meds_bp Ewv2_bp_reportevr Ewv2_bp_before Ewv2_bp_diagnosed_sum ///
Ewv2_bp_diagnosed Ewv2_bp_sum Ewv2_bp ///
Ewv2_diabetes_evr Ewv2_diabetes_before Ewv2_diabetes_diagnosed_sum Ewv2_diabetes_diagnosed ///
Ewv2_glucose_level Ewv2_glucose Ewv2_HbA1c_level Ewv2_HbA1c ///
Ewv2_meds1_diabetes Ewv2_meds2_diabetes Ewv2_insulin_diabetes ///
Ewv2_diabetes_anymeds_sum Ewv2_diabetes_anymeds ///
Ewv2_diabetes_glucose_sum Ewv2_glycemia ///
Ewv4_crp_level Ewv4_crp Ewv4_hdl_level Ewv4_male_hdl Ewv4_female_hdl ///
Ewv4_meds1_hdl Ewv4_meds2_hdl Ewv4_cholesterol_anymeds_sum Ewv4_cholesterol_anymeds ///
Ewv4_cholesterol_before Ewv4_cholesterol_confirm Ewv4_cholesterol_still ///
Ewv4_cholesterol_new Ewv4_cholesterol_newreport Ewv4_cholesterol_evr ///
Ewv4_cholesterol_diagnosed_sum Ewv4_cholesterol_diagnosed Ewv4_hdl_sum ///
Ewv4_hdl_cholesterol Ewv4_waist Ewv4_malewaist_ao Ewv4_femalewaist_ao ///
Ewv4_obesity_waist_sum Ewv4_obesity_waist Ewv4_bmi_score Ewv4_obesity_bmi ///
Ewv4_waist_bmi_sum Ewv4_obesity Ewv4_tg_level Ewv4_tg Ewv4_systolic_mean ///
Ewv4_diastolic_mean Ewv4_systolic_bp Ewv4_diastolic_bp Ewv4_meds1_bp ///
Ewv4_meds2_bp Ewv4_bp_anymeds_sum Ewv4_bp_anymeds Ewv4_bp_before ///
Ewv4_bp_confirm Ewv4_bp_still Ewv4_bp_new Ewv4_bp_newreport Ewv4_bp_evr ///
Ewv4_bp_diagnosed_sum Ewv4_bp_diagnosed Ewv4_bp_sum Ewv4_bp Ewv4_diabetes_before ///
Ewv4_diabetes_confirm Ewv4_diabetes_new Ewv4_diabetes_newreport Ewv4_diabetes_doctor ///
Ewv4_diabetes_evr Ewv4_diabetes_diagnosed_sum Ewv4_diabetes_diagnosed Ewv4_glucose_level ///
Ewv4_glucose Ewv4_HbA1c_level Ewv4_HbA1c_who Ewv4_meds1_diabetes Ewv4_meds2_diabetes ///
Ewv4_insulin_diabetes Ewv4_meds3_diabetes Ewv4_diabetes_anymeds_sum Ewv4_diabetes_anymeds ///
Ewv4_diabetes_glucose_sum Ewv4_glycemia ///
Ewv2_cardio_number_sum Ewv2_cardio_number Ewv2_cardio3 Ewv2_cardio4 ///
Ewv4_cardio_number_sum Ewv4_cardio_number Ewv4_cardio3 Ewv4_cardio4 ///
Ewv2_anydementia_iqcode_report Ewv3_anydementia_iqcode_report ///
Ewv4_anydementia_iqcode_report ///
Ewv5_anydementia_iqcode_report Ewv6_anydementia_iqcode_report ///
Ewv6_anydementia_report Ewv7_anydementia_iqcode_report ///
Ewv8_anydementia_iqcode_report Ewv9_anydementia_iqcode_report ///
Ewv2_interview_date Ewv3_interview_date Ewv4_interview_date ///
Ewv5_interview_date Ewv6_interview_date Ewv7_interview_date ///
Ewv8_interview_date Ewv9_interview_date ///
Ewv2_interview_year Ewv3_interview_year Ewv5_interview_year ///
Ewv6_interview_year Ewv7_interview_year Ewv8_interview_year Ewv9_interview_year ///
Ewv3to9_dementia_sum Ewv3to9_dementia_sum_no_iqcode ///
Ewv3to9_dementia_event Ewv3to9_dementia_event_no_iqcode ///
Ewv3to9_dementia_report_or_lasti Ewv3to9_dementia_report_free_dat ///
Ewv3to9_newdementia_or_lastinter Ewv3to9_dementia_free_date ///
Ewv6to9_dementia_event Ewv6to9_dementia_sum_no_iqcode ///
Ewv6to9_dementia_event_no_iqcode ///
E_time_dementia_months ///
E_time_dementia_report_months_no E_time_dementia_midpoint ///
E_time_dementia_midpoint_final E_time_event_dementia ///
E_time_dementia_report_midpoint_ ///
E_time_dementia_midpoint_no_iqco E_time_event_dementia_report_no_ ///
Ewv6to9_newdementia_or_lastinter Ewv6to9_time_dementia_months ///
Ewv6to9_dementia_free_date ///
Ewv6to9_time_dementia_midpoint ///
Ewv6to9_time_dementia_midpoint_f Ewv6to9_time_event_dementia





/* Prepare variables for SEM dataset 

Binary variables of depressive symptoms and binary and continous cardiometabolic markers at wave 2 and 4

EXPOSURE 

DEPRESSION T1

Ewv2_cesd_happy_rand Ewv2_cesd_enlife_rand Ewv2_cesd_depressed_rand Ewv2_cesd_effort_rand Ewv2_cesd_sleep_rand Ewv2_cesd_lonely_rand Ewv2_cesd_sad_rand Ewv2_cesd_going_rand


CARDIO HEALTH T1

CRP: Ewv2_crp_level Ewv2_crp
HDL cholesterol: Ewv2_hdl_level Ewv2_hdl_cholesterol
Obesity by waist cir: Ewv2_waist Ewv2_obesity_waist
SBP: Ewv2_diastolic_meanEwv2_systolic_mean Ewv2_systolic_bp
DBP: Ewv2_diastolic_mean Ewv2_diastolic_bp
Diabetes: Ewv2_diabetes_diagnosed
HbA1c: Ewv2_HbA1c_level Ewv2_HbA1c

MEDIATORS

DEPRESSION T2

Ewv4_cesd_happy_rand Ewv4_cesd_enlife_rand Ewv4_cesd_depressed_rand Ewv4_cesd_effort_rand Ewv4_cesd_sleep_rand Ewv4_cesd_lonely_rand Ewv4_cesd_sad_rand Ewv4_cesd_going_rand


CARDIO HEALTH T2

CRP: Ewv4_crp_level Ewv4_crp
HDL cholesterol: Ewv4_hdl_level Ewv4_hdl_cholesterol
Obesity by waist cir: Ewv4_waist Ewv4_obesity_waist
SBP: Ewv4_systolic_mean Ewv4_systolic_bp
DBP: Ewv4_diastolic_mean Ewv4_diastolic_bp
Diabetes: Ewv4_diabetes_diagnosed
HbA1c: Ewv4_HbA1c_level Ewv4_HbA1c_who


OUTCOME
 
Dementia incidence: Ewv6_anydementia_iqcode_report (binary)

*/




			
	



*** Descriptive stats of Exposure, Mediator and Outcome at time 1 (wave 2 baseline)

* depression


tabulate Ewv2_depressive_symptoms  
summarize Ewv2_depressive_symptoms

misstable summarize Ewv2_depressive_symptoms
misstable patterns Ewv2_depressive_symptoms

* crp

tabulate Ewv2_crp_level  
summarize Ewv2_crp_level, detail
histogram Ewv2_crp_level, discrete frequency normal
sktest Ewv2_crp_level

misstable summarize Ewv2_crp_level
misstable patterns Ewv2_crp_level

tabulate Ewv2_crp  
summarize Ewv2_crp

misstable summarize Ewv2_crp
misstable patterns Ewv2_crp

*hdl

tabulate Ewv2_hdl_level
summarize Ewv2_hdl_level, detail
histogram Ewv2_hdl_level, discrete frequency normal
sktest Ewv2_hdl_level

misstable summarize Ewv2_hdl_level
misstable patterns Ewv2_hdl_level


tabulate Ewv2_hdl_cholesterol
summarize Ewv2_hdl_cholesterol

misstable summarize Ewv2_hdl_cholesterol
misstable patterns Ewv2_hdl_cholesterol


*obesity waist


tabulate Ewv2_waist
summarize Ewv2_waist, detail
histogram Ewv2_waist, discrete frequency normal
sktest Ewv2_waist


misstable summarize Ewv2_waist
misstable patterns Ewv2_waist


tabulate Ewv2_obesity_waist
summarize Ewv2_obesity_waist

misstable summarize Ewv2_obesity_waist
misstable patterns Ewv2_obesity_waist


*sbp

tabulate Ewv2_systolic_mean
summarize Ewv2_systolic_mean, detail
histogram Ewv2_systolic_mean, discrete frequency normal
sktest Ewv2_systolic_mean


misstable summarize Ewv2_systolic_mean
misstable patterns Ewv2_systolic_mean


tabulate Ewv2_systolic_bp
summarize Ewv2_systolic_bp

misstable summarize Ewv2_systolic_bp
misstable patterns Ewv2_systolic_bp


*dbp


tabulate Ewv2_diastolic_mean
summarize Ewv2_diastolic_mean, detail
histogram Ewv2_diastolic_mean, discrete frequency normal
sktest Ewv2_diastolic_mean

misstable summarize Ewv2_diastolic_mean
misstable patterns Ewv2_diastolic_mean

tabulate Ewv2_diastolic_bp
summarize Ewv2_diastolic_bp

misstable summarize Ewv2_diastolic_bp
misstable patterns Ewv2_diastolic_bp

* diabetes 

tabulate Ewv2_diabetes_diagnosed
summarize Ewv2_diabetes_diagnosed

misstable summarize Ewv2_diabetes_diagnosed
misstable patterns Ewv2_diabetes_diagnosed


* HbA1c

tabulate Ewv2_HbA1c_level
summarize Ewv2_HbA1c_level, detail
histogram Ewv2_HbA1c_level, discrete frequency normal
sktest Ewv2_HbA1c_level


misstable summarize Ewv2_HbA1c_level
misstable patterns Ewv2_HbA1c_level

tabulate Ewv2_HbA1c
summarize Ewv2_HbA1c

misstable summarize Ewv2_HbA1c
misstable patterns Ewv2_HbA1c

* dementia wave 2

tabulate Ewv2_anydementia_iqcode_report
summarize Ewv2_anydementia_iqcode_report

misstable summarize Ewv2_anydementia_iqcode_report
misstable patterns Ewv2_anydementia_iqcode_report




*** Descriptive stats of Exposure, Mediator and Outcome at time 2 (wave 4)

*depression

tabulate Ewv4_depressive_symptoms  
summarize Ewv4_depressive_symptoms

misstable summarize Ewv4_depressive_symptoms
misstable patterns Ewv4_depressive_symptoms


*crp 

tabulate Ewv4_crp_level  
summarize Ewv4_crp_level, detail
histogram Ewv4_crp_level, discrete frequency normal
sktest Ewv4_crp_level


misstable summarize Ewv4_crp_level
misstable patterns Ewv4_crp_level

tabulate Ewv4_crp  
summarize Ewv4_crp

misstable summarize Ewv4_crp
misstable patterns Ewv4_crp


*hdl

tabulate Ewv4_hdl_level
summarize Ewv4_hdl_level, detail
histogram Ewv4_hdl_level, discrete frequency normal
sktest Ewv4_hdl_level


misstable summarize Ewv4_hdl_level
misstable patterns Ewv4_hdl_level


tabulate Ewv4_hdl_cholesterol
summarize Ewv4_hdl_cholesterol

misstable summarize Ewv4_hdl_cholesterol
misstable patterns Ewv4_hdl_cholesterol


*obesity waist

tabulate Ewv4_waist
summarize Ewv4_waist, detail
histogram Ewv4_waist, discrete frequency normal
sktest Ewv4_waist


misstable summarize Ewv4_waist
misstable patterns Ewv4_waist

tabulate Ewv4_obesity_waist
summarize Ewv4_obesity_waist

misstable summarize Ewv4_obesity_waist
misstable patterns Ewv4_obesity_waist


*sbp

tabulate Ewv4_systolic_mean
summarize Ewv4_systolic_mean, detail
histogram Ewv4_systolic_mean, discrete frequency normal
sktest Ewv4_systolic_mean


misstable summarize Ewv4_systolic_mean
misstable patterns Ewv4_systolic_mean

tabulate Ewv4_systolic_bp
summarize Ewv4_systolic_bp

misstable summarize Ewv4_systolic_bp
misstable patterns Ewv4_systolic_bp



*dbp

tabulate Ewv4_diastolic_mean
summarize Ewv4_diastolic_mean, detail
histogram Ewv4_diastolic_mean, discrete frequency normal
sktest Ewv4_diastolic_mean


misstable summarize Ewv4_diastolic_mean
misstable patterns Ewv4_diastolic_mean


tabulate Ewv4_diastolic_bp
summarize Ewv4_diastolic_bp

misstable summarize Ewv4_diastolic_bp
misstable patterns Ewv4_diastolic_bp


*diabetes

tabulate Ewv4_diabetes_diagnosed
summarize Ewv4_diabetes_diagnosed

misstable summarize Ewv4_diabetes_diagnosed
misstable patterns Ewv4_diabetes_diagnosed


*HbA1c

tabulate Ewv4_HbA1c_level
summarize Ewv4_HbA1c_level, detail
histogram Ewv4_HbA1c_level, discrete frequency normal
sktest Ewv4_HbA1c_level


misstable summarize Ewv4_HbA1c_level
misstable patterns Ewv4_HbA1c_level

tabulate Ewv4_HbA1c_who
summarize Ewv4_HbA1c_who

misstable summarize Ewv4_HbA1c_who
misstable patterns Ewv4_HbA1c_who



* dementia wave 3 and 4


tabulate Ewv3_anydementia_iqcode_report 
summarize Ewv3_anydementia_iqcode_report 

misstable summarize Ewv3_anydementia_iqcode_report 
misstable patterns Ewv3_anydementia_iqcode_report 


tabulate Ewv4_anydementia_iqcode_report 
summarize Ewv4_anydementia_iqcode_report 

misstable summarize Ewv4_anydementia_iqcode_report 
misstable patterns Ewv4_anydementia_iqcode_report 







*** CLEANING DATA 


* drop dementia cases at wv2,3 and 4 and missing data at baseline

drop if Ewv2_anydementia_iqcode_report==1
* (50 observations deleted)

drop if Ewv2_anydementia_iqcode_report== .
* (0 observations deleted)

* drop dementia cases at wave 3 and 4

drop if Ewv3_anydementia_iqcode_report==1
* (56 observations deleted)

drop if Ewv4_anydementia_iqcode_report==1
* (65 observations deleted)




* drop invalid ca cases t1 and t2

* drop CRP > 100 

drop if Ewv2_crp_level > 100 & Ewv2_crp_level < 300
* (8 observations deleted)


drop if Ewv4_crp_level > 100 & Ewv4_crp_level < 300
* (2 observations deleted)



* drop obs with no records on dementia at wave 6

drop if Ewv6_anydementia_iqcode_report== .
* (2624 observations deleted)

drop if Ewv6_anydementia_report== .
* (0 observations deleted)



* ANALYTIC SAMPLE -> 4861




*** Recoding crp and hdl of interest


* log transform crp (left-skewed)

gen log_Ewv2_crp_level=log(Ewv2_crp_level)
gen log_Ewv4_crp_level=log(Ewv4_crp_level)

* reverse HDL scores

* HDL cholesterol was reverse scored, so that for all biomarkers higher scores represent greater cardiometabolic dysfunction

findit revrs

revrs Ewv2_hdl_level Ewv4_hdl_level



* rename var of interest to shorter names (max 8 characters)

* multiple renaming
findit renvars


renvars Ewv2_cesd_score Ewv2_depressive_symptoms Ewv2_cesd_happy_rand Ewv2_cesd_enlife_rand Ewv2_cesd_depressed_rand Ewv2_cesd_effort_rand Ewv2_cesd_sleep_rand Ewv2_cesd_lonely_rand Ewv2_cesd_sad_rand Ewv2_cesd_going_rand Ewv2_crp Ewv2_hdl_cholesterol Ewv2_obesity_waist Ewv2_systolic_bp Ewv2_diastolic_bp Ewv2_diabetes_diagnosed Ewv2_HbA1c log_Ewv2_crp_level revEwv2_hdl_level Ewv2_waist Ewv2_systolic_mean Ewv2_diastolic_mean Ewv2_HbA1c_level Ewv4_cesd_sumscore_rand Ewv4_depressive_symptoms Ewv4_cesd_happy_rand Ewv4_cesd_enlife_rand Ewv4_cesd_depressed_rand Ewv4_cesd_effort_rand Ewv4_cesd_sleep_rand Ewv4_cesd_lonely_rand Ewv4_cesd_sad_rand Ewv4_cesd_going_rand Ewv4_crp Ewv4_hdl_cholesterol Ewv4_obesity_waist Ewv4_systolic_bp Ewv4_diastolic_bp Ewv4_diabetes_diagnosed Ewv4_HbA1c_who log_Ewv4_crp_level revEwv4_hdl_level Ewv4_waist Ewv4_systolic_mean Ewv4_diastolic_mean Ewv4_HbA1c_level   Ewv6_anydementia_iqcode_report Ewv6_anydementia_report E_age E_sex E_eduaction E_maritalstatus_4cat E_wealthquintiles E_smoking_3cat E_alcohol_status E_cvd_comorbidity \ cesdsc1 cesddr1 happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 lcrp1 lhdl1 lobese1 lsbp1 ldbp1 lhba1c1 cesdsc2 cesddr2 happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2 lcrp2 lhdl2 lobese2 lsbp2 ldbp2 lhba1c2 dem noiq_dem age sex educ marital wealth smoke alcohol cvd





* Corrrelation matrix of the CM and depression variables

* to create quality table in word - asdoc -
* https://www.youtube.com/watch?v=XHBl6PHfOzs&ab_channel=StataProfessor

help asdoc 

asdoc pwcorr happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2, star(.05)


asdoc pwcorr crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2, star(.05)


* Corrrelation matrix of the categorical (birnary) Cardiometabolic and depression domains

/*

There are three metrics that are commonly used to calculate the correlation between categorical variables:

1. Tetrachoric Correlation: Used to calculate the correlation between binary categorical variables.

2. Polychoric Correlation: Used to calculate the correlation between ordinal categorical variables.

3. Cramer’s V: Used to calculate the correlation between nominal categorical variables.

tetrachoric computes estimates of the tetrachoric correlation coefficients of the binary variables in varlist. All of these variables should be 0, 1, or missing values.

*/


tetrachoric happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2, star(.05)

tetrachoric crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2, star(.05)




* KEEP SEM MODEL VARIABLES

keep idauniq w2wtnur w2wtbld ///
happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 ///
cesdsc1 cesddr1 ///
lcrp1 crp1 lhdl1 hdl1 lobese1 obese1 lsbp1 sbp1 ldbp1 dbp1 ///
diab1 lhba1c1 hba1c1 ///
happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2 ///
cesdsc2 cesddr2 ///
lcrp2 crp2 lhdl2 hdl2 lobese2 obese2 lsbp2 sbp2 ldbp2 dbp2 ///
diab2 lhba1c2 hba1c2 ///
dem noiq_dem age sex educ marital wealth smoke alcohol cvd



*** To read by Mplus -> Open in spss - missing data (-99) - save as csv - tab delimited - tick do not write var names on the first linear



*** convert from stata (dat) to mplus (dta)

help stata2mplus 


stata2mplus using S:\Research\pkstudies\Study4_depr_cardio_path\ELSA\elsa_sem, missing (-99) replace





* General baseline characteristics of ELSA participants by dementia status
* crosstabs categ var (frequencies and chi2) !report column percentage!
* oneway ANOVA cont var (mean, sd)


* Socio-demographics
ttest age, by(dem)
ta sex dem, chi2 column row 
ta educ dem, chi2 column row
ta marital dem, chi2 column row
ta wealth dem, chi2 column row
* Cardiometabolic factors
ta crp1 dem, chi2 column row
ta hdl1 dem, chi2 column row
ta obese1 dem, chi2 column row
ta sbp1 dem, chi2 column row
ta dbp1 dem, chi2 column row
ta diab1 dem, chi2 column row
ta hba1c1 dem, chi2 column row
* Lifestyle/health factors
ta smoke dem, chi2 column row
ta Ewv6_physicalactivity Ewv6_anydementia_iqcode_report, chi2 column row
ta alcohol dem, chi2 column row
ta cvd dem, chi2 column row
* Mental health
ttest cesdsc1, by(dem)
ta cesddr1 dem, chi2 column row





*** SENSITIVITY ANALYSES ***

/*

1) Stratify by age 
Age groups: 1) young old (< 70) 2) old old (>= 70)

2) Exclude dementia cases identified with IQCODE

3) Exclude those with CVDs at baseline

4) Mediation analysis on complete cases

*/


* Stratify by age


gen age70=1 if age < 70
replace age70=2 if age >=70 & !missing(age)

label var age70 "Age groups <70 young-old / 70 old-old"
lab def age_group 1 "young" 2 "old"
lab val age70 age_group

tab age70



*** MISSING DATA ***


search mdesc


* examining number of missing values vs non-missing in each variable

mdesc age sex educ marital wealth smoke alcohol cvd happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2 crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2




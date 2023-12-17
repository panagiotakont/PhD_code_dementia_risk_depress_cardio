/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY 2: Mediating effects of depressive symptoms and cardiometabolic health on dementia development

Method of analysis: 
Path Analysis (SEM) 


MODEL 

T1: EXPOSURE: DEPRESSIVE SYMPTOMS WV2 (BASELINE, 2008)
              CARDIOMETABOLIC RISK WV2 (BASELINE, 2008)
T2: MEDIATOR: DEPRESSIVE SYMPTOMS WV4 (2010)
              CARDIOMETABOLIC RISK: WV4 (2008)
T3: OUTCOME: DEMENTIA WV6 (2012)

COVARIATES ADJUSTMENT FOR PATH MODELS: WV8


*/



* KEEP NECESSARY VARIABLES

keep HHID PN RAHHIDPN HHIDPN ///
H_sex H_age H_eduaction_yrs H_eduaction H_maritalstatus_4cat H_wealthquintiles ///
H_ethnicity H_hispanic_ethnicity ///
H_smoking_2cat H_smoking_3cat H_physicalactivity H_alcohol_freq H_alcohol_status ///
H_cvd_comorbidity Hwv8_cognition Hwv8_memory Hwv8_loneliness_quintiles ///
Hwv8_cesd_depressed Hwv8_cesd_effort Hwv8_cesd_sleep ///
Hwv8_cesd_happy Hwv8_cesd_lonely Hwv8_cesd_enlife Hwv8_cesd_sad ///
Hwv8_cesd_going Hwv8_cesd_score Hwv8_depressive_symptoms ///
Hwv10_cesd_depressed Hwv10_cesd_effort Hwv10_cesd_sleep ///
Hwv10_cesd_happy Hwv10_cesd_lonely Hwv10_cesd_enlife ///
Hwv10_cesd_sad Hwv10_cesd_going Hwv10_cesd_score Hwv10_depressive_symptoms ///
Hwv9_cesd_score Hwv9_depressive_symptoms ///
Hwv11_cesd_score Hwv11_depressive_symptoms ///
Hwv12_cesd_score Hwv12_depressive_symptoms ///
Hwv13_cesd_score Hwv13_depressive_symptoms ///
Hwv14_cesd_sumscore Hwv14_depressive_symptoms ///
Hwv8_crp_level Hwv8_crp Hwv8_hdl_level Hwv8_hdl ///
Hwv8_waist Hwv8_obesity_waist ///
Hwv8_bmi_score Hwv8_obesity ///
Hwv8_systolic_mean Hwv8_diastolic_mean Hwv8_systolic_bp Hwv8_diastolic_bp Hwv8_bp ///
Hwv8_diabetes_reportevr Hwv8_HbA1c_level Hwv8_HbA1c Hwv8_glycemia ///
Hwv10_crp_level Hwv10_crp Hwv10_hdl_level Hwv10_hdl ///
Hwv10_waist Hwv10_obesity_waist Hwv10_bmi_score ///
Hwv10_obesity Hwv10_systolic_mean Hwv10_diastolic_mean ///
Hwv10_systolic_bp Hwv10_diastolic_bp Hwv10_bp ///
Hwv10_diabetes_reportevr Hwv10_HbA1c_level Hwv10_HbA1c Hwv10_glycemia ///
Hwv8_memory_report Hwv9_memory_report Hwv10_anydementia_report ///
Hwv11_anydementia_report Hwv12_anydementia_report ///
Hwv13_anydementia_report Hwv14_anydementia_report ///
Hwv8_interview_date Hwv9_interview_date Hwv10_interview_date ///
Hwv11_interview_date Hwv12_interview_date Hwv13_interview_date Hwv14_interview_date ///
Hwv9to14_dementia_sum Hwv9to14_dementia_event ///
Hwv9to14_newdementia_or_lastinte Hwv9to14_dementia_free_date H_time_dementia_months ///
H_time_dementia_midpoint H_time_dementia_midpoint_final H_time_of_event_dementia ///
Hwv12to14_dementia_sum Hwv12to14_dementia_event Hwv12_anydementia_report ///
Hwv12to14_newdementia_or_lastint Hwv12to14_time_dementia_months ///
Hwv12to14_dementia_free_date Hwv12to14_time_dementia_midpoint ///
Hwv12to14_time_dementia_midpoin0 Hwv12to14_time_of_event_dementia 






/* Prepare variables for SEM dataset 

Binary variables of depressive symptoms and binary and continious cardiometabolic markers at wave 8 and 10

EXPOSURE 

DEPRESSION T1

Hwv8_cesd_depressed Hwv8_cesd_effort Hwv8_cesd_sleep Hwv8_cesd_happy Hwv8_cesd_lonely Hwv8_cesd_enlife Hwv8_cesd_sad Hwv8_cesd_going

** Hwv8_cesd_happy Hwv8_cesd_enlife are already reverse coded (0= yes 1=no)


CARDIO HEALTH T1

CRP: Hwv8_crp_level Hwv8_crp
HDL cholesterol: Hwv8_hdl_level Hwv8_hdl
Obesity by waist cir: Hwv8_waist Hwv8_obesity_waist
SBP: Hwv8_systolic_mean Hwv8_systolic_bp
DBP: Hwv8_diastolic_mean Hwv8_systolic_bp
Diabetes: Hwv8_diabetes_reportevr
HbA1c: Hwv8_HbA1c_level Hwv8_HbA1c

MEDIATORS

DEPRESSION T2

Hwv10_cesd_depressed Hwv10_cesd_effort Hwv10_cesd_sleep Hwv10_cesd_happy Hwv10_cesd_lonely Hwv10_cesd_enlife Hwv10_cesd_sad Hwv10_cesd_going

** Hwv10_cesd_happy Hwv10_cesd_enlife are already reverse coded (0= yes 1=no)


CARDIO HEALTH T2

CRP: Hwv10_crp_level Hwv10_crp
HDL cholesterol: Hwv10_hdl_level Hwv10_hdl
Obesity by waist cir: Hwv10_waist Hwv10_obesity_waist
SBP: Hwv10_systolic_mean Hwv10_systolic_bp
DBP: Hwv10_diastolic_mean Hwv10_diastolic_bp
Diabetes: Hwv10_diabetes_reportevr
HbA1c: Hwv10_HbA1c_level Hwv10_HbA1c


OUTCOME 

Dementia incidence: Hwv12_anydementia_report (binary)
					

*/




			
	



*** Descriptive stats of Exposure, Mediator and Outcome at time 1 (wave 8 baseline)

* depression


tabulate Hwv8_depressive_symptoms  
summarize Hwv8_depressive_symptoms

misstable summarize Hwv8_depressive_symptoms
misstable patterns Hwv8_depressive_symptoms

*crp (invalid cases > 100) 

tabulate Hwv8_crp_level  
summarize Hwv8_crp_level, detail
histogram Hwv8_crp_level, discrete frequency normal
sktest Hwv8_crp_level

misstable summarize Hwv8_crp_level
misstable patterns Hwv8_crp_level

tabulate Hwv8_crp  
summarize Hwv8_crp

misstable summarize Hwv8_crp
misstable patterns Hwv8_crp


*hdl

tabulate Hwv8_hdl_level
summarize Hwv8_hdl_level, detail
histogram Hwv8_hdl_level, discrete frequency normal
sktest Hwv8_hdl_level

misstable summarize Hwv8_hdl_level
misstable patterns Hwv8_hdl_level


tabulate Hwv8_hdl
summarize Hwv8_hdl

misstable summarize Hwv8_hdl
misstable patterns Hwv8_hdl


*obesity waist (invalid > 130)


tabulate Hwv8_waist
summarize Hwv8_waist, detail
histogram Hwv8_waist, discrete frequency normal
sktest Hwv8_waist


misstable summarize Hwv8_waist
misstable patterns Hwv8_waist

tabulate Hwv8_obesity_waist
summarize Hwv8_obesity_waist

misstable summarize Hwv8_obesity_waist
misstable patterns Hwv8_obesity_waist


*sbp (invalid > 300)

tabulate Hwv8_systolic_mean
summarize Hwv8_systolic_mean, detail
histogram Hwv8_systolic_mean, discrete frequency normal
sktest Hwv8_systolic_mean


misstable summarize Hwv8_systolic_mean
misstable patterns Hwv8_systolic_mean


tabulate Hwv8_systolic_bp
summarize Hwv8_systolic_bp

misstable summarize Hwv8_systolic_bp
misstable patterns Hwv8_systolic_bp



*dbp (invalid > 300)


tabulate Hwv8_diastolic_mean
summarize Hwv8_diastolic_mean, detail
histogram Hwv8_diastolic_mean, discrete frequency normal
sktest Hwv8_diastolic_mean

misstable summarize Hwv8_diastolic_mean
misstable patterns Hwv8_diastolic_mean

tabulate Hwv8_diastolic_bp
summarize Hwv8_diastolic_bp

misstable summarize Hwv8_diastolic_bp
misstable patterns Hwv8_diastolic_bp


* diabetes (cannot be measured in z-scores)

tabulate Hwv8_diabetes_reportevr
summarize Hwv8_diabetes_reportevr

misstable summarize Hwv8_diabetes_reportevr
misstable patterns Hwv8_diabetes_reportevr


* HbA1c

tabulate Hwv8_HbA1c_level
summarize Hwv8_HbA1c_level, detail
histogram Hwv8_HbA1c_level, discrete frequency normal
sktest Hwv8_HbA1c_level


misstable summarize Hwv8_HbA1c_level
misstable patterns Hwv8_HbA1c_level


tabulate Hwv8_HbA1c
summarize Hwv8_HbA1c

misstable summarize Hwv8_HbA1c
misstable patterns Hwv8_HbA1c



* dementia wave 8

tabulate Hwv8_memory_report
summarize Hwv8_memory_report

misstable summarize Hwv8_memory_report
misstable patterns Hwv8_memory_report






*** Descriptive stats of Exposure, Mediator and Outcome at time 2 (wave 10)

*depression

tabulate Hwv10_depressive_symptoms  
summarize Hwv10_depressive_symptoms

misstable summarize Hwv10_depressive_symptoms
misstable patterns Hwv10_depressive_symptoms

*crp (invalid cases >100)

tabulate Hwv10_crp_level  
summarize Hwv10_crp_level, detail
histogram Hwv10_crp_level, discrete frequency normal
sktest Hwv10_crp_level

misstable summarize Hwv10_crp_level
misstable patterns Hwv10_crp_level

tabulate Hwv10_crp  
summarize Hwv10_crp

misstable summarize Hwv10_crp
misstable patterns Hwv10_crp


*hdl

tabulate Hwv10_hdl_level
summarize Hwv10_hdl_level, detail
histogram Hwv10_hdl_level, discrete frequency normal
sktest Hwv10_hdl_level

misstable summarize Hwv10_hdl_level
misstable patterns Hwv10_hdl_level


tabulate Hwv10_hdl
summarize Hwv10_hdl

misstable summarize Hwv10_hdl
misstable patterns Hwv10_hdl


*obesity waist (invalid > 130)


tabulate Hwv10_waist
summarize Hwv10_waist, detail
histogram Hwv10_waist, discrete frequency normal
sktest Hwv10_waist


misstable summarize Hwv10_waist
misstable patterns Hwv10_waist

tabulate Hwv10_obesity_waist
summarize Hwv10_obesity_waist

misstable summarize Hwv10_obesity_waist
misstable patterns Hwv10_obesity_waist


*sbp (invalid > 300)

tabulate Hwv10_systolic_mean
summarize Hwv10_systolic_mean, detail
histogram Hwv10_systolic_mean, discrete frequency normal
sktest Hwv10_systolic_mean


misstable summarize Hwv10_systolic_mean
misstable patterns Hwv10_systolic_mean


tabulate Hwv10_systolic_bp
summarize Hwv10_systolic_bp

misstable summarize Hwv10_systolic_bp
misstable patterns Hwv10_systolic_bp



*dbp (invalid > 300)


tabulate Hwv10_diastolic_mean
summarize Hwv10_diastolic_mean, detail
histogram Hwv10_diastolic_mean, discrete frequency normal
sktest Hwv10_diastolic_mean

misstable summarize Hwv10_diastolic_mean
misstable patterns Hwv10_diastolic_mean

tabulate Hwv10_diastolic_bp
summarize Hwv10_diastolic_bp

misstable summarize Hwv10_diastolic_bp
misstable patterns Hwv10_diastolic_bp


* diabetes (cannot be measured in z-scores)

tabulate Hwv10_diabetes_reportevr
summarize Hwv10_diabetes_reportevr

misstable summarize Hwv10_diabetes_reportevr
misstable patterns Hwv10_diabetes_reportevr


* HbA1c

tabulate Hwv10_HbA1c_level
summarize Hwv10_HbA1c_level, detail
histogram Hwv10_HbA1c_level, discrete frequency normal
sktest Hwv10_HbA1c_level


misstable summarize Hwv10_HbA1c_level
misstable patterns Hwv10_HbA1c_level


tabulate Hwv10_HbA1c
summarize Hwv10_HbA1c

misstable summarize Hwv10_HbA1c
misstable patterns Hwv10_HbA1c


*dementia wave 9 and 10


tabulate Hwv9_memory_report 
summarize Hwv9_memory_report 

misstable summarize Hwv9_memory_report 
misstable patterns Hwv9_memory_report 


tabulate Hwv10_anydementia_report 
summarize Hwv10_anydementia_report 

misstable summarize Hwv10_anydementia_report 
misstable patterns Hwv10_anydementia_report 





*** CLEANING DATA 


* drop dementia cases at wv8, 9 and 10 and missing data at baseline

drop if Hwv8_memory_report==1
* (226 observations deleted)

drop if Hwv8_memory_report== .
* (0 observations deleted)

* drop dementia cases at wave 3 and 4

drop if Hwv9_memory_report==1
* (110 observations deleted)

drop if Hwv10_anydementia_report==1
* (105 observations deleted)




* drop invalid ca cases t1 and t2

* drop CRP > 100 

drop if Hwv8_crp_level > 100 & Hwv8_crp_level < 300
* (1 observations deleted)


drop if Hwv10_crp_level > 100 & Hwv10_crp_level < 300
* (7 observations deleted)


* drop SBP > 300

drop if Hwv8_systolic_mean > 300 & Hwv8_systolic_mean < 1000
* (100 observations deleted)

* drop DBP > 300

drop if Hwv8_diastolic_mean > 300 & Hwv8_diastolic_mean < 1000
* (21 observations deleted)

* drop SBP > 300

drop if Hwv10_systolic_mean > 300 & Hwv10_systolic_mean < 1000
* (126 observations deleted)

* drop DBP > 300

drop if Hwv10_diastolic_mean > 300 & Hwv10_diastolic_mean < 1000
* (0 observations deleted)

* drop obesity > 130

drop if Hwv10_waist > 130 & Hwv10_waist < 500
* (1 observation deleted)

* drop obesity <20

drop if Hwv10_waist < 20
* (5 observations deleted)




* drop obs with no records on dementia at wave 12


drop if Hwv12_anydementia_report== .
* (1637 observations deleted)



* ANALYTIC SAMPLE -> 4396 




*** Recoding crp and hdl of interest


* log transform crp (left-skewed)

gen log_Hwv8_crp_level=log(Hwv8_crp_level)
gen log_Hwv10_crp_level=log(Hwv10_crp_level)

* reverse HDL scores

* HDL cholesterol was reverse scored, so that for all biomarkers higher scores represent greater cardiometabolic dysfunction

findit revrs

revrs Hwv8_hdl_level Hwv10_hdl_level


*------------------*




* rename var of interest to shorter names (max 8 characters)

* multiple renaming
findit renvars


renvars Hwv8_cesd_score Hwv8_depressive_symptoms Hwv8_cesd_happy Hwv8_cesd_enlife Hwv8_cesd_depressed Hwv8_cesd_effort Hwv8_cesd_sleep Hwv8_cesd_lonely Hwv8_cesd_sad Hwv8_cesd_going Hwv8_crp Hwv8_hdl Hwv8_obesity_waist Hwv8_systolic_bp Hwv8_diastolic_bp Hwv8_diabetes_reportevr Hwv8_HbA1c log_Hwv8_crp_level revHwv8_hdl_level Hwv8_waist Hwv8_systolic_mean Hwv8_diastolic_mean Hwv8_HbA1c_level Hwv10_cesd_score Hwv10_depressive_symptoms Hwv10_cesd_happy Hwv10_cesd_enlife Hwv10_cesd_depressed Hwv10_cesd_effort Hwv10_cesd_sleep Hwv10_cesd_lonely Hwv10_cesd_sad Hwv10_cesd_going Hwv10_crp Hwv10_hdl Hwv10_obesity_waist Hwv10_systolic_bp Hwv10_diastolic_bp Hwv10_diabetes_reportevr Hwv10_HbA1c log_Hwv10_crp_level revHwv10_hdl_level Hwv10_waist Hwv10_systolic_mean Hwv10_diastolic_mean Hwv10_HbA1c_level Hwv12_anydementia_report H_age H_sex H_eduaction H_maritalstatus_4cat H_wealthquintiles H_smoking_3cat H_alcohol_status H_cvd_comorbidity \ cesdsc1 cesddr1 happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 lcrp1 lhdl1 lobese1 lsbp1 ldbp1 lhba1c1 cesdsc2 cesddr2 happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2 lcrp2 lhdl2 lobese2 lsbp2 ldbp2 lhba1c2 dem age sex educ marital wealth smoke alcohol cvd




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

keep happy1 enlife1 depress1 effort1 sleep1 lonely1 sad1 going1 ///
cesdsc1 cesddr1 ///
crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 lcrp1 lhdl1 ///
lobese1 lsbp1 ldbp1 lhba1c1 ///
happy2 enlife2 depress2 effort2 sleep2 lonely2 sad2 going2 ///
cesdsc2 cesddr2 ///
crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2 lcrp2 ///
lhdl2 lobese2 lsbp2 ldbp2 lhba1c2 ///
dem age sex educ marital wealth smoke alcohol cvd




*** To read by Mplus -> Open in spss - missing data (-9) - save as csv - tab delimited - tick do not write var names on the first linear


*** convert from stata (dat) to mplus (dta)


help stata2mplus 


stata2mplus using S:\Research\pkstudies\Study4_depr_cardio_path\HRS\hrs_sem, missing (-99) replace 






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
ta Hwv12_physicalactivity Hwv12_anydementia_report, chi2 column row
ta alcohol dem, chi2 column row
ta cvd dem, chi2 column row
* Mental health
ttest cesdsc1, by(dem)
ta cesddr1 dem, chi2 column row




*** SENSITIVITY ANALYSES ***

/*

1) Stratify by age 
generate age group variable
Age groups: 1) young old (< 70) 2) old old (>= 70)

2) Exclude those with CVDs at baseline

3) Mediation analysis on complete cases

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







/*

PHD PROJECT: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

STUDY 2: Mediating effects of depressive symptoms and cardiometabolic health on dementia development

Method of analysis: 
Path Analysis (SEM) 


MODEL 

T1: EXPOSURE: DEPRESSIVE SYMPTOMS WV1 (BASELINE, 2011)
              CARDIOMETABOLIC RISK WV1 (BASELINE, 2011)
T2: MEDIATOR: DEPRESSIVE SYMPTOMS WV3 (2015)
              CARDIOMETABOLIC RISK: WV3 (2015)
T3: OUTCOME: DEMENTIA WV4 (2018)

COVARIATES ADJUSTMENT FOR PATH MODELS: WV1


*/


* KEEP NECESSARY VARIABLES

keep ID id_12char bloodweight ///
C_sex C_age C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles ///
Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity Cwv1_memory_wordrecall ///
Cwv1_cesd_score Cwv1_depressive_symptoms ///
Cwv1_cesd_depressed Cwv1_cesd_effort Cwv1_cesd_sleep ///
Cwv1_cesd_lonely Cwv1_cesd_bother Cwv1_cesd_going ///
Cwv1_cesd_mind Cwv1_cesd_fear Cwv1_cesd_happy Cwv1_cesd_hope ///
Cwv3_cesd_score Cwv3_depressive_symptoms ///
Cwv3_cesd_depressed Cwv3_cesd_effort Cwv3_cesd_sleep ///
Cwv3_cesd_lonely Cwv3_cesd_bother Cwv3_cesd_going ///
Cwv3_cesd_mind Cwv3_cesd_fear Cwv3_cesd_happy Cwv3_cesd_hope ///
Cwv1_crp_level Cwv1_crp Cwv1_hdl_level Cwv1_hdl_cholesterol ///
Cwv1_waist Cwv1_obesity_waist Cwv1_bmi_score ///
Cwv1_systolic_mean Cwv1_diastolic_mean Cwv1_systolic_bp Cwv1_diastolic_bp ///
Cwv1_HbA1c_level Cwv1_HbA1c Cwv1_diabetes_report ///
Cwv3_crp_level Cwv3_crp Cwv3_hdl_level Cwv3_hdl_cholesterol ///
Cwv3_waist Cwv3_obesity_waist Cwv3_bmi_score Cwv3_systolic_mean ///
Cwv3_diastolic_mean Cwv3_systolic_bp Cwv3_diastolic_bp ///
Cwv3_HbA1c_level Cwv3_HbA1c Cwv3_diabetes_report ///
Cwv1_dementia_report Cwv2_dementia_report ///
Cwv3_dementia_report Cwv4_self_info_dementia 






/* Prepare variables for SEM dataset 

Variables of depressive symptoms and binary and continous cardiometabolic markers at wave 1 and 3

EXPOSURE 

DEPRESSION T1 (4 CATEG)

Cwv1_cesd_depressed Cwv1_cesd_effort Cwv1_cesd_sleep Cwv1_cesd_lonely Cwv1_cesd_bother Cwv1_cesd_going Cwv1_cesd_mind Cwv1_cesd_fear 
Cwv1_cesd_happy Cwv1_cesd_hope



CARDIO HEALTH T1

CRP: Cwv1_crp_level Cwv1_crp
HDL cholesterol: Cwv1_hdl_level Cwv1_hdl_cholesterol 
Obesity by waist cir: Cwv1_waist Cwv1_obesity_waist
SBP: Cwv1_systolic_mean Cwv1_systolic_bp
DBP: Cwv1_diastolic_mean Cwv1_diastolic_bp
Diabetes: Cwv1_diabetes_report
HbA1c: Cwv1_HbA1c_level Cwv1_HbA1c



MEDIATORS

DEPRESSION T2 (4 CATEG)

Cwv3_cesd_depressed Cwv3_cesd_effort Cwv3_cesd_sleep Cwv3_cesd_lonely Cwv3_cesd_bother Cwv3_cesd_going Cwv3_cesd_mind Cwv3_cesd_fear Cwv3_cesd_happy Cwv3_cesd_hope



CARDIO HEALTH T2

CRP: Cwv3_crp_level Cwv3_crp
HDL cholesterol: Cwv3_hdl_level Cwv3_hdl_cholesterol
Obesity by waist cir: Cwv3_waist Cwv3_obesity_waist
SBP: Cwv3_systolic_mean Cwv3_systolic_bp 
DBP: Cwv3_diastolic_mean Cwv3_diastolic_bp
Diabetes: Cwv3_diabetes_report
HbA1c: Cwv3_HbA1c_level Cwv3_HbA1c


OUTCOME 
Dementia incidence: Cwv4_self_info_dementia (binary)
					

*/




		


*** Descriptive stats of Exposure, Mediator and Outcome at time 1 (wave 1 baseline)

* depression


tabulate Cwv1_depressive_symptoms  
summarize Cwv1_depressive_symptoms

misstable summarize Cwv1_depressive_symptoms
misstable patterns Cwv1_depressive_symptoms


*crp 

tabulate Cwv1_crp_level   
summarize Cwv1_crp_level 

tabulate Cwv1_crp  
summarize Cwv1_crp

misstable summarize Cwv1_crp
misstable patterns Cwv1_crp



*hdl

tabulate Cwv1_hdl_level
summarize Cwv1_hdl_level

tabulate Cwv1_hdl_cholesterol
summarize Cwv1_hdl_cholesterol

misstable summarize Cwv1_hdl_cholesterol
misstable patterns Cwv1_hdl_cholesterol



*obesity waist

tabulate Cwv1_waist 
summarize Cwv1_waist 

tabulate Cwv1_obesity_waist
summarize Cwv1_obesity_waist

misstable summarize Cwv1_obesity_waist
misstable patterns Cwv1_obesity_waist


*sbp

tabulate Cwv1_systolic_mean
summarize Cwv1_systolic_mean

tabulate Cwv1_systolic_bp
summarize Cwv1_systolic_bp

misstable summarize Cwv1_systolic_bp
misstable patterns Cwv1_systolic_bp


*dbp

tabulate  Cwv1_diastolic_mean
summarize  Cwv1_diastolic_mean

tabulate  Cwv1_diastolic_bp
summarize  Cwv1_diastolic_bp

misstable summarize  Cwv1_diastolic_bp
misstable patterns  Cwv1_diastolic_bp


* diabetes

tabulate Cwv1_diabetes_report
summarize Cwv1_diabetes_report

misstable summarize Cwv1_diabetes_report
misstable patterns Cwv1_diabetes_report


* HbA1c

tabulate Cwv1_HbA1c_level
summarize Cwv1_HbA1c_level

tabulate Cwv1_HbA1c
summarize Cwv1_HbA1c

misstable summarize Cwv1_HbA1c
misstable patterns Cwv1_HbA1c



* dementia wave 1

tabulate Cwv1_dementia_report
summarize Cwv1_dementia_report

misstable summarize Cwv1_dementia_report
misstable patterns Cwv1_dementia_report







*** Descriptive stats of Exposure, Mediator and Outcome at time 2 (wave 3)

*depression

tabulate Cwv3_depressive_symptoms  
summarize Cwv3_depressive_symptoms

misstable summarize Cwv3_depressive_symptoms
misstable patterns Cwv3_depressive_symptoms


*crp 

tabulate Cwv3_crp_level  
summarize Cwv3_crp_level

tabulate Cwv3_crp  
summarize Cwv3_crp

misstable summarize Cwv3_crp
misstable patterns Cwv3_crp


*hdl

tabulate Cwv3_hdl_level
summarize Cwv3_hdl_level

tabulate Cwv3_hdl_cholesterol
summarize Cwv3_hdl_cholesterol

misstable summarize Cwv3_hdl_cholesterol
misstable patterns Cwv3_hdl_cholesterol


*obesity waist

tabulate Cwv3_waist
summarize Cwv3_waist

tabulate Cwv3_obesity_waist
summarize Cwv3_obesity_waist

misstable summarize Cwv3_obesity_waist
misstable patterns Cwv3_obesity_waist


*sbp

tabulate Cwv3_systolic_mean
summarize Cwv3_systolic_mean

tabulate Cwv3_systolic_bp
summarize Cwv3_systolic_bp

misstable summarize Cwv3_systolic_bp
misstable patterns Cwv3_systolic_bp



*dbp

tabulate Cwv3_diastolic_mean
summarize Cwv3_diastolic_mean

tabulate Cwv3_diastolic_bp
summarize Cwv3_diastolic_bp

misstable summarize Cwv3_diastolic_bp
misstable patterns Cwv3_diastolic_bp


*diabetes

tabulate Cwv3_diabetes_report
summarize Cwv3_diabetes_report

misstable summarize Cwv3_diabetes_report
misstable patterns Cwv3_diabetes_report


*HbA1c

tabulate Cwv3_HbA1c_level
summarize Cwv3_HbA1c_level

tabulate Cwv3_HbA1c
summarize Cwv3_HbA1c

misstable summarize Cwv3_HbA1c
misstable patterns Cwv3_HbA1c


*dementia wave 2 and 3


tabulate Cwv2_dementia_report 
summarize Cwv2_dementia_report 

misstable summarize Cwv2_dementia_report 
misstable patterns Cwv2_dementia_report 


tabulate Cwv3_dementia_report 
summarize Cwv3_dementia_report 

misstable summarize Cwv3_dementia_report 
misstable patterns Cwv3_dementia_report 







*** CLEANING DATA 


* drop dementia cases at wv1,2 and 3 and missing data at baseline

drop if Cwv1_dementia_report==1
* (267 observations deleted)

drop if Cwv1_dementia_report== .
* (88 observations deleted)

* drop dementia cases at wave 3 and 4

drop if Cwv2_dementia_report==1
* (80 observations deleted)

drop if Cwv3_dementia_report==1
* (101 observations deleted)




* drop invalid ca cases t1 and t2

* drop CRP > 100 

drop if Cwv1_crp_level > 100 & Cwv1_crp_level < 300
* (13 observations deleted)


drop if Cwv3_crp_level > 100 & Cwv3_crp_level < 300
* (4 observations deleted)


* drop sbp > 900 

drop if Cwv1_systolic_mean > 900 & Cwv1_systolic_mean < 999
* (14 observations deleted)


drop if Cwv3_systolic_mean > 900 & Cwv3_systolic_mean < 999
* (22 observations deleted)


* drop obesity > 200

drop if Cwv3_waist > 200 & Cwv3_waist < 900
* (0 observations deleted)




* drop obs with no records on dementia at follow-up wave 4

drop if Cwv4_self_info_dementia== .
* (5393 observations deleted)


* ANALYTIC SAMPLE -> 5865 




*** Recoding crp and hdl of interest


* log transform crp (left-skewed)

gen log_Cwv1_crp_level=log(Cwv1_crp_level)
gen log_Cwv3_crp_level=log(Cwv3_crp_level)


* reverse HDL scores

findit revrs

revrs Cwv1_hdl_level Cwv3_hdl_level

* ---------------- *



* rename var of interest to shorter names (max 8 characters)

* multiple renaming
findit renvars

renvars Cwv1_cesd_score Cwv1_depressive_symptoms Cwv1_cesd_depressed Cwv1_cesd_effort Cwv1_cesd_sleep Cwv1_cesd_lonely Cwv1_cesd_bother Cwv1_cesd_going Cwv1_cesd_mind Cwv1_cesd_fear Cwv1_cesd_happy Cwv1_cesd_hope log_Cwv1_crp_level Cwv1_crp revCwv1_hdl_level Cwv1_hdl_cholesterol Cwv1_waist Cwv1_obesity_waist Cwv1_systolic_mean Cwv1_systolic_bp Cwv1_diastolic_mean Cwv1_diastolic_bp Cwv1_diabetes_report Cwv1_HbA1c_level Cwv1_HbA1c Cwv3_cesd_score Cwv3_depressive_symptoms Cwv3_cesd_depressed Cwv3_cesd_effort Cwv3_cesd_sleep Cwv3_cesd_lonely Cwv3_cesd_bother Cwv3_cesd_going Cwv3_cesd_mind Cwv3_cesd_fear Cwv3_cesd_happy Cwv3_cesd_hope log_Cwv3_crp_level Cwv3_crp revCwv3_hdl_level Cwv3_hdl_cholesterol Cwv3_waist Cwv3_obesity_waist Cwv3_systolic_mean Cwv3_systolic_bp Cwv3_diastolic_mean Cwv3_diastolic_bp Cwv3_diabetes_report Cwv3_HbA1c_level Cwv3_HbA1c Cwv4_self_info_dementia C_age C_sex C_eduaction C_maritalstatus_4cat Cwv1_netwealth_quintiles Cwv1_smoking_3cat Cwv1_alcohol_status C_cvd_comorbidity \ cesdsc1 cesddr1 depress1 effort1 sleep1 lonely1 bother1 going1 mind1 fear1 happy1 hope1 lcrp1 crp1 lhdl1 hdl1 lobese1 obese1 lsbp1 sbp1 ldbp1 dbp1 diab1 lhba1c1 hba1c1 cesdsc2 cesddr2 depress2 effort2 sleep2 lonely2 bother2 going2 mind2 fear2 happy2 hope2 lcrp2 crp2 lhdl2 hdl2 lobese2 obese2 lsbp2 sbp2 ldbp2 dbp2 diab2 lhba1c2 hba1c2 dem age sex educ marital wealth smoke alcohol cvd


* Corrrelation matrix of the CM and depression variables

* to create quality table in word - asdoc -
* https://www.youtube.com/watch?v=XHBl6PHfOzs&ab_channel=StataProfessor

help asdoc 

asdoc pwcorr depress1 effort1 sleep1 lonely1 bother1 going1 mind1 fear1 happy1 hope1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2, star(.05)

asdoc pwcorr crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 depress2 effort2 sleep2 lonely2 bother2 going2 mind2 fear2 happy2 hope2, star(.05)



* Corrrelation matrix of the categorical (ordinal) Cardiometabolic and depression domains

/*

There are three metrics that are commonly used to calculate the correlation between categorical variables:

1. Tetrachoric Correlation: Used to calculate the correlation between binary categorical variables.

2. Polychoric Correlation: Used to calculate the correlation between ordinal categorical variables.

3. Cramer’s V: Used to calculate the correlation between nominal categorical variables.

tetrachoric computes estimates of the tetrachoric correlation coefficients of the binary variables in varlist. All of these variables should be 0, 1, or missing values.

*/

findit polychoric

polychoric depress1 effort1 sleep1 lonely1 bother1 going1 mind1 fear1 happy1 hope1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2


polychoric crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 depress2 effort2 sleep2 lonely2 bother2 going2 mind2 fear2 happy2 hope2


* KEEP SEM MODEL VARIABLES

keep ID id_12char bloodweight ///
cesdsc1 cesddr1 depress1 effort1 sleep1 lonely1 bother1 ///
going1 mind1 fear1 happy1 hope1 ///
lcrp1 crp1 lhdl1 hdl1 lobese1 obese1 lsbp1 sbp1 ldbp1 dbp1 ///
diab1 lhba1c1 hba1c1 ///
cesdsc2 cesddr2 depress2 effort2 sleep2 lonely2 bother2 ///
going2 mind2 fear2 happy2 hope2 ///
lcrp2 crp2 lhdl2 hdl2 lobese2 obese2 lsbp2 sbp2 ldbp2 dbp2 ///
diab2 lhba1c2 hba1c2 ///
dem age sex educ marital wealth smoke alcohol cvd

*** drop ID, id_12char and bloodweight as these cannot be read by mplus

keep cesdsc1 cesddr1 depress1 effort1 sleep1 lonely1 bother1 ///
going1 mind1 fear1 happy1 hope1 ///
lcrp1 crp1 lhdl1 hdl1 lobese1 obese1 lsbp1 sbp1 ldbp1 dbp1 ///
diab1 lhba1c1 hba1c1 ///
cesdsc2 cesddr2 depress2 effort2 sleep2 lonely2 bother2 ///
going2 mind2 fear2 happy2 hope2 ///
lcrp2 crp2 lhdl2 hdl2 lobese2 obese2 lsbp2 sbp2 ldbp2 dbp2 ///
diab2 lhba1c2 hba1c2 ///
dem age sex educ marital wealth smoke alcohol cvd



*** To read by Mplus -> Open in spss - missing data (-99) - save as csv - tab delimited - tick do not write var names on the first linear



*** convert from stata (dat) to mplus (dta)

help stata2mplus 


stata2mplus using S:\Research\pkstudies\Study4_depr_cardio_path\CHARLS\charls_sem_complete, missing (-99) replace





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
ta Cwv1_physicalactivity Cwv4_self_info_dementia, chi2 column row
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

mdesc age sex educ marital wealth smoke alcohol cvd depress1 effort1 sleep1 lonely1 bother1 going1 mind1 fear1 happy1 hope1 depress2 effort2 sleep2 lonely2 bother2 going2 mind2 fear2 happy2 hope2 crp1 hdl1 obese1 sbp1 dbp1 diab1 hba1c1 crp2 hdl2 obese2 sbp2 dbp2 diab2 hba1c2


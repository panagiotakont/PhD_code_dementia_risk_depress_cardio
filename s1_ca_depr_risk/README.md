This readme file was generated on 2023-12-15 by PANAGIOTA KONTARI


# General Information

## Title of Datasets: 
Code for data analysis of Study 1: Independent and combined effects of depressive symptoms and cardiometabolic risk factors on dementia incidence
Based on three databases:
1. English Longitudinal Study of Ageing (ELSA)
2. Health and Retirement Study (HRS) 
3. China Health and Retirement Longitudinal Study (CHARLS) 
PhD project: 
The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

## Principal Investigator Information
Name: Panagiota Kontari
ORCID:0000-0002-6652-4750
Institution: School of Psychology, University of Surrey
Address: Guildford, United Kingdom
Email: p.kontari@surrey.ac.uk
       panagiota.kontari@gmail.com

## Supervisor and Co-investigator Information
Name: Dr Kimberley Smith
Institution: School of Psychology, University of Surrey
Address: Guildford, United Kingdom
Email: kimberley.j.smith@surrey.ac.uk


Date of data access: from 2018-01-08 to 2023-12-31

Geographic location of data sources: ELSA from England, HRS from United States, CHARLS from China



## Sharing/Access information

Links to other publicly accessible locations of the data: 
The ELSA data were made available through the UK Data Archive, which is freely available and can be accessed at https://ukdataservice.ac.uk/
The HRS data were made available through the HRS website at https://hrs.isr.umich.edu/
The CHARLS data are maintained at the National School of Development of Peking University and are accessible at the study website http://charls.pku.edu.cn/en

Links/relationships to ancillary data sets: 
The ELSA, HRS and CHARLS were designed as sister studies with harmonisation as a goal to facilitate cross-national comparisons. 
Harmonised datasets from the Gateway to Global Aging Data (G2G) platform (https://g2aging.org/) were used where possible. 

Was data derived from another source?
Yes. Data sources: 
ELSA: https://ukdataservice.ac.uk/
HRS: https://hrs.isr.umich.edu/
CHARLS: http://charls.pku.edu.cn/en

Recommended citation for this dataset: 
ELSA: NatCen Social Research, University College London, Institute for Fiscal Studies. (2023). English Longitudinal Study of Ageing. [data series]. 7th Release. UK Data Service. SN: 200011, DOI: http://doi.org/10.5255/UKDA-Series-200011
      Steptoe, A., Breeze, E., Banks, J., & Nazroo, J. (2013). Cohort Profile: The English Longitudinal Study of Ageing. International Journal of Epidemiology, 42(6), 1640. https://doi.org/10.1093/IJE/DYS168
HRS: The HRS (Health and Retirement Study) is sponsored by the National Institute on Aging (grant number NIA U01AG009740) and is conducted by the University of Michigan
     Sonnega, A., Faul, J. D., Ofstedal, M. B., Langa, K. M., Phillips, J. W. R., & Weir, D. R. (2014). Cohort Profile: The Health and Retirement Study (HRS). International Journal of Epidemiology, 43(2), 576. https://doi.org/10.1093/IJE/DYU067
CHARLS: Zhao, Y., Hu, Y., Smith, J. P., Strauss, J., & Yang, G. (2014). Cohort Profile: The China Health and Retirement Longitudinal Study (CHARLS). International Journal of Epidemiology, 43(1), 61. https://doi.org/10.1093/IJE/DYS203


## Data & File Overview

File List: 
1. s1_elsa_ca_depr_20210301.do (open with Stata)
2. s1_hrs_ca_depr_20210401.do (open with Stata)
3. s1_charls_ca_depr_20210501.do (open with Stata)
4. s1_elsa_ca_depr_20210301.pdf (open with PDF)
5. s1_hrs_ca_depr_20210401.pdf (open with PDF)
6. s1_charls_ca_depr_20210501.pdf (open with PDF)

Relationship between files, if important: 
The files include code in stata for the statistical analysis of Study 1. 



## Data-specific information 

Exposure variables:

Binary variables of depressive symptoms and cardiometabolic markers measured at baseline wave
Depressive symptoms
CRP
HDL cholesterol
Obesity by waist cir
systolic Blood pressure
diastolic Blood pressure
Diabetes
HbA1c
cardiometabolic index (categorical 0,1,2,3,4+)
cardiometabolic mutlimorbidity >= 2 cardiometabolic indicators
Grouping of Depressive symptoms-cardiometabolic markers

Outcome Variables
Dementia event
Time-to-event
 
Missing data codes: .

Statistical analysis
Descriptive statistics
Multiple Imputation using chained equations (MICE) 
Cox proportional hazards regression in imputed dataset
Sensitivity analyses:
1) interarction effect of gender and age_group
2) survival analysis stratified by age (<70 years and >=70 years)
3) depressive symptoms as continuous variable and >= 3 and >=4 cardiometabolic multimorbidity
4) exclude participants with CVD	
5) survival analysis without IQCODE (only applicable on ELSA dataset s1_elsa_ca_depr_20210301)
6) survival analysis on complete data
7) survival analysis limiting to 5 year follow-up period (only applicable on ELSA and HRS datasets)

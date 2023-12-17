This readme file was generated on 2023-12-15 by PANAGIOTA KONTARI


GENERAL INFORMATION

Title of Datasets: 
Code for data analysis of Study 2: Mediating effects of depressive symptoms and cardiometabolic health on dementia development
Based on three databases:
1. English Longitudinal Study of Ageing (ELSA)
2. Health and Retirement Study (HRS) 
3. China Health and Retirement Longitudinal Study (CHARLS) 
PhD project: 
The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China

Principal Investigator Information
Name: Panagiota Kontari
ORCID:0000-0002-6652-4750
Institution: School of Psychology, University of Surrey
Address: Guildford, United Kingdom
Email: p.kontari@surrey.ac.uk
       panagiota.kontari@gmail.com

Supervisor and Co-investigator Information
Name: Dr Kimberley Smith
Institution: School of Psychology, University of Surrey
Address: Guildford, United Kingdom
Email: kimberley.j.smith@surrey.ac.uk


Date of data access: from 2018-01-08 to 2023-12-31

Geographic location of data sources: ELSA from England, HRS from United States, CHARLS from China



SHARING/ACCESS INFORMATION

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


DATA & FILE OVERVIEW

File List: 
1. s2_elsa_mediation_20220701.do (open with Stata)
2. s2_elsa_mediation_20220701.pdf (open with PDF)
3. s2 elsa cfa ca depr.inp (open with Mplus)
4. s2 elsa cfa depr ca.inp (open with Mplus)
5. s2 elsa mediation ca depr dem.inp (open with Mplus)
6. s2 elsa mediation ca depr dem adj .inp (open with Mplus)
7. s2 elsa mediation depr ca dem.inp (open with Mplus)
8. s2 elsa mediation depr ca dem adj.inp (open with Mplus)
9. s2_hrs_mediation_20220701.do (open with Stata)
10. s2_hrs_mediation_20220701.pdf (open with PDF)
11. s2 hrs cfa ca depr.inp (open with Mplus)
12. s2 hrs cfa depr ca.inp (open with Mplus)
13. s2 hrs mediation ca depr dem.inp (open with Mplus)
14. s2 hrs mediation ca depr dem adj.inp (open with Mplus)
15. s2 hrs mediation depr ca dem.inp (open with Mplus)
16. s2 hrs mediation depr ca dem adj.inp (open with Mplus)
17. s2_charls_mediation_20220701.do (open with Stata)
18. s2_charls_mediation_20220701.pdf (open with PDF)
19. s2 charls cfa ca depr.inp (open with Mplus)
20. s2 charls cfa depr ca.inp (open with Mplus)
21. s2 charls mediation ca depr.inp (open with Mplus)
22. s2 charls mediation ca depr adj.inp (open with Mplus)
23. s2 charls mediation depr ca.inp (open with Mplus)
24. s2 charls mediation depr ca adj.inp (open with Mplus)

Relationship between files, if important: 
The files include code in stata and mplus for the statistical analysis of Study 2. 



DATA-SPECIFIC INFORMATION 

Mediation Model 1
Exposure T1: Depressive symptoms
Mediator T2: Cardiometabolic health
Outcome T3: Dementia

Mediation Model 2
Exposure T1: Depressive symptoms
Mediator T2: Cardiometabolic health
Outcome T3: Dementia
 
Missing data codes: .

Statistical analysis
Data Preparation
Descriptive statistics
Structural Equation Modelling (SEM)
 - Confirmatory Factor Analysis for two latent constructs: Depressive symptoms and Cardiometabolic health
 - SEM-based Mediation models
Sensitivity analyses:
1) age stratification (<70 years and >=70 years)
2) exclude participants with CVD	
3) exclude dementia cases identified with IQCODE (only applicable on ELSA dataset)
4) mediation analysis on complete data

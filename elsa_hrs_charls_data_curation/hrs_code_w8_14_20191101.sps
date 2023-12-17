* Encoding: UTF-8.

# PhD Project: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China
# Data Curation
# HRS: Health and Retirement Study
Baseline: Wave 8 (2006) 
Follow-up: Wave 9 (2008), Wave 10 (2010), Wave 11 (2012), Wave 12 (2014), Wave 13 (2016), Wave 14 (2018) 


# Participant ID -> HHID , PN, HHIDPN
(keep the same name to merge with other datasets)

# Merging RANDhrs2016 data products with other HRS data 
RAND participant identifier: HHIDPN
Raw HRS data participant identifier: HHID and PN 
Merge on HHID and PN
In the raw HRS data, creat RAHHIDPN, a character version of HHIDPN
Use CONCAT function for concatenating variables

STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).
 


# Sum of different variables if the variables have missing data 
# Transform -> Compute -> Statistical Sum (?,?,..) (replace ? with the variables you want to sum)

# Merge Files/Variable
Data-> Merge files -> Add variables
Select dataset from an open dataset or external one
Merge method 
    *One to many merge based on key values
    Select Lookup table 
        *Dataset...(select this one from where are the variables you want to transfer, so the opposite of the active dataset)
        *Soft files by key values before merging 
Variables
    Excluded (all those you don not need)
    Iincluded (all the variables from active dataset plus those you want to transfer)
    Key variables (idauniq)
OK

# Merging Biomarkers 2006 data (baseline wave) and RAND HRS data


DATASET ACTIVATE DataSet11.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet10.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet11.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.


# Merging Biomarkers 2006 data (baseline wave) and Physical measures (section I) 2006 data (H06I_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files

STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet1.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.

# Merging Biomarkers 2006 data (baseline wave) and Health services and insurance (section N) 2006 data (H06N_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files

STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet1.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.


# Merging Biomarkers 2006 data (baseline wave) and Biomarkers 2010 data (1st follow-up after 4 years): BIOMK10BL_R
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet2. 
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet9.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet9'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) and Biomarkers 2014 data (2nd follow-up after 8 years): BIOMK14BL
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet5. 
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet10.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.

# Merging Biomarkers 2006 data (baseline wave) and Health services and insurance (section N) 2010 data (H10N_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files

DATASET ACTIVATE DataSet6.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet11.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet11'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.

# Merging Biomarkers 2006 data (baseline wave) and Health services and insurance (section N) 2014 data (H14N_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files

DATASET ACTIVATE DataSet7.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet12.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet12'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.

# Merging Biomarkers 2006 data (baseline wave) and Physical measures (section I) 2010 data (H10I_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files

DATASET ACTIVATE DataSet8.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet13.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet13'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.

# Merging Biomarkers 2006 data (baseline wave) and Physical measures (section I) 2014 data (H14I_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet9.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet7.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet15.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet15'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.




# Merging Biomarkers 2006 data (baseline wave) with Health section C 2006 data (H06C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet5.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet5.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Health section C 2008 data (H08C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet16.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet16.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet16'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.




# Merging Biomarkers 2006 data (baseline wave) with Health section C 2010 data (H10C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet9.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet9.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet9'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Health section C 2012 data (H12C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet17.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet17.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet17'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Health section C 2014 data (H14C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet10.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet10.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Health section C 2016 data (H16C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet18.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet18.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet18'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.




# Merging Biomarkers 2006 data (baseline wave) with Health section C 2018 data (H18C_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet19.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet19.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet19'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Coverscreen section A 2018 data (H18A_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet4.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet1.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet4.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet4'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



# Merging Biomarkers 2006 data (baseline wave) with Cognition section D 2018 data (H18D_R)
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet4.
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet1.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet1'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.




# Merging Loneliness (3-items) 2006 data (baseline wave) with the main dataset
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet15. 
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet9.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet15.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet9.
MATCH FILES /FILE=*
  /TABLE='DataSet15'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.




# Merging Loneliness (3-items) 2014 data (wave 12) with the main dataset
1. Using HHID and PN creat RAHHIDPN, a character version of HHIDPN
2. Merge files


DATASET ACTIVATE DataSet16. 
STRING RAHHIDPN (A9).
COMPUTE RAHHIDPN = CONCAT(HHID,PN).

DATASET ACTIVATE DataSet9.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet16.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet9.
MATCH FILES /FILE=*
  /TABLE='DataSet16'
  /RENAME (HHID PN = d0 d1) 
  /BY RAHHIDPN
  /DROP= d0 d1.
EXECUTE.



  

# Sociodemographic variables

# Gender
Raw variable: RAGENDER

RECODE RAGENDER (1=0) (2=1) INTO H_sex.
VARIABLE LABELS  H_sex 'Sex male (0), female (1)'.
EXECUTE.


# Age
Raw variable: R8AGEY_E = Age in years at wv 8 end month

RECODE R8AGEY_E (ELSE=Copy) INTO H_age.
VARIABLE LABELS  H_age 'Age continuous in years wave 8'.
EXECUTE.



# Education 
There are 3 variables related to Education level
1. RAEDYRS (categorical) -> education years
   Values:
      (0 = none, 1,2,3,4,5,6,7,8,9,10,11,2,13,14,15,16,17+)
2. RAEDEGRM (categorical) -> degrees diploma 
   Values:
      0 = no degree 
      1= GED = general education development/diploma equivalent to high school level
      2 = HS = high school/secondary school
      3 = HS/GED
      4 = AA/Lt BA = Associate of Arts (prepare for BA) Lt BA = less than BA
      5 = BA = Bachelor of Arts
      6 = MA/MBA = Master of Arts / Master of Bussiness Administration
      7 = Law/MD/PhD (MD = Doctor of Medicine)
      8 = Other 
3. RAEDUC (categorical summary) 
   Values:
      1 = Lt high school
      2 = GED
      3 = High school graduate
      4 = Some college
      5 = College and above
* if high school diploma or GED and years of education over 12, RAEDUC is set to "some college"
* if degree is less than BA or "Other", RAEDUC set to some "some college" 
* if exactly 12 years of education but no college degree, the high school diploma is assumed
* if degree is BA or greater, RAEDUC se to college or above
* the RAEDEGRM RAEDUC variables have no missing data
Steps:
1. Education years
        Recode RAEDYRS into H_eduaction_yrs
2. Education level (3 levels) harmonised to ELSA and CHARLS
Recode H_eduaction_5cat into H_eduaction
Respondents are assigned a code of
      1 = Lt High school / No qualification (1)
      2 = High school or college (2,3,4)
      3 = Higher education (5)


RECODE RAEDYRS (ELSE=Copy) INTO H_eduaction_yrs.
VARIABLE LABELS  H_eduaction_yrs 'Years of education from 0 to 17+ (wave 8)'.
EXECUTE.

RECODE RAEDEGRM (ELSE=Copy) INTO H_eduaction_degree.
VARIABLE LABELS  H_eduaction_degree 'Education categorised into 8 levels according to R highest degree (wave 8)'.
EXECUTE.

RECODE RAEDUC (ELSE=Copy) INTO H_eduaction_5cat.
VARIABLE LABELS  H_eduaction_5cat 'Education categorised into 5 levels from low to high (wave 8)'.
EXECUTE.

RECODE H_eduaction_5cat (1=1) (2 thru 4=2) (5=3) INTO H_eduaction.
VARIABLE LABELS  H_eduaction 'Education categorised into 3 levels from low to high (wave 8)'.
EXECUTE.



# Marital Status
Raw variables: 
1. R8MSTAT (categorical) 
    Values:
         1 = married
         2 = married, spouse absent
         3 = partnered 
         4 = seperated
         5 = divorced
         6 = seperated/divorced
         7 = widowed
         8 = never married
2. R8MPART (categorical about partnered)
3. R8MSTATH (without partnership)
Steps:
H_maritalstatus_4cat (new 4 level categorical variable harmonised to ELSA and CHARLS)
   Values: Recode into
      1 = Married/Partenered (1,2,3) 
      2 = Never married (8)
      3 = Seperated/Divorced (4,5,6)
      4 = Widowed (7)

RECODE R8MSTAT (ELSE=Copy) INTO H_maritalstatus_8cat.
VARIABLE LABELS  H_maritalstatus_8cat 'Marital Status classified into 8 categories (wave 8)'.
EXECUTE.


RECODE R8MSTAT  (1=1) (2=1) (3=1) (4=3) (5=3) (6=3) (7=4) (8=2) INTO H_maritalstatus_4cat.
VARIABLE LABELS  H_maritalstatus_4cat 'Marital Status classified into 4 categories (wave 8)'.
EXECUTE.




# Wealth (nonpension household net wealth)
Raw variable: H8ATOTW = Total wealth less IRA (continous variable)
*IRAs are the pension savings
The net value of total wealth less IRA is calculated as the sum of all wealth components except the value of IRAs
and Keogh plans less all debt:
Sum (HwAHOUS, HwARLES, HwATRAN, HwABSNS, HwASTCK, HwACHCK, HwACD, HwABOND, HwAOTHR)
less Sum (HwAMORT, HwAHMLN, HwADEBT)
Wealth measures are reported in nominal dollars
Steps:
   1. New variable of Total non-pension household wealth minus debt excluding pension savings
   total household wealth - (household debt + pension savings)
   2. Recode into 5 different levels via quantiles (1/5)
      According to the percentiles of frequencies (below):
               Output of Statistics
               N	Valid	6509
               Missing	0
               Percentiles	
               20	-> 32700.0000
               40	-> 127900.0000
               60	-> 268000.0000
               80	-> 562000.0000
               100	-> 30840000.0000
   3. Recode into 5 quantiles


RECODE H8ATOTW (ELSE=Copy) INTO H_totalwealth.
VARIABLE LABELS  H_totalwealth 'Total wealth minus IRA (pension savinngs) minus debt '.
EXECUTE.

FREQUENCIES VARIABLES=H_totalwealth
  /PERCENTILES=20.0 40.0 60.0 80.0 100.0 
  /ORDER=ANALYSIS.

RECODE H_totalwealth (Lowest thru 32700.0000=1) 
    (32700.0001 thru 127900.0000=2) (127900.0001 thru 268000.0000=3) (268000.0001 thru 562000.0000=4) 
    (562000.0001 thru Highest=5) INTO H_wealthquintiles.
VARIABLE LABELS  H_wealthquintiles 'Quintiles of total net: Total household wealth minus pension savings minus household debt'.
EXECUTE.


# Lifestyle variables

# Smoking wave 8
Raw variables: 
R8SMOKEV (categorical): R smoke ever (0=No, 1=Yes)
R8SMOKEN  (categorical): R smoke now (0=No, 1=Yes)
Steps:
   1. Recode into smoking status with 2 levels: H_smoking_2cat
      0= not curret smoker, 1= current smoker 
          (0 + 0 = 0), (1 +1 = 1)
   2. Recode into smoking status with 3 levels (3-level categorical variable harmonised to ELSA): H_smoking_3cat
      0 = never smoker, 1= former smoker, 2= current smoker
          (0 + 0 = 0), (1 + 0 = 1), (1 + 1 = 2)

RECODE R8SMOKEN (ELSE=Copy) INTO H_smoking_2cat.
VARIABLE LABELS  H_smoking_2cat 'Smoking Status with 2 levels (wave 8)'.
EXECUTE.


COMPUTE H_smoking_sum=R8SMOKEN + R8SMOKEV.
VARIABLE LABELS  H_smoking_sum 'Sum of smoking ever and now (wave 8)'.
EXECUTE.

IF  (H_smoking_sum = 0) H_neversmoker=H_smoking_sum.
VARIABLE LABELS  H_neversmoker 'never smoker (wave 8)'.
EXECUTE.

IF  (H_smoking_sum = 2) H_currentsmoker=H_smoking_sum.
VARIABLE LABELS  H_currentsmoker 'current smoker (wave 8)'.
EXECUTE.

IF  (R8SMOKEV = 1 & R8SMOKEN = 0) H_formersmoker=1.
VARIABLE LABELS  H_formersmoker 'former smoker (wave 8)'.
EXECUTE.


DO IF ( H_neversmoker = 0 AND MISSING(H_currentsmoker) AND MISSING(H_formersmoker)).
   COMPUTE H_smoking_3cat = 0.
ELSE IF (MISSING(H_neversmoker) AND MISSING(H_currentsmoker) AND H_formersmoker= 1).
   COMPUTE H_smoking_3cat = 1.
ELSE IF (MISSING(H_neversmoker) AND H_currentsmoker= 2 AND MISSING(H_formersmoker)).
   COMPUTE H_smoking_3cat = 2.
END IF .
VARIABLE LABELS  H_smoking_3cat 'Smoking Status with 3 levels (wave 8)'.
EXECUTE . 





# Smoking wave 12
Raw variables: 
hrs harmonised data
Rand data
R12SMOKEV (categorical): R smoke ever (0=No, 1=Yes)
R12SMOKEN  (categorical): R smoke now (0=No, 1=Yes)
Steps:
   1. Recode R12SMOKEN into smoking status with 2 levels: Hwv12_smoking_2cat
      0= not curret smoker (0)
      1= current smoker (1)
   2. Recode R12SMOKEV into smoking status with 3 levels (3-level categorical variable harmonised to ELSA): Hwv12_smoking_3cat
        if R12SMOKEV 0 and R12SMOKEN 0 -> never smoker (0)
        if R12SMOKEV 1 and R12SMOKEN  0 -> former smoker (1)
        if R12SMOKEV 1 and R12SMOKEN  1 -> current smoker (2)


RECODE R12SMOKEN (0=0) (1=1) (ELSE=SYSMIS) INTO Hwv12_smoking_2cat.
VARIABLE LABELS  Hwv12_smoking_2cat 'Smoking Status with 2 levels (wave 12)'.
EXECUTE.


DO IF (R12SMOKEV   = 0 AND (R12SMOKEN = 0)).
   COMPUTE Hwv12_smoking_3cat = 0.
ELSE IF (R12SMOKEV   = 1 AND (R12SMOKEN = 0)).
   COMPUTE Hwv12_smoking_3cat= 1.
ELSE IF (R12SMOKEV  = 1 AND (R12SMOKEN = 1)).
   COMPUTE Hwv12_smoking_3cat= 2.
END IF .
VARIABLE LABELS Hwv12_smoking_3cat 'Smoking Status with 3 levels (wave 12)'.
EXECUTE.  




# Physical activity wave 8 
Raw variable: 
Beginning in Wave 7, three questions about physical activity offer the choice of vigorous, moderate or light physical activity 
occurring every day, more than once per week, once per week, one to three times per month, or never
These measures are derived as RwVGACTX, RwMDACTX, RwLTACTX
Steps:
   Harmonised with ELSA and 
         Recode into 4 different levels of physical activity status
         1= high 2= moderate, 3= low, 4= sedentary 
1. Recode RwVGACTX (vigorous), RwMDACTX (moderate), RwLTACTX (light)
          1 every day -> high (1)
          2 more than once per week -> high (1)
          3 once per week -> moderate (2)
          4 one to three times per month -> low (3)
          5 never -> sedentary (4)


RECODE R8VGACTX R8MDACTX R8LTACTX (1=1) (2=1) (3=2) (4=3) (5=4) INTO 
H_physicalactivity_vigorous H_physicalactivity_moderate H_physicalactivity_light.
VARIABLE LABELS  H_physicalactivity_vigorous 'Vigorous Physical Activity' /H_physicalactivity_moderate 'Moderate Physical Activity' /H_physicalactivity_light 'Light Physical Activity'.
EXECUTE.

DO IF (H_physicalactivity_vigorous = 1 OR (H_physicalactivity_moderate = 1) OR (H_physicalactivity_light = 1)).
   COMPUTE H_physicalactivity = 1.
ELSE IF (H_physicalactivity_vigorous = 2 OR (H_physicalactivity_moderate = 2) OR (H_physicalactivity_light = 2)).
   COMPUTE H_physicalactivity = 2.
ELSE IF (H_physicalactivity_vigorous = 3 OR (H_physicalactivity_moderate = 3) OR (H_physicalactivity_light = 3)).
   COMPUTE H_physicalactivity = 3.
ELSE IF (H_physicalactivity_vigorous = 4 OR (H_physicalactivity_moderate = 4) OR (H_physicalactivity_light = 4)).
   COMPUTE H_physicalactivity = 4.
END IF .
VARIABLE LABELS  H_physicalactivity 'Physical Activity Status with 4 levels (wave 8)'.
EXECUTE . 




# Physical activity wave 12
Raw variable:
hrs harmonised data
Rand data 
1. R12VGACTX -> R Freq vigorous phys activ
2. R12MDACTX-> R Freq moderate phys activ
3. R12LTACTX -> R Freq light phys activ
Values: 
          1 = every day
          2 = more than once per week
          3 = once per week
          4 = one to three times per month 
          5 = never
Steps:
1. Recode R12VGACTX (vigorous), R12MDACTX (moderate), R12LTACTX (light) 
    into Hwv12_physicalactivity_vigorous Hwv12_physicalactivity_moderate Hwv12_physicalactivity_light  
       1->1= every day
       2->1= more than once a week
       3->2= once a week
       4->3= one to three times a month
       5->4= hardly ever or never
        ELSE (which are missing data)=0
2. Recode Hwv12_physicalactivity_vigorous Hwv12_physicalactivity_moderate Hwv12_physicalactivity_light into "Hwv12_physicalactivity"       
        compute Hwv12_physicalactivity = Hwv12_physicalactivity_vigorous 
        if Hwv12_physicalactivity_moderate > max then max = Hwv12_physicalactivity_moderate
        if Hwv12_physicalactivity_light  > max then max = Hwv12_physicalactivity_light  
3. Turn 0 to missing values      




RECODE R12VGACTX R12MDACTX R12LTACTX (1=1) (2=1) (3=2) (4=3) (5=4) (ELSE=0) INTO 
Hwv12_physicalactivity_vigorous Hwv12_physicalactivity_moderate Hwv12_physicalactivity_light.
VARIABLE LABELS  Hwv12_physicalactivity_vigorous 'Vigorous Physical Activity' 
    /Hwv12_physicalactivity_moderate 'Moderate Physical Activity' /Hwv12_physicalactivity_light 'Light Physical Activity'.
EXECUTE.


COMPUTE Hwv12_physicalactivity=Hwv12_physicalactivity_vigorous.
DO IF (Hwv12_physicalactivity_moderate > Hwv12_physicalactivity).
    COMPUTE Hwv12_physicalactivity=Hwv12_physicalactivity_moderate.
ELSE IF (Hwv12_physicalactivity_light > Hwv12_physicalactivity).
    COMPUTE Hwv12_physicalactivity=Hwv12_physicalactivity_light.
END IF.
VARIABLE LABELS Hwv12_physicalactivity 'Physical Activity with 4 levels (wave 12)'.
EXECUTE.


RECODE Hwv12_physicalactivity_vigorous Hwv12_physicalactivity_moderate Hwv12_physicalactivity_light (1=1) (2=2) (3=3) (4=4) (0=SYSMIS) INTO 
Hwv12_physicalactivity_vigorous Hwv12_physicalactivity_moderate Hwv12_physicalactivity_light.
EXECUTE.


RECODE Hwv12_physicalactivity (1=1) (2=2) (3=3) (4=4) (0=SYSMIS) INTO Hwv12_physicalactivity.
EXECUTE.




# Alcohol wave 8
Raw variable
hrs harmonised data
Rand data
1. RwDRINK -> indicates whether R ever drinks alcoholic beverages
2. RwDRINKD -> R # days/week drinks
Values: 
         0 (doesnt drink) -> less than once per week/once a week
         1 -> less than once per week/once a week
         2 -> twice/three times a week
         3 -> twice/three times a week
         4 -> four/five times a week
         5 -> four/five times a week
         6 -> six/seven times a week
         7 -> six/seven times a week
3. RwDRINKN -> R # drinks/day when drinks
Values: 
        0 = does not drink
        99 = all day
Steps:
1. Recode R8DRINKD into "H_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1)
         2= twice/three times a week (2,3)
         3= four to six times a week (4,5,6)
         4= daily or more (7)
2.  Recode "H_alcohol_freq" into alcohol consumption status "H_alcohol_status"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2)
         3= frequent drinker (3+ days per week) (3,4)
         

RECODE R8DRINKD (0=0) (1=1) (2=2) (3=2) (4=3) (5=3) (6=3) (7=4) INTO H_alcohol_freq.
VARIABLE LABELS  H_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 8)'.
EXECUTE.

RECODE H_alcohol_freq (0=1) (1=2) (2=2) (3=3) (4=3) (5=3) (6=3) (7=3) INTO H_alcohol_status.
VARIABLE LABELS  H_alcohol_status 'Alcohol consumption status (wave 8)'.
EXECUTE.



# Alcohol wave 12
Raw variable
hrs harmonised data
Rand data
1. R12DRINK -> indicates whether R ever drinks alcoholic beverages (0-1)
2. R12DRINKD -> R # days/week drinks
Values: 
         0 (doesnt drink) -> less than once per week/once a week
         1 -> less than once per week/once a week
         2 -> twice/three times a week
         3 -> twice/three times a week
         4 -> four/five times a week
         5 -> four/five times a week
         6 -> six/seven times a week
         7 -> six/seven times a week
3. RwDRINKN -> R # drinks/day when drinks
Values: 
        0 = does not drink
        99 = all day
Steps:
1. Recode R12DRINKD into "H_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1)
         2= twice/three times a week (2,3)
         3= four to six times a week (4,5,6)
         4= daily or more (7)
2.  Recode "H_alcohol_freq" into alcohol consumption status "H_alcohol_status"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2)
         3= frequent drinker (3+ days per week) (3,4)
         

RECODE R12DRINKD (0=0) (1=1) (2=2) (3=2) (4=3) (5=3) (6=3) (7=4) INTO Hwv12_alcohol_freq.
VARIABLE LABELS Hwv12_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 12)'.
EXECUTE.

RECODE Hwv12_alcohol_freq (0=1) (1=2) (2=2) (3=3) (4=3) (5=3) (6=3) (7=3) INTO Hwv12_alcohol_status.
VARIABLE LABELS Hwv12_alcohol_status 'Alcohol consumption status (wave 12)'.
EXECUTE.



# Health variables wave 8

# Cardiovascular diseases CVD
Raw variables: 
heart problems -> heart attack, coronary heart disease, angina, congestive heart failure, or other heart problems
stroke -> stroke or transient ischemic attack (TIA)
1. RwHEART -> R reports heart prob this wv (doctor diagnosed heart disease) (yes/no) (extra 2,3,4,5 values)
2. RwSTROK -> R reports stroke this wv  (yes/no) (extra 2 (TIA/possible stroke),3,4,5 values)
3. RwHEARTE -> R ever had heart problems  (yes/no)
4. RwSTROKE -> R ever had stroke  (yes/no)
5. RwHEARTS -> R had heart prob snce last IW  (yes/no)
6. RwSTROKS -> R had stroke since last IW  (yes/no)
Steps:
1. Recode heart problems: R8HEART, R8HEARTE, R8HEARTS
2. Sum of heart diseases and compute H_heart_disease
3. Recode stroke: R8STROK, R8STROKE, R8STROKS
4. Sum of stroke and compute H_stroke
5. Sum of CVDs (heart and stroke)
6. Recode into different variables ? 1 -> CVD (0 = no CVD, 1= at least one CVD)



RECODE R8HEART (0=0) (1=1) (3=1) (4=0) (ELSE=SYSMIS) INTO H_heart_prob_report.
VARIABLE LABELS  H_heart_prob_report 'R reports heart disease at wave 8'.
EXECUTE.

RECODE R8HEARTE R8HEARTS (0=0) (1=1) (ELSE=SYSMIS) INTO H_heart_prob_evr H_heart_prob_before.
VARIABLE LABELS  H_heart_prob_evr  'Doctor ever diagnosed heart problem (wave 8)' 
/H_heart_prob_before 'R had heart problem since last interview (wave 8)'.
EXECUTE.



COMPUTE H_heart_disease_sum=SUM(H_heart_prob_report,H_heart_prob_evr,H_heart_prob_before).
VARIABLE LABELS  H_heart_disease_sum 'Sum of doctor diagnosed any heart disease (wave 8)'.
EXECUTE.

RECODE H_heart_disease_sum (0=0) (1 thru 3=1) INTO H_heart_disease.
VARIABLE LABELS  H_heart_disease 'Doctor diagnosed any heart disease (wave 8)'.
EXECUTE.




RECODE R8STROK (0=0) (1=1) (2=1) (3=1) (4=0) (ELSE=SYSMIS) INTO H_stroke_report.
VARIABLE LABELS H_stroke_report 'R reports stroke or transient ischemic attack (TIA) at wave 8'.
EXECUTE.

RECODE R8STROKE R8STROKS (0=0) (1=1) (ELSE=SYSMIS) INTO H_stroke_evr H_stroke_before.
VARIABLE LABELS  H_stroke_evr 'Doctor ever diagnosed stroke (wave 8)' /H_stroke_before 'R had stroke since last interview (wave 8)'.
EXECUTE.


COMPUTE H_stroke_sum=SUM(H_stroke_report,H_stroke_evr,H_stroke_before).
VARIABLE LABELS  H_stroke_sum 'Sum of doctor diagnosed stroke (wave 8)'.
EXECUTE.

RECODE H_stroke_sum (0=0) (1 thru 3=1) INTO H_stroke.
VARIABLE LABELS  H_stroke 'Doctor diagnosed stroke (wave 8)'.
EXECUTE.




COMPUTE H_cvd_sum=SUM(H_heart_disease,H_stroke).
VARIABLE LABELS  H_cvd_sum 'Sum of Cardiovascular diseases (heart diseases and stroke) (wave 8)'.
EXECUTE.

RECODE H_cvd_sum (0=0) (1 thru 2=1) INTO H_cvd_comorbidity.
VARIABLE LABELS  H_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease (heart diseases and stroke) (wave 8)'.
EXECUTE.



# Health variables wave 12

# Cardiovascular diseases CVD wave 12
Raw variables: 
hrs harmonised
Rand data
heart problems -> heart attack, coronary heart disease, angina, congestive heart failure, or other heart problems
stroke -> stroke or transient ischemic attack (TIA)
1. RwHEART -> R reports heart prob this wv (doctor diagnosed heart disease) (yes/no) (extra 2,3,4,5 values)
2. RwSTROK -> R reports stroke this wv  (yes/no) (extra 2 (TIA/possible stroke),3,4,5 values)
3. RwHEARTE -> R ever had heart problems  (yes/no)
4. RwSTROKE -> R ever had stroke  (yes/no)
5. RwHEARTS -> R had heart prob snce last IW  (yes/no)
6. RwSTROKS -> R had stroke since last IW  (yes/no)
Steps:
1. Recode heart problems: R12HEART, R12HEARTE, R12HEARTS
2. Sum of heart diseases and compute Hwv12_heart_disease
3. Recode stroke: R12STROK, R12STROKE, R12STROKS
4. Sum of stroke and compute Hwv12_stroke
5. Sum of CVDs (heart and stroke)
6. Recode into different variables ? 1 -> CVD (0 = no CVD, 1= at least one CVD)



RECODE R12HEART (0=0) (1=1) (3=1) (4=0) (ELSE=SYSMIS) INTO Hwv12_heart_prob_report.
VARIABLE LABELS  Hwv12_heart_prob_report 'R reports heart disease at wave 12'.
EXECUTE.

RECODE R12HEARTE R12HEARTS (0=0) (1=1) (ELSE=SYSMIS) INTO Hwv12_heart_prob_evr Hwv12_heart_prob_before.
VARIABLE LABELS  Hwv12_heart_prob_evr  'Doctor ever diagnosed heart problem (wave 12)' 
/Hwv12_heart_prob_before 'R had heart problem since last interview (wave 12)'.
EXECUTE.



COMPUTE Hwv12_heart_disease_sum=SUM(Hwv12_heart_prob_report,Hwv12_heart_prob_evr,Hwv12_heart_prob_before).
VARIABLE LABELS  Hwv12_heart_disease_sum 'Sum of doctor diagnosed any heart disease (wave 12)'.
EXECUTE.

RECODE Hwv12_heart_disease_sum (0=0) (1 thru 3=1) INTO Hwv12_heart_disease.
VARIABLE LABELS  Hwv12_heart_disease 'Doctor diagnosed any heart disease (wave 12)'.
EXECUTE.




RECODE R12STROK (0=0) (1=1) (2=1) (3=1) (4=0) (ELSE=SYSMIS) INTO Hwv12_stroke_report.
VARIABLE LABELS Hwv12_stroke_report 'R reports stroke or transient ischemic attack (TIA) at wave 12'.
EXECUTE.

RECODE R12STROKE R12STROKS (0=0) (1=1) (ELSE=SYSMIS) INTO Hwv12_stroke_evr Hwv12_stroke_before.
VARIABLE LABELS  Hwv12_stroke_evr 'Doctor ever diagnosed stroke (wave 8)' /Hwv12_stroke_before 'R had stroke since last interview (wave 12)'.
EXECUTE.


COMPUTE Hwv12_stroke_sum=SUM(Hwv12_stroke_report,Hwv12_stroke_evr,Hwv12_stroke_before).
VARIABLE LABELS  Hwv12_stroke_sum 'Sum of doctor diagnosed stroke (wave 12)'.
EXECUTE.

RECODE Hwv12_stroke_sum (0=0) (1 thru 3=1) INTO Hwv12_stroke.
VARIABLE LABELS  Hwv12_stroke 'Doctor diagnosed stroke (wave 12)'.
EXECUTE.




COMPUTE Hwv12_cvd_sum=SUM(Hwv12_heart_disease,Hwv12_stroke).
VARIABLE LABELS  Hwv12_cvd_sum 'Sum of Cardiovascular diseases (heart diseases and stroke) (wave 12)'.
EXECUTE.

RECODE Hwv12_cvd_sum (0=0) (1 thru 2=1) INTO Hwv12_cvd_comorbidity.
VARIABLE LABELS  Hwv12_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease (heart diseases and stroke) (wave 12)'.
EXECUTE.




# Cognition wave 8
Rand data
The cognitive functioning measures include immediate and delayed word recall, the serial 7s test, counting backwards, 
naming tasks (e.g., date-naming), and vocabulary questions
In addition to the individual cognitive functioning measures, the HRS also derived three cognition
summary indices:
    1. the total recall index (RwTR20, R1TR40, RwATR20, RwHTR40) summarizes the immediate and delayed word recall tasks
        The scores range from 0 to 20 in other waves
    2. The mental status index (RwMSTOT, R2AMSTOT) sums scores from counting, naming, and vocabulary tasks
    3.  A total cognition score (RwCOGTOT, R2ACGTOT) sums the total recall and mental status indices
Raw variables:
- R8IMRC: W8 IMMEDIATE WORD RECALL (cont)
- R8DLRC: W8 DELAYED WORD RECALL (cont)
- R8SER7: W8 SERIAL 7S (cont)
- R8BWC20: W8 BACKWARDS COUNT FROM 20 (categ)
        Values:
        0= icorrect
        1= correct 2nd try
        2= correct 1st try
- R8MO:W8 Cognition Date naming-Month (categ) (0 = incorrect, 1= correct)
- R8DY:W8 Cognition Date naming-Day of month (categ)
- R8YR:W8 Cognition Date naming-Year (categ)
- R8DW:W8 Cognition Date naming-Day of week (categ)
- R8SCIS: W8 SCISSORS (categ)
- R8CACT: W8 CACTUS (categ)
- R8PRES: W8 PRESIDENT  (categ)
- R8VP: W8 VICE PRESIDENT  (categ) 
- R8VOCAB: W8 VOCAB SUM SCORE (categ) -> RwVOCAB scores the Respondents ability to provide definitions of five given words
    There are two sets of words, one of which is randomly assigned at the Respondent’s first interview
    The two sets are then alternated in subsequent waves The two word sets are: 1. repair, fabric, domestic, remorse, plagiarize; and 2. conceal, enormous, perimeter, compassion, audacious
- R8TR20: W8 TOTAL WORD RECALL SUMMARY SCORE (cont)
    The total word recall summary variables sum the immediate and delayed word recall scores
- R8MSTOT: W8 TOTAL MENTAL STATUS SUMMARY SCORE (cont)
    The mental status summary sums the scores for serial 7’s (RwSER7, 0-5), backwards counting from 20 (RwBWC2, 0-2),
    and object (RwCACT, RwSCIS; 0-2 total), date (RwDY, RwMO, RwYR, RwDW; 0-4 total), and President/Vice-President
    (RwPRES, RwVP; 0-2 total) naming tasks
    The resulting range is 0-15
- R8COGTOT: W8 TOTAL COGNITION SUMMARY SCORE (cont)
    The total cognition score sums the total word recall and mental status summary scores, resulting in a range of 0-35
    RwCOGTOT is the sum of RwTR20 and RwMSTOT
Steps:
Recode R8TR20 R8MSTOT R8COGTOT indices into new variables that measure memory, mental status and total cognitive function respectively

        
   
RECODE R8TR20 R8MSTOT R8COGTOT (ELSE=Copy) INTO Hwv8_memory Hwv8_mental_status Hwv8_cognition.
VARIABLE LABELS  Hwv8_memory 'Memory Function: summary score for immediate and delayed 10 word recall scores (wave 8)' 
    /Hwv8_mental_status 'Mental status: summary of the scores (range 0-15) of serial 7s, backwards counting from 20, object and date naming and President/Vice-President (wave 8)'
    /Hwv8_cognition 'Total cognitive index measured by memory and mental status (range 0-35) (wave 8)'.
EXECUTE.





# Cognition wave 12
Rand data
- R12TR20: W12 TOTAL WORD RECALL SUMMARY SCORE (cont)
    The total word recall summary variables sum the immediate and delayed word recall scores
    The scores range from 0 to 20 in other waves
Steps:
Recode R12TR20 into new variable that measure memory

        
   
RECODE R12TR20 (ELSE=Copy) INTO Hwv12_memory.
VARIABLE LABELS  Hwv12_memory 'Memory Function: summary score for immediate and delayed 10 word recall scores (wave 12)'.
EXECUTE.



# Dementia variables
Wave 8 (baseline): memory problem 
Rand data (0-1 no/yes)
    R8MEMRY -> R reports memory prob this wv
    R8MEMRYE -> R ever had memory problem
    R8MEMRYS -> R had memory prob snce last IW
HRS raw data
    KC069 -> MEMORY RELATED DISEASE (1= yes, 5= no, 8= N/A, 9= N/A)
Wave 9: memory problem   
Rand data (0-1 no/yes)
    R9MEMRY -> R reports memory prob this wv
    R9MEMRYE -> R ever had memory problem
    R9MEMRYS -> R had memory prob snce last IW
HRS raw data
    LC069 -> MEMORY RELATED DISEASE (1= yes, 3= disputes previous but now yes 4= disputes previous and no 5= no, 8= N/A, 9= N/A)
Wave 10: Alzheimers disease and dementia
Rand data (0-1 no/yes)
    R10ALZHE -> R reports Alzheimer this wv
    R10ALZHEE -> R ever reported Alzheimer
    R10DEMEN -> R reports dementia this wv
    R10DEMENE -> R ever reported dementia
HRS raw data
    MC272 -> EVER HAD ALZHEIMERS (1= yes, 5= no, 7= no AD, 8= N/A, 9= N/A)
    MC273 -> EVER HAD DEMENTIA (1= yes, 5= no, 8= N/A, 9= N/A)
Wave 11: Alzheimers disease and dementia
Rand data (0-1 no/yes)
    R11ALZHE -> R reports Alzheimer this wv
    R11ALZHEE -> R ever reported Alzheimer
    R11ALZHES -> R had Alzheimer onset snce last IW
    R11DEMEN -> R reports dementia this wv
    R11DEMENE -> R ever reported dementia
    R11DEMENS -> R had dementia onset snce last IW
HRS raw data
    NC272 -> EVER HAD ALZHEIMERS (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 7= no AD, 8= N/A, 9= N/A)
    NC273 -> EVER HAD DEMENTIA (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 8= N/A, 9= N/A)
Wave 12: Alzheimers disease and dementia
Rand data (0-1 no/yes)
    R12ALZHE -> R reports Alzheimer this wv
    R12ALZHEE -> R ever reported Alzheimer
    R12ALZHES -> R had Alzheimer onset snce last IW
    R12DEMEN -> R reports dementia this wv
    R12DEMENE -> R ever reported dementia
    R12DEMENS -> R had dementia onset snce last IW
HRS raw data
    OC272 -> EVER HAD ALZHEIMERS (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 7= no AD, 8= N/A, 9= N/A)
    OC273 -> EVER HAD DEMENTIA (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 8= N/A, 9= N/A)
Wave 13: Alzheimers disease and dementia
Rand data (0-1 no/yes)
    R13ALZHE -> R reports Alzheimer this wv
    R13ALZHEE -> R ever reported Alzheimer
    R13ALZHES -> R had Alzheimer onset snce last IW
    R13DEMEN -> R reports dementia this wv
    R13DEMENE -> R ever reported dementia
    R13DEMENS -> W13 R had dementia onset snce last IW
HRS raw data
    PC272 -> EVER HAD ALZHEIMERS (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 7= no AD, 8= N/A, 9= N/A)
    PC273 -> EVER HAD DEMENTIA (1= yes, 3= disputes but yes, 4= disputes and no, 5= no, 8= N/A, 9= N/A)
Wave 14: Alzheimers disease and dementia (no Rand data)
HRS raw data
    QC272 -> EVER HAD ALZHEIMERS (1= yes, 4= never AD, 5= no, 8= N/A, 9= N/A)
    QC273 -> EVER HAD DEMENTIA (1= yes, 4= never dementia 5= no, 8= N/A, 9= N/A)
    


# Wave 8 2006 (baseline)
1. Recode self-reported memory problem variables
2. Sum of memory-related variables
3. Recode memory report

RECODE R8MEMRY (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO 
Hwv8_memory_diagnosed.
VARIABLE LABELS  Hwv8_memory_diagnosed 'Doctor diagnosed memory problem at wave 8'.
EXECUTE.

RECODE R8MEMRYE R8MEMRYS (0=0) (1=1) (ELSE=Copy) INTO 
Hwv8_memory_evr Hwv8_memory_before.
VARIABLE LABELS Hwv8_memory_evr 'Ever had memory problem (wave 8)' 
    /Hwv8_memory_before 'Had memory problem since last interview (wave 8)'.
EXECUTE.

RECODE KC069 (1=1) (5=0) (8=SYSMIS) (9=SYSMIS) INTO 
Hwv8_confirm_memory.
VARIABLE LABELS  Hwv8_confirm_memory 'Doctor ever told you that you have memory problem (wave 8)'.
EXECUTE.



COMPUTE Hwv8_memory_sum=SUM(Hwv8_memory_diagnosed,Hwv8_memory_evr,Hwv8_memory_before,Hwv8_confirm_memory).
VARIABLE LABELS  Hwv8_memory_sum 'Sum of new diagnosis of memory-related disease at wave 8'.
EXECUTE.

RECODE Hwv8_memory_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv8_memory_report.
VARIABLE LABELS  Hwv8_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 8'.
EXECUTE.



# Wave 9 2008
1. Recode self-reported memory problem variables
2. Sum of memory-related variables
3. Recode memory report

RECODE R9MEMRY (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv9_memory_diagnosed.
VARIABLE LABELS Hwv9_memory_diagnosed 'Doctor diagnosed memory problem at wave 9'.
EXECUTE.

RECODE R9MEMRYE R9MEMRYS (0=0) (1=1) (ELSE=Copy) INTO Hwv9_memory_evr Hwv9_memory_before.
VARIABLE LABELS Hwv9_memory_evr 'Ever had memory problem (wave 9)' 
    /Hwv9_memory_before 'Had memory problem since last interview (wave 9)'.
EXECUTE.

RECODE LC069 (1=1) (3=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv9_confirm_memory.
VARIABLE LABELS  Hwv9_confirm_memory 'Doctor ever told you that you have memory problem (wave 9)'.
EXECUTE.


COMPUTE Hwv9_memory_sum=SUM(Hwv9_memory_diagnosed,Hwv9_memory_evr,Hwv9_memory_before,Hwv9_confirm_memory).
VARIABLE LABELS  Hwv9_memory_sum 'Sum of new diagnosis of memory-related disease at wave 9'.
EXECUTE.

RECODE Hwv9_memory_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv9_memory_report.
VARIABLE LABELS  Hwv9_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 9'.
EXECUTE.



# Wave 10 2010
# Dementia wave 10
1. Recode self-reported dementia variables
2. Sum of dementia variables
3. Recode dementia report

RECODE R10DEMEN (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv10_dementia_diagnosed.
VARIABLE LABELS  Hwv10_dementia_diagnosed 'Doctor diagnosed dementia at wave 10'.
EXECUTE.

RECODE R10DEMENE (0=0) (1=1) (ELSE=Copy) INTO Hwv10_dementia_evr.
VARIABLE LABELS Hwv10_dementia_evr 'Ever had dementia problem (wave 10)'.
EXECUTE.

RECODE MC273 (1=1) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv10_confirm_dementia.
VARIABLE LABELS  Hwv10_confirm_dementia 'Doctor ever told you that you have dementia (wave 10)'.
EXECUTE.


COMPUTE Hwv10_dementia_sum=SUM(Hwv10_dementia_diagnosed,Hwv10_dementia_evr,Hwv10_confirm_dementia).
VARIABLE LABELS  Hwv10_dementia_sum 'Sum of new diagnosis of dementia at wave 10'.
EXECUTE.

RECODE Hwv10_dementia_sum (3=1) (2=1) (1=1) (0=0) INTO Hwv10_dementia_report.
VARIABLE LABELS  Hwv10_dementia_report 'Whether reported physician-diagnosed dementia new at wave 10'.
EXECUTE.


# Alzheimers disease wave 10
1. Recode self-reported AD variables
2. Sum of AD variables
3. Recode AD report


RECODE R10ALZHE  (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv10_ad_diagnosed.
VARIABLE LABELS Hwv10_ad_diagnosed 'Doctor diagnosed Alzheimer disease (AD) at wave 10'.
EXECUTE.

RECODE R10ALZHEE (0=0) (1=1) (ELSE=Copy) INTO Hwv10_ad_evr .
VARIABLE LABELS Hwv10_ad_evr 'Ever had AD problem (wave 10)'.
EXECUTE.

RECODE MC272 (1=1) (5=0) (7=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv10_confirm_ad.
VARIABLE LABELS  Hwv10_confirm_ad 'Doctor ever told you that you have AD (wave 10)'.
EXECUTE.


COMPUTE Hwv10_ad_sum=SUM(Hwv10_ad_diagnosed,Hwv10_ad_evr,Hwv10_confirm_ad).
VARIABLE LABELS  Hwv10_ad_sum 'Sum of new diagnosis of AD at wave 10'.
EXECUTE.

RECODE Hwv10_ad_sum (3=1) (2=1) (1=1) (0=0) INTO Hwv10_ad_report.
VARIABLE LABELS  Hwv10_ad_report 'Whether reported physician-diagnosed AD new at wave 10'.
EXECUTE.


# Dementia + AD (wave 10)
    
COMPUTE Hwv10_anydementia_sum=SUM(Hwv10_ad_report,Hwv10_dementia_report).
VARIABLE LABELS  Hwv10_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia and AD) at wave 10'.
EXECUTE.

RECODE Hwv10_anydementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Hwv10_anydementia_report.
VARIABLE LABELS  Hwv10_anydementia_report 'All new dementia cases reported at wave 10'.
EXECUTE.




# Wave 11 2012
# Dementia wave 11
1. Recode self-reported dementia variables
2. Sum of dementia variables
3. Recode dementia report

RECODE R11DEMEN (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv11_dementia_diagnosed.
VARIABLE LABELS  Hwv11_dementia_diagnosed 'Doctor diagnosed dementia at wave 11'.
EXECUTE.

RECODE R11DEMENE R11DEMENS (0=0) (1=1) (ELSE=Copy) INTO Hwv11_dementia_evr Hwv11_dementia_before.
VARIABLE LABELS Hwv11_dementia_evr 'Ever had dementia problem (wave 11)' 
    /Hwv11_dementia_before 'Had dementia since last interview (wave 11)'.
EXECUTE.


RECODE NC273 (1=1) (3=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv11_confirm_dementia.
VARIABLE LABELS  Hwv11_confirm_dementia 'Doctor ever told you that you have dementia (wave 11)'.
EXECUTE.


COMPUTE Hwv11_dementia_sum=SUM(Hwv11_dementia_diagnosed,Hwv11_dementia_evr,Hwv11_dementia_before,Hwv11_confirm_dementia).
VARIABLE LABELS  Hwv11_dementia_sum 'Sum of new diagnosis of dementia at wave 11'.
EXECUTE.

RECODE Hwv11_dementia_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv11_dementia_report.
VARIABLE LABELS  Hwv11_dementia_report 'Whether reported physician-diagnosed dementia new at wave 11'.
EXECUTE.


# Alzheimers disease wave 11
1. Recode self-reported AD variables
2. Sum of AD variables
3. Recode AD report


RECODE R11ALZHE (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv11_ad_diagnosed.
VARIABLE LABELS  Hwv11_ad_diagnosed 'Doctor diagnosed Alzheimer disease (AD) at wave 11'.
EXECUTE.

RECODE R11ALZHEE R11ALZHES (0=0) (1=1) (ELSE=Copy) INTO Hwv11_ad_evr Hwv11_ad_before.
VARIABLE LABELS Hwv11_ad_evr 'Ever had AD problem (wave 11)' 
    /Hwv11_ad_before 'Had AD since last interview (wave 11)'.
EXECUTE.


RECODE NC272 (1=1)  (3=1) (4=0) (5=0) (7=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv11_confirm_ad.
VARIABLE LABELS  Hwv11_confirm_ad 'Doctor ever told you that you have AD (wave 11)'.
EXECUTE.


COMPUTE Hwv11_ad_sum=SUM(Hwv11_ad_diagnosed,Hwv11_ad_evr,Hwv11_ad_before,Hwv11_confirm_ad).
VARIABLE LABELS  Hwv11_ad_sum 'Sum of new diagnosis of AD at wave 11'.
EXECUTE.

RECODE Hwv11_ad_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv11_ad_report.
VARIABLE LABELS  Hwv11_ad_report 'Whether reported physician-diagnosed AD new at wave 11'.
EXECUTE.


# Dementia + AD (wave 11)
    
COMPUTE Hwv11_anydementia_sum=SUM(Hwv11_ad_report,Hwv11_dementia_report).
VARIABLE LABELS  Hwv11_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia and AD) at wave 11'.
EXECUTE.

RECODE Hwv11_anydementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Hwv11_anydementia_report.
VARIABLE LABELS  Hwv11_anydementia_report 'All new dementia cases reported at wave 11'.
EXECUTE.




# Wave 12 2014
# Dementia wave 12
1. Recode self-reported dementia variables
2. Sum of dementia variables
3. Recode dementia report


RECODE R12DEMEN (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv12_dementia_diagnosed.
VARIABLE LABELS Hwv12_dementia_diagnosed 'Doctor diagnosed dementia at wave 12'.
EXECUTE.

RECODE R12DEMENE R12DEMENS (0=0) (1=1) (ELSE=Copy) INTO Hwv12_dementia_evr Hwv12_dementia_before.
VARIABLE LABELS Hwv12_dementia_evr 'Ever had dementia problem (wave 12)' 
    /Hwv12_dementia_before 'Had dementia since last interview (wave 12)' .
EXECUTE.



RECODE OC273 (1=1) (3=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv12_confirm_dementia.
VARIABLE LABELS  Hwv12_confirm_dementia 'Doctor ever told you that you have dementia (wave 12)'.
EXECUTE.


COMPUTE Hwv12_dementia_sum=SUM(Hwv12_dementia_diagnosed,Hwv12_dementia_evr,Hwv12_dementia_before,Hwv12_confirm_dementia).
VARIABLE LABELS  Hwv12_dementia_sum 'Sum of new diagnosis of dementia at wave 12'.
EXECUTE.

RECODE Hwv12_dementia_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv12_dementia_report.
VARIABLE LABELS  Hwv12_dementia_report 'Whether reported physician-diagnosed dementia new at wave 12'.
EXECUTE.


# Alzheimers disease wave 12
1. Recode self-reported AD variables
2. Sum of AD variables
3. Recode AD report


RECODE R12ALZHE  (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv12_ad_diagnosed.
VARIABLE LABELS Hwv12_ad_diagnosed 'Doctor diagnosed Alzheimer disease (AD) at wave 12'.
EXECUTE.

RECODE R12ALZHEE R12ALZHES (0=0) (1=1) (ELSE=Copy) INTO Hwv12_ad_evr Hwv12_ad_before.
VARIABLE LABELS Hwv12_ad_evr 'Ever had AD problem (wave 12)' 
    /Hwv12_ad_before 'Had AD since last interview (wave 12)'.
EXECUTE.



RECODE OC272 (1=1) (3=1) (4=0) (5=0) (7=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv12_confirm_ad.
VARIABLE LABELS  Hwv12_confirm_ad 'Doctor ever told you that you have AD (wave 12)'.
EXECUTE.



COMPUTE Hwv12_ad_sum=SUM(Hwv12_ad_diagnosed,Hwv12_ad_evr,Hwv12_ad_before,Hwv12_confirm_ad).
VARIABLE LABELS  Hwv12_ad_sum 'Sum of new diagnosis of AD at wave 12'.
EXECUTE.

RECODE Hwv12_ad_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv12_ad_report.
VARIABLE LABELS  Hwv12_ad_report 'Whether reported physician-diagnosed AD new at wave 12'.
EXECUTE.


# Dementia + AD (wave 12)
    
COMPUTE Hwv12_anydementia_sum=SUM(Hwv12_ad_report,Hwv12_dementia_report).
VARIABLE LABELS  Hwv12_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia and AD) at wave 12'.
EXECUTE.

RECODE Hwv12_anydementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Hwv12_anydementia_report.
VARIABLE LABELS  Hwv12_anydementia_report 'All new dementia cases reported at wave 12'.
EXECUTE.



# Wave 13 2016
# Dementia wave 13
1. Recode self-reported dementia variables
2. Sum of dementia variables
3. Recode dementia report


RECODE R13DEMEN  (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv13_dementia_diagnosed.
VARIABLE LABELS Hwv13_dementia_diagnosed 'Doctor diagnosed dementia at wave 13'.
EXECUTE.

RECODE R13DEMENE R13DEMENS (0=0) (1=1) (ELSE=Copy) INTO Hwv13_dementia_evr Hwv13_dementia_before.
VARIABLE LABELS Hwv13_dementia_evr 'Ever had dementia problem (wave 13)' 
    /Hwv13_dementia_before 'Had dementia since last interview (wave 13)'.
EXECUTE.


RECODE PC273 (1=1) (3=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv13_confirm_dementia.
VARIABLE LABELS  Hwv13_confirm_dementia 'Doctor ever told you that you have dementia (wave 13)'.
EXECUTE.


COMPUTE Hwv13_dementia_sum=SUM(Hwv13_dementia_diagnosed,Hwv13_dementia_evr,Hwv13_dementia_before,Hwv13_confirm_dementia).
VARIABLE LABELS  Hwv13_dementia_sum 'Sum of new diagnosis of dementia at wave 13'.
EXECUTE.

RECODE Hwv13_dementia_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv13_dementia_report.
VARIABLE LABELS  Hwv13_dementia_report 'Whether reported physician-diagnosed dementia new at wave 13'.
EXECUTE.



# Alzheimers disease wave 13
1. Recode self-reported AD variables
2. Sum of AD variables
3. Recode AD report


RECODE R13ALZHE  (0=0) (1=1) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) INTO Hwv13_ad_diagnosed.
VARIABLE LABELS Hwv13_ad_diagnosed 'Doctor diagnosed Alzheimer disease (AD) at wave 13'.
EXECUTE.

RECODE R13ALZHEE R13ALZHES (0=0) (1=1) (ELSE=Copy) INTO Hwv13_ad_evr Hwv13_ad_before.
VARIABLE LABELS Hwv13_ad_evr 'Ever had AD problem (wave 13)' 
    /Hwv13_ad_before 'Had AD since last interview (wave 13)'.
EXECUTE.


RECODE PC272 (1=1) (3=1) (4=0) (5=0) (7=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv13_confirm_ad.
VARIABLE LABELS  Hwv13_confirm_ad 'Doctor ever told you that you have AD (wave 13)'.
EXECUTE.



COMPUTE Hwv13_ad_sum=SUM(Hwv13_ad_diagnosed,Hwv13_ad_evr,Hwv13_ad_before,Hwv13_confirm_ad).
VARIABLE LABELS  Hwv13_ad_sum 'Sum of new diagnosis of AD at wave 13'.
EXECUTE.

RECODE Hwv13_ad_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Hwv13_ad_report.
VARIABLE LABELS  Hwv13_ad_report 'Whether reported physician-diagnosed AD new at wave 13'.
EXECUTE.


# Dementia + AD (wave 13)
    
COMPUTE Hwv13_anydementia_sum=SUM(Hwv13_ad_report,Hwv13_dementia_report).
VARIABLE LABELS  Hwv13_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia and AD) at wave 13'.
EXECUTE.

RECODE Hwv13_anydementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Hwv13_anydementia_report.
VARIABLE LABELS  Hwv13_anydementia_report 'All new dementia cases reported at wave 13'.
EXECUTE.




# Wave 14 2018 (only HRS raw data)
# Dementia wave 14
    Recode self-reported dementia variable


RECODE QC273 (1=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv14_dementia_report.
VARIABLE LABELS  Hwv14_dementia_report 'Whether reported physician-diagnosed dementia new at wave 14'.
EXECUTE.


# Alzheimers disease wave 13
    Recode self-reported AD variable


RECODE QC272 (1=1) (4=0) (5=0) (8=SYSMIS) (9=SYSMIS) INTO Hwv14_ad_report.
VARIABLE LABELS  Hwv14_ad_report 'Whether reported physician-diagnosed AD new at wave 14'.
EXECUTE.



# Dementia + AD (wave 14)
    
COMPUTE Hwv14_anydementia_sum=SUM(Hwv14_ad_report,Hwv14_dementia_report).
VARIABLE LABELS  Hwv14_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia and AD) at wave 14'.
EXECUTE.

RECODE Hwv14_anydementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Hwv14_anydementia_report.
VARIABLE LABELS  Hwv14_anydementia_report 'All new dementia cases reported at wave 14'.
EXECUTE.





*** Create a new dataset "hrs_data2020_final" to exclude baseline dementia cases (wave 8)
Remove baseline dementia cases and in a cognitively intact sample estimate the event to dementia variable during the follow-up waves (9-14)
Then, merge event to dementia related variables with the full-sample dataset. Excluded cases will be showed as missing data (N/As).


# Event to Dementia (variable created in a seperate dataset where all baseline dementia cases were excluded)
event to dementia -> Hwv9to14_dementia_event
    1. Sum of new dementia cases in all the follow-up waves (waves 9 -14)
            Name variable: "Hwv9to14_dementia_sum"
    2. Recode into 0 - 1 (yes/no dementia)
                 0 -> 0 no dementia until the last interview (wave 14)
                 1 -> 1 yes dementia
                 2 -> 1 yes dementia
                 3 -> 1 yes dementia
                 4 -> 1 yes dementia
                 5 -> 1 yes dementia
                 6 -> 1 yes dementia
Name variable: "Hwv9to14_dementia_event"

COMPUTE Hwv9to14_dementia_sum=SUM(Hwv9_memory_report,Hwv10_anydementia_report,
    Hwv11_anydementia_report,Hwv12_anydementia_report,Hwv13_anydementia_report,Hwv14_anydementia_report).
VARIABLE LABELS  Hwv9to14_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 9 -14'.
EXECUTE.

RECODE Hwv9to14_dementia_sum (0=0) (1=1) (2=1) (3=1) (4=1) (5=1) (6=1) INTO Hwv9to14_dementia_event.
VARIABLE LABELS  Hwv9to14_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis (wave 9-14)'.
EXECUTE.



# Merge Hwv9to14_dementia_sum and Hwv9to14_dementia_event with the main dataset
where the baseline cases of dementia are recorded as N/A.


DATASET ACTIVATE DataSet1.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet2.
SORT CASES BY RAHHIDPN.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /BY RAHHIDPN.
EXECUTE.


# Time of Event - Time of Dementia Incidence
Steps:
1. year and month of interview
2. date of interview
3. time difference
4. midpoint



# Step 1 - year and month of interview
Recode variables related to time of interview (waves 8-13)
            e.g. wave 8: R8IWBEG: Interview Begin Date
                               R8IWEND: Interview End Date
                               R8IWMID: Interview Midpoint Date
                               R8IWENDM: Interview End Month
                               R8IWENDY: Interview End Year
There are not available data about time (date) of dementia diagnosis
!!! RwIWBEG, RwIWMID, and RwIWEND are in SAS date format, which is the number of days relative to January 1, 1960 (# days from 1/1/1960)
RwIWENDM and RwIWENDY provide the end interview month and year, respectively, not in SAS date format
From Wave 3 forward, the 15th of the interview month was used
So, RwIWENDM and RwIWENDY (month and year of interveiw) will be used for the calculation of the date of interview.

# Step 2 - date of interview
Recode into a new variable of date of interview based on month and year of interview
            Date properties: dd.mm.yyyy (data on the day is unavailable so consistently use "01")


# Wave 8 (Baseline 2006)

RECODE R8IWENDM R8IWENDY (ELSE=Copy) INTO Hwv8_interview_month Hwv8_interview_year.
VARIABLE LABELS Hwv8_interview_month 'Month of respondent interview wave 8' /Hwv8_interview_year 'Year of respondent interview wave 8'.

COMPUTE Hwv8_interview_date=DATE.MOYR(Hwv8_interview_month,Hwv8_interview_year).
VARIABLE LABELS  Hwv8_interview_date 'Date of interview (01 for day / month / year) at wave 8 (baseline)'.
EXECUTE.


# Wave 9 (2008)

RECODE R9IWENDM R9IWENDY (ELSE=Copy) INTO Hwv9_interview_month Hwv9_interview_year.
VARIABLE LABELS Hwv9_interview_month 'Month of respondent interview wave 9' /Hwv9_interview_year 'Year of respondent interview wave 9'.

COMPUTE Hwv9_interview_date=DATE.MOYR(Hwv9_interview_month,Hwv9_interview_year).
VARIABLE LABELS  Hwv9_interview_date 'Date of interview (01 for day / month / year) at wave 9'.
EXECUTE.


# Wave 10 (2010)

RECODE R10IWENDM R10IWENDY (ELSE=Copy) INTO Hwv10_interview_month Hwv10_interview_year.
VARIABLE LABELS Hwv10_interview_month 'Month of respondent interview wave 10' /Hwv10_interview_year 'Year of respondent interview wave 10'.

COMPUTE Hwv10_interview_date=DATE.MOYR(Hwv10_interview_month,Hwv10_interview_year).
VARIABLE LABELS  Hwv10_interview_date 'Date of interview (01 for day / month / year) at wave 10'.
EXECUTE.


# Wave 11 (2012)

RECODE R11IWENDM R11IWENDY (ELSE=Copy) INTO Hwv11_interview_month Hwv11_interview_year.
VARIABLE LABELS Hwv11_interview_month 'Month of respondent interview wave 11' /Hwv11_interview_year 'Year of respondent interview wave 11'.

COMPUTE Hwv11_interview_date=DATE.MOYR(Hwv11_interview_month,Hwv11_interview_year).
VARIABLE LABELS  Hwv11_interview_date 'Date of interview (01 for day / month / year) at wave 11'.
EXECUTE.


# Wave 12 (2014)

RECODE R12IWENDM R12IWENDY (ELSE=Copy) INTO Hwv12_interview_month Hwv12_interview_year.
VARIABLE LABELS Hwv12_interview_month 'Month of respondent interview wave 12' /Hwv12_interview_year 'Year of respondent interview wave 12'.

COMPUTE Hwv12_interview_date=DATE.MOYR(Hwv12_interview_month,Hwv12_interview_year).
VARIABLE LABELS  Hwv12_interview_date 'Date of interview (01 for day / month / year) at wave 12'.
EXECUTE.


# Wave 13 (2016)

RECODE R13IWENDM R13IWENDY (ELSE=Copy) INTO Hwv13_interview_month Hwv13_interview_year.
VARIABLE LABELS Hwv13_interview_month 'Month of respondent interview wave 13' /Hwv13_interview_year 'Year of respondent interview wave 13'.

COMPUTE Hwv13_interview_date=DATE.MOYR(Hwv13_interview_month,Hwv13_interview_year).
VARIABLE LABELS  Hwv13_interview_date 'Date of interview (01 for day / month / year) at wave 13'.
EXECUTE.


# Wave 14 (2018)

RECODE QA500 QA501 (ELSE=Copy) INTO Hwv14_interview_month Hwv14_interview_year.
VARIABLE LABELS Hwv14_interview_month 'Month of respondent interview wave 14' /Hwv14_interview_year 'Year of respondent interview wave 14'.

COMPUTE Hwv14_interview_date=DATE.MOYR(Hwv14_interview_month,Hwv14_interview_year).
VARIABLE LABELS  Hwv14_interview_date 'Date of interview (01 for day / month / year) at wave 14'.
EXECUTE.




# Step 3 - time difference
   - Create a variable "Hwv9to14_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 8 date of interview -> "Hwv8_interview_date"
   - Create a variable "H_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 8 - 2006) 
       and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff" : 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"


* Date and Time Wizard: H_time_dementia_months.
COMPUTE  H_time_dementia_months=RND((Hwv9to14_newdementia_or_lastinterview_date - 
    Hwv8_interview_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  H_time_dementia_months "Time in months from the baseline (wave 8) to the date "+
    "of dementia diagnosis or last date of study assessment".
VARIABLE LEVEL  H_time_dementia_months (SCALE).
FORMATS  H_time_dementia_months (F5.0).
VARIABLE WIDTH  H_time_dementia_months(5).
EXECUTE.

# OR

COMPUTE Length=DATEDIFF(Hwv9to14_newdementia_or_lastinterview_date,Hwv8_interview_date,"months").
VARIABLE LABELS  H_time_dementia_months 'Time in months from the baseline (wave 8) to the date of dementia diagnosis or last date of study assessment'.
EXECUTE.




*** For those who reported dementia, follow-up time was calculated as the time elapsed (in
                months) between the date of the baseline interview date and the date of the reported diagnosis
                of dementia. For those who reported dementia but did not report the associated date of diagnosis,
                the follow-up time was calculated as the time elapsed from to the baseline interview date to the
                midpoint between (a) the last assessment in which they reported not having dementia and (b)
                the assessment in which they did report having dementia. For those who did not report dementia,
                follow-up time was calculated as the time elapsed between the date of baseline and most recent interview



# Step 4 - midpoint
   - Create a variable "Hwv9to14_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
        Find when was the last interview when the participant was dementia free 
        For those who never developed dementia (censored), the value remains N/A [manual work]
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "H_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("H_time_dementia_midpoint_final") for the cases without dementia [manual work] 
       (if you do not do this the time _of_event_dementia will be wrong, which means the mean of H_time_dementia_months, H_time_dementia_midpoint will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored (people lost or without dementia until the last date of assessment) 
            measured in months and adjusted for midpoint between interviews
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (H_time_dementia_months, H_time_dementia_midpoint)


* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  H_time_dementia_midpoint=RND((Hwv9to14_newdementia_or_lastinterview_date - 
    Hwv9to14_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  H_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  H_time_dementia_midpoint (SCALE).
FORMATS  H_time_dementia_midpoint (F5.0).
VARIABLE WIDTH  H_time_dementia_midpoint(5).
EXECUTE.


RECODE H_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO H_time_dementia_midpoint_final.
VARIABLE LABELS H_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE H_time_of_event_dementia=MEAN(H_time_dementia_months,H_time_dementia_midpoint_final).
VARIABLE LABELS  H_time_of_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.






# Dementia Incidence Waves 12-14


# Event to Dementia
Step 1: event to dementia -> Hwv12to14_dementia_event
      1. Sum of new dementia cases in all the follow-up waves (waves 12-14)
            Name of variable: "Hwv12to14_dementia_sum"
      2. Recode into 0 - 1 (yes/no dementia)
                     0 -> 0 no dementia until the last interview (wave 14)
                     1 -> 1 yes dementia
                     2 -> 1 yes dementia
                     3 -> 1 yes dementia
            Name of variable: "Hwv12to14_dementia_event" 


COMPUTE Hwv12to14_dementia_sum=SUM(Hwv12_anydementia_report,Hwv13_anydementia_report,Hwv14_anydementia_report).
VARIABLE LABELS  Hwv12to14_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 12-14'.
EXECUTE.

RECODE Hwv12to14_dementia_sum (0=0) (1=1) (2=1) (3=1) INTO Hwv12to14_dementia_event.
VARIABLE LABELS Hwv12to14_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis (wave 12-14)'.
EXECUTE.




# Time of Event - Time of Dementia Incidence
Survival time was measured in months, from the date of interview in the final wave of exposure measurement (wave 11)
to the date of dementia diagnosis or last interview, whichever was first
1. date of interview (add year and month of interview for waves 11, 12, 13, 14)
2. time difference
4. midpoint


# Date of interview
    

COMPUTE Hwv8_interview_date=DATE.MOYR(Hwv8_interview_month,Hwv8_interview_year).
VARIABLE LABELS  Hwv8_interview_date 'Date of interview (01 for day / month / year) at wave 8'.
EXECUTE.

COMPUTE Hwv9_interview_date=DATE.MOYR(Hwv9_interview_month,Hwv9_interview_year).
VARIABLE LABELS  Hwv9_interview_date 'Date of interview (01 for day / month / year) at wave 9'.
EXECUTE.

COMPUTE Hwv10_interview_date=DATE.MOYR(Hwv10_interview_month,Hwv10_interview_year).
VARIABLE LABELS  Hwv10_interview_date 'Date of interview (01 for day / month / year) at wave 10'.
EXECUTE.

COMPUTE Hwv11_interview_date=DATE.MOYR(Hwv11_interview_month,Hwv11_interview_year).
VARIABLE LABELS  Hwv11_interview_date 'Date of interview (01 for day / month / year) at wave 11'.
EXECUTE.

    
COMPUTE Hwv12_interview_date=DATE.MOYR(Hwv12_interview_month,Hwv12_interview_year).
VARIABLE LABELS  Hwv12_interview_date 'Date of interview (01 for day / month / year) at wave 12'.
EXECUTE.


COMPUTE Hwv13_interview_date=DATE.MOYR(Hwv13_interview_month,Hwv13_interview_year).
VARIABLE LABELS  Hwv13_interview_date 'Date of interview (01 for day / month / year) at wave 13'.
EXECUTE.


COMPUTE Hwv14_interview_date=DATE.MOYR(Hwv14_interview_month,Hwv14_interview_year).
VARIABLE LABELS  Hwv14_interview_date 'Date of interview (01 for day / month / year) at wave 14'.
EXECUTE.





# Time difference
   - Create a variable "Hwv12to14_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 11 date of interview "Hwv11_interview_date"
   - Create a variable "Hwv12to14_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 11 2012) and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"
            



COMPUTE Hwv12to14_time_dementia_months=DATEDIFF(Hwv12to14_newdementia_or_lastinterview_date,Hwv11_interview_date,"months").
VARIABLE LABELS  Hwv12to14_time_dementia_months 'Time in months from the baseline (wave 11 ) to the date of '+
    'dementia diagnosis or last date of study assessment'.
EXECUTE.



# Midpoint
   - Create a variable "Hwv12to14_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
        Find when was the last interview when the participant was dementia free 
        For those who never developed dementia (censored), the value remains N/A [manual work]
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "Hwv12to14_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("Hwv12to14_time_dementia_midpoint_final") for the cases without dementia [manual work] 
       (if you do not do this the time _of_event_dementia will be wrong, which means the mean of Hwv12to14_time_dementia_months, Hwv12to14_time_dementia_midpoint will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored (people lost or without dementia until the last date of assessment) 
            measured in months and adjusted for midpoint between interviews
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (Hwv12to14_time_dementia_months, Hwv12to14_time_dementia_midpoint)
            


* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  Hwv12to14_time_dementia_midpoint=RND((Hwv12to14_newdementia_or_lastinterview_date - 
    Hwv12to14_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  Hwv12to14_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  Hwv12to14_time_dementia_midpoint (SCALE).
FORMATS  Hwv12to14_time_dementia_midpoint (F5.0).
VARIABLE WIDTH  Hwv12to14_time_dementia_midpoint(5).
EXECUTE.


RECODE Hwv12to14_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO Hwv12to14_time_dementia_midpoint_final.
VARIABLE LABELS Hwv12to14_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE Hwv12to14_time_of_event_dementia=MEAN(Hwv12to14_time_dementia_months,Hwv12to14_time_dementia_midpoint_final).
VARIABLE LABELS  Hwv12to14_time_of_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.





# Predictors (Depressive symptoms and Cardiometabolic risk factors)

# Depressive symptoms (CES-D 8 items):
Raw variables: 
    1. 8 items of CES-D: R8DEPRES R8EFFORT R8SLEEPR R8WHAPPY R8FLONE R8ENLIFE R8FSAD R8GOING
        Yes/No (0-1) questions, so the highest score is 8
        cutoff score 4/8 (4 or above)
        If 1 or more items are missing do not score
    2. R8CESD -> Total score measured by Rand
        RwCESD is the sum of RwDEPRES, RwEFFORT, RwSLEEPR, (1-RwWHAPPY), RwFLONE, RwFSAD, RwGOING, and (1-RwENLIFE)
Steps:
1. Recode reverse-scored questions (happy and enjoyed life: R8WHAPPY, R8ENLIFE) 
    1=yes -> 0
    0=no  -> 1
2. Sum of 8 items
    (do not use SUM function, use + to add all the items excluding those with missing values) 
    *The comparison showed sumscore and R8CESD (by RAND data) produce equal sumscore, so for waves 8-13 use RAND data to measure depressive symptoms
3. Recode into "Hwv8_depressive_symptoms" (0=no/low depressive symptoms, 1= high depressive symptoms)



# Wave 8

RECODE R8WHAPPY R8ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv8_cesd_happy Hwv8_cesd_enlife.
VARIABLE LABELS  Hwv8_cesd_happy  'CESD Was happy (0,1) (wave 8)' 
    /Hwv8_cesd_enlife  'CESD Enjoyed life (0,1) (wave 8)'.
EXECUTE.


RECODE R8DEPRES R8EFFORT R8SLEEPR R8FLONE R8FSAD R8GOING (ELSE=Copy) INTO 
Hwv8_cesd_depressed Hwv8_cesd_effort Hwv8_cesd_sleep Hwv8_cesd_lonely Hwv8_cesd_sad Hwv8_cesd_going.
VARIABLE LABELS  Hwv8_cesd_depressed 'CES-D Felt depressed (0,1) (wave 8)' 
/Hwv8_cesd_effort 'CES-D Everything an effort (0,1) (wave 8)' 
/Hwv8_cesd_sleep 'CESD Sleep restless (0,1) (wave 8)' 
/Hwv8_cesd_lonely 'CESD Felt lonely (0,1) (wave 8)'  
/Hwv8_cesd_sad 'CESD Felt sad (0,1) (wave 8)' 
/Hwv8_cesd_going 'CESD Could not get going (0,1) (wave 8)'.
EXECUTE.


COMPUTE Hwv8_cesd_sumscore = Hwv8_cesd_depressed + Hwv8_cesd_effort + Hwv8_cesd_sleep + Hwv8_cesd_lonely
     + Hwv8_cesd_sad + Hwv8_cesd_going + Hwv8_cesd_happy + Hwv8_cesd_enlife.
VARIABLE LABELS  Hwv8_cesd_sumscore 'Sum of 8 items of CESD (wave 8)'.
EXECUTE.


RECODE R8CESD (ELSE=Copy) INTO Hwv8_cesd_score.
VARIABLE LABELS  Hwv8_cesd_score 'CESD total score measured by Rand (wave 8)'.
EXECUTE.


RECODE Hwv8_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 8 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.



# Wave 9

RECODE R9WHAPPY R9ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv9_cesd_happy Hwv9_cesd_enlife.
VARIABLE LABELS  Hwv9_cesd_happy 'CESD Was happy (0,1) (wave 9)' 
    /Hwv9_cesd_enlife 'CESD Enjoyed life (0,1) (wave 9)'.
EXECUTE.


RECODE R9DEPRES R9EFFORT R9SLEEPR R9FLONE R9FSAD R9GOING (ELSE=Copy) INTO 
Hwv9_cesd_depressed Hwv9_cesd_effort Hwv9_cesd_sleep Hwv9_cesd_lonely Hwv9_cesd_sad Hwv9_cesd_going.
VARIABLE LABELS  Hwv9_cesd_depressed 'CES-D Felt depressed (0,1) (wave 9)' 
/Hwv9_cesd_effort 'CES-D Everything an effort (0,1) (wave 9)' 
/Hwv9_cesd_sleep 'CESD Sleep restless (0,1) (wave 9)' 
/Hwv9_cesd_lonely 'CESD Felt lonely (0,1) (wave 9)'  
/Hwv9_cesd_sad 'CESD Felt sad (0,1) (wave 9)' 
/Hwv9_cesd_going 'CESD Could not get going (0,1) (wave 9)'.
EXECUTE.


COMPUTE Hwv9_cesd_sumscore = Hwv9_cesd_depressed + Hwv9_cesd_effort + Hwv9_cesd_sleep + Hwv9_cesd_lonely
     + Hwv9_cesd_sad + Hwv9_cesd_going + Hwv9_cesd_happy + Hwv9_cesd_enlife.
VARIABLE LABELS  Hwv9_cesd_sumscore 'Sum of 8 items of CESD (wave 9)'.
EXECUTE.


RECODE R9CESD (ELSE=Copy) INTO Hwv9_cesd_score.
VARIABLE LABELS  Hwv9_cesd_score 'CESD total score measured by Rand (wave 9)'.
EXECUTE.


RECODE Hwv9_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv9_depressive_symptoms.
VARIABLE LABELS  Hwv9_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 9 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.




# Wave 10

RECODE R10WHAPPY R10ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv10_cesd_happy Hwv10_cesd_enlife.
VARIABLE LABELS  Hwv10_cesd_happy 'CESD Was happy (0,1) (wave 10)' 
    /Hwv10_cesd_enlife 'CESD Enjoyed life (0,1) (wave 10)'.
EXECUTE.


RECODE R10DEPRES R10EFFORT R10SLEEPR R10FLONE R10FSAD R10GOING (ELSE=Copy) INTO 
Hwv10_cesd_depressed Hwv10_cesd_effort Hwv10_cesd_sleep Hwv10_cesd_lonely Hwv10_cesd_sad Hwv10_cesd_going.
VARIABLE LABELS  Hwv10_cesd_depressed 'CES-D Felt depressed (0,1) (wave 10)' 
/Hwv10_cesd_effort 'CES-D Everything an effort (0,1) (wave 10)' 
/Hwv10_cesd_sleep 'CESD Sleep restless (0,1) (wave 10)' 
/Hwv10_cesd_lonely 'CESD Felt lonely (0,1) (wave 10)'  
/Hwv10_cesd_sad 'CESD Felt sad (0,1) (wave 10)' 
/Hwv10_cesd_going 'CESD Could not get going (0,1) (wave 10)'.
EXECUTE.


COMPUTE Hwv10_cesd_sumscore = Hwv10_cesd_depressed + Hwv10_cesd_effort + Hwv10_cesd_sleep + Hwv10_cesd_lonely
     + Hwv10_cesd_sad + Hwv10_cesd_going + Hwv10_cesd_happy + Hwv10_cesd_enlife.
VARIABLE LABELS  Hwv10_cesd_sumscore 'Sum of 8 items of CESD (wave 10)'.
EXECUTE.


RECODE R10CESD (ELSE=Copy) INTO Hwv10_cesd_score.
VARIABLE LABELS  Hwv10_cesd_score 'CESD total score measured by Rand (wave 10)'.
EXECUTE.


RECODE Hwv10_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv10_depressive_symptoms.
VARIABLE LABELS  Hwv10_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 10 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.




# Wave 11


RECODE R11WHAPPY R11ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv11_cesd_happy Hwv11_cesd_enlife.
VARIABLE LABELS  Hwv11_cesd_happy 'CESD Was happy (0,1) (wave 11)' 
    /Hwv11_cesd_enlife 'CESD Enjoyed life (0,1) (wave 11)'.
EXECUTE.


RECODE R11DEPRES R11EFFORT R11SLEEPR R11FLONE R11FSAD R11GOING (ELSE=Copy) INTO 
Hwv11_cesd_depressed Hwv11_cesd_effort Hwv11_cesd_sleep Hwv11_cesd_lonely Hwv11_cesd_sad Hwv11_cesd_going.
VARIABLE LABELS  Hwv11_cesd_depressed 'CES-D Felt depressed (0,1) (wave 11)' 
/Hwv11_cesd_effort 'CES-D Everything an effort (0,1) (wave 11)' 
/Hwv11_cesd_sleep 'CESD Sleep restless (0,1) (wave 11)' 
/Hwv11_cesd_lonely 'CESD Felt lonely (0,1) (wave 11)'  
/Hwv11_cesd_sad 'CESD Felt sad (0,1) (wave 11)' 
/Hwv11_cesd_going 'CESD Could not get going (0,1) (wave 11)'.
EXECUTE.


COMPUTE Hwv11_cesd_sumscore = Hwv11_cesd_depressed + Hwv11_cesd_effort + Hwv11_cesd_sleep + Hwv11_cesd_lonely
     + Hwv11_cesd_sad + Hwv11_cesd_going + Hwv11_cesd_happy + Hwv11_cesd_enlife.
VARIABLE LABELS  Hwv11_cesd_sumscore 'Sum of 8 items of CESD (wave 11)'.
EXECUTE.


RECODE R11CESD (ELSE=Copy) INTO Hwv11_cesd_score.
VARIABLE LABELS  Hwv11_cesd_score 'CESD total score measured by Rand (wave 11)'.
EXECUTE.


RECODE Hwv11_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv11_depressive_symptoms.
VARIABLE LABELS  Hwv11_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 11 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.



# Wave 12

RECODE R12WHAPPY R12ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv12_cesd_happy Hwv12_cesd_enlife.
VARIABLE LABELS  Hwv12_cesd_happy 'CESD Was happy (0,1) (wave 12)' 
    /Hwv12_cesd_enlife 'CESD Enjoyed life (0,1) (wave 12)'.
EXECUTE.


RECODE R12DEPRES R12EFFORT R12SLEEPR R12FLONE R12FSAD R12GOING (ELSE=Copy) INTO 
Hwv12_cesd_depressed Hwv12_cesd_effort Hwv12_cesd_sleep Hwv12_cesd_lonely Hwv12_cesd_sad Hwv12_cesd_going.
VARIABLE LABELS  Hwv12_cesd_depressed 'CES-D Felt depressed (0,1) (wave 12)' 
/Hwv12_cesd_effort 'CES-D Everything an effort (0,1) (wave 12)' 
/Hwv12_cesd_sleep 'CESD Sleep restless (0,1) (wave 12)' 
/Hwv12_cesd_lonely 'CESD Felt lonely (0,1) (wave 12)'  
/Hwv12_cesd_sad 'CESD Felt sad (0,1) (wave 12)' 
/Hwv12_cesd_going 'CESD Could not get going (0,1) (wave 12)'.
EXECUTE.


COMPUTE Hwv12_cesd_sumscore = Hwv12_cesd_depressed + Hwv12_cesd_effort + Hwv12_cesd_sleep + Hwv12_cesd_lonely
     + Hwv12_cesd_sad + Hwv12_cesd_going + Hwv12_cesd_happy + Hwv12_cesd_enlife.
VARIABLE LABELS  Hwv12_cesd_sumscore 'Sum of 8 items of CESD (wave 12)'.
EXECUTE.


RECODE R12CESD (ELSE=Copy) INTO Hwv12_cesd_score.
VARIABLE LABELS  Hwv12_cesd_score 'CESD total score measured by Rand (wave 12)'.
EXECUTE.


RECODE Hwv12_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv12_depressive_symptoms.
VARIABLE LABELS  Hwv12_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 12 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.



# Wave 13

RECODE R13WHAPPY R13ENLIFE (0=1) (1=0) (ELSE=SYSMIS) INTO Hwv13_cesd_happy Hwv13_cesd_enlife.
VARIABLE LABELS  Hwv13_cesd_happy 'CESD Was happy (0,1) (wave 13)' 
    /Hwv13_cesd_enlife 'CESD Enjoyed life (0,1) (wave 13)'.
EXECUTE.


RECODE R13DEPRES R13EFFORT R13SLEEPR R13FLONE R13FSAD R13GOING (ELSE=Copy) INTO 
Hwv13_cesd_depressed Hwv13_cesd_effort Hwv13_cesd_sleep Hwv13_cesd_lonely Hwv13_cesd_sad Hwv13_cesd_going.
VARIABLE LABELS  Hwv13_cesd_depressed 'CES-D Felt depressed (0,1) (wave 13)' 
/Hwv13_cesd_effort 'CES-D Everything an effort (0,1) (wave 13)' 
/Hwv13_cesd_sleep 'CESD Sleep restless (0,1) (wave 13)' 
/Hwv13_cesd_lonely 'CESD Felt lonely (0,1) (wave 13)'  
/Hwv13_cesd_sad 'CESD Felt sad (0,1) (wave 13)' 
/Hwv13_cesd_going 'CESD Could not get going (0,1) (wave 13)'.
EXECUTE.


COMPUTE Hwv13_cesd_sumscore = Hwv13_cesd_depressed + Hwv13_cesd_effort + Hwv13_cesd_sleep + Hwv13_cesd_lonely
     + Hwv13_cesd_sad + Hwv13_cesd_going + Hwv13_cesd_happy + Hwv13_cesd_enlife.
VARIABLE LABELS  Hwv13_cesd_sumscore 'Sum of 8 items of CESD (wave 13)'.
EXECUTE.


RECODE R13CESD (ELSE=Copy) INTO Hwv13_cesd_score.
VARIABLE LABELS  Hwv13_cesd_score 'CESD total score measured by Rand (wave 13)'.
EXECUTE.


RECODE Hwv13_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv13_depressive_symptoms.
VARIABLE LABELS  Hwv13_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 13 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.



# Wave 14
CES-D 8 items -> data from Cognition Section D variables: "QD110 - QD117" 
values 1 = yes,  5 = no

RECODE QD113 QD113 (5=1) (1=0) (8=SYSMIS) (9=SYSMIS) (ELSE=SYSMIS) INTO Hwv14_cesd_happy Hwv14_cesd_enlife.
VARIABLE LABELS  Hwv14_cesd_happy 'CESD Was happy (0,1) (wave 14)' 
    /Hwv14_cesd_enlife 'CESD Enjoyed life (0,1) (wave 14)'.
EXECUTE.


RECODE QD110 QD111 QD112 QD114 QD116 QD117 (1=1) (5=0) (8=SYSMIS) (9=SYSMIS) (ELSE=SYSMIS) INTO 
Hwv14_cesd_depressed Hwv14_cesd_effort Hwv14_cesd_sleep Hwv14_cesd_lonely Hwv14_cesd_sad Hwv14_cesd_going.
VARIABLE LABELS  Hwv14_cesd_depressed 'CES-D Felt depressed (0,1) (wave 14)' 
/Hwv14_cesd_effort 'CES-D Everything an effort (0,1) (wave 14)' 
/Hwv14_cesd_sleep 'CESD Sleep restless (0,1) (wave 14)' 
/Hwv14_cesd_lonely 'CESD Felt lonely (0,1) (wave 14)'  
/Hwv14_cesd_sad 'CESD Felt sad (0,1) (wave 14)' 
/Hwv14_cesd_going 'CESD Could not get going (0,1) (wave 14)'.
EXECUTE.


COMPUTE Hwv14_cesd_sumscore = Hwv14_cesd_depressed + Hwv14_cesd_effort + Hwv14_cesd_sleep + Hwv14_cesd_lonely
     + Hwv14_cesd_sad + Hwv14_cesd_going + Hwv14_cesd_happy + Hwv14_cesd_enlife.
VARIABLE LABELS  Hwv14_cesd_sumscore 'Sum of 8 items of CESD (wave 14)'.
EXECUTE.


RECODE Hwv14_cesd_sumscore (4 thru 8=1) (0 thru 3=0) (SYSMIS=SYSMIS) INTO Hwv14_depressive_symptoms.
VARIABLE LABELS  Hwv14_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 14 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.






# Cardiometabolic markers
Cardiometabolic markers assessememt takes place every 4 years: wave 8 (2006), wave 10 (2010), wave 12 (2014)
NHANES equivalent assay values for analytic use!
1. Inflammation indicator of C-reactive protein (CRP) 
2. Blood pressure (BP)
3. Diabetes
4. Glucose (HbA1c) 
5. Abdomical obesity (waist circumference and BMI - ethnic specific values)
6. HDL cholesterol 



# Wave 8 (2006) (baseline)

# Inflammation CRP 
Raw variable: KCRP_ADJ
Normal level of CRP <= 3 ug/mL 
units of measurement: (ug/mL means ?g/mL = microgram per milliliter) (?g/mL = mg/L [same measurement as ELSA]) see: http://unitslab.com/node/67
Steps: 
1. Recode KCRP_ADJ into a new CRP variable
2. Recode into dichotomised variable to divide into normal level of inflammation and high level of inflammation (0-1)


RECODE KCRP_ADJ (ELSE=Copy) INTO Hwv8_crp_level.
VARIABLE LABELS  Hwv8_crp_level 'CRP level (ug/mL) without n/a (wave 8)'.
EXECUTE.

RECODE Hwv8_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Hwv8_crp.
VARIABLE LABELS  Hwv8_crp 'CRP level dichotomised into normal/high (normal CRP <= 3 ug/mL) (wave 8)'.
EXECUTE.




# HDL cholesterol
IDFcriteria
          Reduced HDL cholesterol 
          < 40 mg/dL (1.03 mmol/L) in males
          < 50 mg/dL (1.29 mmol/L) in females
           or specific treatment for this lipid abnormality
Raw available cholesterol-related variables:
RwCHOLST -> CHOLESTEROL TEST SINCE PREV WAVE (preventative measure - NO USE!) (0-1)
KC110 -> CHOLESTEROL TEST SINCE PREV WAVE (NO USE!)
    Since we talked to you last in R LAST IW MONTH, YEAR/In the last two
    years, have you had any of the following medical tests or procedures?
    A blood test for cholesterol?
    Values: (1= yes, 5= no, 8=N/A, 9=N/A)
KN360 -> RX DRUGS REGULARLY CHOLESTEROL 
    Do you regularly take prescription medications for any of the following common health problems:
    To help lower your cholesterol? 
    Values: (1= yes, 5= no, 8=N/A, 9=N/A) 
KHDL_ADJ
    Unit of measurment mg/dL
Steps:
1. Recode KHDL_ADJ into HDL cholesterol level
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE KHDL_ADJ (ELSE=Copy) INTO Hwv8_hdl_level.
VARIABLE LABELS  Hwv8_hdl_level 'HDL cholesterol level (mg/dL) without n/a (wave 8)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv8_hdl_level (Lowest thru 39=1) (40 thru Highest=0) 
    INTO Hwv8_male_hdl.
END IF.
VARIABLE LABELS  Hwv8_male_hdl 'Male HDL cholesterol (wave 8): IDF criteria < 40 mg/dL'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv8_hdl_level (Lowest thru 49=1) (50 thru Highest=0) 
    INTO Hwv8_female_hdl.
END IF.
VARIABLE LABELS  Hwv8_female_hdl 'Female HDL cholesterol (wave 8): IDF criteria < 50 mg/dL'.
EXECUTE.

* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Hwv8_hdl_sum=SUM(Hwv8_male_hdl,Hwv8_female_hdl).
VARIABLE LABELS  Hwv8_hdl_sum 'Sum of male and female HDL cholesterol (wave 8)'.
EXECUTE.

RECODE Hwv8_hdl_sum (0=0) (1 thru Highest=1) INTO Hwv8_hdl.
VARIABLE LABELS  Hwv8_hdl 'HDL cholesterol dichotomised into normal/abnormal (wave 8)'.
EXECUTE.




# Abdominal obesity
Raw variable: 
- R8BMI -> Body Mass Index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- KI907 -> WAIST MEASURMENT
    Unit of measurment: inches
    IDFcriteria (ethnic group: Europids)
          Abdominal obesity 
          Male 94 cm -> 37.01 inches
          Female 80 cm -> 31.50 inches
Steps:
Waist circumference
    1. Recode KI907 into waist circumeference score with n/a (there is 6 case with score 999 -> recode into SYSMIS)
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode R8BMI into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)
    


RECODE KI907 (990 thru Highest=SYSMIS) (ELSE=Copy) INTO Hwv8_waist.
VARIABLE LABELS  Hwv8_waist 'Waist circumference in inches without n/a (wave 8)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv8_waist (Lowest thru 37.00=0) (37.01 thru Highest=1) INTO Hwv8_malewaist_ao.
END IF.
VARIABLE LABELS  Hwv8_malewaist_ao 'Male Waist circumference (inches) (wave 8): IDF criteria for Abdominal Obesity'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv8_waist (Lowest thru 31.49=0) (31.50 thru Highest=1) INTO Hwv8_femalewaist_ao.
END IF.
VARIABLE LABELS  Hwv8_femalewaist_ao 'Female Waist circumference (inches) (wave 8): IDF criteria for Abdominal Obesity'.
EXECUTE.


COMPUTE Hwv8_obesity_waist_sum=SUM(Hwv8_malewaist_ao,Hwv8_femalewaist_ao).
VARIABLE LABELS  Hwv8_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 8)'.
EXECUTE.

RECODE Hwv8_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Hwv8_obesity_waist.
VARIABLE LABELS  Hwv8_obesity_waist 'Abdominal obesity based on waist circumference at wave 8 (yes/no)'.
EXECUTE.




RECODE R8BMI (ELSE=Copy) INTO Hwv8_bmi_score.
VARIABLE LABELS  Hwv8_bmi_score 'BMI score kg/m² (wave 8)'.
EXECUTE.


RECODE Hwv8_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Hwv8_obesity_bmi.
VARIABLE LABELS  Hwv8_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 8 (yes/no)'.
EXECUTE.


COMPUTE Hwv8_waist_bmi_sum=SUM(Hwv8_obesity_waist,Hwv8_obesity_bmi).
VARIABLE LABELS  Hwv8_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 8)'.
EXECUTE.


RECODE Hwv8_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Hwv8_obesity.
VARIABLE LABELS  Hwv8_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 8'.
EXECUTE.




# Blood pressure (BP)
Physical measure: 
KI859 (BP 1 systolic), KI860 (BP 1 diastolic), KI864 (BP 2 systolic), KI865 (BP 2 diastolic), KI869 (BP 3 systolic), KI870 (BP 3 diastolic)
    BP was measured three times (so there are available 3 measures for systolic diastolic and pulse)
    To create a valid mean diastolic and systolic BP, I will calculate the mean of the 2nd and 3rd measurement
Self-reports:   
R8HIBP -> R reports high BP this wv (0-1)
R8HIBPE -> R ever had high blood pressure (0-1)
KC005 -> HIGH BLOOD PRESSURE
    Has a doctor ever told you that you have high blood pressure or hypertension?
    Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
KC006 -> BLOOD PRESSURE MEDICATION
    In order to lower your blood pressure, are you now taking any medication?
    Values: 1=yes, 5=no, 8=N/A, 9= N/A
KC008 -> BLOOD PRESSURE UNDER CONTROL (NO USE!)
    Is your blood pressure generally under control?
    Values: 1=yes, 5=no, 8=N/A, 9= N/A
KC009 -> HIGH BLOOD PRESSURE- WORSE/SAME (NO USE!)
    Compared to when we interviewed you in R LAST IW MONTH, YEAR, 
    is your high blood pressure better, worse, or is it about the same as it was then?
    Values: 1=better, 2=about the same, 3= worse, 8=N/A, 9= N/A
IDF criteria for raised blood pressure: systolic BP >= 130 or diastolic BP >= 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Mean Diastolic BP
2. Mean Systolic BP 
3. Recode Diastolic BP
4. Recode Systolic BP
5. Sum of diastolic, systolic BP
6. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP


RECODE KI859 KI860 KI864 KI865 KI869 KI870 (ELSE=Copy) INTO Hwv8_1systolic_bp Hwv8_1diastolic_bp Hwv8_2systolic_bp Hwv8_2diastolic_bp Hwv8_3systolic_bp Hwv8_3diastolic_bp.
VARIABLE LABELS  Hwv8_1systolic_bp 'Systolic blood pressure (BP) 1st measure in time 1 without n/a (wave 8)' /Hwv8_1diastolic_bp 'Diastolic BP 1st measure without n/a (wave 8)' 
/Hwv8_2systolic_bp 'Systolic BP 2nd measure without n/a (wave 8)' /Hwv8_2diastolic_bp 'Diastolic BP 2nd measure without n/a (wave 8)' /Hwv8_3systolic_bp 'Systolic BP 3rd measure without n/a (wave 8)' 
/Hwv8_3diastolic_bp 'Diastolic BP 3rd measure without n/a (wave 8)'.
EXECUTE.

COMPUTE Hwv8_systolic_mean=MEAN(Hwv8_2systolic_bp,Hwv8_3systolic_bp).
VARIABLE LABELS  Hwv8_systolic_mean 'Mean systolic BP calculated by the 2nd and 3rd measures of systolic BP at time 2 and 3 (wave 8)'.
EXECUTE.

COMPUTE Hwv8_diastolic_mean=MEAN(Hwv8_2diastolic_bp,Hwv8_3diastolic_bp).
VARIABLE LABELS  Hwv8_diastolic_mean 'Mean diastolic BP calculated by the 2nd and 3rd measures of diastolic BP at time 2 and 3 (wave 8)'.
EXECUTE.


RECODE Hwv8_systolic_mean (Lowest thru 129.9=0) (130 thru Highest=1) INTO Hwv8_systolic_bp.
VARIABLE LABELS  Hwv8_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria (wave 8)'.
EXECUTE.

RECODE Hwv8_diastolic_mean (Lowest thru 84.9=0) (85 thru Highest=1) INTO Hwv8_diastolic_bp.
VARIABLE LABELS  Hwv8_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria (wave 8)'.
EXECUTE.



* Sum of systolic, diastolic BP and recode into a 0-1 variable


COMPUTE Hwv8_bp_sum=SUM(Hwv8_systolic_bp,Hwv8_diastolic_bp).
VARIABLE LABELS  Hwv8_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 8)'.
EXECUTE.

RECODE Hwv8_bp_sum (0=0) (1 thru Highest=1) INTO Hwv8_bp.
VARIABLE LABELS  Hwv8_bp 'Blood Pressure (BP) dichotomised into normal/abnormal'.
EXECUTE.





# Diabetes and Glycemia
Blood measure:
    KA1C_ADJ (HbA1c in %)
Self-reported diabets/blood sugar:
    R8DIAB -> R reports diabetes this wv 
    R8DIABE -> R8DIABE:W8 R ever had diabetes
    R8DIABS-> R had diabetes since last IW (0-1) (NO USE !)
    KC010 -> DIABETES
        Has a doctor ever told you that you have diabetes or high blood sugar?
        Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
     KC214 -> YEAR DIABETES FIRST DIAGNOSED (NO USE !)
         In what year was your diabetes first diagnosed?
     KC011 -> SWALLOWED MEDICATION FOR DIABETES
         In order to treat or control your diabetes, are you now taking
        medication that you swallow?
        Values: 1=yes, 5=no, 8=N/A, 9= N/A
     KC012 -> TAKING INSULIN - DIABETES
         Are you now using insulin shots or a pump?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     KC236 -> DOC RECOMMEND INSULIN - DIABETES (NO USE !)
         Has a doctor ever recommended to you that you use insulin?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     KC015 -> DIABETES UNDER CONTROL (NO USE !)
         Is your diabetes generally under control?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     KC016 -> DIABETES BETTER/WORSE/SAME (NO USE !)
         Compared to when we interviewed you last (in R LAST IW MONTH, YEAR),
         has your diabetes gotten better, worse, or stayed about the same?
         Values: 1=better, 2=about the same, 3= worse, 8=N/A, 9= N/A
IDF criteria for raised fasting plasma glucose (FPG) ? 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
In HRS FPG is not available, so the blood measure of HbA1c is used 
HbA1c >= 6.5% (48 mmol/mol)
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode HbA1c >= 6.5% (48 mmol/mol)
3. Sum of diabetes diagnosis and HbA1c
4. Dichotomous variable of Glycemia (yes/no)



* Self-reported diabetes diagnosis
    

RECODE KC010 (-9=SYSMIS) (-8=SYSMIS) (1=1) (3=1) (4=0) (5=0) INTO Hwv8_diabetes_before.
VARIABLE LABELS  Hwv8_diabetes_before 'Has a doctor ever told you that you have diabetes or high blood sugar (wave 8)'.
EXECUTE.

RECODE R8DIAB R8DIABE (3=1) (4=0) (ELSE=Copy) INTO Hwv8_diabetes_report Hwv8_diabetesevr.
VARIABLE LABELS  Hwv8_diabetes_report 'Self-report of diabetes at wave 8' /Hwv8_diabetesevr 'Ever had diabetes without n/a (wave 8)'.
EXECUTE.

COMPUTE Hwv8_diabetes_reportevr_sum=SUM(Hwv8_diabetes_before,Hwv8_diabetes_report,Hwv8_diabetesevr).
VARIABLE LABELS  Hwv8_diabetes_reportevr_sum 'Sum of diabetes report as measured by self-report and ever had variables (wave 8)'.
EXECUTE.

RECODE Hwv8_diabetes_reportevr_sum (0=0) (1 thru Highest=1) INTO Hwv8_diabetes_reportevr.
VARIABLE LABELS  Hwv8_diabetes_reportevr 'Self-report or ever had diabetes dichotomised into yes/no (wave 8)'.
EXECUTE.


* HbA1c level


RECODE KA1C_ADJ (ELSE=Copy) INTO Hwv8_HbA1c_level.
VARIABLE LABELS  Hwv8_HbA1c_level 'Hemoglobin A1c (HbA1c) without n/a (wave 8)'.
EXECUTE.

RECODE Hwv8_HbA1c_level (Lowest thru 6.4=0) (6.5 thru Highest=1) INTO Hwv8_HbA1c.
VARIABLE LABELS  Hwv8_HbA1c 'HbA1c (%): IDF and WHO criteria (wave 8)'.
EXECUTE.


*Sum of HbA1c and previously diagnosed diabetes and recode into a 0-1 variable

COMPUTE Hwv8_diabetes_HbA1c_sum=SUM(Hwv8_diabetes_reportevr,Hwv8_HbA1c).
VARIABLE LABELS  Hwv8_diabetes_HbA1c_sum 'Sum of HbA1c and diabetes self-reported diagnosis (wave 8)'.
EXECUTE.

RECODE  Hwv8_diabetes_HbA1c_sum (0=0) (1 thru Highest=1) INTO Hwv8_glycemia.
VARIABLE LABELS  Hwv8_glycemia 'Glycemia based on diabetes diagnosis and/or HbA1c level dichotomised into normal/abnormal (wave 8)'.
EXECUTE.




# Wave 10 (2010)

# CRP 
Raw variable: MCRP_ADJ
Normal level of CRP <= 3 ug/mL 
units of measurement: (ug/mL means ?g/mL = microgram per milliliter) (?g/mL = mg/L [same measurement as ELSA]) see: http://unitslab.com/node/67
Steps: 
1. Recode MCRP_ADJ into a new CRP variable
2. Recode into dichotomised variable to divide into normal level of inflammation and high level of inflammation (0-1)


RECODE MCRP_ADJ (ELSE=Copy) INTO Hwv10_crp_level.
VARIABLE LABELS  Hwv10_crp_level 'CRP level (ug/mL) without n/a (wave 10)'.
EXECUTE.

RECODE Hwv10_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Hwv10_crp.
VARIABLE LABELS  Hwv10_crp 'CRP level dichotomised into normal/high (normal CRP <= 3 ug/mL) (wave 10)'.
EXECUTE.





# HDL cholesterol
IDFcriteria
          Reduced HDL cholesterol 
          < 40 mg/dL (1.03 mmol/L) in males
          < 50 mg/dL (1.29 mmol/L) in females
           or specific treatment for this lipid abnormality
Raw available cholesterol-related variables:
MC110 -> CHOLESTEROL TEST SINCE PREV WAVE (NO USE!)
    Since we talked to you last in R LAST IW MONTH, YEAR/In the last two
    years, have you had any of the following medical tests or procedures?
    A blood test for cholesterol?
    Values: (1= yes, 5= no, 8=N/A, 9=N/A)
MN360 -> RX DRUGS REGULARLY CHOLESTEROL
    Do you regularly take prescription medications for any of the following common health problems:
    To help lower your cholesterol? 
    Values: (1= yes, 5= no, 8=N/A, 9=N/A) 
MHDL_ADJ
    Unit of measurment mg/dL
Steps:
1. Recode MHDL_ADJ into HDL cholesterol level
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)



* HDL level (males/females)

RECODE MHDL_ADJ (ELSE=Copy) INTO Hwv10_hdl_level.
VARIABLE LABELS  Hwv10_hdl_level 'HDL cholesterol level (mg/dL) without n/a (wave 10)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv10_hdl_level (Lowest thru 39=1) (40 thru Highest=0) 
    INTO Hwv10_male_hdl.
END IF.
VARIABLE LABELS  Hwv10_male_hdl 'Male HDL cholesterol (wave 10): IDF criteria < 40 mg/dL'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv10_hdl_level (Lowest thru 49=1) (50 thru Highest=0) 
    INTO Hwv10_female_hdl.
END IF.
VARIABLE LABELS  Hwv10_female_hdl 'Female HDL cholesterol (wave 10): IDF criteria < 50 mg/dL'.
EXECUTE.


* Sum of male, female HDL and recode into 0-1 variable


COMPUTE Hwv10_hdl_sum=SUM(Hwv10_male_hdl,Hwv10_female_hdl).
VARIABLE LABELS  Hwv10_hdl_sum 'Sum of male and female HDL cholesterol (wave 10)'.
EXECUTE.

RECODE Hwv10_hdl_sum (0=0) (1 thru Highest=1) INTO Hwv10_hdl.
VARIABLE LABELS  Hwv10_hdl 'HDL cholesterol dichotomised into normal/abnormal (wave 10)'.
EXECUTE.




# Abdominal obesity
Raw variable: 
- R10BMI -> Body Mass Index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- MI907 -> WAIST MEASURMENT
    Unit of measurment: inches
    IDFcriteria (ethnic group: Europids)
          Abdominal obesity 
          Male ? 94 cm -> ? 37.01 inches
          Female ? 80 cm -> ? 31.50 inches
Steps:
Waist circumference
    1. Recode MI907 into waist circumeference score with n/a (there is 1 case with score 999 -> recode into SYSMIS)
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode R10BMI into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)
    


RECODE MI907 (990 thru Highest=SYSMIS) (ELSE=Copy) INTO Hwv10_waist.
VARIABLE LABELS  Hwv10_waist 'Waist circumference in inches without n/a (wave 10)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv10_waist (Lowest thru 37.00=0) (37.01 thru Highest=1) INTO Hwv10_malewaist_ao.
END IF.
VARIABLE LABELS  Hwv10_malewaist_ao 'Male Waist circumference (inches) (wave 10): IDF criteria for Abdominal Obesity'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv10_waist (Lowest thru 31.49=0) (31.50 thru Highest=1) INTO Hwv10_femalewaist_ao.
END IF.
VARIABLE LABELS  Hwv10_femalewaist_ao 'Female Waist circumference (inches) (wave 10): IDF criteria for Abdominal Obesity'.
EXECUTE.

COMPUTE Hwv10_obesity_waist_sum=SUM(Hwv10_malewaist_ao,Hwv10_femalewaist_ao).
VARIABLE LABELS  Hwv10_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 10)'.
EXECUTE.

RECODE Hwv10_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Hwv10_obesity_waist.
VARIABLE LABELS  Hwv10_obesity_waist 'Abdominal obesity based on waist circumference at wave 10 (yes/no)'.
EXECUTE.




RECODE R10BMI (ELSE=Copy) INTO Hwv10_bmi_score.
VARIABLE LABELS  Hwv10_bmi_score 'BMI score kg/m² (wave 10)'.
EXECUTE.


RECODE Hwv10_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Hwv10_obesity_bmi.
VARIABLE LABELS  Hwv10_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 10 (yes/no)'.
EXECUTE.


COMPUTE Hwv10_waist_bmi_sum=SUM(Hwv10_obesity_waist,Hwv10_obesity_bmi).
VARIABLE LABELS  Hwv10_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 10)'.
EXECUTE.


RECODE Hwv10_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Hwv10_obesity.
VARIABLE LABELS  Hwv10_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 10'.
EXECUTE.




# Blood pressure (BP)
Physical measure: 
MI859 (BP 1 systolic), MI860 (BP 1 diastolic), MI864 (BP 2 systolic), MI865 (BP 2 diastolic), MI869 (BP 3 systolic), MI870 (BP 3 diastolic)
    BP was measured three times (so there are available 3 measures for systolic diastolic and pulse)
    To create a valid mean diastolic and systolic BP, I will calculate the mean of the 2nd and 3rd measurement
Self-reports:   
R10HIBP -> R reports high BP this wv (0-1)
R10HIBPE -> R ever had high blood pressure (0-1)
MC005 -> HIGH BLOOD PRESSURE
    Has a doctor ever told you that you have high blood pressure or hypertension?
    Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
MC006 -> BLOOD PRESSURE MEDICATION
    In order to lower your blood pressure, are you now taking any medication?
    Values: 1=yes, 5=no, 8=N/A, 9= N/A
MC008 -> BLOOD PRESSURE UNDER CONTROL (NO USE!)
    Is your blood pressure generally under control?
    Values: 1=yes, 5=no, 8=N/A, 9= N/A
MC009 -> HIGH BLOOD PRESSURE- WORSE/SAME (NO USE!)
    Compared to when we interviewed you in R LAST IW MONTH, YEAR, 
    is your high blood pressure better, worse, or is it about the same as it was then?
    Values: 1=better, 2=about the same, 3= worse, 8=N/A, 9= N/A
IDF criteria for raised blood pressure: systolic BP >= 130 or diastolic BP >= 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Mean Diastolic BP
2. Mean Systolic BP 
3. Recode Diastolic BP
4. Recode Systolic BP
5. Sum of diastolic, systolic BP
6. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP


RECODE MI859 MI860 MI864 MI865 MI869 MI870 (ELSE=Copy) INTO Hwv10_1systolic_bp Hwv10_1diastolic_bp Hwv10_2systolic_bp Hwv10_2diastolic_bp Hwv10_3systolic_bp Hwv10_3diastolic_bp.
VARIABLE LABELS  Hwv10_1systolic_bp 'Systolic blood pressure (BP) 1st measure in time 1 without n/a (wave 10)' /Hwv10_1diastolic_bp 'Diastolic BP 1st measure without n/a (wave 10)' 
/Hwv10_2systolic_bp 'Systolic BP 2nd measure without n/a (wave 10)' /Hwv10_2diastolic_bp 'Diastolic BP 2nd measure without n/a (wave 10)' /Hwv10_3systolic_bp 'Systolic BP 3rd measure without n/a (wave 10)' 
/Hwv10_3diastolic_bp 'Diastolic BP 3rd measure without n/a (wave 10)'.
EXECUTE.

COMPUTE Hwv10_systolic_mean=MEAN(Hwv10_2systolic_bp,Hwv10_3systolic_bp).
VARIABLE LABELS  Hwv10_systolic_mean 'Mean systolic BP calculated by the 2nd and 3rd measures of systolic BP at time 2 and 3 (wave 10)'.
EXECUTE.

COMPUTE Hwv10_diastolic_mean=MEAN(Hwv10_2diastolic_bp,Hwv10_3diastolic_bp).
VARIABLE LABELS  Hwv10_diastolic_mean 'Mean diastolic BP calculated by the 2nd and 3rd measures of diastolic BP at time 2 and 3 (wave 10)'.
EXECUTE.


RECODE Hwv10_systolic_mean (Lowest thru 129.9=0) (130 thru Highest=1) INTO Hwv10_systolic_bp.
VARIABLE LABELS  Hwv10_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria (wave 10)'.
EXECUTE.

RECODE Hwv10_diastolic_mean (Lowest thru 84.9=0) (85 thru Highest=1) INTO Hwv10_diastolic_bp.
VARIABLE LABELS  Hwv10_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria (wave 10)'.
EXECUTE.




* Sum of systolic, diastolic BP and recode into a 0-1 variable


COMPUTE Hwv10_bp_sum=SUM(Hwv10_systolic_bp,Hwv10_diastolic_bp).
VARIABLE LABELS  Hwv10_bp_sum 'Sum of BP including mean systolic, diastolic BP  (wave 10)'.
EXECUTE.

RECODE Hwv10_bp_sum (0=0) (1 thru Highest=1) INTO Hwv10_bp.
VARIABLE LABELS  Hwv10_bp 'Blood Pressure (BP) dichotomised into normal/abnormal'.
EXECUTE.





# Diabetes and Glycemia
Blood measure:
    MA1C_ADJ (HbA1c in %)
Self-reported diabets/blood sugar:
    R10DIAB -> R reports diabetes this wv 
    R10DIABE -> R8DIABE:W8 R ever had diabetes
    R10DIABS-> R had diabetes since last IW (0-1) (NO USE!) 
    LC010 -> DIABETES
        Has a doctor ever told you that you have diabetes or high blood sugar?
        Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
     LC214 -> YEAR DIABETES FIRST DIAGNOSED (NO USE !)
         In what year was your diabetes first diagnosed?
     LC011 -> SWALLOWED MEDICATION FOR DIABETES
         In order to treat or control your diabetes, are you now taking
        medication that you swallow?
        Values: 1=yes, 5=no, 8=N/A, 9= N/A
     LC012 -> TAKING INSULIN - DIABETES
         Are you now using insulin shots or a pump?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     LC236 -> DOC RECOMMEND INSULIN - DIABETES (NO USE !)
         Has a doctor ever recommended to you that you use insulin?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     LC015 -> DIABETES UNDER CONTROL (NO USE !)
         Is your diabetes generally under control?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     LC016 -> DIABETES BETTER/WORSE/SAME (NO USE !)
         Compared to when we interviewed you last (in R LAST IW MONTH, YEAR),
         has your diabetes gotten better, worse, or stayed about the same?
         Values: 1=better, 2=about the same, 3= worse, 8=N/A, 9= N/A
IDF criteria for raised fasting plasma glucose (FPG) ? 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
In HRS FPG is not available, so the blood measure of HbA1c is used 
HbA1c >= 6.5% (48 mmol/mol)
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode HbA1c >= 6.5% (48 mmol/mol)
3. Sum of diabetes diagnosis and HbA1c
4. Dichotomous variable of Glycemia (yes/no)



* Self-reported diabetes diagnosis
    

RECODE LC010 (-9=SYSMIS) (-8=SYSMIS) (1=1) (3=1) (4=0) (5=0) INTO Hwv10_diabetes_before.
VARIABLE LABELS  Hwv10_diabetes_before 'Has a doctor ever told you that you have diabetes or high blood sugar (wave 10)'.
EXECUTE.

RECODE R10DIAB R10DIABE (3=1) (4=0) (ELSE=Copy) INTO Hwv10_diabetes_report Hwv10_diabetesevr.
VARIABLE LABELS  Hwv10_diabetes_report 'Self-report of diabetes at wave 10' /Hwv10_diabetesevr 'Ever had diabetes without n/a (wave 10)'.
EXECUTE.

COMPUTE Hwv10_diabetes_reportevr_sum=SUM(Hwv10_diabetes_before,Hwv10_diabetes_report,Hwv10_diabetesevr).
VARIABLE LABELS  Hwv10_diabetes_reportevr_sum 'Sum of diabetes report as measured by self-report and ever had variables (wave 10)'.
EXECUTE.

RECODE Hwv10_diabetes_reportevr_sum (0=0) (1 thru Highest=1) INTO Hwv10_diabetes_reportevr.
VARIABLE LABELS  Hwv10_diabetes_reportevr 'Self-report or ever had diabetes dichotomised into yes/no (wave 10)'.
EXECUTE.



* HbA1c level


RECODE MA1C_ADJ (ELSE=Copy) INTO Hwv10_HbA1c_level.
VARIABLE LABELS  Hwv10_HbA1c_level 'Hemoglobin A1c (HbA1c) without n/a (wave 10)'.
EXECUTE.

RECODE Hwv10_HbA1c_level (Lowest thru 6.4=0) (6.5 thru Highest=1) INTO Hwv10_HbA1c.
VARIABLE LABELS  Hwv10_HbA1c 'HbA1c (%): IDF and WHO criteria (wave 10)'.
EXECUTE.


*Sum of HbA1c and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Hwv10_diabetes_HbA1c_sum=SUM(Hwv10_diabetes_reportevr,Hwv10_HbA1c).
VARIABLE LABELS  Hwv10_diabetes_HbA1c_sum 'Sum of HbA1c and diabetes self-reported diagnosis (wave 10)'.
EXECUTE.

RECODE  Hwv10_diabetes_HbA1c_sum (0=0) (1 thru Highest=1) INTO Hwv10_glycemia.
VARIABLE LABELS  Hwv10_glycemia 'Glycemia based on diabetes diagnosis and/or HbA1c level dichotomised into normal/abnormal (wave 10)'.
EXECUTE.




# Wave 12 (2014)

# CRP 
Raw variable: OCRP_ADJ
Normal level of CRP <= 3 ug/mL 
units of measurement: (ug/mL means ?g/mL = microgram per milliliter) (?g/mL = mg/L [same measurement as ELSA]) see: http://unitslab.com/node/67
Steps: 
1. Recode OCRP_ADJ into a new CRP variable
2. Recode into dichotomised variable to divide into normal level of inflammation and high level of inflammation (0-1)


RECODE OCRP_ADJ (ELSE=Copy) INTO Hwv12_crp_level.
VARIABLE LABELS  Hwv12_crp_level 'CRP level (ug/mL) without n/a (wave 12)'.
EXECUTE.

RECODE Hwv12_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Hwv12_crp.
VARIABLE LABELS  Hwv12_crp 'CRP level dichotomised into normal/high (normal CRP <=3 ug/mL) (wave 12)'.
EXECUTE.



# HDL cholesterol
IDFcriteria
          Reduced HDL cholesterol 
          < 40 mg/dL (1.03 mmol/L) in males
          < 50 mg/dL (1.29 mmol/L) in females
           or specific treatment for this lipid abnormality
Raw available cholesterol-related variables:
OC283 -> HIGH CHOLESTEROL
    Have you ever been told by a doctor or other health professional that your blood cholesterol level was high?
    Values: (1= yes, 5= no, 8=N/A, 9=N/A)
OC110 -> CHOLESTEROL TEST SINCE PREV WAVE (NO USE!)
    Since we talked to you last in R LAST IW MONTH, YEAR/In the last two
    years, have you had any of the following medical tests or procedures?
    A blood test for cholesterol?
    Values: (1= yes, 5= no, 8=N/A, 9=N/A)
ON360 -> RX DRUGS REGULARLY CHOLESTEROL
    Do you regularly take prescription medications for any of the following common health problems:
    To help lower your cholesterol? 
    Values: (1= yes, 5= no, 8=N/A, 9=N/A) 
OHDL_ADJ
    Unit of measurment mg/dL
Steps:
1. Recode OHDL_ADJ into HDL cholesterol level
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)



* HDL level (males/females)

RECODE OHDL_ADJ (ELSE=Copy) INTO Hwv12_hdl_level.
VARIABLE LABELS  Hwv12_hdl_level 'HDL cholesterol level (mg/dL) without n/a (wave 12)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv12_hdl_level (Lowest thru 39=1) (40 thru Highest=0) 
    INTO Hwv12_male_hdl.
END IF.
VARIABLE LABELS  Hwv12_male_hdl 'Male HDL cholesterol (wave 12): IDF criteria < 40 mg/dL'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv12_hdl_level (Lowest thru 49=1) (50 thru Highest=0) 
    INTO Hwv12_female_hdl.
END IF.
VARIABLE LABELS  Hwv12_female_hdl 'Female HDL cholesterol (wave 12): IDF criteria < 50 mg/dL'.
EXECUTE.



* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Hwv12_hdl_sum=SUM(Hwv12_male_hdl,Hwv12_female_hdl).
VARIABLE LABELS  Hwv12_hdl_sum 'Sum of male and female HDL cholesterol (wave 12)'.
EXECUTE.

RECODE Hwv12_hdl_sum (0=0) (1 thru Highest=1) INTO Hwv12_hdl.
VARIABLE LABELS  Hwv12_hdl 'HDL cholesterol dichotomised into normal/abnormal (wave 12)'.
EXECUTE.





# Abdominal obesity
Raw variable: 
- R12BMI -> Body Mass Index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- OI907 -> WAIST MEASURMENT
    Unit of measurment: inches
    IDFcriteria (ethnic group: Europids)
          Abdominal obesity 
          Male 94 cm -> 37.01 inches
          Female 80 cm -> 31.50 inches
Steps:
Waist circumference
    1. Recode OI907 into waist circumeference score with n/a (there is no extreme score)
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode R12BMI into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)
    


RECODE OI907 (ELSE=Copy) INTO Hwv12_waist.
VARIABLE LABELS  Hwv12_waist 'Waist circumference in inches without n/a (wave 12)'.
EXECUTE.

DO IF  (H_sex = 0).
RECODE Hwv12_waist (Lowest thru 37.00=0) (37.01 thru Highest=1) INTO Hwv12_malewaist_ao.
END IF.
VARIABLE LABELS  Hwv12_malewaist_ao 'Male Waist circumference (inches) (wave 12): IDF criteria for Abdominal Obesity'.
EXECUTE.

DO IF  (H_sex = 1).
RECODE Hwv12_waist (Lowest thru 31.49=0) (31.50 thru Highest=1) INTO Hwv12_femalewaist_ao.
END IF.
VARIABLE LABELS  Hwv12_femalewaist_ao 'Female Waist circumference (inches) (wave 12): IDF criteria for Abdominal Obesity'.
EXECUTE.

COMPUTE Hwv12_obesity_waist_sum=SUM(Hwv12_malewaist_ao,Hwv12_femalewaist_ao).
VARIABLE LABELS  Hwv12_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 12)'.
EXECUTE.

RECODE Hwv12_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Hwv12_obesity_waist.
VARIABLE LABELS  Hwv12_obesity_waist 'Abdominal obesity based on waist circumference at wave 12 (yes/no)'.
EXECUTE.



RECODE R12BMI (ELSE=Copy) INTO Hwv12_bmi_score.
VARIABLE LABELS  Hwv12_bmi_score 'BMI score kg/m² (wave 12)'.
EXECUTE.


RECODE Hwv12_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Hwv12_obesity_bmi.
VARIABLE LABELS  Hwv12_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 12 (yes/no)'.
EXECUTE.


COMPUTE Hwv12_waist_bmi_sum=SUM(Hwv12_obesity_waist,Hwv12_obesity_bmi).
VARIABLE LABELS  Hwv12_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 12)'.
EXECUTE.


RECODE Hwv12_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Hwv12_obesity.
VARIABLE LABELS  Hwv12_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 12'.
EXECUTE.





# Blood pressure (BP)
Physical measure: 
OI859 (BP 1 systolic), OI860 (BP 1 diastolic), OI864 (BP 2 systolic), OI865 (BP 2 diastolic), OI869 (BP 3 systolic), OI870 (BP 3 diastolic)
    BP was measured three times (so there are available 3 measures for systolic diastolic and pulse)
    To create a valid mean diastolic and systolic BP, I will calculate the mean of the 2nd and 3rd measurement
Self-reports:   
R12HIBP -> R reports high BP this wv (0-1)
R12HIBPE -> R ever had high blood pressure (0-1)
OC005 -> HIGH BLOOD PRESSURE
    Has a doctor ever told you that you have high blood pressure or hypertension?
    Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
OC006 -> BLOOD PRESSURE MEDICATION
    In order to lower your blood pressure, are you now taking any medication?
    Values: 1=yes, 5=no, 8=N/A, 9= N/A
IDF criteria for raised blood pressure: systolic BP >= 130 or diastolic BP >= 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Mean Diastolic BP
2. Mean Systolic BP 
3. Recode Diastolic BP
4. Recode Systolic BP
5. Sum of diastolic, systolic BP
6. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP


RECODE OI859 OI860 OI864 OI865 OI869 OI870 (ELSE=Copy) INTO Hwv12_1systolic_bp Hwv12_1diastolic_bp Hwv12_2systolic_bp Hwv12_2diastolic_bp Hwv12_3systolic_bp Hwv12_3diastolic_bp.
VARIABLE LABELS  Hwv12_1systolic_bp 'Systolic blood pressure (BP) 1st measure in time 1 without n/a (wave 12)' /Hwv12_1diastolic_bp 'Diastolic BP 1st measure without n/a (wave 12)' 
/Hwv12_2systolic_bp 'Systolic BP 2nd measure without n/a (wave 12)' /Hwv12_2diastolic_bp 'Diastolic BP 2nd measure without n/a (wave 12)' /Hwv12_3systolic_bp 'Systolic BP 3rd measure without n/a (wave 12)' 
/Hwv12_3diastolic_bp 'Diastolic BP 3rd measure without n/a (wave 12)'.
EXECUTE.

COMPUTE Hwv12_systolic_mean=MEAN(Hwv12_2systolic_bp,Hwv12_3systolic_bp).
VARIABLE LABELS  Hwv12_systolic_mean 'Mean systolic BP calculated by the 2nd and 3rd measures of systolic BP at time 2 and 3 (wave 12)'.
EXECUTE.

COMPUTE Hwv12_diastolic_mean=MEAN(Hwv12_2diastolic_bp,Hwv12_3diastolic_bp).
VARIABLE LABELS  Hwv12_diastolic_mean 'Mean diastolic BP calculated by the 2nd and 3rd measures of diastolic BP at time 2 and 3 (wave 12)'.
EXECUTE.


RECODE Hwv12_systolic_mean (Lowest thru 129.9=0) (130 thru Highest=1) INTO Hwv12_systolic_bp.
VARIABLE LABELS  Hwv12_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria (wave 12)'.
EXECUTE.

RECODE Hwv12_diastolic_mean (Lowest thru 84.9=0) (85 thru Highest=1) INTO Hwv12_diastolic_bp.
VARIABLE LABELS  Hwv12_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria (wave 12)'.
EXECUTE.


* Sum of systolic, diastolic BP and recode into a 0-1 variable


COMPUTE Hwv12_bp_sum=SUM(Hwv12_systolic_bp,Hwv12_diastolic_bp).
VARIABLE LABELS  Hwv12_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 12)'.
EXECUTE.

RECODE Hwv12_bp_sum (0=0) (1 thru Highest=1) INTO Hwv12_bp.
VARIABLE LABELS  Hwv12_bp 'Blood Pressure (BP) dichotomised into normal/abnormal'.
EXECUTE.





# Diabetes and Glycemia
Blood measure:
    OA1C_ADJ (HbA1c in %)
Self-reported diabets/blood sugar:
    R12DIAB -> R reports diabetes this wv 
    R12DIABE -> R8DIABE:W8 R ever had diabetes
    R12DIABS-> R had diabetes since last IW (0-1) (NO USE!) 
    MC010 -> DIABETES
        Has a doctor ever told you that you have diabetes or high blood sugar?
        Values: 1=yes, 3 disputes but yes, 4= disputes but no, 5=no, 8=N/A, 9= N/A
     MC214 -> YEAR DIABETES FIRST DIAGNOSED (NO USE !)
         In what year was your diabetes first diagnosed?
     MC011 -> SWALLOWED MEDICATION FOR DIABETES
         In order to treat or control your diabetes, are you now taking
        medication that you swallow?
        Values: 1=yes, 5=no, 8=N/A, 9= N/A
     MC012 -> TAKING INSULIN - DIABETES
         Are you now using insulin shots or a pump?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     MC236 -> DOC RECOMMEND INSULIN - DIABETES (NO USE !)
         Has a doctor ever recommended to you that you use insulin?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     MC015 -> DIABETES UNDER CONTROL (NO USE !)
         Is your diabetes generally under control?
         Values: 1=yes, 5=no, 8=N/A, 9= N/A
     MC016 -> DIABETES BETTER/WORSE/SAME (NO USE !)
         Compared to when we interviewed you last (in R LAST IW MONTH, YEAR),
         has your diabetes gotten better, worse, or stayed about the same?
         Values: 1=better, 2=about the same, 3= worse, 8=N/A, 9= N/A
IDF criteria for raised fasting plasma glucose (FPG) >= 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
In HRS FPG is not available, so the blood measure of HbA1c is used 
HbA1c >= 6.5% (48 mmol/mol)
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode HbA1c >= 6.5% (48 mmol/mol)
3. Sum of diabetes diagnosis and HbA1c
4. Dichotomous variable of Glycemia (yes/no)



* Self-reported diabetes diagnosis
    

RECODE MC010 (-9=SYSMIS) (-8=SYSMIS) (1=1) (3=1) (4=0) (5=0) INTO Hwv12_diabetes_before.
VARIABLE LABELS  Hwv12_diabetes_before 'Has a doctor ever told you that you have diabetes or high blood sugar (wave 12)'.
EXECUTE.

RECODE R12DIAB R12DIABE (3=1) (4=0) (ELSE=Copy) INTO Hwv12_diabetes_report Hwv12_diabetesevr.
VARIABLE LABELS  Hwv12_diabetes_report 'Self-report of diabetes at wave 12' /Hwv12_diabetesevr 'Ever had diabetes without n/a (wave 12)'.
EXECUTE.

COMPUTE Hwv12_diabetes_reportevr_sum=SUM(Hwv12_diabetes_before,Hwv12_diabetes_report,Hwv12_diabetesevr).
VARIABLE LABELS  Hwv12_diabetes_reportevr_sum 'Sum of diabetes report as measured by self-report and ever had variables (wave 12)'.
EXECUTE.

RECODE Hwv12_diabetes_reportevr_sum (0=0) (1 thru Highest=1) INTO Hwv12_diabetes_reportevr.
VARIABLE LABELS  Hwv12_diabetes_reportevr 'Self-report or ever had diabetes dichotomised into yes/no (wave 12)'.
EXECUTE.



* HbA1c level

RECODE OA1C_ADJ (ELSE=Copy) INTO Hwv12_HbA1c_level.
VARIABLE LABELS  Hwv12_HbA1c_level 'Hemoglobin A1c (HbA1c) without n/a (wave 12)'.
EXECUTE.

RECODE Hwv12_HbA1c_level (Lowest thru 6.4=0) (6.5 thru Highest=1) INTO Hwv12_HbA1c.
VARIABLE LABELS  Hwv12_HbA1c 'HbA1c (%): IDF and WHO criteria (wave 12)'.
EXECUTE.



*Sum of HbA1c and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Hwv12_diabetes_HbA1c_sum=SUM(Hwv12_diabetes_reportevr,Hwv12_HbA1c).
VARIABLE LABELS  Hwv12_diabetes_HbA1c_sum 'Sum of HbA1c and diabetes self-reported diagnosis (wave 12)'.
EXECUTE.

RECODE  Hwv12_diabetes_HbA1c_sum (0=0) (1 thru Highest=1) INTO Hwv12_glycemia.
VARIABLE LABELS  Hwv12_glycemia 'Glycemia based on diabetes diagnosis and/or HbA1c level dichotomised into normal/abnormal (wave 12)'.
EXECUTE.





# Grouping Predictors 

# Step 1: Individual cardiometabolic markers

# Step 2: depressive symptoms and cardiometabolic markers
4 groups based on the presence of depressive symptoms and individual cardiomeatbolic markers



* Wave 8 (baseline) grouping of cardiometabolic markers and depressive symptoms
    

# Waist obesity (waist) + depressive symptoms (depress)
Steps:
1. Hwv8_waist_depress_sum
2. Grouping based on the presence of waist cir obesity and depressive symptoms (N=no, Y=yes)
    Hwv8_Nwaist_Ndepress
    Hwv8_Nwaist_Ydepress
    Hwv8_Ywaist_Ndepress
    Hwv8_Ywaist_Ydepress
3. Hwv8_waist_depress_group


COMPUTE Hwv8_waist_depress_sum=SUM(Hwv8_obesity_waist,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_waist_depress_sum 'Sum of Waist Obesity and Depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_waist_depress_sum = 0) Hwv8_Nwaist_Ndepress=Hwv8_waist_depress_sum.
VARIABLE LABELS  Hwv8_Nwaist_Ndepress 'Group of healthy controls without waist obesity or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nwaist_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nwaist_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_obesity_waist = 1) Hwv8_Ywaist_Ndepress=Hwv8_obesity_waist.
VARIABLE LABELS  Hwv8_Ywaist_Ndepress 'Group of those with waist obesity only (wave 8)'.
EXECUTE.

IF  (Hwv8_waist_depress_sum = 2) Hwv8_Ywaist_Ydepress=Hwv8_waist_depress_sum.
VARIABLE LABELS  Hwv8_Ywaist_Ydepress 'Group of those with both waist obesity and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Nwaist_Ndepress = 0 AND MISSING(Hwv8_Nwaist_Ydepress) AND MISSING(Hwv8_Ywaist_Ndepress) AND MISSING(Hwv8_Ywaist_Ydepress)) .
   COMPUTE Hwv8_waist_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nwaist_Ndepress) AND Hwv8_Nwaist_Ydepress=1 AND MISSING(Hwv8_Ywaist_Ndepress) AND MISSING(Hwv8_Ywaist_Ydepress)) .
   COMPUTE Hwv8_waist_depress_group=1.
ELSE IF (MISSING(Hwv8_Nwaist_Ndepress) AND MISSING( Hwv8_Nwaist_Ydepress) AND Hwv8_Ywaist_Ndepress= 1 AND MISSING(Hwv8_Ywaist_Ydepress)).
   COMPUTE Hwv8_waist_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nwaist_Ndepress) AND Hwv8_Nwaist_Ydepress=1 AND Hwv8_Ywaist_Ndepress= 1 AND Hwv8_Ywaist_Ydepress=2)).
   COMPUTE Hwv8_waist_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_waist_depress_group 'Grouping for waist obesity and/or depressive symptoms (wave 8)'.
EXECUTE . 



# Diabetes: (diabet) + depressive symptoms (depress)
Steps:
1. Hwv8_diabet_depress_sum
2. Grouping based on the presence of diabetes and depressive symptoms (N=no, Y=yes)
   Hwv8_Ndiabet_Ndepress
   Hwv8_Ndiabet_Ydepress
   Hwv8_Ydiabet_Ndepress
   Hwv8_Ydiabet_Ydepress
3. Hwv8_diabet_depress_group



COMPUTE Hwv8_diabet_depress_sum=SUM(Hwv8_diabetes_reportevr,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_diabet_depress_sum 'Sum of Diabetes and Depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_diabet_depress_sum = 0) Hwv8_Ndiabet_Ndepress=Hwv8_diabet_depress_sum.
VARIABLE LABELS  Hwv8_Ndiabet_Ndepress 'Group of healthy controls without diabetes or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Ndiabet_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Ndiabet_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_diabetes_reportevr = 1) Hwv8_Ydiabet_Ndepress=Hwv8_diabetes_reportevr.
VARIABLE LABELS  Hwv8_Ydiabet_Ndepress 'Group of those with diabetes only (wave 8)'.
EXECUTE.

IF  (Hwv8_diabet_depress_sum = 2) Hwv8_Ydiabet_Ydepress=Hwv8_diabet_depress_sum.
VARIABLE LABELS  Hwv8_Ydiabet_Ydepress 'Group of those with both diabetes and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Ndiabet_Ndepress = 0 AND MISSING(Hwv8_Ndiabet_Ydepress) AND MISSING(Hwv8_Ydiabet_Ndepress) AND MISSING(Hwv8_Ydiabet_Ydepress)) .
   COMPUTE Hwv8_diabet_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Ndiabet_Ndepress) AND Hwv8_Ndiabet_Ydepress=1 AND MISSING(Hwv8_Ydiabet_Ndepress) AND MISSING(Hwv8_Ydiabet_Ydepress)) .
   COMPUTE Hwv8_diabet_depress_group=1.
ELSE IF (MISSING(Hwv8_Ndiabet_Ndepress) AND MISSING( Hwv8_Ndiabet_Ydepress) AND Hwv8_Ydiabet_Ndepress= 1 AND MISSING(Hwv8_Ydiabet_Ydepress)).
   COMPUTE Hwv8_diabet_depress_group=2.
ELSE IF ((MISSING(Hwv8_Ndiabet_Ndepress) AND Hwv8_Ndiabet_Ydepress=1 AND Hwv8_Ydiabet_Ndepress= 1 AND Hwv8_Ydiabet_Ydepress=2)).
   COMPUTE Hwv8_diabet_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_diabet_depress_group 'Grouping for diabetes and/or depressive symptoms (wave 8)'.
EXECUTE . 



# HbA1c: (hba1c) + depressive symptoms (depress)
Steps:
1. Hwv8_hba1c_depress_sum
2. Grouping based on the presence of hba1c and depressive symptoms (N=no, Y=yes)
   Hwv8_Nhba1c_Ndepress
   Hwv8_Nhba1c_Ydepress
   Hwv8_Yhba1c_Ndepress
   Hwv8_Yhba1c_Ydepress
3. Hwv8_hba1c_depress_group



COMPUTE Hwv8_hba1c_depress_sum=SUM(Hwv8_HbA1c,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_hba1c_depress_sum 'Sum of HbA1c and Depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_hba1c_depress_sum = 0) Hwv8_Nhba1c_Ndepress=Hwv8_hba1c_depress_sum.
VARIABLE LABELS  Hwv8_Nhba1c_Ndepress 'Group of healthy controls without hba1c or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nhba1c_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nhba1c_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_HbA1c = 1) Hwv8_Yhba1c_Ndepress=Hwv8_HbA1c.
VARIABLE LABELS  Hwv8_Yhba1c_Ndepress 'Group of those with hba1c only (wave 8)'.
EXECUTE.

IF  (Hwv8_hba1c_depress_sum = 2) Hwv8_Yhba1c_Ydepress=Hwv8_hba1c_depress_sum.
VARIABLE LABELS  Hwv8_Yhba1c_Ydepress 'Group of those with both hba1 cand depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Nhba1c_Ndepress = 0 AND MISSING(Hwv8_Nhba1c_Ydepress) AND MISSING(Hwv8_Yhba1c_Ndepress) AND MISSING(Hwv8_Yhba1c_Ydepress)) .
   COMPUTE Hwv8_hba1c_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nhba1c_Ndepress) AND Hwv8_Nhba1c_Ydepress=1 AND MISSING(Hwv8_Yhba1c_Ndepress) AND MISSING(Hwv8_Yhba1c_Ydepress)) .
   COMPUTE Hwv8_hba1c_depress_group=1.
ELSE IF (MISSING(Hwv8_Nhba1c_Ndepress) AND MISSING( Hwv8_Nhba1c_Ydepress) AND Hwv8_Yhba1c_Ndepress= 1 AND MISSING(Hwv8_Yhba1c_Ydepress)).
   COMPUTE Hwv8_hba1c_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nhba1c_Ndepress) AND Hwv8_Nhba1c_Ydepress=1 AND Hwv8_Yhba1c_Ndepress= 1 AND Hwv8_Yhba1c_Ydepress=2)).
   COMPUTE Hwv8_hba1c_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_hba1c_depress_group 'Grouping for hba1c and/or depressive symptoms (wave 8)'.
EXECUTE . 





# HDL cholesterol (hdl) + depressive symptoms (depress)
Steps:
1. Hwv8_hdl_depress_sum
2. Grouping based on the presence of low HDL cholesterol and depressive symptoms (N=no, Y=yes)
   Hwv8_Nhdl_Ndepress
   Hwv8_Nhdl_Ydepress
   Hwv8_Yhdl_Ndepress
   Hwv8_Yhdl_Ydepress
3. Hwv8_hdl_depress_group


COMPUTE Hwv8_hdl_depress_sum=SUM(Hwv8_hdl,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_hdl_depress_sum 'Sum of HDL cholesterol and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_hdl_depress_sum = 0) Hwv8_Nhdl_Ndepress=Hwv8_hdl_depress_sum.
VARIABLE LABELS  Hwv8_Nhdl_Ndepress 'Group of healthy controls without low HDL cholesterol or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nhdl_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nhdl_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_hdl = 1) Hwv8_Yhdl_Ndepress=Hwv8_hdl.
VARIABLE LABELS  Hwv8_Yhdl_Ndepress 'Group of those with low HDL cholesterol only (wave 8)'.
EXECUTE.

IF  (Hwv8_hdl_depress_sum = 2) Hwv8_Yhdl_Ydepress=Hwv8_hdl_depress_sum.
VARIABLE LABELS  Hwv8_Yhdl_Ydepress 'Group of those with both low HDL cholesterol and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Nhdl_Ndepress = 0 AND MISSING(Hwv8_Nhdl_Ydepress) AND MISSING(Hwv8_Yhdl_Ndepress) AND MISSING(Hwv8_Yhdl_Ydepress)) .
   COMPUTE Hwv8_hdl_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nhdl_Ndepress) AND Hwv8_Nhdl_Ydepress=1 AND MISSING(Hwv8_Yhdl_Ndepress) AND MISSING(Hwv8_Yhdl_Ydepress)) .
   COMPUTE Hwv8_hdl_depress_group=1.
ELSE IF (MISSING(Hwv8_Nhdl_Ndepress) AND MISSING( Hwv8_Nhdl_Ydepress) AND Hwv8_Yhdl_Ndepress= 1 AND MISSING(Hwv8_Yhdl_Ydepress)).
   COMPUTE Hwv8_hdl_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nhdl_Ndepress) AND Hwv8_Nhdl_Ydepress=1 AND Hwv8_Yhdl_Ndepress= 1 AND Hwv8_Yhdl_Ydepress=2)).
   COMPUTE Hwv8_hdl_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_hdl_depress_group 'Grouping for low HDL cholesterol and/or depressive symptoms (wave 8)'.
EXECUTE . 



# Blood pressure (bp) + depressive symptoms (depress)
Steps:
1. Hwv8_bp_depress_sum
2. Grouping based on the presence of hypertension and depressive symptoms (N=no, Y=yes)
   Hwv8_Nbp_Ndepress
   Hwv8_Nbp_Ydepress
   Hwv8_Ybp_Ndepress
   Hwv8_Ybp_Ydepress
3. Hwv8_bp_depress_group



COMPUTE Hwv8_bp_depress_sum=SUM(Hwv8_bp,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_bp_depress_sum 'Sum of Blood pressure and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_bp_depress_sum = 0) Hwv8_Nbp_Ndepress=Hwv8_bp_depress_sum.
VARIABLE LABELS  Hwv8_Nbp_Ndepress 'Group of healthy controls without hypertension or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nbp_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nbp_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_bp = 1) Hwv8_Ybp_Ndepress=Hwv8_bp.
VARIABLE LABELS  Hwv8_Ybp_Ndepress 'Group of those with hypertension only (wave 8)'.
EXECUTE.

IF  (Hwv8_bp_depress_sum = 2) Hwv8_Ybp_Ydepress=Hwv8_bp_depress_sum.
VARIABLE LABELS  Hwv8_Ybp_Ydepress 'Group of those with both hypertension and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Nbp_Ndepress = 0 AND MISSING(Hwv8_Nbp_Ydepress) AND MISSING(Hwv8_Ybp_Ndepress) AND MISSING(Hwv8_Ybp_Ydepress)) .
   COMPUTE Hwv8_bp_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nbp_Ndepress) AND Hwv8_Nbp_Ydepress=1 AND MISSING(Hwv8_Ybp_Ndepress) AND MISSING(Hwv8_Ybp_Ydepress)) .
   COMPUTE Hwv8_bp_depress_group=1.
ELSE IF (MISSING(Hwv8_Nbp_Ndepress) AND MISSING( Hwv8_Nbp_Ydepress) AND Hwv8_Ybp_Ndepress= 1 AND MISSING(Hwv8_Ybp_Ydepress)).
   COMPUTE Hwv8_bp_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nbp_Ndepress) AND Hwv8_Nbp_Ydepress=1 AND Hwv8_Ybp_Ndepress= 1 AND Hwv8_Ybp_Ydepress=2)).
   COMPUTE Hwv8_bp_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_bp_depress_group 'Grouping for hypertension and/or depressive symptoms (wave 8)'.
EXECUTE . 





# Systolic blood pressure (sbp) + depressive symptoms (depress)
Steps:
1. Hwv8_sbp_depress_sum
2. Grouping based on the presence of SBP and depressive symptoms (N=no, Y=yes)
   Hwv8_Nsbp_Ndepress
   Hwv8_Nsbp_Ydepress
   Hwv8_Ysbp_Ndepress
   Hwv8_Ysbp_Ydepress
3. Hwv8_sbp_depress_group



COMPUTE Hwv8_sbp_depress_sum=SUM(Hwv8_systolic_bp,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_sbp_depress_sum 'Sum of SBP and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_sbp_depress_sum = 0) Hwv8_Nsbp_Ndepress=Hwv8_sbp_depress_sum.
VARIABLE LABELS  Hwv8_Nsbp_Ndepress 'Group of healthy controls without SBP or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nsbp_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nsbp_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_systolic_bp = 1) Hwv8_Ysbp_Ndepress=Hwv8_systolic_bp.
VARIABLE LABELS  Hwv8_Ysbp_Ndepress 'Group of those with SBP only (wave 8)'.
EXECUTE.

IF  (Hwv8_sbp_depress_sum = 2) Hwv8_Ysbp_Ydepress=Hwv8_sbp_depress_sum.
VARIABLE LABELS  Hwv8_Ysbp_Ydepress 'Group of those with both SBP and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Nsbp_Ndepress = 0 AND MISSING(Hwv8_Nsbp_Ydepress) AND MISSING(Hwv8_Ysbp_Ndepress) AND MISSING(Hwv8_Ysbp_Ydepress)) .
   COMPUTE Hwv8_sbp_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nsbp_Ndepress) AND Hwv8_Nsbp_Ydepress=1 AND MISSING(Hwv8_Ysbp_Ndepress) AND MISSING(Hwv8_Ysbp_Ydepress)) .
   COMPUTE Hwv8_sbp_depress_group=1.
ELSE IF (MISSING(Hwv8_Nsbp_Ndepress) AND MISSING( Hwv8_Nsbp_Ydepress) AND Hwv8_Ysbp_Ndepress= 1 AND MISSING(Hwv8_Ysbp_Ydepress)).
   COMPUTE Hwv8_sbp_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nsbp_Ndepress) AND Hwv8_Nsbp_Ydepress=1 AND Hwv8_Ysbp_Ndepress= 1 AND Hwv8_Ysbp_Ydepress=2)).
   COMPUTE Hwv8_sbp_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_sbp_depress_group 'Grouping for SBP and/or depressive symptoms (wave 8)'.
EXECUTE . 




# Diastolic blood pressure (dbp) + depressive symptoms (depress)
Steps:
1. Hwv8_dbp_depress_sum
2. Grouping based on the presence of DBP and depressive symptoms (N=no, Y=yes)
   Hwv8_Ndbp_Ndepress
   Hwv8_Ndbp_Ydepress
   Hwv8_Ydbp_Ndepress
   Hwv8_Ydbp_Ydepress
3. Hwv8_dbp_depress_group



COMPUTE Hwv8_dbp_depress_sum=SUM(Hwv8_diastolic_bp,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_dbp_depress_sum 'Sum of DBP and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_dbp_depress_sum = 0) Hwv8_Ndbp_Ndepress=Hwv8_dbp_depress_sum.
VARIABLE LABELS  Hwv8_Ndbp_Ndepress 'Group of healthy controls without DBP or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Ndbp_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Ndbp_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_diastolic_bp = 1) Hwv8_Ydbp_Ndepress=Hwv8_diastolic_bp.
VARIABLE LABELS  Hwv8_Ydbp_Ndepress 'Group of those with DBP only (wave 8)'.
EXECUTE.

IF  (Hwv8_dbp_depress_sum = 2) Hwv8_Ydbp_Ydepress=Hwv8_dbp_depress_sum.
VARIABLE LABELS  Hwv8_Ydbp_Ydepress 'Group of those with both DBP and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Ndbp_Ndepress = 0 AND MISSING(Hwv8_Ndbp_Ydepress) AND MISSING(Hwv8_Ydbp_Ndepress) AND MISSING(Hwv8_Ydbp_Ydepress)) .
   COMPUTE Hwv8_dbp_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Ndbp_Ndepress) AND Hwv8_Ndbp_Ydepress=1 AND MISSING(Hwv8_Ydbp_Ndepress) AND MISSING(Hwv8_Ydbp_Ydepress)) .
   COMPUTE Hwv8_dbp_depress_group=1.
ELSE IF (MISSING(Hwv8_Ndbp_Ndepress) AND MISSING( Hwv8_Ndbp_Ydepress) AND Hwv8_Ydbp_Ndepress= 1 AND MISSING(Hwv8_Ydbp_Ydepress)).
   COMPUTE Hwv8_dbp_depress_group=2.
ELSE IF ((MISSING(Hwv8_Ndbp_Ndepress) AND Hwv8_Ndbp_Ydepress=1 AND Hwv8_Ydbp_Ndepress= 1 AND Hwv8_Ydbp_Ydepress=2)).
   COMPUTE Hwv8_dbp_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_dbp_depress_group 'Grouping for DBP and/or depressive symptoms (wave 8)'.
EXECUTE . 



# CRP (crp) + depressive symptoms (depress)
Steps:
1. Hwv8_crp_depress_sum
2. Grouping based on the presence of high CRP and depressive symptoms (N=no, Y=yes)
   Hwv8_Ncrp_Ndepress
   Hwv8_Ncrp_Ydepress
   Hwv8_Ycrp_Ndepress
   Hwv8_Ycrp_Ydepress
3. Hwv8_crp_depress_group



COMPUTE Hwv8_crp_depress_sum=SUM(Hwv8_crp,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_crp_depress_sum 'Sum of CRP and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_crp_depress_sum = 0) Hwv8_Ncrp_Ndepress=Hwv8_crp_depress_sum.
VARIABLE LABELS  Hwv8_Ncrp_Ndepress 'Group of healthy controls without high CRP or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Ncrp_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Ncrp_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_crp = 1) Hwv8_Ycrp_Ndepress=Hwv8_crp.
VARIABLE LABELS  Hwv8_Ycrp_Ndepress 'Group of those with high CRP only (wave 8)'.
EXECUTE.

IF  (Hwv8_crp_depress_sum = 2) Hwv8_Ycrp_Ydepress=Hwv8_crp_depress_sum.
VARIABLE LABELS  Hwv8_Ycrp_Ydepress 'Group of those with both high CRP and depressive symptoms (wave 8)'.
EXECUTE.

DO IF (Hwv8_Ncrp_Ndepress = 0 AND MISSING(Hwv8_Ncrp_Ydepress) AND MISSING(Hwv8_Ycrp_Ndepress) AND MISSING(Hwv8_Ycrp_Ydepress)) .
   COMPUTE Hwv8_crp_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Ncrp_Ndepress) AND Hwv8_Ncrp_Ydepress=1 AND MISSING(Hwv8_Ycrp_Ndepress) AND MISSING(Hwv8_Ycrp_Ydepress)) .
   COMPUTE Hwv8_crp_depress_group=1.
ELSE IF (MISSING(Hwv8_Ncrp_Ndepress) AND MISSING( Hwv8_Ncrp_Ydepress) AND Hwv8_Ycrp_Ndepress= 1 AND MISSING(Hwv8_Ycrp_Ydepress)).
   COMPUTE Hwv8_crp_depress_group=2.
ELSE IF ((MISSING(Hwv8_Ncrp_Ndepress) AND Hwv8_Ncrp_Ydepress=1 AND Hwv8_Ycrp_Ndepress= 1 AND Hwv8_Ycrp_Ydepress=2)).
   COMPUTE Hwv8_crp_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_crp_depress_group 'Grouping for high CRP and/or depressive symptoms (wave 8)'.
EXECUTE . 





# Step 3: Depressive symptoms and/or Cardiometabolic Abnormality (Hwv8_cardio3) cluster of 
at least 3 cardiometabolic markers (Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp)
Use of SUM.3( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 3 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers



COMPUTE Hwv8_cardio3_sum=SUM.3(Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp).
VARIABLE LABELS  Hwv8_cardio3_sum 'Sum of Cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 8)'.
EXECUTE.


RECODE Hwv8_cardio3_sum (0 thru 2=0) (3 thru 7=1) INTO Hwv8_cardio3.
VARIABLE LABELS  Hwv8_cardio3 'Cardiometabolic Abnormality defined by the co-existance of at least 3 markers (wave 8)'.
EXECUTE.


COMPUTE Hwv8_ca3_depress_sum=SUM(Hwv8_cardio3,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_ca3_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_ca3_depress_sum = 0) Hwv8_Nca3_Ndepress=Hwv8_ca3_depress_sum.
VARIABLE LABELS  Hwv8_Nca3_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nca3_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nca3_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_cardio3 = 1) Hwv8_Yca3_Ndepress=Hwv8_cardio3.
VARIABLE LABELS  Hwv8_Yca3_Ndepress 'Group of those with cardiometabolic abnormality only (wave 8)'.
EXECUTE.

IF  (Hwv8_ca3_depress_sum = 2) Hwv8_Yca3_Ydepress=Hwv8_ca3_depress_sum.
VARIABLE LABELS  Hwv8_Yca3_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 8)'.
EXECUTE.


DO IF (Hwv8_Nca3_Ndepress = 0 AND MISSING(Hwv8_Nca3_Ydepress) AND MISSING(Hwv8_Yca3_Ndepress) AND MISSING(Hwv8_Yca3_Ydepress)) .
   COMPUTE Hwv8_ca3_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nca3_Ndepress) AND Hwv8_Nca3_Ydepress=1 AND MISSING(Hwv8_Yca3_Ndepress) AND MISSING(Hwv8_Yca3_Ydepress)) .
   COMPUTE Hwv8_ca3_depress_group=1.
ELSE IF (MISSING(Hwv8_Nca3_Ndepress) AND MISSING(Hwv8_Nca3_Ydepress) AND Hwv8_Yca3_Ndepress= 1 AND MISSING(Hwv8_Yca3_Ydepress)).
   COMPUTE Hwv8_ca3_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nca3_Ndepress) AND Hwv8_Nca3_Ydepress=1 AND Hwv8_Yca3_Ndepress= 1 AND Hwv8_Yca3_Ydepress=2)).
   COMPUTE Hwv8_ca3_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_ca3_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 8)'.
EXECUTE. 




# Step 4: Depressive symptoms and/or Cardiometabolic Abnormality (Hwv8_cardio4) cluster of 
at least 4 cardiometabolic markers (Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp)
Use of SUM.4( , ) function which means that it calculates sum only if 4 out of 7 markers have a valid value/answer (if more than 4 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers


COMPUTE Hwv8_cardio4_sum=SUM.4(Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp).
VARIABLE LABELS  Hwv8_cardio4_sum 'Sum of at least 4 cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 8)'.
EXECUTE.


RECODE Hwv8_cardio4_sum (0 thru 3=0) (4 thru 7=1) INTO Hwv8_cardio4.
VARIABLE LABELS  Hwv8_cardio4 'Cardiometabolic Abnormality defined by the co-existance of at least 4 markers (wave 8)'.
EXECUTE.


COMPUTE Hwv8_ca4_depress_sum=SUM(Hwv8_cardio4,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_ca4_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_ca4_depress_sum = 0) Hwv8_Nca4_Ndepress=Hwv8_ca4_depress_sum.
VARIABLE LABELS  Hwv8_Nca4_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nca4_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nca4_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_cardio4 = 1) Hwv8_Yca4_Ndepress=Hwv8_cardio4.
VARIABLE LABELS  Hwv8_Yca4_Ndepress 'Group of those with cardiometabolic abnormality only (wave 8)'.
EXECUTE.

IF  (Hwv8_ca4_depress_sum = 2) Hwv8_Yca4_Ydepress=Hwv8_ca4_depress_sum.
VARIABLE LABELS  Hwv8_Yca4_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 8)'.
EXECUTE.


DO IF (Hwv8_Nca4_Ndepress = 0 AND MISSING(Hwv8_Nca4_Ydepress) AND MISSING(Hwv8_Yca4_Ndepress) AND MISSING(Hwv8_Yca4_Ydepress)) .
   COMPUTE Hwv8_ca4_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nca4_Ndepress) AND Hwv8_Nca4_Ydepress=1 AND MISSING(Hwv8_Yca4_Ndepress) AND MISSING(Hwv8_Yca4_Ydepress)) .
   COMPUTE Hwv8_ca4_depress_group=1.
ELSE IF (MISSING(Hwv8_Nca4_Ndepress) AND MISSING(Hwv8_Nca4_Ydepress) AND Hwv8_Yca4_Ndepress= 1 AND MISSING(Hwv8_Yca4_Ydepress)).
   COMPUTE Hwv8_ca4_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nca4_Ndepress) AND Hwv8_Nca4_Ydepress=1 AND Hwv8_Yca4_Ndepress= 1 AND Hwv8_Yca4_Ydepress=2)).
   COMPUTE Hwv8_ca4_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_ca4_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 8)'.
EXECUTE. 




# Step 5: Depressive symptoms and/or Cardiometabolic Abnormality (Hwv8_cardio2) cluster of 
at least 2 cardiometabolic markers (Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp)
Use of SUM.2( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 2 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers



COMPUTE Hwv8_cardio2_sum=SUM.2(Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp).
VARIABLE LABELS  Hwv8_cardio2_sum 'Sum of at least 2 cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 8)'.
EXECUTE.


RECODE Hwv8_cardio2_sum (0 thru 1=0) (2 thru 7=1) INTO Hwv8_cardio2.
VARIABLE LABELS  Hwv8_cardio2 'Cardiometabolic Abnormality defined by the co-existance of at least 2 markers (wave 8)'.
EXECUTE.


COMPUTE Hwv8_ca2_depress_sum=SUM(Hwv8_cardio2,Hwv8_depressive_symptoms).
VARIABLE LABELS  Hwv8_ca2_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 8)'.
EXECUTE.


IF  (Hwv8_ca2_depress_sum = 0) Hwv8_Nca2_Ndepress=Hwv8_ca2_depress_sum.
VARIABLE LABELS  Hwv8_Nca2_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 8)'.
EXECUTE.

IF  (Hwv8_depressive_symptoms = 1) Hwv8_Nca2_Ydepress=Hwv8_depressive_symptoms.
VARIABLE LABELS  Hwv8_Nca2_Ydepress 'Group of those with depressive symptoms only (wave 8)'.
EXECUTE.

IF  (Hwv8_cardio2 = 1) Hwv8_Yca2_Ndepress=Hwv8_cardio2.
VARIABLE LABELS  Hwv8_Yca2_Ndepress 'Group of those with cardiometabolic abnormality only (wave 8)'.
EXECUTE.

IF  (Hwv8_ca2_depress_sum = 2) Hwv8_Yca2_Ydepress=Hwv8_ca2_depress_sum.
VARIABLE LABELS  Hwv8_Yca2_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 8)'.
EXECUTE.


DO IF (Hwv8_Nca2_Ndepress = 0 AND MISSING(Hwv8_Nca2_Ydepress) AND MISSING(Hwv8_Yca2_Ndepress) AND MISSING(Hwv8_Yca2_Ydepress)) .
   COMPUTE Hwv8_ca2_depress_group = 0 .
ELSE IF (MISSING(Hwv8_Nca2_Ndepress) AND Hwv8_Nca2_Ydepress=1 AND MISSING(Hwv8_Yca2_Ndepress) AND MISSING(Hwv8_Yca2_Ydepress)) .
   COMPUTE Hwv8_ca2_depress_group=1.
ELSE IF (MISSING(Hwv8_Nca2_Ndepress) AND MISSING(Hwv8_Nca2_Ydepress) AND Hwv8_Yca2_Ndepress= 1 AND MISSING(Hwv8_Yca2_Ydepress)).
   COMPUTE Hwv8_ca2_depress_group=2.
ELSE IF ((MISSING(Hwv8_Nca2_Ndepress) AND Hwv8_Nca2_Ydepress=1 AND Hwv8_Yca2_Ndepress= 1 AND Hwv8_Yca2_Ydepress=2)).
   COMPUTE Hwv8_ca2_depress_group=3.
END IF .
VARIABLE LABELS  Hwv8_ca2_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 8)'.
EXECUTE. 





# Step 6: Composite measure of cardiometabolic abnormalities (Hwv8_cardio_number) of cardiometabolic markers
(Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp)
Use of SUM.1( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 1 value are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited 0,1,2,3,4+
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any cardiomeatbolic markers
1 -> Those with one CA
2 -> Those with two CA
3 -> Those with three CA
4 -> Those with four ore more CA

COMPUTE Hwv8_cardio_number_sum=SUM.1(Hwv8_obesity_waist,Hwv8_hdl,Hwv8_systolic_bp,Hwv8_diastolic_bp,Hwv8_diabetes_reportevr,Hwv8_HbA1c,Hwv8_crp).
VARIABLE LABELS  Hwv8_cardio_number_sum 'Sum of cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (cont) (wave 8)'.
EXECUTE.


RECODE Hwv8_cardio_number_sum (0=0) (1=1) (2=2) (3=3) (4 thru 7=4) INTO Hwv8_cardio_number.
VARIABLE LABELS  Hwv8_cardio_number 'Composite measure of cardiometabolic abnormality defined by the number of CA markers (0,1,2,3,4+) (wave 8)'.
EXECUTE.



# Sensitivity analysis to run survival analysis limiting to 5 year follow-up period
    HRS follow-up wave 9-12

# Event to Dementia
event to dementia -> Hwv9to12_dementia_event
    1. Sum of new dementia cases in all the follow-up waves (waves 9 -12)
            Name variable: "Hwv9to12_dementia_sum"
    2. Recode into 0 - 1 (yes/no dementia)
                 0 -> 0 no dementia until the last interview (wave 12)
                 1 -> 1 yes dementia
                 2 -> 1 yes dementia
                 3 -> 1 yes dementia
                 4 -> 1 yes dementia
Name variable: "Hwv9to12_dementia_event"

COMPUTE Hwv9to12_dementia_sum=SUM(Hwv9_memory_report,Hwv10_anydementia_report,
    Hwv11_anydementia_report,Hwv12_anydementia_report).
VARIABLE LABELS  Hwv9to12_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 9 -12'.
EXECUTE.

RECODE Hwv9to12_dementia_sum (0=0) (1=1) (2=1) (3=1) (4=1) INTO Hwv9to12_dementia_event.
VARIABLE LABELS  Hwv9to12_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis (wave 9-12)'.
EXECUTE.


# Time of Event - Time of Dementia Incidence
Steps:
1. year and month of interview
2. date of interview
3. time difference
4. midpoint



# Step 3 - time difference
   - Create a variable "Hwv9to12_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 8 date of interview -> "Hwv8_interview_date"
   - Create a variable "H_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 8 - 2006) 
       and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff" : 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"


* Date and Time Wizard: H_time_dementia_months.
COMPUTE  Hwv9to12_time_dementia_months=RND((Hwv9to12_newdementia_or_lastinterview_date - 
    Hwv8_interview_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  Hwv9to12_time_dementia_months "Time in months from the baseline (wave 8) to the date "+
    "of dementia diagnosis or last date of study assessment".
VARIABLE LEVEL  Hwv9to12_time_dementia_months (SCALE).
FORMATS  Hwv9to12_time_dementia_months (F5.0).
VARIABLE WIDTH  Hwv9to12_time_dementia_months(5).
EXECUTE.



# Step 4 - midpoint
   - Create a variable "Hwv9to12_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
        Find when was the last interview when the participant was dementia free 
        For those who never developed dementia (censored), the value remains N/A [manual work]
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "H_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("H_time_dementia_midpoint_final") for the cases without dementia [manual work] 
       (if you do not do this the time _of_event_dementia will be wrong, which means the mean of H_time_dementia_months, H_time_dementia_midpoint will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored (people lost or without dementia until the last date of assessment) 
            measured in months and adjusted for midpoint between interviews
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (H_time_dementia_months, H_time_dementia_midpoint)


* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  Hwv9to12_time_dementia_midpoint=RND((Hwv9to12_newdementia_or_lastinterview_date - 
    Hwv9to12_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  Hwv9to12_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  Hwv9to12_time_dementia_midpoint (SCALE).
FORMATS  Hwv9to12_time_dementia_midpoint (F5.0).
VARIABLE WIDTH  Hwv9to12_time_dementia_midpoint(5).
EXECUTE.


RECODE Hwv9to12_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO Hwv9to12_time_dementia_midpoint_final.
VARIABLE LABELS Hwv9to12_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE Hwv9to12_time_of_event_dementia=MEAN(Hwv9to12_time_dementia_months,Hwv9to12_time_dementia_midpoint_final).
VARIABLE LABELS  Hwv9to12_time_of_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.



----------------------------------





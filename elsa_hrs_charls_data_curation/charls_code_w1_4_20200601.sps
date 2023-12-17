* Encoding: UTF-8.

# PhD Project: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China
# Data curation
# CHARLS: China Health and Retirement Longitudinal Study
Baseline: Wave 1 (2011) 
Follow-up: Wave 2 (2013), Wave 3 (2014), Wave 4 (2015), Wave 5 (2018)



# Identifiers
Individuals unique identifier -> ‘ID’ 
Households -> ‘HHID’ 
Couples -> HwCOUPID
Keep 'ID' the same to merge with other datasets

# Merging datasets
All merged in "charls_data_apr2020", which is based on "blood2011" and has 11847 rows (participants)
Merging blood2011data products with 
harmonised_charls1234_apr2020
blood2015
biomarkers2011
biomarkers2015

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


# 1. Merging charls_data2020 and biomarkers2011 (key variable ID)
Wave 1 datasets 2011 use ID identifier with 11 characters.

DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /TABLE='DataSet4'
  /BY ID.
EXECUTE.

# 2. Merging harmonised_charls1234_apr2020 with blood2015 and then with biomarkers2015
This happens because harmonised dataset and datasets 2015 use a common 12-character ID identifier

DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /RENAME (communityID householdID = d0 d1) 
  /BY ID
  /DROP= d0 d1.
EXECUTE.

MATCH FILES /FILE=*
  /TABLE='DataSet3'
  /RENAME (communityID householdID versionID = d0 d1 d2) 
  /BY ID
  /DROP= d0 d1 d2.
EXECUTE.

# 3. Merging charls_data2020 and harmonised_charls1234_apr2020
There is no common key variable between these datasets
So, before merging the datasets, we have to create a common key variable in the harmonised dataset by concatting  "hhid_w1" and "pnc".
      "hhid_w1" -> 9 characters (based on the id from wave 1)
       "pnc" -> 2 characters (personal id)
      This will create an ID of 11 characters which will allow merging the two datasets.
      Use CONCAT function for concatenating variables


DATASET ACTIVATE DataSet3.
STRING ID (A11).
COMPUTE ID = CONCAT(hhid_w1,pnc).

DATASET ACTIVATE DataSet1.
SORT CASES BY ID.
DATASET ACTIVATE DataSet3.
SORT CASES BY ID.
MATCH FILES /FILE=*
  /TABLE='DataSet3'
  /RENAME (communityID householdID = d0 d1) 
  /BY ID
  /DROP= d0 d1.
EXECUTE.




# Merging Health_Status_and_Functioning datasets wv1 (2011), wv2 (2013) and wv4 (2015) to the main dataset "charls_data2020"
    1. Open and extract .rar file using 7-zip
    2. Convert from STATA file (.dta) to SPSS (.sav) by using the following:
        The SPSS command get stata file can be used to read in a Stata data file (get stata file="")
    3. Merging with the main dataset using the ID for wave 1 as the key variable and id-12charact for wave 2 and 4 



get stata file="S:\Research\ProjectCohorts\CHARLS\charls_original_data\Wave1_2011\data\health_status_and_functioning.dta".

get stata file="S:\Research\ProjectCohorts\CHARLS\charls_original_data\Wave2_2013\data\Health_Status_and_Functioning.dta".

get stata file="S:\Research\ProjectCohorts\CHARLS\charls_original_data\Wave4_2015\data\Health_Status_and_Functioning.dta".



DATASET ACTIVATE DataSet8.
SORT CASES BY ID.
ALTER TYPE ID (A33).
DATASET ACTIVATE DataSet9.
SORT CASES BY ID.
DATASET ACTIVATE DataSet8.
MATCH FILES /FILE=*
  /TABLE='DataSet9'
  /RENAME (communityID householdID = d0 d1) 
  /BY ID
  /DROP= d0 d1.
EXECUTE.



SORT CASES BY id_12char.
ALTER TYPE id_12char (A36).
DATASET ACTIVATE DataSet10.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet8.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /RENAME (communityID householdID versionID = d0 d1 d2) 
  /BY id_12char
  /DROP= d0 d1 d2.
EXECUTE.



SORT CASES BY id_12char.
DATASET ACTIVATE DataSet11.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet8.
MATCH FILES /FILE=*
  /TABLE='DataSet11'
  /RENAME (communityID xrgender householdID xrtype versionID = d0 d1 d2 d3 d4) 
  /BY id_12char
  /DROP= d0 d1 d2 d3 d4.
EXECUTE.





# Merging Health_Status_and_Functioning, Cognition, Sample info and Insider datasets wv4 (2018) to the main dataset "charls_data_w1_4_dec2020"
    1. Open and extract .rar file using 7-zip
    2. Convert from STATA file (.dta) to SPSS (.sav) by using the following command in windows (does not work in mac)
        The SPSS command get stata file can be used to read in a Stata data file (get stata file="")
    3. Merging with the main dataset using the ID for wave 1 as the key variable and id-12charact for wave 4 



get stata file="S:\Research\pkhec\CHARLS\charls_original_data\Wave4_2018\Health_Status_and_Functioning.dta".

get stata file="S:\Research\pkhec\CHARLS\charls_original_data\Wave4_2018\Cognition.dta".

get stata file="S:\Research\pkhec\CHARLS\charls_original_data\Wave4_2018\Sample_Infor.dta".

get stata file="S:\Research\pkhec\CHARLS\charls_original_data\Wave4_2018\Insider.dta".





SORT CASES BY id_12char.
DATASET ACTIVATE DataSet5.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /BY id_12char.
EXECUTE.



SORT CASES BY id_12char.
DATASET ACTIVATE DataSet6.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet6'
  /BY id_12char.
EXECUTE.



SORT CASES BY id_12char.
DATASET ACTIVATE DataSet8.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet8'
  /BY id_12char.
EXECUTE.



SORT CASES BY id_12char.
DATASET ACTIVATE DataSet10.
SORT CASES BY id_12char.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /BY id_12char.
EXECUTE.




# Socioeconomic variables

# Gender
Raw variable: ragender

RECODE ragender (1=0) (2=1) INTO C_sex.
VARIABLE LABELS  C_sex 'Sex male (0), female (1)'.
EXECUTE.


# Age
Raw variable: r1agey = Age in years at wave 1

RECODE r1agey (ELSE=Copy) INTO C_age.
VARIABLE LABELS  C_age 'Age continuous in years wave 1'.
EXECUTE.



# Education 
There are 2 variables related to Education level
1.raeduc_c (categorical) ->  level of education 
   Values: 
      1= No formal education (illiterate)
      2 = Did not finish primary school but can read
      3 = Sishu (private tutoring)
      4 = Elementary school
      5 = Middle school
      6 = High school
      7 = Vocational school
      8 = Two/Three Year College/Associate degree
      9 = Four Year College/Bachelors degree (College Grad)
      10 = Post-graduated (Master/PhD) 
2. raeducl (three-tier harmonised scale, according to the 1997 International Standard Classification of Education (ISCED-97) codes)
   Values:
      1 = Less than lower secondary
      2 = upper secondary & vocational training
      3 = tertiary
* Respondents are assigned a code of 
        1 if the respondent reports an education level of 1,2,3,4,5
        2 if  If the respondent reports an education level of 6,7
        3 if the respondent reports an education level of 8,9,10
* the raeduc_c and raeducl variables include missing data with d., m., r. codes
4. Recode "raeduc_c" into C_eduaction (3-level categorical variable harmonised to HRS and ELSA)
   Values: exaclty as the above coding
      1 = Lt High school / No qualification 
      2 = High school or college
      3 = Higher education
5. Recode "C_educ_new"


RECODE raeduc_c (ELSE=Copy) INTO C_eduaction_10level.
VARIABLE LABELS  C_eduaction_10level 'Education level categorised into 10 levels (raw CHARLS data) at wave 1'.
EXECUTE.

RECODE raeducl (ELSE=Copy) INTO C_eduaction_harmon_3cat.
VARIABLE LABELS  C_eduaction_harmon_3cat 'Education three-tier harmonised scale'.
EXECUTE.


RECODE C_eduaction_10level (1 thru 5=1) (6 thru 7=2) (8 thru 10=3) (ELSE=Copy) INTO C_eduaction.
VARIABLE LABELS  C_eduaction 'Education level categorised into 3 levels from low to high (wave 1)'.
EXECUTE.


RECODE C_eduaction_10level (1 thru 4=1) (5 thru 7=2) (8 thru 10=3) (ELSE=Copy) INTO C_educ_new.
VARIABLE LABELS  C_educ_new 'Education categorised into 3 levels from low to high (wave 1)'.
EXECUTE.



# Marital Status
Raw variables: 
1. r1mstath (categorical) r marital status without partnership filled
    Values:
         1 = married
         2 = married, spouse absent (=married but not living with spouse temporarily for reasons such as work)
         3 = partnered 
         4 = seperated
         5 = divorced
         7 = widowed
         8 = never married
* 33 missing data
2. r1mstat (categorical) r marital status with partnership filled
    Values:
         1 = married
         3 = partnered 
         4 = seperated
         5 = divorced
         7 = widowed
         8 = never married
* 12 missing data
Steps:
Recode "r1mstat" into C_maritalstatus_4cat (4-level categorical variable harmonised to HRS and ELSA)
   Values: Recode into
      1 = Married/Partenered (1,3)
      2 = Never married (8)
      3 = Seperated/Divorced (4,5)
      4 = Widowed (7)



RECODE r1mstat (ELSE=Copy) INTO C_maritalstatus_8cat.
VARIABLE LABELS  C_maritalstatus_8cat 'Marital Status classified into 8 categories (wave 1)'.
EXECUTE.

RECODE r1mstat  (1=1) (3=1) (4=3) (5=3) (7=4) (8=2) INTO C_maritalstatus_4cat.
VARIABLE LABELS  C_maritalstatus_4cat 'Marital Status classified into 4 categories (wave 1)'.
EXECUTE.



# Wealth (nonpension household net wealth)
Raw variable: hh1atotb = Total wealth (continous variable)
The net value of total wealth is calculated as the sum of all wealth components except the value pension less all debt:
hh1atotb =  h1achck + h1astck + h1abond + h1aothr + hh1arles + hh1ahous + hh1atran + hh1adurbl +
hh1afixc + hh1aland + hh1aagri + hh1aploan + hh1afhhm - h1adebt - hh1amort
        Sum of
        h1achck = Asset: r+s cash, checking and saving acounts (6)
        h1astck = Asset: r+s stocks and mutual funds (5)
        h1abond = Asset: r+s government bonds (7,8) 
        h1aothr = Asset: r+s all other savings (9)
        hh1arles =  Asset: HHold Net value of other real estate (not primary residence) (2)
        hh1ahous = Asset: HHold primary residence regardless of ownership (1)
        hh1atran = Asset: HHold value of vehicles (3)
        hh1adurbl = Household value of non-financial asset (consumer durable asset)
        hh1afixc = Asset: HHold fixed capital assets
        hh1aland = Asset: HHold value of irrigable land
        hh1aagri = Asset: Agricultural asset: HHold livestock & fisheries
        hh1aploan = Household value of personal loans
        hh1afhhm = Asset: net value of other HH members financial and debt
        Minus 
        h1adebt = Asset: r+s debt
        hh1amort = Asset: HHold total mortgage for primary residence
Wealth measures are reported in Chinas currency Yuan
Steps:
   1. Recode "hh1atotb " into a variable of Total non-pension household wealth minus debt excluding pension savings
       total household wealth - (household debt + pension savings)
   2. Recode into 5 different levels via quantiles (1/5)
      According to the percentiles of frequencies (below):
Output of Statistics		
Total wealth minus pension savinngs minus debt 
N	Valid	8632
	Missing	3215
Percentiles	20	9250.0000
	40	33218.0000
	60	82700.0000
	80	169642.0000
	100	40754800.0000
   3. Recode into 5 quantiles


RECODE hh1atotb  (ELSE=Copy) INTO Cwv1_totalwealth.
VARIABLE LABELS  Cwv1_totalwealth 'Total wealth minus pension savings minus debt (wave 1) '.
EXECUTE.

*Wealth: Calculation of sum of all the above individual variables to confirm if it lead to the same amounts

FREQUENCIES VARIABLES=h1achck h1astck h1abond h1aothr hh1arles hh1ahous hh1atran hh1adurbl
 hh1afixc hh1aland hh1aagri hh1aploan hh1afhhm  h1adebt  hh1amort
  /STATISTICS=STDDEV MINIMUM MAXIMUM MEAN MEDIAN SUM SKEWNESS SESKEW KURTOSIS SEKURT
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

 COMPUTE Cwv1_wealth= h1achck + h1astck + h1abond + h1aothr + hh1arles + hh1ahous + hh1atran + hh1adurbl +
 hh1afixc + hh1aland + hh1aagri + hh1aploan + hh1afhhm - h1adebt - hh1amort.
VARIABLE LABELS  Cwv1_wealth 'Sum of household wealth minus debt (wave 1)'.
EXECUTE.



FREQUENCIES VARIABLES=Cwv1_totalwealth
  /PERCENTILES=20.0 40.0 60.0 80.0 100.0 
  /ORDER=ANALYSIS.

RECODE Cwv1_totalwealth (Lowest thru 9250.0000=1) (9250.0001 thru 33218.0000=2) 
    (33218.0001 thru 82700.0000=3) (82700.0001 thru 169642.0000=4) (169642.0001 thru Highest=5) INTO Cwv1_wealthquintiles.
VARIABLE LABELS  Cwv1_wealthquintiles 'Quintiles of total wealth net: Total household net wealth minus pension savings minus household debt (wave 1)'.
EXECUTE.



*A second variable for wealth: Total score of net wealth harmonised with HRS and ELSA: excluding hh1aploan and  hh1afhhm
 h1achck + h1astck + h1abond + h1aothr + hh1arles + hh1ahous + hh1atran + hh1adurbl +
 hh1afixc + hh1aland + hh1aagri - h1adebt - hh1amort
Steps:
   1. COMPUTE Cwv1_netwealth= h1achck + h1astck + h1abond + h1aothr + hh1arles + hh1ahous + hh1atran + hh1adurbl +
 hh1afixc + hh1aland + hh1aagri - h1adebt - hh1amort
       This is the sum of Net household wealth - (household debt + pension savings)
   2. Recode Cwv1_netwealth into 5 different levels via quantiles (1/5)
      According to the percentiles of frequencies (below):
Output of Statistics		
Total wealth minus pension savinngs minus debt 
N	Valid	9508
	Missing	2339
Percentiles	20	12500.0000
	40	38600.0000
	60	93154.0000
	80	185780.0000
	100	40751800.0000
   3. Recode into 5 quantiles
    

COMPUTE Cwv1_netwealth= h1achck + h1astck + h1abond + h1aothr + hh1arles + hh1ahous + hh1atran + hh1adurbl +
 hh1afixc + hh1aland + hh1aagri - h1adebt - hh1amort.
VARIABLE LABELS  Cwv1_netwealth 'Sum of household net wealth minus debt (wave 1)'.
EXECUTE.

FREQUENCIES VARIABLES=Cwv1_netwealth
  /PERCENTILES=20.0 40.0 60.0 80.0 100.0 
  /ORDER=ANALYSIS.

RECODE Cwv1_netwealth (Lowest thru 12500.0000=1) (12500.0001 thru 38600.0000=2) 
    (38600.0001 thru 93154.0000=3) (93154.0001 thru 185780.0000=4) (185780.0001 thru Highest=5) INTO Cwv1_netwealth_quintiles.
VARIABLE LABELS  Cwv1_netwealth_quintiles 'Quintiles of total wealth net: Total household net wealth minus pension savings minus household debt (wave 1)'.
EXECUTE.



# Lifestyle variables

# Smoking wave 1
Raw variables: 
r1smokev (categorical): R smoke ever (0=No, 1=Yes)
r1smoken  (categorical): R smoke now (0=No, 1=Yes)
Steps:
   1. Recode "r1smoken" into smoking status with 2 levels: Cwv1_smoking_2cat
      0= not current smoker (0)
      1= current smoker (1)
   2. Recode "r1smokev" into smoking status with 3 levels (3-level categorical variable harmonised to HRS and ELSA): Cwv1_smoking_3cat
        if r1smokev 0 and r1smoken 0 -> never smoker (0)
        if r1smokev 1 and r1smoken 0 -> former smoker (1)
        if r1smokev 1 and r1smoken 1 -> current smoker (2)
    

RECODE r1smoken (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv1_smoking_2cat.
VARIABLE LABELS  Cwv1_smoking_2cat 'Smoking Status with 2 levels (wave 1)'.
EXECUTE.



DO IF (r1smokev  = 0 AND (r1smoken = 0)).
   COMPUTE Cwv1_smoking_3cat = 0.
ELSE IF (r1smokev  = 1 AND (r1smoken = 0)).
   COMPUTE Cwv1_smoking_3cat= 1.
ELSE IF (r1smokev = 1 AND (r1smoken = 1)).
   COMPUTE Cwv1_smoking_3cat= 2.
END IF .
VARIABLE LABELS Cwv1_smoking_3cat 'Smoking Status with 3 levels (wave 1)'.
EXECUTE.  



# Smoking wave 4
Raw variables: 
r4smokev (categorical): R smoke ever (0=No, 1=Yes)
r4smoken  (categorical): R smoke now (0=No, 1=Yes)
Steps:
   1. Recode "r4smoken" into smoking status with 2 levels: Cwv4_smoking_2cat
      0= not current smoker (0)
      1= current smoker (1)
   2. Recode "r4smokev" into smoking status with 3 levels (3-level categorical variable harmonised to HRS and ELSA): Cwv4_smoking_3cat
        if r4smokev 0 and r4smoken 0 -> never smoker (0)
        if r4smokev 1 and r4smoken 0 -> former smoker (1)
        if r4smokev 1 and r4smoken 1 -> current smoker (2)
    

RECODE r4smoken (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_smoking_2cat.
VARIABLE LABELS  Cwv4_smoking_2cat 'Smoking Status with 2 levels (wave 4)'.
EXECUTE.



DO IF (r4smokev  = 0 AND (r4smoken = 0)).
   COMPUTE Cwv4_smoking_3cat = 0.
ELSE IF (r4smokev  = 1 AND (r4smoken = 0)).
   COMPUTE Cwv4_smoking_3cat= 1.
ELSE IF (r4smokev = 1 AND (r4smoken = 1)).
   COMPUTE Cwv4_smoking_3cat= 2.
END IF .
VARIABLE LABELS Cwv4_smoking_3cat 'Smoking Status with 3 levels (wave 4)'.
EXECUTE.  





# Physical activity wave 1
Raw variable: 
Three questions about physical activity offer the choice of vigorous, moderate or light physical activity 
at least 10 min every week (no=0, yes=1)
These measures are derived as:
r1vgact_c -> r any vigorous physical activity or exercise at least 10 minutes
r1mdact_c -> r any moderate physical activity or exercise at least 10 minutes
r1ltact_c -> r any light physical activity or exercise at least 10 minutes
Steps:
1. Recode r1vgact_c (vigorous), r1mdact_c  (moderate), r1ltact_c (light) into Cwv1_physicalactivity_vigorous Cwv1_physicalactivity_moderate Cwv1_physicalactivity_light 
2. Recode into 4 different levels of physical activity status -> 1= high 2= moderate, 3= low, 4= sedentary (harmonised to ELSA and HRS)
        Recode Cwv1_physicalactivity_vigorous Cwv1_physicalactivity_moderate Cwv1_physicalactivity_light into "Cwv1_physicalactivity"
        if vigorous 1, moderate 1, light 1 -> high (1)
        if vigorous 1, moderate 1, light 0 -> high (1)
        if vigorous 1, moderate 0, light 1 -> high (1)
        if vigorous 1, moderate 0, light 0 -> high (1)
        if vigorous 0, moderate 1, light 1 -> moderate (2)
        if vigorous 0, moderate 1, light 0 -> moderate (2)
        if vigorous 0, moderate 0, light 1 -> low (3)
        if vigorous 0, moderate 0, light 0 -> sedentary (4) 
                


RECODE r1vgact_c r1mdact_c r1ltact_c (0=0) (1=1) (ELSE=Copy) INTO 
Cwv1_physicalactivity_vigorous Cwv1_physicalactivity_moderate Cwv1_physicalactivity_light.
VARIABLE LABELS  Cwv1_physicalactivity_vigorous 'Vigorous Physical Activity at least 10 min every week' 
/Cwv1_physicalactivity_moderate 'Moderate Physical Activity at least 10 min every week' 
/Cwv1_physicalactivity_light 'Light Physical Activity at least 10 min every week'.
EXECUTE.


DO IF (Cwv1_physicalactivity_vigorous = 1 AND (Cwv1_physicalactivity_moderate = 1) AND (Cwv1_physicalactivity_light = 1)).
   COMPUTE Cwv1_physicalactivity = 1.
ELSE IF (Cwv1_physicalactivity_vigorous = 1 AND (Cwv1_physicalactivity_moderate = 1) AND (Cwv1_physicalactivity_light = 0)).
   COMPUTE Cwv1_physicalactivity = 1.
ELSE IF (Cwv1_physicalactivity_vigorous = 1 AND (Cwv1_physicalactivity_moderate = 0) AND (Cwv1_physicalactivity_light = 1)).
   COMPUTE Cwv1_physicalactivity = 1.
ELSE IF (Cwv1_physicalactivity_vigorous = 1 AND (Cwv1_physicalactivity_moderate = 0) AND (Cwv1_physicalactivity_light = 0)).
   COMPUTE Cwv1_physicalactivity = 1.
ELSE IF (Cwv1_physicalactivity_vigorous = 0 AND (Cwv1_physicalactivity_moderate = 1) AND (Cwv1_physicalactivity_light = 1)).
   COMPUTE Cwv1_physicalactivity = 2.
ELSE IF (Cwv1_physicalactivity_vigorous = 0 AND (Cwv1_physicalactivity_moderate = 1) AND(Cwv1_physicalactivity_light = 0)).
   COMPUTE Cwv1_physicalactivity = 2.
ELSE IF (Cwv1_physicalactivity_vigorous = 0 AND (Cwv1_physicalactivity_moderate = 0) AND (Cwv1_physicalactivity_light = 1)).
   COMPUTE Cwv1_physicalactivity = 3.
ELSE IF (Cwv1_physicalactivity_vigorous = 0 AND (Cwv1_physicalactivity_moderate = 0) AND (Cwv1_physicalactivity_light = 0)).
   COMPUTE Cwv1_physicalactivity = 4.
END IF .
VARIABLE LABELS  Cwv1_physicalactivity 'Physical Activity Status with 4 levels (high, moderate, low, sedentary) (wave 1)'.
EXECUTE . 






# Physical activity wave 4
Raw variable: 
Three questions about physical activity offer the choice of vigorous, moderate or light physical activity 
at least 10 min every week (no=0, yes=1)
These measures are derived as:
r4vgact_c -> r any vigorous physical activity or exercise at least 10 minutes
r4mdact_c -> r any moderate physical activity or exercise at least 10 minutes
r4ltact_c -> r any light physical activity or exercise at least 10 minutes
Steps:
1. Recode r4vgact_c (vigorous), r4mdact_c  (moderate), r4ltact_c (light) into Cwv4_physicalactivity_vigorous Cwv4_physicalactivity_moderate Cwv4_physicalactivity_light 
2. Recode into 4 different levels of physical activity status -> 1= high 2= moderate, 3= low, 4= sedentary (harmonised to ELSA and HRS)
        Recode Cwv4_physicalactivity_vigorous Cwv4_physicalactivity_moderate Cwv4_physicalactivity_light into "Cwv4_physicalactivity"
        if vigorous 1, moderate 1, light 1 -> high (1)
        if vigorous 1, moderate 1, light 0 -> high (1)
        if vigorous 1, moderate 0, light 1 -> high (1)
        if vigorous 1, moderate 0, light 0 -> high (1)
        if vigorous 0, moderate 1, light 1 -> moderate (2)
        if vigorous 0, moderate 1, light 0 -> moderate (2)
        if vigorous 0, moderate 0, light 1 -> low (3)
        if vigorous 0, moderate 0, light 0 -> sedentary (4) 
                


RECODE r4vgact_c r4mdact_c r4ltact_c (0=0) (1=1) (ELSE=Copy) INTO 
Cwv4_physicalactivity_vigorous Cwv4_physicalactivity_moderate Cwv4_physicalactivity_light.
VARIABLE LABELS  Cwv4_physicalactivity_vigorous 'Vigorous Physical Activity at least 10 min every week' 
/Cwv4_physicalactivity_moderate 'Moderate Physical Activity at least 10 min every week' 
/Cwv4_physicalactivity_light 'Light Physical Activity at least 10 min every week'.
EXECUTE.


DO IF (Cwv4_physicalactivity_vigorous = 1 AND (Cwv4_physicalactivity_moderate = 1) AND (Cwv4_physicalactivity_light = 1)).
   COMPUTE Cwv4_physicalactivity = 1.
ELSE IF (Cwv4_physicalactivity_vigorous = 1 AND (Cwv4_physicalactivity_moderate = 1) AND (Cwv4_physicalactivity_light = 0)).
   COMPUTE Cwv4_physicalactivity = 1.
ELSE IF (Cwv4_physicalactivity_vigorous = 1 AND (Cwv4_physicalactivity_moderate = 0) AND (Cwv4_physicalactivity_light = 1)).
   COMPUTE Cwv4_physicalactivity = 1.
ELSE IF (Cwv4_physicalactivity_vigorous = 1 AND (Cwv4_physicalactivity_moderate = 0) AND (Cwv4_physicalactivity_light = 0)).
   COMPUTE Cwv4_physicalactivity = 1.
ELSE IF (Cwv4_physicalactivity_vigorous = 0 AND (Cwv4_physicalactivity_moderate = 1) AND (Cwv4_physicalactivity_light = 1)).
   COMPUTE Cwv4_physicalactivity = 2.
ELSE IF (Cwv4_physicalactivity_vigorous = 0 AND (Cwv4_physicalactivity_moderate = 1) AND(Cwv4_physicalactivity_light = 0)).
   COMPUTE Cwv4_physicalactivity = 2.
ELSE IF (Cwv4_physicalactivity_vigorous = 0 AND (Cwv4_physicalactivity_moderate = 0) AND (Cwv4_physicalactivity_light = 1)).
   COMPUTE Cwv4_physicalactivity = 3.
ELSE IF (Cwv4_physicalactivity_vigorous = 0 AND (Cwv4_physicalactivity_moderate = 0) AND (Cwv4_physicalactivity_light = 0)).
   COMPUTE Cwv4_physicalactivity = 4.
END IF .
VARIABLE LABELS  Cwv4_physicalactivity 'Physical Activity Status with 4 levels (high, moderate, low, sedentary) (wave 4)'.
EXECUTE . 





# Alcohol wave 1
Raw variable
r1drink -> r ever drinks any alcohol before (categ) (yes/no)
r1drinkl-> r ever drinks any alcohol last year (categ) (yes/no)
r1drinkn_c -> r frequency of drinking last year (categ)
        0 = None or does not drink
        1 = Once a month
        2 = 2 to 3 days a month
        3 = Once a week
        4 = 2 to 3 days a week
        5 = 4 to 6 days a week
        6 = Daily
        7 = Twice a day
        8 = More than twice a day
Steps:
  1. Recode r1drinkn_c  to be harmonised with HRS and ELSA
         Recode "r1drinkn_c" into "Cwv1_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1,2,3)
         2= twice/three times a week (4)
         3= four to six times a week (5)
         4= daily or more (6,7,8)
   2.  Recode "r1drinkn_c" into alcohol consumption status "Cwv1_alcohol_status"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2,3,4)
         3= frequent drinker (3+ days per week) (5,6,7,8)
         

RECODE r1drinkn_c (0=0) (1=1) (2=1) (3=1) (4=2) (5=3) (6=4) (7=4) (8=4)  (ELSE=Copy) INTO Cwv1_alcohol_freq.
VARIABLE LABELS  Cwv1_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 1)'.
EXECUTE.

RECODE r1drinkn_c (0=1) (1=2) (2=2) (3=2) (4=2) (5=3) (6=3) (7=3) (8=3) (ELSE=Copy) INTO Cwv1_alcohol_status.
VARIABLE LABELS  Cwv1_alcohol_status 'Alcohol consumption status (wave 1)'.
EXECUTE.





# Alcohol wave 4
Raw variable
r4drink -> r ever drinks any alcohol before (categ) (yes/no)
r4drinkl-> r ever drinks any alcohol last year (categ) (yes/no)
r4drinkn_c -> r frequency of drinking last year (categ)
        0 = None or does not drink
        1 = Once a month
        2 = 2 to 3 days a month
        3 = Once a week
        4 = 2 to 3 days a week
        5 = 4 to 6 days a week
        6 = Daily
        7 = Twice a day
        8 = More than twice a day
Steps:
  1. Recode r4drinkn_c  to be harmonised with HRS and ELSA
         Recode "r4drinkn_c" into "Cwv4_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1,2,3)
         2= twice/three times a week (4)
         3= four to six times a week (5)
         4= daily or more (6,7,8)
   2.  Recode "r4drinkn_c" into alcohol consumption status "Cwv4_alcohol_status"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2,3,4)
         3= frequent drinker (3+ days per week) (5,6,7,8)
         

RECODE r4drinkn_c (0=0) (1=1) (2=1) (3=1) (4=2) (5=3) (6=4) (7=4) (8=4)  (ELSE=Copy) INTO Cwv4_alcohol_freq.
VARIABLE LABELS  Cwv4_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 4)'.
EXECUTE.

RECODE r4drinkn_c (0=1) (1=2) (2=2) (3=2) (4=2) (5=3) (6=3) (7=3) (8=3) (ELSE=Copy) INTO Cwv4_alcohol_status.
VARIABLE LABELS  Cwv4_alcohol_status 'Alcohol consumption status (wave 4)'.
EXECUTE.



# Health variables wave 1

# Cardiovascular diseases-CVD wave 1
Raw variables: 
Self-reported heart problem and stroke
Rand data:
 - r1hearte -> r ever had heart problem (doctor diagnosed heart disease) (yes/no) (0-1)
 - r1stroke -> r ever had stroke (doctor diagnosed stroke) (yes/no) (0-1)
Charls data:
 - da007_7_ -> (1=yes, 2=no) -> Have you been diagnosed with heart problems by a doctor?
 - da007_8_ -> (1=yes, 2=no) -> Have you been diagnosed with stroke by a doctor?
Treatment for heart problem
 Charls data:
  - da010_7_s1 -> Take Chinese Traditional Medicine for Heart Problems
  - da010_7_s2 -> Take Western Morden Medicine for Heart Problems
  - da010_7_s3 -> Take Western Morden Medicine for Heart Problems
  - da010_7_s4 -> None of the Above for Heart Problems
Treatment for stroke
 Charls data:
  - da019s1 -> Treat Stroke by Take Chinese Traditional Medicine
  - da019s2 -> Treat Stroke by Take Western Morden Medicine
  - da019s3 -> Treat Stroke by Physical Therapys
  - da019s4 -> Treat Stroke by Acupuncture and Moxibustion
  - da019s5 -> Treat Stroke by Occupational Therapy
  - da019s6 -> Treat Stroke by None of the Above
Steps:
1. Recode heart and stroke variables
2. Recode treatments for heart problems and stroke
3. Sum of reported comorbidity of CVDs
4. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)


* Self-reported heart problems
    
RECODE r1hearte (0=0) (1=1) (ELSE=SYSMIS) INTO C_heart_disease_evr .
VARIABLE LABELS  C_heart_disease_evr 'Doctor ever diagnosed heart problem measured by Rand (wave 1)'.
EXECUTE.

RECODE da007_7_ (2=0) (1=1) (ELSE=SYSMIS) INTO C_heart_disease_diagnosed.
VARIABLE LABELS  C_heart_disease_diagnosed 'Have you been diagnosed with heart disease by doctor measured by Charls (wave 1)'.
EXECUTE.

COMPUTE C_heart_disease_sum=SUM(C_heart_disease_evr,C_heart_disease_diagnosed).
VARIABLE LABELS  C_heart_disease_sum 'Sum of self-reported doctor diagnosed heart disease (wave 1)'.
EXECUTE.

RECODE C_heart_disease_sum (0=0) (1 thru Highest=1) INTO C_heart_disease.
VARIABLE LABELS  C_heart_disease 'Self-reported doctor diagnosed heart disease (wave 1)'.
EXECUTE.



* Self-reported stroke
    
RECODE r1stroke (0=0) (1=1) (ELSE=SYSMIS) INTO C_stroke_evr .
VARIABLE LABELS  C_stroke_evr 'Doctor ever diagnosed stroke measured by Rand (wave 1)'.
EXECUTE.

RECODE da007_8_ (2=0) (1=1) (ELSE=SYSMIS) INTO C_stroke_diagnosed.
VARIABLE LABELS  C_stroke_diagnosed 'Have you been diagnosed with strokeby doctor measured by Charls (wave 1)'.
EXECUTE.

COMPUTE C_stroke_sum=SUM(C_stroke_evr,C_stroke_diagnosed).
VARIABLE LABELS  C_stroke_sum 'Sum of self-reported doctor diagnosed stroke (wave 1)'.
EXECUTE.

RECODE C_stroke_sum (0=0) (1 thru Highest=1) INTO C_stroke.
VARIABLE LABELS  C_stroke 'Self-reported doctor diagnosed stroke (wave 1)'.
EXECUTE.



* Sum of self-reported CVDs (heart diseases and stroke), and recode into 0-1 variable

COMPUTE C_cvd_sum=SUM(C_heart_disease,C_stroke).
VARIABLE LABELS  C_cvd_sum 'Sum of Cardiovascular diseases (wave 1)'.
EXECUTE.

RECODE C_cvd_sum (0=0) (1 thru 2=1) INTO C_cvd_comorbidity.
VARIABLE LABELS  C_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease at wave 1'.
EXECUTE.





# Health variables wave 4

# Cardiovascular diseases-CVD wave 4
Raw variables: 
Self-reported heart problem and stroke
Rand data:
 - r4hearte -> r ever had heart problem (doctor diagnosed heart disease) (yes/no) (0-1)
 - r4stroke -> r ever had stroke (doctor diagnosed stroke) (yes/no) (0-1)
Charls data:
 - da007_7_wv4 -> (1=yes, 2=no) -> Have you been diagnosed with heart attack by a doctor?
 - da007_8_wv4 -> (1=yes, 2=no) -> Have you been diagnosed with stroke by a doctor?
Steps:
1. Recode heart and stroke variables
2. Sum of reported comorbidity of CVDs
3. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)


* Self-reported heart problems
    
RECODE r4hearte (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_heart_disease_evr .
VARIABLE LABELS  Cwv4_heart_disease_evr 'Doctor ever diagnosed heart problem measured by Rand (wave 4)'.
EXECUTE.

RECODE da007_7_wv4 (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_heart_disease_diagnosed.
VARIABLE LABELS  Cwv4_heart_disease_diagnosed 'Have you been diagnosed with heart disease by doctor measured by Charls (wave 4)'.
EXECUTE.

COMPUTE Cwv4_heart_disease_sum=SUM(Cwv4_heart_disease_evr,Cwv4_heart_disease_diagnosed).
VARIABLE LABELS  Cwv4_heart_disease_sum 'Sum of self-reported doctor diagnosed heart disease (wave 4)'.
EXECUTE.

RECODE Cwv4_heart_disease_sum (0=0) (1 thru Highest=1) INTO Cwv4_heart_disease.
VARIABLE LABELS  Cwv4_heart_disease 'Self-reported doctor diagnosed heart disease (wave 4)'.
EXECUTE.



* Self-reported stroke
    
RECODE r4stroke (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_stroke_evr .
VARIABLE LABELS  Cwv4_stroke_evr 'Doctor ever diagnosed stroke measured by Rand (wave 4)'.
EXECUTE.

RECODE da007_8_wv4 (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_stroke_diagnosed.
VARIABLE LABELS  Cwv4_stroke_diagnosed 'Have you been diagnosed with strokeby doctor measured by Charls (wave 4)'.
EXECUTE.

COMPUTE Cwv4_stroke_sum=SUM(Cwv4_stroke_evr,Cwv4_stroke_diagnosed).
VARIABLE LABELS  Cwv4_stroke_sum 'Sum of self-reported doctor diagnosed stroke (wave 4)'.
EXECUTE.

RECODE Cwv4_stroke_sum (0=0) (1 thru Highest=1) INTO Cwv4_stroke.
VARIABLE LABELS  Cwv4_stroke 'Self-reported doctor diagnosed stroke (wave 4)'.
EXECUTE.



* Sum of self-reported CVDs (heart diseases and stroke), and recode into 0-1 variable

COMPUTE Cwv4_cvd_sum=SUM(Cwv4_heart_disease,Cwv4_stroke).
VARIABLE LABELS  Cwv4_cvd_sum 'Sum of Cardiovascular diseases (wave 4)'.
EXECUTE.

RECODE Cwv4_cvd_sum (0=0) (1 thru 2=1) INTO Cwv4_cvd_comorbidity.
VARIABLE LABELS  Cwv4_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease at wave 4'.
EXECUTE.




# Cognition wave 1
Raw variables:
Memory: 10 word recall
    - r1imrc: w1 r immediate word recall (cont)
    - r1dlrc: w1 r delayed word recall (cont)
    - r1tr20: w1 r recall summary score (cont)
Concetration
    - r1ser7: w1 r serial 7s (cont)
Orientation in time
    - r1mo: w1 r cognition date naming-month (categ)
    - r1dy: w1 r cognition date naming-day of month (categ)
    - r1yr: w1 r cognition date naming-year (categ)
    - r1dw: w1 r cognition date naming-day of week (categ)
    - r1orient: w1 r cognition orient (summary date naming) (cont)
Executive function
    - r1draw: w1 r cognition able to draw assign picture (categ)
Recode r1tr20, r1ser7, r1orient, r1draw into new variables that measure memory, concetration, orientation and executue functions respectively
We cannot develop a holistic variable that estimates cognitive status, we can just use specific cognition measures that capture specific cognitive functions
1. r1tr20
        r1tr20 is the summary score for total word recall
        r1tr20 sums the immediate and delayed word recall scores
        It is calculated by taking the sum of r1imrc (range 0-10) and r1dlrc (range 0-10)
        r1tr20 is only calculated when the respondent has non-missing values for r1imrc and r1dlrc
2. r1ser7
        r1ser7 provides the numbers of correct subtractions in the serial 7’s test
        This test asks the individual to subtract 7 from the prior number, beginning with 100 for five trials
        Valid scores are 0-5
3. r1orient
        r1orient indicates the orientation to date, month, year and day of week
        It is the summary measure for the above four variables, ranging from 0 to 4, with four indicating all questions answered correctly
4. r1draw (no/yes, 0-1)
        r1draw is the cognition measure indicating whether the respondent is able to draw an assigned picture, 
        which was a picture of two pentagons overlapped
5. Recode a total score variable of Cognitive Index that sums the scores for 1.memory word recall, 2.concetration, 3.orientation in time and 4.executive function        
    The resulting range is 0-30
   



RECODE r1tr20 r1ser7 r1orient (ELSE=Copy) INTO Cwv1_memory_wordrecall Cwv1_concetration_serial7 Cwv1_orientation_time.
VARIABLE LABELS  Cwv1_memory_wordrecall 'Memory Function: summary score for immediate and delayed 10 words recall (wave 1)' 
    /Cwv1_concetration_serial7 'Concetration measure by the serial 7’s test (wave 1) ' 
    /Cwv1_orientation_time 'Orientation in time measure by date naming (month, day of month, year, day of week) at wave 1'.
EXECUTE.


RECODE r1draw (0=0) (1=1) (ELSE=Copy) INTO Cwv1_executive_drawpicture.
VARIABLE LABELS  Cwv1_executive_drawpicture 'Executive Function by ability to draw an assigned picture (wave 1)'.
EXECUTE.


COMPUTE Cwv1_cognition = Cwv1_memory_wordrecall + Cwv1_concetration_serial7 + Cwv1_orientation_time + Cwv1_executive_drawpicture.
VARIABLE LABELS  Cwv1_cognition 'Total cognitive index measured by memory, concetration, orientation and executive function (range 0-30) (wave 1)'.
EXECUTE.




# Cognition wave 4
Rand data
-r4tr20: memory wordrecall (0-20)
-r4ser7: serial 7’s test (0-5)
-r4orient: orientation to date, month, year and day of week (0-4)
-r4draw: draw an assigned picture (0-1)

RECODE r4tr20 r4ser7 r4orient (ELSE=Copy) INTO Cwv4_memory_wordrecall Cwv4_concetration_serial7 Cwv4_orientation_time.
VARIABLE LABELS  Cwv4_memory_wordrecall 'Memory Function: summary score for immediate and delayed 10 words recall (wave 4)' 
    /Cwv4_concetration_serial7 'Concetration measure by the serial 7’s test (wave 4) ' 
    /Cwv4_orientation_time 'Orientation in time measure by date naming (month, day of month, year, day of week) at wave 4'.
EXECUTE.



RECODE r4draw (0=0) (1=1) (ELSE=Copy) INTO Cwv4_executive_drawpicture.
VARIABLE LABELS  Cwv4_executive_drawpicture 'Executive Function by ability to draw an assigned picture (wave 4)'.
EXECUTE.


COMPUTE Cwv4_cognition = Cwv4_memory_wordrecall + Cwv4_concetration_serial7 + Cwv4_orientation_time + Cwv4_executive_drawpicture.
VARIABLE LABELS  Cwv4_cognition 'Total cognitive index measured by memory, concetration, orientation and executive function (range 0-30) (wave 4)'.
EXECUTE.






# Dementia variables (waves 1, 2,3 and 4)

# Wave 1 - baseline (2011)
Raw Rand data: 
    Doctor-diagnosed memory related disease (Alzheimers disease, Parkinson disease or disease related to brain atrophy)
       1. r1memrye -> R ever had memory problem (0=no, 1=yes)
       2. r1memryf -> R flag dispute chg memory problem (NO USE!)
Raw charls data (Section of Health status and functioning)
       self-report 
       da007_12_ -> Have you ever been diagnosed with memory-related disease by a doctor? (1=yes, 2=no)


* Self-reported memory-related disease

RECODE r1memrye (0=0) (1=1)  (ELSE=Copy) INTO Cwv1_memory_evr.
VARIABLE LABELS Cwv1_memory_evr 'Ever had memory related disease (wave 1)'. 
EXECUTE.


RECODE da007_12_ (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv1_memory_diagnosed.
VARIABLE LABELS Cwv1_memory_diagnosed 'Doctor diagnosed memory related disease at wave 1'. 
EXECUTE.



* Sum of  memory-related disease and recode into a 0-1 variable


COMPUTE Cwv1_dementia_sum=SUM(Cwv1_memory_evr,Cwv1_memory_diagnosed).
VARIABLE LABELS Cwv1_dementia_sum 'Sum of new diagnosis of dementia at wave 1'.
EXECUTE.

RECODE Cwv1_dementia_sum  (2=1) (1=1) (0=0) INTO Cwv1_dementia_report.
VARIABLE LABELS  Cwv1_dementia_report 'Whether reported physician-diagnosed dementia new at wave 1'.
EXECUTE.




# Wave 2 (2013)
Raw Rand data: 
    Doctor-diagnosed memory related disease (Alzheimers disease, Parkinson disease or disease related to brain atrophy)
       1. r2memrye -> R ever had memory problem (0=no, 1=yes)
       2. r2memryf -> R flag dispute chg memory problem (NO USE!)
Raw charls data (Section of Health status and functioning)
       self-report 
       da007_w2_2_12_-> Have you ever been diagnosed with memory-related disease by a doctor? (1=yes, 2=no)
  

* Self-reported memory-related disease

RECODE r2memrye (0=0) (1=1)  (ELSE=Copy) INTO Cwv2_memory_evr.
VARIABLE LABELS Cwv2_memory_evr 'Ever had memory related disease (wave 2)'. 
EXECUTE.


RECODE da007_w2_2_12_ (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv2_memory_diagnosed.
VARIABLE LABELS Cwv2_memory_diagnosed 'Doctor diagnosed memory related disease at wave 2'. 
EXECUTE.


* Sum of  memory-related disease and recode into a 0-1 variable

COMPUTE Cwv2_dementia_sum=SUM(Cwv2_memory_evr,Cwv2_memory_diagnosed).
VARIABLE LABELS Cwv2_dementia_sum 'Sum of new diagnosis of dementia at wave 2'.
EXECUTE.

RECODE Cwv2_dementia_sum  (2=1) (1=1) (0=0) INTO Cwv2_dementia_report.
VARIABLE LABELS  Cwv2_dementia_report 'Whether reported physician-diagnosed dementia new at wave 2'.
EXECUTE.




# Wave 3 (2015)
Raw Rand data: 
    Doctor-diagnosed memory related disease (Alzheimers disease, Parkinson disease or disease related to brain atrophy)
       1. r4memrye -> R ever had memory problem (0=no, 1=yes)
       2. r4memryf -> R flag dispute chg memory problem (NO USE!)
Raw charls data (Section of Health status and functioning)
       self-report 
       da007_w2_2_12_wv3-> Have you ever been diagnosed with memory-related disease by a doctor? (1=yes, 2=no)


* Self-reported memory-related disease

RECODE r4memrye (0=0) (1=1) (ELSE=Copy) INTO Cwv3_memory_evr.
VARIABLE LABELS Cwv3_memory_evr 'Ever had memory related disease (wave 3)'. 
EXECUTE.


RECODE da007_w2_2_12_wv3 (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv3_memory_diagnosed.
VARIABLE LABELS Cwv3_memory_diagnosed 'Doctor diagnosed memory related disease at wave 3'. 
EXECUTE.



* Sum of  memory-related disease and recode into a 0-1 variable


COMPUTE Cwv3_dementia_sum=SUM(Cwv3_memory_evr,Cwv3_memory_diagnosed).
VARIABLE LABELS Cwv3_dementia_sum 'Sum of new diagnosis of dementia at wave 3'.
EXECUTE.

RECODE Cwv3_dementia_sum  (2=1) (1=1) (0=0) INTO Cwv3_dementia_report.
VARIABLE LABELS  Cwv3_dementia_report 'Whether reported physician-diagnosed dementia new at wave 3'.
EXECUTE.



# Wave 4 (2018)
Raw charls data (Section of Health status and functioning)
    1. self-report 
       da007_12_wv4-> Have you ever been diagnosed with memory-related disease by a doctor? (1=yes, 2=no)
    2. Informant Information (first time in wave 4 - 2018)
        dd010_w4 -> R Been Diagnose with Alzheimers Disease (use)
        dd011_w4 -> R Been Diagnose with Memory Problems (use)
        IQCODE (26-item) ->26 items from "dd012_w4" - "dd037_w4" (recode but no use as it is only available in wave 4)
    
      


RECODE da007_12_wv4 (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv4_memory_diagnosed.
VARIABLE LABELS Cwv4_memory_diagnosed 'Doctor diagnosed memory related disease at wave 4'. 
EXECUTE.


RECODE Cwv4_memory_diagnosed (ELSE=SYSMIS) INTO Cwv4_dementia_report.
VARIABLE LABELS Cwv4_dementia_report 'Whether reported physician-diagnosed dementia new at wave 4'. 
EXECUTE.


* Informant Information about R diagnosis of AD or memory problem


RECODE dd010_w4 (2=0) (1=1) (9=SYSMIS) INTO Cwv4_ad_informant.
VARIABLE LABELS Cwv4_ad_informant 'R been diagnosed with Alzheimers disease as reported by informant (wave 4)'. 
EXECUTE.  
 

RECODE dd011_w4 (2=0) (1=1) (9=SYSMIS) INTO Cwv4_memory_informant.
VARIABLE LABELS Cwv4_memory_informant 'R been diagnosed with memory related disease as reported by informant (wave 4)'. 
EXECUTE.     


* Sum of  Informant-reported AD/memory-related disease and recode into a 0-1 variable


COMPUTE Cwv4_dementia_informant_sum=SUM(Cwv4_ad_informant,Cwv4_memory_informant).
VARIABLE LABELS Cwv4_dementia_informant_sum 'Sum of informant-reported diagnosis of dementia at wave 4'.
EXECUTE.

RECODE Cwv4_dementia_informant_sum  (2=1) (1=1) (0=0) INTO Cwv4_dementia_informant.
VARIABLE LABELS  Cwv4_dementia_informant 'Informant-reported diagnosis of dementia at wave 4'.
EXECUTE.



* IQCODE wave 4 
    1. 26 items from "dd012_w4" - "dd037_w4" for missing data (6, 8, 9 = N/A)
    2. Keep values as they are:
            1 = much better
            2 = improved
            3 = not much change
            4 = gotten worse
            5 = much worse
    3. Sum of 26 items
    4. Devide Sum by 26 (Sum/26)
    5. Score IQCODE based on the threshold of 3.5  (score ≥3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1



RECODE dd012_w4 dd013_w4 dd014_w4 dd015_w4 dd016_w4 dd017_w4 dd018_w4 dd019_w4 
dd020_w4 dd021_w4 dd022_w4 dd023_w4 dd024_w4 dd025_w4 dd026_w4 dd027_w4 dd028_w4 dd029_w4
dd030_w4 dd031_w4 dd032_w4 dd033_w4 dd034_w4 dd035_w4 dd036_w4 dd037_w4 
(6=SYSMIS) (8=SYSMIS) (9=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)
INTO Cwv4_iqcode1 Cwv4_iqcode2 Cwv4_iqcode3 Cwv4_iqcode4 Cwv4_iqcode5 Cwv4_iqcode6 Cwv4_iqcode7 Cwv4_iqcode8
Cwv4_iqcode9 Cwv4_iqcode10 Cwv4_iqcode11 Cwv4_iqcode12 Cwv4_iqcode13 Cwv4_iqcode14 Cwv4_iqcode15 Cwv4_iqcode16
Cwv4_iqcode17 Cwv4_iqcode18 Cwv4_iqcode19 Cwv4_iqcode20 Cwv4_iqcode21 Cwv4_iqcode22 Cwv4_iqcode23 Cwv4_iqcode24
Cwv4_iqcode25 Cwv4_iqcode26.
VARIABLE LABELS Cwv4_iqcode1 'iqcode1: Ability to Recognize Faces of Families and Friends compared to 10 years ago (wave 4)' 
/Cwv4_iqcode2 'iqcode2: Ability to Remember Names of Families and Friends compared to 10 years ago  (wave 4)'
/Cwv4_iqcode3 'iqcode3: Ability to Remember Occupations Etc compared to 10 years ago (wave 4)'
/Cwv4_iqcode4 'iqcode4: Ability to Remember Things Happened Recently compared to 10 years ago (wave 4)'
/Cwv4_iqcode5 'iqcode5: Ability to Recall Conversations A Few Days before compared to 10 years ago (wave 4)'
/Cwv4_iqcode6 'iqcode6: Ability to Forget What to Say When Talk compared to 10 years ago (wave 4)'
/Cwv4_iqcode7 'iqcode7: Ability to Remember Address and Telephone Number compared to 10 years ago (wave 4)'
/Cwv4_iqcode8 'iqcode8: Ability to Remember What Day and Month It is compared to 10 years ago (wave 4)'
/Cwv4_iqcode9 'iqcode9: Ability to Remember Where Things Are Usually Kept compared to 10 years ago (wave 4)'
/Cwv4_iqcode10 'iqcode10: Ability to Find Things Which Have Been Put in Different Place compared to 10 years ago (wave 4)'
/Cwv4_iqcode11 'iqcode11: Ability to Adapt Changes in Daily Life compared to 10 years ago (wave 4)'
/Cwv4_iqcode12 'iqcode12: Ability to Use Regular Machines Around House Such as TV compared to 10 years ago (wave 4)'
/Cwv4_iqcode13 'iqcode13: Ability to Use New Machines Around House compared to 10 years ago (wave 4)'
/Cwv4_iqcode14 'iqcode14: Ability to Learn New Things compared to 10 years ago (wave 4)'
/Cwv4_iqcode15 'iqcode15: Ability to Remember Past Things Happened at Young or Childhood compared to 10 years ago (wave 4)'
/Cwv4_iqcode16 'iqcode16: Ability to Remember Things Learned at Young compared to 10 years ago (wave 4)'
/Cwv4_iqcode17 'iqcode17: Ability to Understand Uncommon Used Words compared to 10 years ago (wave 4)'
/Cwv4_iqcode18 'iqcode18: Ability to Understand Aticles in Journals or Papers compared to 10 years ago (wave 4)'
/Cwv4_iqcode19 'iqcode19: Ability to Understand Stories in Books or TV compared to 10 years ago (wave 4)'
/Cwv4_iqcode20 'iqcode20: Ability to Write Letters compared to 10 years ago (wave 4)'
/Cwv4_iqcode21 'iqcode21: Known Important Historical Event compared to 10 years ago (wave 4)'
/Cwv4_iqcode22 'iqcode22: Ability to Make Decisions on Everyday Matters compared to 10 years ago (wave 4)'
/Cwv4_iqcode23 'iqcode23: Ability to Handling Money for Shopping compared to 10 years ago (wave 4)'
/Cwv4_iqcode24 'iqcode24: Ability to Handling Finacial Matters compared to 10 years ago (wave 4)'
/Cwv4_iqcode25 'iqcode25: Ability to Handling Everyday Arithmatic Problems compared to 10 years ago (wave 4)'
/Cwv4_iqcode26 'iqcode26: Ability to Understand What Is Going on and to Reason Things through compared to 10 years ago (wave 4)'.
EXECUTE.


COMPUTE Cwv4_iqcode_sum = Cwv4_iqcode1 + Cwv4_iqcode2 + Cwv4_iqcode3 + Cwv4_iqcode4 + Cwv4_iqcode5 + 
    Cwv4_iqcode6 + Cwv4_iqcode7 + Cwv4_iqcode8 + Cwv4_iqcode9 + Cwv4_iqcode10 + Cwv4_iqcode11 + Cwv4_iqcode12 + 
    Cwv4_iqcode13 + Cwv4_iqcode14 + Cwv4_iqcode15 + Cwv4_iqcode16 + Cwv4_iqcode17 + Cwv4_iqcode18 + Cwv4_iqcode19 + Cwv4_iqcode20
    + Cwv4_iqcode21 + Cwv4_iqcode22 + Cwv4_iqcode23 + Cwv4_iqcode24 + Cwv4_iqcode25 + Cwv4_iqcode26.
VARIABLE LABELS  Cwv4_iqcode_sum 'Sum of 26 IQCODE items at wave 4'.
EXECUTE.

COMPUTE Cwv4_iqcode_scoreby26=Cwv4_iqcode_sum / 26.
VARIABLE LABELS  Cwv4_iqcode_scoreby26 'Score of IQCODE (26 items) divided by 26 (wave 4)'.
EXECUTE.

RECODE Cwv4_iqcode_scoreby26 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Cwv4_dementia_iqcode.
VARIABLE LABELS  Cwv4_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 4)'.
EXECUTE.




* self-report dementia + informant-report dementia 

COMPUTE Cwv4_self_info_dementia_sum=SUM(Cwv4_dementia_report,Cwv4_dementia_informant).
VARIABLE LABELS Cwv4_self_info_dementia_sum 'Sum of self-reported dementia and infomant-reported dementia at wave 4'.
EXECUTE.

RECODE Cwv4_self_info_dementia_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Cwv4_self_info_dementia.
VARIABLE LABELS  Cwv4_self_info_dementia 'All new self-reported dementia and informant-reported dementia at wave 4'.
EXECUTE.


* self-report dementia + informant-report dementia + IQCODE 

COMPUTE Cwv4_anydementia_sum=SUM(Cwv4_dementia_report,Cwv4_dementia_informant,Cwv4_dementia_iqcode).
VARIABLE LABELS Cwv4_anydementia_sum 'Sum of self-reported dementia, infomant-reported dementia and IQCODE cases at wave 4'.
EXECUTE.

RECODE Cwv4_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Cwv4_anydementia_report.
VARIABLE LABELS  Cwv4_anydementia_report 'All new self-reported dementia, informant-reported dementia and IQCODE cases at wave 4'.
EXECUTE.




*** Create a new dataset "charls_dementia_event_variable" to exclude baseline dementia cases (wave1)
Remove baseline dementia cases and in a cognitively intact sample estimate the event to dementia variable during the follow-up waves (2-4)
Then, merge event to dementia related variables with the full-sample dataset. Excluded cases will be showed as missing data (N/As).




# Event to Dementia (variable created in a seperate dataset where all baseline dementia cases were excluded)
1. Sum of new dementia cases in all the follow-up waves (waves 2-4)
Name variable: "Cwv2to4_dementia_sum"
2. Recode into 0 - 1 (yes/no dementia)
             0 -> 0 no dementia until the last interview (wave 4)
             1 -> 1 yes dementia
             2 -> 1 yes dementia
             3 -> 1 yes dementia
Name variable: "Cwv2to4_dementia_event"

COMPUTE Cwv2to4_dementia_sum=SUM(Cwv2_dementia_report,Cwv3_dementia_report,Cwv4_self_info_dementia).
VARIABLE LABELS  Cwv2to4_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 2-4'.
EXECUTE.

RECODE Cwv2to4_dementia_sum (0=0) (1=1) (2=1) (3=1) INTO Cwv2to4_dementia_event.
VARIABLE LABELS Cwv2to4_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis (wave 2-4)'.
EXECUTE.


# Merge "Cwv2to4_dementia_sum" and "Cwv2to4_dementia_event"
where the cases of dementia baseline cases are recorded as N/A.

DATASET ACTIVATE DataSet6.
SORT CASES BY ID.
DATASET ACTIVATE DataSet10.
SORT CASES BY ID.
DATASET ACTIVATE DataSet6.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /BY ID.
EXECUTE.



# Time of Event - Time of Dementia Incidence
Steps:
1. year and month of interview 
2. date of interview
3. time difference
4. midpoint


# Step 1 -  Interview dates (year and month) (cont)
Recode variables related to time of interview (waves 1,2,3,4)
        year of interview: r1iwy, r2iwy, r4iwy, iyearwv4
        month of interview: r1iwm, r2iwm, r4iwm, imonthwv4
        

# Step 2 - date of interview
Recode into a new variable of date of interview based on month and year of interview
            Date properties: dd.mm.yyyy (data on the day is unavailable so consistently use "01")


# Wave 1 (Baseline date)

RECODE r1iwm r1iwy (ELSE=Copy) INTO Cwv1_interview_month Cwv1_interview_year.
VARIABLE LABELS Cwv1_interview_month 'Month of respondent interview wave 1' /Cwv1_interview_year 'Year of respondent interview wave 1'.

COMPUTE Cwv1_interview_date=DATE.MOYR(Cwv1_interview_month,Cwv1_interview_year).
VARIABLE LABELS  Cwv1_interview_date 'Date of interview (01 for day / month / year) at wave 1 (baseline)'.
EXECUTE.

# Wave 2

RECODE r2iwm r2iwy (ELSE=Copy) INTO Cwv2_interview_month Cwv2_interview_year.
VARIABLE LABELS Cwv2_interview_month 'Month of respondent interview wave 2' /Cwv2_interview_year 'Year of respondent interview wave 2'.

COMPUTE Cwv2_interview_date=DATE.MOYR(Cwv2_interview_month,Cwv2_interview_year).
VARIABLE LABELS  Cwv2_interview_date 'Date of interview (01 for day / month / year) at wave 2'.
EXECUTE.


# Wave 3

RECODE r4iwm r4iwy (ELSE=Copy) INTO Cwv3_interview_month Cwv3_interview_year.
VARIABLE LABELS Cwv3_interview_month 'Month of respondent interview wave 3' /Cwv3_interview_year 'Year of respondent interview wave 3'.

COMPUTE Cwv3_interview_date=DATE.MOYR(Cwv3_interview_month,Cwv3_interview_year).
VARIABLE LABELS  Cwv3_interview_date 'Date of interview (01 for day / month / year) at wave 3'.
EXECUTE.


# Wave 4

RECODE imonthwv4 iyearwv4 (ELSE=Copy) INTO Cwv4_interview_month Cwv4_interview_year.
VARIABLE LABELS Cwv4_interview_month 'Month of respondent interview wave 4' /Cwv4_interview_year 'Year of respondent interview wave 4'.

COMPUTE Cwv4_interview_date=DATE.MOYR(Cwv4_interview_month,Cwv4_interview_year).
VARIABLE LABELS  Cwv4_interview_date 'Date of interview (01 for day / month / year) at wave 4'.
EXECUTE.





# Step 3 - time difference
   - Create a variable "Cwv2to4_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 1 date of interview "Cwv1_interview_date"
   - Create a variable "C_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 1 2011) and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"


* Date and Time Wizard: H_time_dementia_months.
COMPUTE  C_time_dementia_months=RND((Cwv2to4_newdementia_or_lastinterview_date - 
    Cwv1_interview_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  C_time_dementia_months "Time in months from the baseline (wave 1) to the date "+
    "of dementia diagnosis or last date of study assessment".
VARIABLE LEVEL  C_time_dementia_months (SCALE).
FORMATS  C_time_dementia_months (F5.0).
VARIABLE WIDTH  C_time_dementia_months(5).
EXECUTE.

# OR

COMPUTE C_time_dementia_months=DATEDIFF(Cwv2to4_newdementia_or_lastinterview_date,Cwv1_interview_date,"months").
VARIABLE LABELS  C_time_dementia_months 'Time in months from the baseline (wave 1) to the date of '+
    'dementia diagnosis or last date of study assessment'.
EXECUTE.



# Step 4 - midpoint
   - Create a variable "Cwv2to4_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
           This shows when was the last interview when the participant was dementia free [manual work]
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "C_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("C_time_dementia_midpoint_final") for the cases without dementia
           (if you do not do this the time _of_event_dementia will be wrong, which means the mean of C_time_dementia_months, C_time_dementia_midpoint will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored "C_time_of_event_dementia" 
            measured in months and adjusting for midpoint between interviews (people lost or without dementia until the last date of assessment) 
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (C_time_dementia_months,C_time_dementia_midpoint_final)


* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  C_time_dementia_midpoint=RND((Cwv2to4_newdementia_or_lastinterview_date - 
    Cwv2to4_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  C_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  C_time_dementia_midpoint (SCALE).
FORMATS  C_time_dementia_midpoint (F5.0).
VARIABLE WIDTH  C_time_dementia_midpoint(5).
EXECUTE.


RECODE C_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO C_time_dementia_midpoint_final.
VARIABLE LABELS C_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE C_time_of_event_dementia=MEAN(C_time_dementia_months,C_time_dementia_midpoint_final).
VARIABLE LABELS  C_time_of_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.




# Predictors (Depressive symptoms and Cardiometabolic risk factors)



# Depressive symptoms (CES-D 10 items):
        Assessed in waves 1,2 and 3
        r1depresl r1effortl r1sleeprl r1whappyl r1flonel r1botherl r1goingl r1mindtsl r1fhopel r1fearll
        Assessed in wave 4
        dc009w4 dc010w4 dc011w4 dc012w4 dc013w4 dc014w4 dc015w4 dc016w4 dc017w4 dc018w4
4-Likert scale (1-4), the standard scale is measured in a scale of 0-3, so the highest score is 30.
        1= rarely or none of the time < 1 day
        2= some or a little of the time  1-2 days
        3=  occasionally or a moderate amount of 3-4 days
        4= most or all of the time 5-7 days
cutoff score 10/30 (10 and above)
do not score if > 2 items are missing (use command of SUM.8)
"rwcesd10" -> Sum of the 10 questions with reserve positives (2 items) and adjusted to 0-3 scale than 1-4.
Steps:
1. Recode reverse-scored questions (all waves 1,2,3,4)
2. Recode each item to 0-3 scale than 1-4
3. Sum of 10 questions and sum of CESD score "r1cesd10" as measured by RAND CHARLS (check that the scores are the same fro waves 1,2,3)
4. Recode into  "Cwv1_depressive_symptoms" (0-1, yes/no depressive symptoms)


# Step 1. Reverse scored questions (waves 1,2,3,4)

RECODE r1whappyl r2whappyl r4whappyl dc016w4 r1fhopel r2fhopel r4fhopel dc013w4 (1=4) (4=1) (2=3) (3=2) 
   (8=SYSMIS) (9=SYSMIS) (SYSMIS=SYSMIS) INTO Cwv1_cesd_happy1_4 Cwv2_cesd_happy1_4 Cwv3_cesd_happy1_4 Cwv4_cesd_happy1_4 Cwv1_cesd_hope1_4 
    Cwv2_cesd_hope1_4 Cwv3_cesd_hope1_4 Cwv4_cesd_hope1_4.
VARIABLE LABELS  Cwv1_cesd_happy1_4 'CESD Was happy scale of 1-4 (wave 1)' 
    /Cwv2_cesd_happy1_4 'CESD Was happy  scale of 1-4 (wave 2)' 
    /Cwv3_cesd_happy1_4 'CESD Was happy  scale of 1-4 (wave 3)' 
    /Cwv4_cesd_happy1_4 'CESD Was happy  scale of 1-4 (wave 4)' 
    /Cwv1_cesd_hope1_4 'CESD Feel hopeful about the future scale of 1-4(wave 1)' 
    /Cwv2_cesd_hope1_4 'CESD Feel hopeful about the future scale of 1-4 (wave 2)' 
    /Cwv3_cesd_hope1_4 'CESD Feel hopeful about the future  scale of 1-4 (wave 3)'
    /Cwv4_cesd_hope1_4 'CESD Feel hopeful about the future  scale of 1-4 (wave 4)'.
EXECUTE.


# Wave 1

RECODE r1depresl r1effortl r1sleeprl r1flonel r1botherl r1goingl r1mindtsl r1fearll (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv1_cesd_depressed Cwv1_cesd_effort Cwv1_cesd_sleep Cwv1_cesd_lonely Cwv1_cesd_bother Cwv1_cesd_going Cwv1_cesd_mind Cwv1_cesd_fear.
VARIABLE LABELS  Cwv1_cesd_depressed 'CES-D Felt depressed (wave 1)' Cwv1_cesd_effort 'CES-D Everything an effort (wave 1)' 
/Cwv1_cesd_sleep 'CESD Sleep was restless (wave 1)' /Cwv1_cesd_lonely 'CESD Felt lonely (wave 1)' 
/Cwv1_cesd_bother 'CESD Bothered by little things (wave 1)' /Cwv1_cesd_going 'CESD Could not get going (wave 1)' 
/Cwv1_cesd_mind 'CESD Had trouble keeping mind on what is doing (wave 1)' /Cwv1_cesd_fear 'CESD Feel fearful (wave 1)'.
EXECUTE.

RECODE  Cwv1_cesd_happy1_4 Cwv1_cesd_hope1_4 (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv1_cesd_happy Cwv1_cesd_hope.
VARIABLE LABELS  Cwv1_cesd_happy 'CES-D Was happy (wave 1)' Cwv1_cesd_hope 'CES-D Feel hopeful about the future (wave 1)'.
EXECUTE.

COMPUTE Cwv1_cesd_sumscore=SUM.8(Cwv1_cesd_depressed, Cwv1_cesd_effort, Cwv1_cesd_sleep,
 Cwv1_cesd_lonely, Cwv1_cesd_bother, Cwv1_cesd_going, Cwv1_cesd_mind, Cwv1_cesd_fear,Cwv1_cesd_happy, Cwv1_cesd_hope).
VARIABLE LABELS  Cwv1_cesd_sumscore 'Sum of 10 items of CESD (wave 1)'.
EXECUTE.

RECODE Cwv1_cesd_sumscore (10 thru 30=1) (0 thru 9=0) INTO Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 1 (10-30 = high depressive symptoms and 0-9 = low or no depressive symptoms)'.
EXECUTE.

RECODE r1cesd10 (ELSE=Copy) INTO Cwv1_cesd_score.
VARIABLE LABELS  Cwv1_cesd_score 'CESD total score of 10items by Rand charls (wave 1)'.
EXECUTE.




# Wave 2

RECODE r2depresl r2effortl r2sleeprl r2flonel r2botherl r2goingl r2mindtsl r2fearll (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv2_cesd_depressed Cwv2_cesd_effort Cwv2_cesd_sleep Cwv2_cesd_lonely Cwv2_cesd_bother Cwv2_cesd_going Cwv2_cesd_mind Cwv2_cesd_fear.
VARIABLE LABELS  Cwv2_cesd_depressed 'CES-D Felt depressed (wave 2)' Cwv2_cesd_effort 'CES-D Everything an effort (wave 2)' 
/Cwv2_cesd_sleep 'CESD Sleep was restless (wave 2)' /Cwv2_cesd_lonely 'CESD Felt lonely (wave 2)' 
/Cwv2_cesd_bother 'CESD Bothered by little things (wave 2)' /Cwv2_cesd_going 'CESD Could not get going (wave 2)' 
/Cwv2_cesd_mind 'CESD Had trouble keeping mind on what is doing (wave 2)' /Cwv2_cesd_fear 'CESD Feel fearful (wave 2)'.
EXECUTE.

RECODE  Cwv2_cesd_happy1_4 Cwv2_cesd_hope1_4 (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv2_cesd_happy Cwv2_cesd_hope.
VARIABLE LABELS  Cwv2_cesd_happy 'CES-D Was happy (wave 2)' Cwv2_cesd_hope 'CES-D Feel hopeful about the future (wave 2)'.
EXECUTE.

COMPUTE Cwv2_cesd_sumscore=SUM.8(Cwv2_cesd_depressed, Cwv2_cesd_effort, Cwv2_cesd_sleep,
 Cwv2_cesd_lonely, Cwv2_cesd_bother, Cwv2_cesd_going, Cwv2_cesd_mind, Cwv2_cesd_fear,Cwv2_cesd_happy, Cwv2_cesd_hope).
VARIABLE LABELS  Cwv2_cesd_sumscore 'Sum of 10 items of CESD (wave 2)'.
EXECUTE.

RECODE Cwv2_cesd_sumscore (10 thru 30=1) (0 thru 9=0) INTO Cwv2_depressive_symptoms.
VARIABLE LABELS  Cwv2_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 2 (10-30 = high depressive symptoms and 0-9 = low or no depressive symptoms)'.
EXECUTE.

RECODE r2cesd10 (ELSE=Copy) INTO Cwv2_cesd_score.
VARIABLE LABELS  Cwv2_cesd_score 'CESD total score of 10items by Rand charls (wave 2)'.
EXECUTE.


# Wave 3

RECODE r4depresl r4effortl r4sleeprl r4flonel r4botherl r4goingl r4mindtsl r4fearll (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv3_cesd_depressed Cwv3_cesd_effort Cwv3_cesd_sleep Cwv3_cesd_lonely Cwv3_cesd_bother Cwv3_cesd_going Cwv3_cesd_mind Cwv3_cesd_fear.
VARIABLE LABELS  Cwv3_cesd_depressed 'CES-D Felt depressed (wave 3)' Cwv3_cesd_effort 'CES-D Everything an effort (wave 3)' 
/Cwv3_cesd_sleep 'CESD Sleep was restless (wave 3)' /Cwv3_cesd_lonely 'CESD Felt lonely (wave 3)' 
/Cwv3_cesd_bother 'CESD Bothered by little things (wave 3)' /Cwv3_cesd_going 'CESD Could not get going (wave 3)' 
/Cwv3_cesd_mind 'CESD Had trouble keeping mind on what is doing (wave 3)' /Cwv3_cesd_fear 'CESD Feel fearful (wave 3)'.
EXECUTE.

RECODE  Cwv3_cesd_happy1_4 Cwv3_cesd_hope1_4 (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv3_cesd_happy Cwv3_cesd_hope.
VARIABLE LABELS  Cwv3_cesd_happy 'CES-D Was happy (wave 3)' Cwv3_cesd_hope 'CES-D Feel hopeful about the future (wave 3)'.
EXECUTE.

COMPUTE Cwv3_cesd_sumscore=SUM.8(Cwv3_cesd_depressed, Cwv3_cesd_effort, Cwv3_cesd_sleep,
 Cwv3_cesd_lonely, Cwv3_cesd_bother, Cwv3_cesd_going, Cwv3_cesd_mind, Cwv3_cesd_fear,Cwv3_cesd_happy, Cwv3_cesd_hope).
VARIABLE LABELS  Cwv3_cesd_sumscore 'Sum of 10 items of CESD (wave 3)'.
EXECUTE.

RECODE Cwv3_cesd_sumscore (10 thru 30=1) (0 thru 9=0) INTO Cwv3_depressive_symptoms.
VARIABLE LABELS  Cwv3_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 3 (10-30 = high depressive symptoms and 0-9 = low or no depressive symptoms)'.
EXECUTE.

RECODE r4cesd10 (ELSE=Copy) INTO Cwv3_cesd_score.
VARIABLE LABELS  Cwv3_cesd_score 'CESD total score of 10items by Rand charls (wave 3)'.
EXECUTE.



# Wave 4

RECODE dc009w4 dc010w4 dc011w4 dc012w4 dc014w4 dc015w4 dc017w4 dc018w4 (4=3) (3=2) (2=1) (1=0) (8=SYSMIS) (9=SYSMIS) (SYSMIS=SYSMIS) 
INTO Cwv4_cesd_bother Cwv4_cesd_mind Cwv4_cesd_depressed Cwv4_cesd_effort Cwv4_cesd_fear Cwv4_cesd_sleep Cwv4_cesd_lonely Cwv4_cesd_going.
VARIABLE LABELS  Cwv4_cesd_bother 'CESD Bothered by little things (wave 4)' 
/Cwv4_cesd_mind 'CESD Had trouble keeping mind on what is doing (wave 4)'
/Cwv4_cesd_depressed 'CES-D Felt depressed (wave 4)' 
/Cwv4_cesd_effort 'CES-D Everything an effort (wave 4)' 
/Cwv4_cesd_fear 'CESD Feel fearful (wave 4)' 
/Cwv4_cesd_sleep 'CESD Sleep was restless (wave 4)' 
/Cwv4_cesd_lonely 'CESD Felt lonely (wave 4)' 
/Cwv4_cesd_going 'CESD Could not get going (wave 4)'.
EXECUTE.

RECODE  Cwv4_cesd_happy1_4 Cwv4_cesd_hope1_4 (4=3) (3=2) (2=1) (1=0) (SYSMIS=SYSMIS) INTO 
Cwv4_cesd_happy Cwv4_cesd_hope.
VARIABLE LABELS  Cwv4_cesd_happy 'CES-D Was happy (wave 4)' Cwv4_cesd_hope 'CES-D Feel hopeful about the future (wave 4)'.
EXECUTE.

COMPUTE Cwv4_cesd_sumscore=SUM.8(Cwv4_cesd_bother, Cwv4_cesd_mind, Cwv4_cesd_depressed, 
    Cwv4_cesd_effort, Cwv4_cesd_fear, Cwv4_cesd_sleep, Cwv4_cesd_lonely, Cwv4_cesd_going, Cwv4_cesd_happy, Cwv4_cesd_hope).
VARIABLE LABELS  Cwv4_cesd_sumscore 'Sum of 10 items of CESD (wave 4)'.
EXECUTE.

RECODE Cwv4_cesd_sumscore (10 thru 30=1) (0 thru 9=0) INTO Cwv4_depressive_symptoms.
VARIABLE LABELS  Cwv4_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 4 (10-30 = high depressive symptoms and 0-9 = low or no depressive symptoms)'.
EXECUTE.





# Cardiometabolic markers
Cardiometabolic markers assessememt takes place at the baseline wave 1 (2011) and wave 3 (2015)
1. Inflammation indicator of high-sensitivity C-reactive protein (CRP) 
2. Blood pressure
3. Diabetes
4. Glucose (HbA1c)
5. Abdomical obesity (waist circumference)
6.HDL cholesterol 



# Wave 1 (2011)

# CRP 
Raw variable: newcrp (measured in mg/l)
Normal level of CRP <= 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L [same measurement as ELSA]) see: http://unitslab.com/node/67
Steps: 
1. Recode newcrp into a new CRP variable
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE newcrp (ELSE=Copy) INTO Cwv1_crp_level.
VARIABLE LABELS  Cwv1_crp_level 'CRP level (ug/mL) without n/a (wave 1)'.
EXECUTE.

RECODE Cwv1_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Cwv1_crp.
VARIABLE LABELS  Cwv1_crp 'CRP level dichotomised into normal/high (normal CRP <= 3 ug/mL) (wave 1)'.
EXECUTE.



# HDL cholesterol
Raw variable: newhdl
Unit of measurment mg/dL
Self-reported dyslipidemia: 
 - r1dyslipe (rand data) (1=yes, 0= no) ->  r ever had dyslipidemia (indicates whether or not a doctor has told the respondent 
   they ever had dyslipidemia (elevation of low density lipoprotein, triglycerides, and total cholesterol, or a low high density lipoprotein level))
 - da007_2_ (charls data) (1=yes, 2=no) -> Have you been diagnosed with dyslipidemia by a doctor? 
Medication for dyslipidemia (charls data): 
 - da010_2_s1 (1) -> Take Chinese Traditional Medicine for Dyslipidemia
 - da010_2_s2 (2) -> Take Western Mordern Medicine for Dyslipidemia
 - da010_2_s3 (3) -> Other Treatments for Dyslipidemia
 - da010_2_s4 (4) -> None of the Above for Dyslipidemia
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
Steps:
1. Recode newhdl into HDL cholesterol level
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE newhdl (ELSE=Copy) INTO Cwv1_hdl_level.
VARIABLE LABELS  Cwv1_hdl_level 'HDL cholesterol level (mg/dL) without n/a (wave 1)'.
EXECUTE.

DO IF  (C_sex = 0).
RECODE Cwv1_hdl_level (Lowest thru 39.99=1) (40 thru Highest=0) 
    INTO Cwv1_male_hdl.
END IF.
VARIABLE LABELS  Cwv1_male_hdl 'Male HDL cholesterol (wave 1): IDF criteria < 40 mg/dL'.
EXECUTE.

DO IF  (C_sex = 1).
RECODE Cwv1_hdl_level (Lowest thru 49.99=1) (50 thru Highest=0) 
    INTO Cwv1_female_hdl.
END IF.
VARIABLE LABELS  Cwv1_female_hdl 'Female HDL cholesterol (wave 1): IDF criteria < 50 mg/dL'.
EXECUTE.



* Sum of male, female HDL and recode into 0-1 variable


COMPUTE Cwv1_hdl_sum=SUM(Cwv1_male_hdl,Cwv1_female_hdl).
VARIABLE LABELS  Cwv1_hdl_sum 'Sum of male and female HDL cholesterol (wave 1)'.
EXECUTE.

RECODE Cwv1_hdl_sum (0=0) (1 thru Highest=1) INTO Cwv1_hdl_cholesterol.
VARIABLE LABELS  Cwv1_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 1)'.
EXECUTE.




# Abdominal obesity (waist circumference or BMI > 30 kg/m²) 
Raw variable: 
- r1bmi -> r body mass index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- qm002 -> waist measurement
    Unit of measurement: cm
    IDFcriteria (ethnic group: South Asians -> Chinese)
          Abdominal obesity 
          Male ≥ 90 cm
          Female ≥ 80 cm
Steps:
Waist circumference
    1. Recode qm002 into waist circumference score without n/a
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode r1bmi into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)



RECODE qm002 (ELSE=Copy) INTO Cwv1_waist.
VARIABLE LABELS  Cwv1_waist 'Waist circumference in cm (wave 1)'.
EXECUTE.

DO IF  (C_sex = 0).
RECODE Cwv1_waist (Lowest thru 89.99=0) (90.00 thru Highest=1) INTO Cwv1_malewaist_ao.
END IF.
VARIABLE LABELS  Cwv1_malewaist_ao 'Male Waist circumference (cm) (wave 1): IDF criteria Chinese ethnic group Abdominal Obesity'.
EXECUTE.

DO IF  (C_sex = 1).
RECODE Cwv1_waist (Lowest thru 79.99=0) (80.00 thru Highest=1) INTO Cwv1_femalewaist_ao.
END IF.
VARIABLE LABELS  Cwv1_femalewaist_ao 'Female Waist circumference (cm) (wave 1): IDF criteria Chinese ethnic group Abdominal Obesity'.
EXECUTE.

COMPUTE Cwv1_obesity_waist_sum=SUM(Cwv1_malewaist_ao,Cwv1_femalewaist_ao).
VARIABLE LABELS  Cwv1_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 1)'.
EXECUTE.

RECODE Cwv1_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Cwv1_obesity_waist.
VARIABLE LABELS  Cwv1_obesity_waist 'Abdominal obesity based on waist circumference at wave 1 (yes/no)'.
EXECUTE.



RECODE r1bmi (ELSE=Copy) INTO Cwv1_bmi_score.
VARIABLE LABELS  Cwv1_bmi_score 'BMI score kg/m² (wave 1)'.
EXECUTE.


RECODE Cwv1_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Cwv1_obesity_bmi.
VARIABLE LABELS  Cwv1_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²)  at wave 1 (yes/no)'.
EXECUTE.


COMPUTE Cwv1_waist_bmi_sum=SUM(Cwv1_obesity_waist,Cwv1_obesity_bmi).
VARIABLE LABELS  Cwv1_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 1)'.
EXECUTE.


RECODE Cwv1_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Cwv1_obesity.
VARIABLE LABELS  Cwv1_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 1'.
EXECUTE.




# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables: measured in mm Hg
Systolic reading
time 1:qa003
time 2:qa007
time 3: qa011 
Diastolic reading
time 1: qa004
time 2:qa008
time 3: qa012
Pulse
time 1: qa005
time 2:qa009
time 3: qa013
Raw variables:
 - qa003 (BP 1 systolic), qa004 (BP 1 diastolic),qa007 (BP 2 systolic), qa008 (BP 2 diastolic), qa011  (BP 3 systolic), qa012 (BP 3 diastolic)
Self-reported hypertension: 
 - r1hibpe (rand data) (1=yes, 0= no) ->  r ever had high blood pressure
 - da007_1_ (charls data) (1=yes, 2=no) -> Have you been diagnosed with hypertension by a doctor?
Medication for hypertension (charls data): 
 - da011s1 (1) -> Take Chinese Traditional Medicine for hypertension
 - da011s2 (2) -> Take Western Mordern Medicine for hypertension
 - da011s3 (3) -> None of the Above for hypertension
To create a valid mean diastolic and systolic BP, I will calculate the mean of the 2nd and 3rd measurement
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Mean Diastolic BP (2nd and 3rd measures)
2. Mean Systolic BP  (2nd and 3rd measures)
3. Recode Diastolic BP
4. Recode Systolic BP
5. Sum of diastolic, systolic BP
6. Dichotomous variable of BP (normal/abnormal)



* BP level (systolic and diastolic)

RECODE qa003 qa004 qa007 qa008 qa011 qa012 (ELSE=Copy) INTO Cwv1_1systolic_bp Cwv1_1diastolic_bp 
Cwv1_2systolic_bp Cwv1_2diastolic_bp Cwv1_3systolic_bp Cwv1_3diastolic_bp.
VARIABLE LABELS  Cwv1_1systolic_bp 'Systolic blood pressure (BP) 1st measure (wave 1)' 
/Cwv1_1diastolic_bp 'Diastolic BP 1st measure (wave 1)' 
/Cwv1_2systolic_bp 'Systolic BP 2nd measure (wave 1)' 
/Cwv1_2diastolic_bp 'Diastolic BP 2nd measure (wave 1)' 
/Cwv1_3systolic_bp 'Systolic BP 3rd measure (wave 1)' 
/Cwv1_3diastolic_bp 'Diastolic BP 3rd measure (wave 1)'.
EXECUTE.

COMPUTE Cwv1_systolic_mean=MEAN(Cwv1_2systolic_bp,Cwv1_3systolic_bp).
VARIABLE LABELS  Cwv1_systolic_mean 'Mean systolic BP calculated by the 2nd and 3rd measures of systolic BP at time 2 and 3 (wave 1)'.
EXECUTE.

COMPUTE Cwv1_diastolic_mean=MEAN(Cwv1_2diastolic_bp,Cwv1_3diastolic_bp).
VARIABLE LABELS  Cwv1_diastolic_mean 'Mean diastolic BP calculated by the 2nd and 3rd measures of diastolic BP at time 2 and 3 (wave 1)'.
EXECUTE.


RECODE Cwv1_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Cwv1_systolic_bp.
VARIABLE LABELS  Cwv1_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130  (wave 1)'.
EXECUTE.

RECODE Cwv1_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Cwv1_diastolic_bp.
VARIABLE LABELS  Cwv1_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 1)'.
EXECUTE.


* Sum of systolic, diastolic BP and recode into 0-1 variable

COMPUTE Cwv1_bp_sum=SUM(Cwv1_systolic_bp,Cwv1_diastolic_bp).
VARIABLE LABELS  Cwv1_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 1)'.
EXECUTE.

RECODE Cwv1_bp_sum (0=0) (1 thru Highest=1) INTO Cwv1_bp.
VARIABLE LABELS  Cwv1_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 1'.
EXECUTE.




# Diabetes and Glycemia
Raw variables: 
 - newglu: Glucose (mg/dl)
 - newhba1c: Glycated Hemoglobin (%)
Self-reported diabetes
 - r1diabe: (rand data) (1=yes, 0= no) -> r ever had diabetes
 - da007_3_ (charls data) (1=yes, 2=no) -> Have you been diagnosed with diabetes or high blood sugar by a doctor?
 Medication for diabetes (charls data): 
 - da014s1 (1) -> Take Chinese Traditional Medicine for Diabetes
 - da014s2 (2) -> Take Western Morden Medicine for Diabetes
 - da014s3 (3) -> Taking Insulin Injections for Diabetes
 - da014s4 (4) -> None of the Above for Diabetes
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
According to CHARLS doc: We asked respondents to have fasted overnight, but we took blood even if they were not fasting and we noted their status,
which is a variable in the data. Over 92% of respondents who gave blood reported that they were fasting
Steps:
1. Recode Glucose ≥ 100 mg/dL 
2. Recode HbA1c ≥ 6.5% (48 mmol/mol)
3. Self-reported diabetes diagnosis
4. Sum of Glucose and self-reported diabetes diagnosis
5. Dichotomous variable of Glycemia (yes/no)


* FPG level

RECODE newglu (ELSE=Copy) INTO Cwv1_glucose_level.
VARIABLE LABELS  Cwv1_glucose_level 'Glucose level (mg/dL) at wave 1'.
EXECUTE.

RECODE Cwv1_glucose_level (Lowest thru 99.99=0) (100 thru Highest=1) INTO Cwv1_glucose.
VARIABLE LABELS  Cwv1_glucose 'Glucose (mg/dl): IDF criteria FPG ≥ 100 mg/dL (wave 1)'.
EXECUTE.


* HbA1c level  

RECODE newhba1c (ELSE=Copy) INTO Cwv1_HbA1c_level.
VARIABLE LABELS  Cwv1_HbA1c_level 'Hemoglobin A1c (HbA1c) level (%) at wave 1'.
EXECUTE.

RECODE Cwv1_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Cwv1_HbA1c.
VARIABLE LABELS  Cwv1_HbA1c 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 1)'.
EXECUTE.


* Self-reported diabetes 

RECODE r1diabe (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv1_diabetes_evr.
VARIABLE LABELS  Cwv1_diabetes_evr 'Ever had diabetes measured by Rand (wave 1)'.
EXECUTE.

RECODE da007_3_ (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv1_diabetes_diagnosed.
VARIABLE LABELS  Cwv1_diabetes_diagnosed 'Have you been diagnosed with diabetes by doctor measured by Charls (wave 1)'.
EXECUTE.

COMPUTE Cwv1_diabetes_report_sum=SUM(Cwv1_diabetes_evr,Cwv1_diabetes_diagnosed).
VARIABLE LABELS  Cwv1_diabetes_report_sum 'Sum of self-reported doctor diagnosed diabetes (wave 1)'.
EXECUTE.

RECODE Cwv1_diabetes_report_sum (0=0) (1 thru Highest=1) INTO Cwv1_diabetes_report.
VARIABLE LABELS  Cwv1_diabetes_report 'Self-reported doctor diagnosed diabetes (wave 1)'.
EXECUTE.


* Sum of FPG and self-reported diabetes diagnosis, and recode into 0-1 variable

COMPUTE Cwv1_glucose_diabetes_sum=SUM(Cwv1_glucose,Cwv1_diabetes_report).
VARIABLE LABELS  Cwv1_glucose_diabetes_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 1)'.
EXECUTE.

RECODE  Cwv1_glucose_diabetes_sum (0=0) (1 thru Highest=1) INTO Cwv1_glycemia.
VARIABLE LABELS  Cwv1_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 1)'.
EXECUTE.





# Wave 3 (2015)

# CRP 
Raw variable: bl_crp (measured in mg/l)
Normal level of CRP <= 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L [same measurement as ELSA]) see: http://unitslab.com/node/67
Steps: 
1. Recode bl_crp into a new CRP variable
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE bl_crp (ELSE=Copy) INTO Cwv3_crp_level.
VARIABLE LABELS  Cwv3_crp_level 'CRP level (ug/mL) without n/a (wave 3)'.
EXECUTE.

RECODE Cwv3_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Cwv3_crp.
VARIABLE LABELS  Cwv3_crp 'CRP level dichotomised into normal/high (normal CRP <= 3 ug/mL) (wave 3)'.
EXECUTE.





# HDL cholesterol
Raw variable: bl_hdl
Unit of measurment mg/dL
Self-reported dyslipidemia: 
 - r4dyslipe (rand data) (1=yes, 0= no) ->  r ever had dyslipidemia (indicates whether or not a doctor has told the respondent 
   they ever had dyslipidemia (elevation of low density lipoprotein, triglycerides, and total cholesterol, or a low high density lipoprotein level))
 - da007_w2_2_2_wv3 (charls data) (1=yes, 2=no) -> Have you been diagnosed with dyslipidemia by a doctor? 
Medication for dyslipidemial (charls data): 
 - da010_2_s1wv3 (1) -> Take Chinese Traditional Medicine for Dyslipidemia
 - da010_2_s2wv3 (2) -> Take Western Mordern Medicine for Dyslipidemia
 - da010_2_s3wv3 (3) -> Other Treatments for Dyslipidemia
 - da010_2_s4wv3 (4) -> None of the Above for Dyslipidemia
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
Steps:
1. Recode newhdl into HDL cholesterol level
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE bl_hdl (ELSE=Copy) INTO Cwv3_hdl_level.
VARIABLE LABELS Cwv3_hdl_level 'HDL cholesterol level (mg/dL) (wave 3)'.
EXECUTE.

DO IF  (C_sex = 0).
RECODE Cwv3_hdl_level (Lowest thru 39.99=1) (40 thru Highest=0) 
    INTO Cwv3_male_hdl.
END IF.
VARIABLE LABELS  Cwv3_male_hdl 'Male HDL cholesterol (wave 3): IDF criteria < 40 mg/dL'.
EXECUTE.

DO IF  (C_sex = 1).
RECODE Cwv3_hdl_level (Lowest thru 49.99=1) (50 thru Highest=0) 
    INTO Cwv3_female_hdl.
END IF.
VARIABLE LABELS Cwv3_female_hdl 'Female HDL cholesterol (wave 3): IDF criteria < 50 mg/dL'.
EXECUTE.



* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Cwv3_hdl_sum=SUM(Cwv3_male_hdl,Cwv3_female_hdl).
VARIABLE LABELS  Cwv3_hdl_sum 'Sum of male and female HDL cholesterol (wave 3)'.
EXECUTE.

RECODE Cwv3_hdl_sum (0=0) (1 thru Highest=1) INTO Cwv3_hdl_cholesterol.
VARIABLE LABELS  Cwv3_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 3)'.
EXECUTE.





# Abdominal obesity (waist circumference or BMI > 30 kg/m²) 
Raw variable: 
- r4bmi -> r body mass index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- wv4qm002 -> waist measurement
    Unit of measurement: cm
    IDFcriteria (ethnic group: South Asians -> Chinese)
          Abdominal obesity 
          Male ≥ 90 cm
          Female ≥ 80 cm
Steps:
Waist circumference
    1. Recode qm002 into waist circumference score without n/a
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode r1bmi into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)



RECODE wv4qm002 (ELSE=Copy) INTO Cwv3_waist.
VARIABLE LABELS  Cwv3_waist 'Waist circumference in cm (wave 3)'.
EXECUTE.

DO IF  (C_sex = 0).
RECODE Cwv3_waist (Lowest thru 89.99=0) (90.00 thru Highest=1) INTO Cwv3_malewaist_ao.
END IF.
VARIABLE LABELS  Cwv3_malewaist_ao 'Male Waist circumference (cm) (wave 3): IDF criteria Chinese ethnic group Abdominal Obesity'.
EXECUTE.

DO IF  (C_sex = 1).
RECODE Cwv3_waist (Lowest thru 79.99=0) (80.00 thru Highest=1) INTO Cwv3_femalewaist_ao.
END IF.
VARIABLE LABELS  Cwv3_femalewaist_ao 'Female Waist circumference (cm) (wave 3): IDF criteria Chinese ethnic group Abdominal Obesity'.
EXECUTE.


COMPUTE Cwv3_obesity_waist_sum=SUM(Cwv3_malewaist_ao,Cwv3_femalewaist_ao).
VARIABLE LABELS  Cwv3_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 3)'.
EXECUTE.

RECODE Cwv3_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Cwv3_obesity_waist.
VARIABLE LABELS  Cwv3_obesity_waist 'Abdominal obesity based on waist circumference at wave 3 (yes/no)'.
EXECUTE.



RECODE r4bmi (ELSE=Copy) INTO Cwv3_bmi_score.
VARIABLE LABELS  Cwv3_bmi_score 'BMI score kg/m² (wave 3)'.
EXECUTE.


RECODE Cwv3_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Cwv3_obesity_bmi.
VARIABLE LABELS  Cwv3_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 3 (yes/no)'.
EXECUTE.


COMPUTE Cwv3_waist_bmi_sum=SUM(Cwv3_obesity_waist,Cwv3_obesity_bmi).
VARIABLE LABELS  Cwv3_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 3)'.
EXECUTE.


RECODE Cwv3_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Cwv3_obesity.
VARIABLE LABELS  Cwv3_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 3'.
EXECUTE.






# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables: measured in mm Hg
Systolic reading
time 1:wv4qa003
time 2:wv4qa007
time 3: wv4qa011 
Diastolic reading
time 1: wv4qa004
time 2:wv4qa008
time 3: wv4qa012
Pulse
time 1: wv4qa005
time 2:wv4qa009
time 3: wv4qa013
Raw variables:
 - wv4qa003 (BP 1 systolic), wv4qa004 (BP 1 diastolic), wv4qa007 (BP 2 systolic), wv4qa008 (BP 2 diastolic), wv4qa011 (BP 3 systolic), wv4qa012 (BP 3 diastolic)
Self-reported hypertension: 
 - r4hibpe (rand data) (1=yes, 0= no) ->  r ever had high blood pressure
 - da007_w2_2_1_wv3 (charls data) (1=yes, 2=no) -> Have you been diagnosed with hypertension by a doctor?
Medication for hypertension (charls data): 
 - da011s1wv3 (1) -> Take Chinese Traditional Medicine for hypertension
 - da011s2wv3 (2) -> Take Western Mordern Medicine for hypertension
 - da011s3wv3 (3) -> None of the Above for hypertension
To create a valid mean diastolic and systolic BP, I will calculate the mean of the 2nd and 3rd measurement
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Mean Diastolic BP (2nd and 3rd measures)
2. Mean Systolic BP  (2nd and 3rd measures)
3. Recode Diastolic BP
4. Recode Systolic BP
5. Sum of diastolic, systolic BP
6. Dichotomous variable of BP (normal/abnormal)



* BP level (systolic and diastolic)

RECODE wv4qa003 wv4qa004 wv4qa007 wv4qa008 wv4qa011 wv4qa012 (ELSE=Copy) INTO Cwv3_1systolic_bp Cwv3_1diastolic_bp 
Cwv3_2systolic_bp Cwv3_2diastolic_bp Cwv3_3systolic_bp Cwv3_3diastolic_bp.
VARIABLE LABELS  Cwv3_1systolic_bp 'Systolic blood pressure (BP) 1st measure (wave 3)' 
/Cwv3_1diastolic_bp 'Diastolic BP 1st measure (wave 3)' 
/Cwv3_2systolic_bp 'Systolic BP 2nd measure (wave 3)' 
/Cwv3_2diastolic_bp 'Diastolic BP 2nd measure (wave 3)' 
/Cwv3_3systolic_bp 'Systolic BP 3rd measure (wave 3)' 
/Cwv3_3diastolic_bp 'Diastolic BP 3rd measure (wave 3)'.
EXECUTE.

COMPUTE Cwv3_systolic_mean=MEAN(Cwv3_2systolic_bp,Cwv3_3systolic_bp).
VARIABLE LABELS  Cwv3_systolic_mean 'Mean systolic BP calculated by the 2nd and 3rd measures of systolic BP at time 2 and 3 (wave 3)'.
EXECUTE.

COMPUTE Cwv3_diastolic_mean=MEAN(Cwv3_2diastolic_bp,Cwv3_3diastolic_bp).
VARIABLE LABELS  Cwv3_diastolic_mean 'Mean diastolic BP calculated by the 2nd and 3rd measures of diastolic BP at time 2 and 3 (wave 3)'.
EXECUTE.


RECODE Cwv3_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Cwv3_systolic_bp.
VARIABLE LABELS  Cwv3_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130  (wave 3)'.
EXECUTE.

RECODE Cwv3_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Cwv3_diastolic_bp.
VARIABLE LABELS  Cwv3_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 3)'.
EXECUTE.



* Sum of systolic, diastolic BP and recode into 0-1 variable

COMPUTE Cwv3_bp_sum=SUM(Cwv3_systolic_bp,Cwv3_diastolic_bp).
VARIABLE LABELS  Cwv3_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 3)'.
EXECUTE.

RECODE Cwv3_bp_sum (0=0) (1 thru Highest=1) INTO Cwv3_bp.
VARIABLE LABELS  Cwv3_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 3'.
EXECUTE.






# Diabetes and Glycemia
Raw variables: 
 - bl_glu: Glucose (mg/dl)
 - bl_hbalc: Glycated Hemoglobin (%)
Self-reported diabetes
 - r4diabe: (rand data) (1=yes, 0= no) -> r ever had diabetes
 - da007_w2_2_3_wv3 (charls data) (1=yes, 2=no) -> Have you been diagnosed with diabetes or high blood sugar by a doctor?
 Medication for diabetes (charls data): 
 - da014s1wv3 (1) -> Take Chinese Traditional Medicine for Diabetes
 - da014s2wv3 (2) -> Take Western Morden Medicine for Diabetes
 - da014s3wv3 (3) -> Taking Insulin Injections for Diabetes
 - da014s4wv3 (4) -> None of the Above for Diabetes
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
According to CHARLS doc: We asked respondents to have fasted overnight, but we took blood even if they were not fasting and we noted their status,
which is a variable in the data. Over 92% of respondents who gave blood reported that they were fasting
Steps:
1. Recode Glucose ≥ 100 mg/dL 
2. Recode HbA1c ≥ 6.5% (48 mmol/mol) 
3. Self-reported diabetes diagnosis
4. Sum of Glucose and self-reported diabetes diagnosis
5. Dichotomous variable of Glycemia (yes/no)


* FPG level

RECODE bl_glu (ELSE=Copy) INTO Cwv3_glucose_level.
VARIABLE LABELS  Cwv3_glucose_level 'Glucose level (mg/dL) at wave 3'.
EXECUTE.

RECODE Cwv3_glucose_level (Lowest thru 99.99=0) (100 thru Highest=1) INTO Cwv3_glucose.
VARIABLE LABELS  Cwv3_glucose 'Glucose (mg/dl): IDF criteria FPG ≥ 100 mg/dL (wave 3)'.
EXECUTE.


* HbA1c level 

RECODE bl_hbalc (ELSE=Copy) INTO Cwv3_HbA1c_level.
VARIABLE LABELS  Cwv3_HbA1c_level 'Hemoglobin A1c (HbA1c) level (%) at wave 3'.
EXECUTE.

RECODE Cwv3_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Cwv3_HbA1c.
VARIABLE LABELS  Cwv3_HbA1c 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 3)'.
EXECUTE.



* Self-reported diabetes 

RECODE r4diabe (0=0) (1=1) (ELSE=SYSMIS) INTO Cwv3_diabetes_evr.
VARIABLE LABELS  Cwv3_diabetes_evr 'Ever had diabetes measured by Rand (wave 3)'.
EXECUTE.

RECODE da007_w2_2_3_wv3 (2=0) (1=1) (ELSE=SYSMIS) INTO Cwv3_diabetes_diagnosed.
VARIABLE LABELS  Cwv3_diabetes_diagnosed 'Have you been diagnosed with diabetes by doctor measured by Charls (wave 3)'.
EXECUTE.

COMPUTE Cwv3_diabetes_report_sum=SUM(Cwv3_diabetes_evr,Cwv3_diabetes_diagnosed).
VARIABLE LABELS  Cwv3_diabetes_report_sum 'Sum of self-reported doctor diagnosed diabetes (wave 3)'.
EXECUTE.

RECODE Cwv3_diabetes_report_sum (0=0) (1 thru Highest=1) INTO Cwv3_diabetes_report.
VARIABLE LABELS  Cwv3_diabetes_report 'Self-reported doctor diagnosed diabetes (wave 3)'.
EXECUTE.


* Sum of FPG and self-reported diabetes diagnosis, and recode into 0-1 variable

COMPUTE Cwv3_glucose_diabetes_sum=SUM(Cwv3_glucose,Cwv3_diabetes_report).
VARIABLE LABELS  Cwv3_glucose_diabetes_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 3)'.
EXECUTE.

RECODE  Cwv3_glucose_diabetes_sum (0=0) (1 thru Highest=1) INTO Cwv3_glycemia.
VARIABLE LABELS  Cwv3_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 3)'.
EXECUTE.




# Grouping Predictors 

# Step 1: Individual cardiometabolic markers


# Step 2: depressive symptoms and individual cardiometabolic markers
4 groups based on the presence of depressive symptoms and individual cardiomeatbolic biomarkers



*** Wave 1 (baseline) grouping of cardiometabolic markers and depressive symptoms


# Waist obesity (waist) + depressive symptoms (depress)
Steps:
1. Cwv1_waist_depress_sum
2. Grouping based on the presence of waist cir obesity and depressive symptoms (N=no, Y=yes)
    Cwv1_Nwaist_Ndepress
    Cwv1_Nwaist_Ydepress
    Cwv1_Ywaist_Ndepress
    Cwv1_Ywaist_Ydepress
3. Cwv1_waist_depress_group


COMPUTE Cwv1_waist_depress_sum=SUM(Cwv1_obesity_waist,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_waist_depress_sum 'Sum of Waist Obesity and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_waist_depress_sum = 0) Cwv1_Nwaist_Ndepress=Cwv1_waist_depress_sum.
VARIABLE LABELS  Cwv1_Nwaist_Ndepress 'Group of healthy controls without waist obesity or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nwaist_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nwaist_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_obesity_waist = 1) Cwv1_Ywaist_Ndepress=Cwv1_obesity_waist.
VARIABLE LABELS  Cwv1_Ywaist_Ndepress 'Group of those with waist obesity only (wave 1)'.
EXECUTE.

IF  (Cwv1_waist_depress_sum = 2) Cwv1_Ywaist_Ydepress=Cwv1_waist_depress_sum.
VARIABLE LABELS  Cwv1_Ywaist_Ydepress 'Group of those with both waist obesity and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Nwaist_Ndepress = 0 AND MISSING(Cwv1_Nwaist_Ydepress) AND MISSING(Cwv1_Ywaist_Ndepress) AND MISSING(Cwv1_Ywaist_Ydepress)) .
   COMPUTE Cwv1_waist_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nwaist_Ndepress) AND Cwv1_Nwaist_Ydepress=1 AND MISSING(Cwv1_Ywaist_Ndepress) AND MISSING(Cwv1_Ywaist_Ydepress)) .
   COMPUTE Cwv1_waist_depress_group=1.
ELSE IF (MISSING(Cwv1_Nwaist_Ndepress) AND MISSING( Cwv1_Nwaist_Ydepress) AND Cwv1_Ywaist_Ndepress= 1 AND MISSING(Cwv1_Ywaist_Ydepress)).
   COMPUTE Cwv1_waist_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nwaist_Ndepress) AND Cwv1_Nwaist_Ydepress=1 AND Cwv1_Ywaist_Ndepress= 1 AND Cwv1_Ywaist_Ydepress=2)).
   COMPUTE Cwv1_waist_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_waist_depress_group 'Grouping for waist obesity and/or depressive symptoms (wave 1)'.
EXECUTE . 



# Diabetes: (diabet) + depressive symptoms (depress)
Steps:
1. Cwv1_diabet_depress_sum
2. Grouping based on the presence of diabetes and depressive symptoms (N=no, Y=yes)
   Cwv1_Ndiabet_Ndepress
   Cwv1_Ndiabet_Ydepress
   Cwv1_Ydiabet_Ndepress
   Cwv1_Ydiabet_Ydepress
3. Cwv1_diabet_depress_group

COMPUTE Cwv1_diabet_depress_sum=SUM(Cwv1_diabetes_report,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_diabet_depress_sum 'Sum of diabetes and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_diabet_depress_sum = 0) Cwv1_Ndiabet_Ndepress=Cwv1_diabet_depress_sum.
VARIABLE LABELS  Cwv1_Ndiabet_Ndepress 'Group of healthy controls without diabetes or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Ndiabet_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Ndiabet_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_diabetes_report = 1) Cwv1_Ydiabet_Ndepress=Cwv1_diabetes_report.
VARIABLE LABELS  Cwv1_Ydiabet_Ndepress 'Group of those with diebetes only (wave 1)'.
EXECUTE.

IF  (Cwv1_diabet_depress_sum = 2) Cwv1_Ydiabet_Ydepress=Cwv1_diabet_depress_sum.
VARIABLE LABELS  Cwv1_Ydiabet_Ydepress 'Group of those with both diabetes and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Ndiabet_Ndepress = 0 AND MISSING(Cwv1_Ndiabet_Ydepress) AND MISSING(Cwv1_Ydiabet_Ndepress) AND MISSING(Cwv1_Ydiabet_Ydepress)) .
   COMPUTE Cwv1_diabet_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Ndiabet_Ndepress) AND Cwv1_Ndiabet_Ydepress=1 AND MISSING(Cwv1_Ydiabet_Ndepress) AND MISSING(Cwv1_Ydiabet_Ydepress)) .
   COMPUTE Cwv1_diabet_depress_group=1.
ELSE IF (MISSING(Cwv1_Ndiabet_Ndepress) AND MISSING(Cwv1_Ndiabet_Ydepress) AND Cwv1_Ydiabet_Ndepress= 1 AND MISSING(Cwv1_Ydiabet_Ydepress)).
   COMPUTE Cwv1_diabet_depress_group=2.
ELSE IF ((MISSING(Cwv1_Ndiabet_Ndepress) AND Cwv1_Ndiabet_Ydepress=1 AND Cwv1_Ydiabet_Ndepress= 1 AND Cwv1_Ydiabet_Ydepress=2)).
   COMPUTE Cwv1_diabet_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_diabet_depress_group 'Grouping for diabetes and/or depressive symptoms (wave 1)'.
EXECUTE . 



# HbA1c: (hba1c) + depressive symptoms (depress)
Steps:
1. Cwv1_hba1c_depress_sum
2. Grouping based on the presence of hba1c and depressive symptoms (N=no, Y=yes)
   Cwv1_Nhba1c_Ndepress
   Cwv1_Nhba1c_Ydepress
   Cwv1_Yhba1c_Ndepress
   Cwv1_Yhba1c_Ydepress
3. Cwv1_hba1c_depress_group

COMPUTE Cwv1_hba1c_depress_sum=SUM(Cwv1_HbA1c,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_hba1c_depress_sum 'Sum of hba1c and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_hba1c_depress_sum = 0) Cwv1_Nhba1c_Ndepress=Cwv1_hba1c_depress_sum.
VARIABLE LABELS  Cwv1_Nhba1c_Ndepress 'Group of healthy controls without hba1c or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nhba1c_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nhba1c_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_HbA1c = 1) Cwv1_Yhba1c_Ndepress=Cwv1_HbA1c.
VARIABLE LABELS  Cwv1_Yhba1c_Ndepress 'Group of those with hba1c only (wave 1)'.
EXECUTE.

IF  (Cwv1_hba1c_depress_sum = 2) Cwv1_Yhba1c_Ydepress=Cwv1_hba1c_depress_sum.
VARIABLE LABELS  Cwv1_Yhba1c_Ydepress 'Group of those with both hba1c and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Nhba1c_Ndepress = 0 AND MISSING(Cwv1_Nhba1c_Ydepress) AND MISSING(Cwv1_Yhba1c_Ndepress) AND MISSING(Cwv1_Yhba1c_Ydepress)) .
   COMPUTE Cwv1_hba1c_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nhba1c_Ndepress) AND Cwv1_Nhba1c_Ydepress=1 AND MISSING(Cwv1_Yhba1c_Ndepress) AND MISSING(Cwv1_Yhba1c_Ydepress)) .
   COMPUTE Cwv1_hba1c_depress_group=1.
ELSE IF (MISSING(Cwv1_Nhba1c_Ndepress) AND MISSING(Cwv1_Nhba1c_Ydepress) AND Cwv1_Yhba1c_Ndepress= 1 AND MISSING(Cwv1_Yhba1c_Ydepress)).
   COMPUTE Cwv1_hba1c_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nhba1c_Ndepress) AND Cwv1_Nhba1c_Ydepress=1 AND Cwv1_Yhba1c_Ndepress= 1 AND Cwv1_Yhba1c_Ydepress=2)).
   COMPUTE Cwv1_hba1c_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_hba1c_depress_group 'Grouping for hba1c and/or depressive symptoms (wave 1)'.
EXECUTE . 





# HDL cholesterol (hdl) + depressive symptoms (depress)
Steps:
1. Cwv1_hdl_depress_sum
2. Grouping based on the presence of low HDL cholesterol and depressive symptoms (N=no, Y=yes)
   Cwv1_Nhdl_Ndepress
   Cwv1_Nhdl_Ydepress
   Cwv1_Yhdl_Ndepress
   Cwv1_Yhdl_Ydepress
3. Cwv1_hdl_depress_group

COMPUTE Cwv1_hdl_depress_sum=SUM(Cwv1_hdl_cholesterol,Cwv1_depressive_symptoms).
VARIABLE LABELS Cwv1_hdl_depress_sum 'Sum of HDL cholesterol and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_hdl_depress_sum = 0) Cwv1_Nhdl_Ndepress=Cwv1_hdl_depress_sum.
VARIABLE LABELS  Cwv1_Nhdl_Ndepress 'Group of healthy controls without low HDL cholesterol or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nhdl_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nhdl_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_hdl_cholesterol = 1) Cwv1_Yhdl_Ndepress=Cwv1_hdl_cholesterol.
VARIABLE LABELS  Cwv1_Yhdl_Ndepress 'Group of those with low HDL cholesterol only (wave 1)'.
EXECUTE.

IF  (Cwv1_hdl_depress_sum = 2) Cwv1_Yhdl_Ydepress=Cwv1_hdl_depress_sum.
VARIABLE LABELS  Cwv1_Yhdl_Ydepress 'Group of those with both low HDL cholesterol and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Nhdl_Ndepress = 0 AND MISSING(Cwv1_Nhdl_Ydepress) AND MISSING(Cwv1_Yhdl_Ndepress) AND MISSING(Cwv1_Yhdl_Ydepress)) .
   COMPUTE Cwv1_hdl_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nhdl_Ndepress) AND Cwv1_Nhdl_Ydepress=1 AND MISSING(Cwv1_Yhdl_Ndepress) AND MISSING(Cwv1_Yhdl_Ydepress)) .
   COMPUTE Cwv1_hdl_depress_group=1.
ELSE IF (MISSING(Cwv1_Nhdl_Ndepress) AND MISSING(Cwv1_Nhdl_Ydepress) AND Cwv1_Yhdl_Ndepress= 1 AND MISSING(Cwv1_Yhdl_Ydepress)).
   COMPUTE Cwv1_hdl_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nhdl_Ndepress) AND Cwv1_Nhdl_Ydepress=1 AND Cwv1_Yhdl_Ndepress= 1 AND Cwv1_Yhdl_Ydepress=2)).
   COMPUTE Cwv1_hdl_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_hdl_depress_group 'Grouping for low HDL cholesterol and/or depressive symptoms (wave 1)'.
EXECUTE . 



# Blood pressure (bp) + depressive symptoms (depress)
Steps:
1. Cwv1_bp_depress_sum
2. Grouping based on the presence of hypertension and depressive symptoms (N=no, Y=yes)
   Cwv1_Nbp_Ndepress
   Cwv1_Nbp_Ydepress
   Cwv1_Ybp_Ndepress
   Cwv1_Ybp_Ydepress
3. Cwv1_bp_depress_group

COMPUTE Cwv1_bp_depress_sum=SUM(Cwv1_bp,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_bp_depress_sum 'Sum of Blood pressure and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_bp_depress_sum = 0) Cwv1_Nbp_Ndepress=Cwv1_bp_depress_sum.
VARIABLE LABELS  Cwv1_Nbp_Ndepress 'Group of healthy controls without hypertension or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nbp_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nbp_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_bp = 1) Cwv1_Ybp_Ndepress=Cwv1_bp.
VARIABLE LABELS  Cwv1_Ybp_Ndepress 'Group of those with hypertension only (wave 1)'.
EXECUTE.

IF  (Cwv1_bp_depress_sum = 2) Cwv1_Ybp_Ydepress=Cwv1_bp_depress_sum.
VARIABLE LABELS  Cwv1_Ybp_Ydepress 'Group of those with both hypertension and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Nbp_Ndepress = 0 AND MISSING(Cwv1_Nbp_Ydepress) AND MISSING(Cwv1_Ybp_Ndepress) AND MISSING(Cwv1_Ybp_Ydepress)) .
   COMPUTE Cwv1_bp_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nbp_Ndepress) AND Cwv1_Nbp_Ydepress=1 AND MISSING(Cwv1_Ybp_Ndepress) AND MISSING(Cwv1_Ybp_Ydepress)) .
   COMPUTE Cwv1_bp_depress_group=1.
ELSE IF (MISSING(Cwv1_Nbp_Ndepress) AND MISSING( Cwv1_Nbp_Ydepress) AND Cwv1_Ybp_Ndepress= 1 AND MISSING(Cwv1_Ybp_Ydepress)).
   COMPUTE Cwv1_bp_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nbp_Ndepress) AND Cwv1_Nbp_Ydepress=1 AND Cwv1_Ybp_Ndepress= 1 AND Cwv1_Ybp_Ydepress=2)).
   COMPUTE Cwv1_bp_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_bp_depress_group 'Grouping for hypertension and/or depressive symptoms (wave 1)'.
EXECUTE . 




# Systolic blood pressure (sbp) + depressive symptoms (depress)
Steps:
1. Cwv1_sbp_depress_sum
2. Grouping based on the presence of SBP and depressive symptoms (N=no, Y=yes)
   Cwv1_Nsbp_Ndepress
   Cwv1_Nsbp_Ydepress
   Cwv1_Ysbp_Ndepress
   Cwv1_Ysbp_Ydepress
3. Cwv1_sbp_depress_group

COMPUTE Cwv1_sbp_depress_sum=SUM(Cwv1_systolic_bp,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_sbp_depress_sum 'Sum of SBP and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_sbp_depress_sum = 0) Cwv1_Nsbp_Ndepress=Cwv1_sbp_depress_sum.
VARIABLE LABELS  Cwv1_Nsbp_Ndepress 'Group of healthy controls without SBP or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nsbp_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nsbp_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_systolic_bp = 1) Cwv1_Ysbp_Ndepress=Cwv1_systolic_bp.
VARIABLE LABELS  Cwv1_Ysbp_Ndepress 'Group of those with SBP only (wave 1)'.
EXECUTE.

IF  (Cwv1_sbp_depress_sum = 2) Cwv1_Ysbp_Ydepress=Cwv1_sbp_depress_sum.
VARIABLE LABELS  Cwv1_Ysbp_Ydepress 'Group of those with both SBP and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Nsbp_Ndepress = 0 AND MISSING(Cwv1_Nsbp_Ydepress) AND MISSING(Cwv1_Ysbp_Ndepress) AND MISSING(Cwv1_Ysbp_Ydepress)) .
   COMPUTE Cwv1_sbp_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nsbp_Ndepress) AND Cwv1_Nsbp_Ydepress=1 AND MISSING(Cwv1_Ysbp_Ndepress) AND MISSING(Cwv1_Ysbp_Ydepress)) .
   COMPUTE Cwv1_sbp_depress_group=1.
ELSE IF (MISSING(Cwv1_Nsbp_Ndepress) AND MISSING( Cwv1_Nsbp_Ydepress) AND Cwv1_Ysbp_Ndepress= 1 AND MISSING(Cwv1_Ysbp_Ydepress)).
   COMPUTE Cwv1_sbp_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nsbp_Ndepress) AND Cwv1_Nsbp_Ydepress=1 AND Cwv1_Ysbp_Ndepress= 1 AND Cwv1_Ysbp_Ydepress=2)).
   COMPUTE Cwv1_sbp_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_sbp_depress_group 'Grouping for SBP and/or depressive symptoms (wave 1)'.
EXECUTE . 





# Diastolic blood pressure (dbp) + depressive symptoms (depress)
Steps:
1. Cwv1_dbp_depress_sum
2. Grouping based on the presence of DBP and depressive symptoms (N=no, Y=yes)
   Cwv1_Ndbp_Ndepress
   Cwv1_Ndbp_Ydepress
   Cwv1_Ydbp_Ndepress
   Cwv1_Ydbp_Ydepress
3. Cwv1_dbp_depress_group

COMPUTE Cwv1_dbp_depress_sum=SUM(Cwv1_diastolic_bp,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_dbp_depress_sum 'Sum of DBP and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_dbp_depress_sum = 0) Cwv1_Ndbp_Ndepress=Cwv1_dbp_depress_sum.
VARIABLE LABELS  Cwv1_Ndbp_Ndepress 'Group of healthy controls without DBP or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Ndbp_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Ndbp_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_diastolic_bp = 1) Cwv1_Ydbp_Ndepress=Cwv1_diastolic_bp.
VARIABLE LABELS  Cwv1_Ydbp_Ndepress 'Group of those with DBP only (wave 1)'.
EXECUTE.

IF  (Cwv1_dbp_depress_sum = 2) Cwv1_Ydbp_Ydepress=Cwv1_dbp_depress_sum.
VARIABLE LABELS  Cwv1_Ydbp_Ydepress 'Group of those with both DBP and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Ndbp_Ndepress = 0 AND MISSING(Cwv1_Ndbp_Ydepress) AND MISSING(Cwv1_Ydbp_Ndepress) AND MISSING(Cwv1_Ydbp_Ydepress)) .
   COMPUTE Cwv1_dbp_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Ndbp_Ndepress) AND Cwv1_Ndbp_Ydepress=1 AND MISSING(Cwv1_Ydbp_Ndepress) AND MISSING(Cwv1_Ydbp_Ydepress)) .
   COMPUTE Cwv1_dbp_depress_group=1.
ELSE IF (MISSING(Cwv1_Ndbp_Ndepress) AND MISSING( Cwv1_Ndbp_Ydepress) AND Cwv1_Ydbp_Ndepress= 1 AND MISSING(Cwv1_Ydbp_Ydepress)).
   COMPUTE Cwv1_dbp_depress_group=2.
ELSE IF ((MISSING(Cwv1_Ndbp_Ndepress) AND Cwv1_Ndbp_Ydepress=1 AND Cwv1_Ydbp_Ndepress= 1 AND Cwv1_Ydbp_Ydepress=2)).
   COMPUTE Cwv1_dbp_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_dbp_depress_group 'Grouping for DBP and/or depressive symptoms (wave 1)'.
EXECUTE . 



# CRP (crp) + depressive symptoms (depress)
Steps:
1. Cwv1_crp_depress_sum
2. Grouping based on the presence of high CRP and depressive symptoms (N=no, Y=yes)
   Cwv1_Ncrp_Ndepress
   Cwv1_Ncrp_Ydepress
   Cwv1_Ycrp_Ndepress
   Cwv1_Ycrp_Ydepress
3. Cwv1_crp_depress_group

COMPUTE Cwv1_crp_depress_sum=SUM(Cwv1_crp,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_crp_depress_sum 'Sum of CRP and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_crp_depress_sum = 0) Cwv1_Ncrp_Ndepress=Cwv1_crp_depress_sum.
VARIABLE LABELS  Cwv1_Ncrp_Ndepress 'Group of healthy controls without high CRP or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Ncrp_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Ncrp_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_crp = 1) Cwv1_Ycrp_Ndepress=Cwv1_crp.
VARIABLE LABELS  Cwv1_Ycrp_Ndepress 'Group of those with high CRP only (wave 1)'.
EXECUTE.

IF  (Cwv1_crp_depress_sum = 2) Cwv1_Ycrp_Ydepress=Cwv1_crp_depress_sum.
VARIABLE LABELS  Cwv1_Ycrp_Ydepress 'Group of those with both high CRP and depressive symptoms (wave 1)'.
EXECUTE.

DO IF (Cwv1_Ncrp_Ndepress = 0 AND MISSING(Cwv1_Ncrp_Ydepress) AND MISSING(Cwv1_Ycrp_Ndepress) AND MISSING(Cwv1_Ycrp_Ydepress)) .
   COMPUTE Cwv1_crp_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Ncrp_Ndepress) AND Cwv1_Ncrp_Ydepress=1 AND MISSING(Cwv1_Ycrp_Ndepress) AND MISSING(Cwv1_Ycrp_Ydepress)) .
   COMPUTE Cwv1_crp_depress_group=1.
ELSE IF (MISSING(Cwv1_Ncrp_Ndepress) AND MISSING(Cwv1_Ncrp_Ydepress) AND Cwv1_Ycrp_Ndepress= 1 AND MISSING(Cwv1_Ycrp_Ydepress)).
   COMPUTE Cwv1_crp_depress_group=2.
ELSE IF ((MISSING(Cwv1_Ncrp_Ndepress) AND Cwv1_Ncrp_Ydepress=1 AND Cwv1_Ycrp_Ndepress= 1 AND Cwv1_Ycrp_Ydepress=2)).
   COMPUTE Cwv1_crp_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_crp_depress_group 'Grouping for high CRP and/or depressive symptoms (wave 1)'.
EXECUTE . 




# Step 3: Depressive symptoms and/or Cardiometabolic Abnormality (Cwv1_cardio3) cluster of 
at least 3 cardiometabolic markers (Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp)
Use of SUM.3( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 3 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers



COMPUTE Cwv1_cardio3_sum=SUM.3(Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp).
VARIABLE LABELS  Cwv1_cardio3_sum 'Sum of Cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 1)'.
EXECUTE.


RECODE Cwv1_cardio3_sum (0 thru 2=0) (3 thru 7=1) INTO Cwv1_cardio3.
VARIABLE LABELS  Cwv1_cardio3 'Cardiometabolic Abnormality defined by the co-existance of at least 3 markers (wave 1)'.
EXECUTE.


COMPUTE Cwv1_ca3_depress_sum=SUM(Cwv1_cardio3,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_ca3_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_ca3_depress_sum = 0) Cwv1_Nca3_Ndepress=Cwv1_ca3_depress_sum.
VARIABLE LABELS  Cwv1_Nca3_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nca3_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nca3_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_cardio3 = 1) Cwv1_Yca3_Ndepress=Cwv1_cardio3.
VARIABLE LABELS  Cwv1_Yca3_Ndepress 'Group of those with cardiometabolic abnormality only (wave 1)'.
EXECUTE.

IF  (Cwv1_ca3_depress_sum = 2) Cwv1_Yca3_Ydepress=Cwv1_ca3_depress_sum.
VARIABLE LABELS  Cwv1_Yca3_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 1)'.
EXECUTE.


DO IF (Cwv1_Nca3_Ndepress = 0 AND MISSING(Cwv1_Nca3_Ydepress) AND MISSING(Cwv1_Yca3_Ndepress) AND MISSING(Cwv1_Yca3_Ydepress)) .
   COMPUTE Cwv1_ca3_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nca3_Ndepress) AND Cwv1_Nca3_Ydepress=1 AND MISSING(Cwv1_Yca3_Ndepress) AND MISSING(Cwv1_Yca3_Ydepress)) .
   COMPUTE Cwv1_ca3_depress_group=1.
ELSE IF (MISSING(Cwv1_Nca3_Ndepress) AND MISSING(Cwv1_Nca3_Ydepress) AND Cwv1_Yca3_Ndepress= 1 AND MISSING(Cwv1_Yca3_Ydepress)).
   COMPUTE Cwv1_ca3_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nca3_Ndepress) AND Cwv1_Nca3_Ydepress=1 AND Cwv1_Yca3_Ndepress= 1 AND Cwv1_Yca3_Ydepress=2)).
   COMPUTE Cwv1_ca3_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_ca3_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 1)'.
EXECUTE. 




# Step 4: Depressive symptoms and/or Cardiometabolic Abnormality (Cwv1_cardio4) cluster of 
at least 4 cardiometabolic markers (Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp)
Use of SUM.4( , ) function which means that it calculates sum only if 4 out of 7 markers have a valid value/answer (if more than 4 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers


COMPUTE Cwv1_cardio4_sum=SUM.4(Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp).
VARIABLE LABELS  Cwv1_cardio4_sum 'Sum of at least 4 cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 1)'.
EXECUTE.


RECODE Cwv1_cardio4_sum (0 thru 3=0) (4 thru 7=1) INTO Cwv1_cardio4.
VARIABLE LABELS  Cwv1_cardio4 'Cardiometabolic Abnormality defined by the co-existance of at least 4 markers (wave 1)'.
EXECUTE.


COMPUTE Cwv1_ca4_depress_sum=SUM(Cwv1_cardio4,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_ca4_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_ca4_depress_sum = 0) Cwv1_Nca4_Ndepress=Cwv1_ca4_depress_sum.
VARIABLE LABELS  Cwv1_Nca4_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nca4_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nca4_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_cardio4 = 1) Cwv1_Yca4_Ndepress=Cwv1_cardio4.
VARIABLE LABELS  Cwv1_Yca4_Ndepress 'Group of those with cardiometabolic abnormality only (wave 1)'.
EXECUTE.

IF  (Cwv1_ca4_depress_sum = 2) Cwv1_Yca4_Ydepress=Cwv1_ca4_depress_sum.
VARIABLE LABELS  Cwv1_Yca4_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 1)'.
EXECUTE.


DO IF (Cwv1_Nca4_Ndepress = 0 AND MISSING(Cwv1_Nca4_Ydepress) AND MISSING(Cwv1_Yca4_Ndepress) AND MISSING(Cwv1_Yca4_Ydepress)) .
   COMPUTE Cwv1_ca4_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nca4_Ndepress) AND Cwv1_Nca4_Ydepress=1 AND MISSING(Cwv1_Yca4_Ndepress) AND MISSING(Cwv1_Yca4_Ydepress)) .
   COMPUTE Cwv1_ca4_depress_group=1.
ELSE IF (MISSING(Cwv1_Nca4_Ndepress) AND MISSING(Cwv1_Nca4_Ydepress) AND Cwv1_Yca4_Ndepress= 1 AND MISSING(Cwv1_Yca4_Ydepress)).
   COMPUTE Cwv1_ca4_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nca4_Ndepress) AND Cwv1_Nca4_Ydepress=1 AND Cwv1_Yca4_Ndepress= 1 AND Cwv1_Yca4_Ydepress=2)).
   COMPUTE Cwv1_ca4_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_ca4_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 1)'.
EXECUTE. 





# Step 5: Depressive symptoms and/or Cardiometabolic Abnormality (Cwv1_cardio2) cluster of 
at least 2 cardiometabolic markers (Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp)
Use of SUM.2( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 2 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers



COMPUTE Cwv1_cardio2_sum=SUM.2(Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp).
VARIABLE LABELS  Cwv1_cardio2_sum 'Sum of Cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (wave 1)'.
EXECUTE.


RECODE Cwv1_cardio2_sum (0 thru 1=0) (2 thru 7=1) INTO Cwv1_cardio2.
VARIABLE LABELS  Cwv1_cardio2 'Cardiometabolic Abnormality defined by the co-existance of at least 2 markers (wave 1)'.
EXECUTE.


COMPUTE Cwv1_ca2_depress_sum=SUM(Cwv1_cardio2,Cwv1_depressive_symptoms).
VARIABLE LABELS  Cwv1_ca2_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 1)'.
EXECUTE.


IF  (Cwv1_ca2_depress_sum = 0) Cwv1_Nca2_Ndepress=Cwv1_ca2_depress_sum.
VARIABLE LABELS  Cwv1_Nca2_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 1)'.
EXECUTE.

IF  (Cwv1_depressive_symptoms = 1) Cwv1_Nca2_Ydepress=Cwv1_depressive_symptoms.
VARIABLE LABELS  Cwv1_Nca2_Ydepress 'Group of those with depressive symptoms only (wave 1)'.
EXECUTE.

IF  (Cwv1_cardio2 = 1) Cwv1_Yca2_Ndepress=Cwv1_cardio2.
VARIABLE LABELS  Cwv1_Yca2_Ndepress 'Group of those with cardiometabolic abnormality only (wave 1)'.
EXECUTE.

IF  (Cwv1_ca2_depress_sum = 2) Cwv1_Yca2_Ydepress=Cwv1_ca2_depress_sum.
VARIABLE LABELS  Cwv1_Yca2_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 1)'.
EXECUTE.


DO IF (Cwv1_Nca2_Ndepress = 0 AND MISSING(Cwv1_Nca2_Ydepress) AND MISSING(Cwv1_Yca2_Ndepress) AND MISSING(Cwv1_Yca2_Ydepress)) .
   COMPUTE Cwv1_ca2_depress_group = 0 .
ELSE IF (MISSING(Cwv1_Nca2_Ndepress) AND Cwv1_Nca2_Ydepress=1 AND MISSING(Cwv1_Yca2_Ndepress) AND MISSING(Cwv1_Yca2_Ydepress)) .
   COMPUTE Cwv1_ca2_depress_group=1.
ELSE IF (MISSING(Cwv1_Nca2_Ndepress) AND MISSING(Cwv1_Nca2_Ydepress) AND Cwv1_Yca2_Ndepress= 1 AND MISSING(Cwv1_Yca2_Ydepress)).
   COMPUTE Cwv1_ca2_depress_group=2.
ELSE IF ((MISSING(Cwv1_Nca2_Ndepress) AND Cwv1_Nca2_Ydepress=1 AND Cwv1_Yca2_Ndepress= 1 AND Cwv1_Yca2_Ydepress=2)).
   COMPUTE Cwv1_ca2_depress_group=3.
END IF .
VARIABLE LABELS  Cwv1_ca2_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 1)'.
EXECUTE. 





# Step 6: Composite measure of cardiometabolic abnormalities (Cwv1_cardio_number) of cardiometabolic markers
(Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp)
Use of SUM.1( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 1 value are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited 0,1,2,3,4+
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any cardiomeatbolic markers
1 -> Those with one CA
2 -> Those with two CA
3 -> Those with three CA
4 -> Those with four ore more CA

COMPUTE Cwv1_cardio_number_sum=SUM.1(Cwv1_obesity_waist,Cwv1_hdl_cholesterol,Cwv1_systolic_bp,Cwv1_diastolic_bp,Cwv1_diabetes_report,Cwv1_HbA1c,Cwv1_crp).
VARIABLE LABELS  Cwv1_cardio_number_sum 'Sum of cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (cont) (wave 1)'.
EXECUTE.


RECODE Cwv1_cardio_number_sum (0=0) (1=1) (2=2) (3=3) (4 thru 7=4) INTO Cwv1_cardio_number.
VARIABLE LABELS  Cwv1_cardio_number 'Composite measure of cardiometabolic abnormality defined by the number of CA markers (0,1,2,3,4+) (wave 1)'.
EXECUTE.



----------------------------------------



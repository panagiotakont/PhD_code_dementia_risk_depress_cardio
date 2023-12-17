* Encoding: UTF-8.

# PhD Project: The role of depressive symptoms and cardiometabolic risk factors in the prediction of dementia: a cross-country comparison in England, the United States and China
# Data Curation
# ELSA: English Longitudinal Study of Ageing
Baseline: Wave 2 (2004) nurse data (include blood measures and biomarkers)
Follow-up: Wave 3 (2006), Wave 4 (2008), Wave 5 (2010), Wave 6 (2012), Wave7 (2014), Wave 8 (2016), Wave 9 (2018)


# Participant ID -> idauniq
(keep the same name to merge with other datasets)

# Merge Files/Variable
# spss 25
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


# Merging datasets
All merged in "elsa_data2020", which is based on "wave_2_nurse_data_v2" (7666 rows the initial sample)
1. Merging wave_2_nurse_data_v2 products with the rest wave 2 datasets:
    - wave_2_core_data_v4
    - wave_2_derived_variables
    - wave_2_financial_derived_variables
    - wave_2_ifs_derived_variables
    - wave_2_mortgage_data
    - wave_2_pension_grid_v3
    - wave_2_pension_wealth
    - wave_2_ryff_data
    - elsa_eol_w2_archive_v1
2. Merging with h_elsa (this is the harmonised datset from G2G and includes waves 2-7)
3. Merging wave 3-9 datasets after recoding the variables of interest



SORT CASES BY idauniq.
DATASET ACTIVATE DataSet6.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet6'
  /RENAME (idahhw2 idaindw2 = d0 d1) 
  /BY idauniq
  /DROP= d0 d1.
EXECUTE.


SORT CASES BY idauniq.
DATASET ACTIVATE DataSet7.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet7'
  /RENAME (w2sic92 w2soc2000 w2nssec3 w2nssec5 w2nssec8 w2sic92mis w2soc2000mis w2sec w2sic w2soc = 
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9) 
  /BY idauniq
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9.
EXECUTE.


SORT CASES BY idauniq.
DATASET ACTIVATE DataSet8.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet8'
  /RENAME (futype idahhw2 = d0 d1) 
  /BY idauniq
  /DROP= d0 d1.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet9.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet9'
  /RENAME (bueq coupid fuid futype intdatm intdaty couple persno perid cpid sex idahhw2 indobyr = 
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12) 
  /BY idauniq
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet10.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /RENAME (hooutm = d0) 
  /BY idauniq
  /DROP= d0.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet11.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet11'
  /RENAME (wpfsapc wpcony wpacat wpmcaf wpyca wppwr wppyr wplma wpacob wpacoc wpidre wpidru wpidrl 
    wpidrr wpind wpide wpidu wpidl wpidr wpincd wpasale wpasalu wpasall wpasalr wppeae wppeau wppeal 
    wppear wppenb wpyye wpyyu wpyyl wpyyr wpwwye wpwwyu wpwwyl wpwwyr wpacon wppstr wprec wpsps wpcons 
    wpanyc wpfsav wpmmin wperc wpecna wpecon wpefs wpeper wpptop wpyfe wpyfu wpyfl wpyfr wpwwfe wpwwfu 
    wpwwfl wpwwfr wpsrul wplups wplms wpfinf wptakp wpycat wptkp wpdespc wpdsp wpasal wppsal wpptp 
    wpinf wpnra wpera wpcos wptax wpwtx wpdps wppdes wpdpsn wpdsnb wpdsnc wpmc wpmca wpmfrc wpperc 
    wpyme wpymu wpyml wpymr wpwwme wpwwmu wpwwml wpwwmr wpbtha wpady wpybs wpyoe wpyou wpyol wpyor 
    wpwwoe wpwwou wpwwol wpwwor wpkpc wpyfra wpfras wpbthp wplftm1 wplftp1 wplftm2 wppete wppetu wppetl 
    wppetr wpkp wpmsc wpauc wpfruc wpper wpmuc wpacoa wppfe wppfu wppfl wppfr wppfva wpapfe wpapfu 
    wpapfl wpapfr wpapf wplupa wplue wpluu wplul wplur idahhw2 idaindw2 wpfsap wpyaer wppay wppwp 
    wplump wprgh wprghb wprghx wpplph wpplp wpywe wpywu wpywl wpywr wpwwwe wpwwwu wpwwwl wpwwwr wpds 
    wpde wpoars = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 
    d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 
    d49 d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 
    d74 d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 
    d99 d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 d116 d117 d118 
    d119 d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 d130 d131 d132 d133 d134 d135 d136 d137 d138 
    d139 d140 d141 d142 d143 d144 d145 d146 d147 d148 d149 d150 d151 d152 d153 d154 d155 d156 d157 d158 
    d159 d160) 
  /BY idauniq
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 
    d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 d49 
    d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 d74 
    d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99 
    d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 d116 d117 d118 d119 
    d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 d130 d131 d132 d133 d134 d135 d136 d137 d138 d139 
    d140 d141 d142 d143 d144 d145 d146 d147 d148 d149 d150 d151 d152 d153 d154 d155 d156 d157 d158 d159 
    d160.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet12.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet12'
  /BY idauniq.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet13.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet13'
  /BY idauniq.
EXECUTE.

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet14.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet14'
  /BY idauniq.
EXECUTE.


SORT CASES BY idauniq.
DATASET ACTIVATE DataSet16.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet16'
  /BY idauniq.
EXECUTE.

# Merge wave 9: merging wave 9 nurse data and wave 9 core dataset

DATASET ACTIVATE DataSet4.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet6.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet4.
MATCH FILES /FILE=*
  /TABLE='DataSet6'
  /BY idauniq.
EXECUTE.



DATASET ACTIVATE DataSet4.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet5.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet4.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /BY idauniq.
EXECUTE.




# Socioeconomic variables

# Sex
DhSex from wave_2_core_data.

RECODE DhSex (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=0) (2=1) INTO E_sex.
VARIABLE LABELS  E_sex 'Sex male (0) female (1)'.
EXECUTE.

# Age
Age is a continous variable but collapsed the individuals > 90 and gives value of 99.  
1. Recode into E_age to exclude missing data

RECODE dhager (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=Copy) INTO E_age.
VARIABLE LABELS  E_age 'Age continuous collapsed the individuals > 90 years old given value 99'.
EXECUTE.



# Education 
Raw variables: 4 variables related to education level
1. w2edqual -> Highest educational qualification obtained
from wave_2_derived variables
Values: 
       -9 to -1 = N/As
      1= NVQ4/NVQ5 Degree or equivalent
      2 = Higher education below degree
      3 = NVQ3/GCE A Level equivalent
      4 = NVQ2/GCE O Level equivalent
      5 = NVQ1/CCE other grade equivalent
      6 = Foreign /other
      7 = No qualification
2. raeduc_e -> r level of education (categorical) 
   Values: 
      0= No qualification
      1= Lt high school
      3 = high school graduate
      4 = Some college
      5 = College and above
3. raeducl (three-tier harmonised scale, according to the 1997 International Standard Classification of Education (ISCED) codes)
   Values:
      1 = Less than lower secondary
      2 = upper secondary & vocational training
      3 = tertiary 
Recode 3 education-related variables:
Education level (3 levels) according to thel Highest Education Qualification obtained by ELSA wv2
        Recode w2edqual into E_eduaction
Respondents are assigned a code of 
      1 = Lt High school / No qualification (contains values 6 = "Foreign /other" and 7 = "No qualification") 
      2 = High school or college (contains values 3 = "NVQ3/GCE A Level equivalent", 4 = "NVQ2/GCE O Level equivalent" and 5 = "NVQ1/CCE other grade equivalent")
      3 = Higher education (contains values 1 = "NVQ4/NVQ5 Degree or equivalent" and 2 = "Higher education below degree")



RECODE w2edqual (-9=SYSMIS) (-8=SYSMIS) (-6=SYSMIS) (-1=SYSMIS) (6 thru 7=1) (3 thru 5=2) (1 thru 2=3) INTO E_eduaction.
VARIABLE LABELS  E_eduaction 'Education categorised into 3 levels from low to high (wave 2)'.
EXECUTE.



# Marital Status
Raw variables:
1. marstat (categ) -> marital status - couple1 combined with dimar
         1 = married
         2 = cohabiting
         3 = single, never married
         4 = widowed
         5 = divorced
         6 = seperated
 * No missing data        
2. r2mstat (categ) r marital status with partnership filled
    Values:
         1 = married
         2 = married, spouse absent
         3 = partnered 
         4 = seperated
         5 = divorced
         7 = widowed
         8 = never married
* 1 missing data
3. r2mstath (categ) r marital status
    Values:
         1 = married
         2 = married, spouse absent
         3 = civil partner
         4 = seperated
         5 = divorced
         7 = widowed
         8 = never married
* 1 missing data
Recode "marstat" into E_maritalstatus_4cat (4-level categorical variable harmonised to HRS and CHARLS)
   Values: Recode into
      1 = Married/Partenered (1,2)
      2 = Never married (3)
      3 = Seperated/Divorced (5,6)
      4 = Widowed (4)


RECODE marstat (1=1) (2=1) (3=2) (4=4) (5=3) (6=3) INTO E_maritalstatus_4cat.
VARIABLE LABELS  E_maritalstatus_4cat 'Marital Status classified into 4 categories (wave 2)'.
EXECUTE.






# Wealth (nonpension household net wealth)
Raw variable: 
nettotw_bu_s -> BU total net (non-pension) wealth - summary var (from wave 2 financial_derived_variables)
ELSA financial variables are measured in nominal pounds
Steps: 
   1. Recode "nettotw_bu_s" into a variable of Total non-pension household wealth minus debt excluding pension savings
total household wealth - (household debt + pension savings)
   2. Compute quintiles (1/5)
      According to the percentiles of frequencies (below):
   Output of Statistics
               N	Valid	7561
               Missing	105
               Percentiles	
               20	-> 65547.6000
               40	-> 159230.8000
               60	-> 	236310.0000
               80	-> 374600.6000
               100	-> 9319227.0000  
   3. Recode into avariable of welthe according to the 5 quintiles


RECODE nettotw_bu_s (-995.00=SYSMIS) (-998.00=SYSMIS) (-999.00=SYSMIS) (ELSE=Copy) INTO E_totalwealth.
VARIABLE LABELS  E_totalwealth 'Total wealth minus pension savings minus debt (wave 2)'.
EXECUTE.

  
  FREQUENCIES VARIABLES=E_totalwealth
  /PERCENTILES=20.0 40.0 60.0 80.0 100.0 
  /ORDER=ANALYSIS.

RECODE E_totalwealth (Lowest thru 65547.6000=1) (65547.6001 thru 159230.8000=2) 
    (159230.8001 thru 236310.0000=3) (236310.0001 thru 374600.6000=4) (374600.6001 thru Highest=5) INTO E_wealthquintiles.
VARIABLE LABELS  E_wealthquintiles 'Quintiles of total wealth net: Total household net wealth minus pension savings minus household debt (wave 2)'.
EXECUTE.



# Lifestyle variables

# Smoking wave 2
Raw variables: 
elsa original data
1. smoker -> whether current smoker
Values: 
      0= not a current smoker
      1= current smoker
2. smokerstat -> smoker status (past or present)
Values: 
      0= never smoked
      1= ex smoker occassional
      2= ex smoker regular
      3= ex smoker DK freq
      4= current smoker
Rand data
3. r2smokev -> R smoke ever (0-1)  
4. r2smoken -> R smokes now (0-1)
5. r2smokef -> R # cigarettes/day (cont)
Recode "smokerstat" into smoking status with 3 levels (3-level categorical variable harmonised to HRS and CHARLS): E_smoking_3cat
          0= never smoker (0)
          1= former smoker (1,2,3)
          2= current smoker (4)
    

RECODE smokerstat (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (0=0) (1=1) (2=1) (3=1) (4=2) INTO E_smoking_3cat.
VARIABLE LABELS  E_smoking_3cat 'Smoking Status with 3 levels (wave 2)'.
EXECUTE.




# Smoking wave 6
Raw variables: 
elsa harmonised data
Rand data
1. r6smokev -> R smoke ever (0-1)  
2. r6smoken -> R smokes now (0-1)
3. r6smokef -> R # cigarettes/day (cont)
Recode "r6smokev" and "r6smoken" into smoking status with 3 levels (3-level categorical variable harmonised to HRS and CHARLS): Ewv6_smoking_3cat       
        if r6smokev 0 and r6smoken 0 -> never smoker (0)
        if r6smokev 1 and r6smoken 0 -> former smoker (1)
        if r6smokev 1 and r6smoken 1 -> current smoker (2)
    

RECODE r6smoken (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv6_smoking_2cat.
VARIABLE LABELS  Ewv6_smoking_2cat 'Smoking Status with 2 levels (wave 6)'.
EXECUTE.


DO IF (r6smokev  = 0 AND (r6smoken = 0)).
   COMPUTE Ewv6_smoking_3cat = 0.
ELSE IF (r6smokev  = 1 AND (r6smoken = 0)).
   COMPUTE Ewv6_smoking_3cat= 1.
ELSE IF (r6smokev = 1 AND (r6smoken = 1)).
   COMPUTE Ewv6_smoking_3cat= 2.
END IF .
VARIABLE LABELS Ewv6_smoking_3cat 'Smoking Status with 3 levels (wave 6)'.
EXECUTE.  




# Physical activity wave 2
Raw variable:
1. palevel -> (D) Physical activity summary
Values: 
      0= sedentary
      1= low
      2= moderate
      3= high
2. HeActa ->  Frequency does vigorous sports or activities
3. HeActb -> Frequency does moderate sports or activities
4. HeActc -> Frequency does mild sports or activities
Values: 
      1= more than once a week
      2= once a week
      3= one to three times a month
      4= hardly ever or never
5. r2vgactx_e -> R Freq vigorous phys activ
6. r2mdactx_e -> R Freq moderate phys activ
7. r2ltactx_e -> R Freq light phys activ
Values: 
      1= > 1 per week
      2= 1 week
      3= 1-3 per month
      4= hardly ever or never
Steps:
1. Recode "palevel" into 4 different levels of physical activity status -> "E_physicalactivity" (Harmonised with HRS and CHARLS)
       1= high (3)
       2= moderate (2)
       3= low (1)
       4= sedentary (0)
2. Recode HeActa (vigorous), HeActb (moderate), HeActc (light) into E_physicalactivity_vigorous E_physicalactivity_moderate E_physicalactivity_light 
        1= more than once a week -> high (1)
        2= once a week -> moderate (2)
        3= one to three times a month -> low (3)
        4= hardly ever or never -> sedentary (4)
3. Recode E_physicalactivity_vigorous E_physicalactivity_moderate E_physicalactivity_light into "E_physicalactivity_level"       
        if vigorous 1 or moderate 1 or light 1 -> high (1)
        if vigorous 2 or  moderate 2 or light 2 -> moderate (2)
        if vigorous 3 or moderate 3 or light 3 -> low (3)
        if vigorous 4 or moderate 4 or light 4 -> sedentary (4)
 


RECODE palevel (0=4) (1=3) (2=2) (3=1) (-8=SYSMIS) (-6=SYSMIS) (-1=SYSMIS) INTO E_physicalactivity.
VARIABLE LABELS  E_physicalactivity 'Physical Activity Status with 4 levels (wave 2)'.
EXECUTE.



RECODE HeActa HeActb HeActc (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=2) (3=3) (4=4) INTO 
E_physicalactivity_vigorous E_physicalactivity_moderate E_physicalactivity_light.
VARIABLE LABELS  E_physicalactivity_vigorous 'Vigorous Physical Activity' /E_physicalactivity_moderate 'Moderate Physical Activity' /E_physicalactivity_light 'Light Physical Activity'.
EXECUTE.

DO IF (E_physicalactivity_vigorous = 1 OR (E_physicalactivity_moderate = 1) OR (E_physicalactivity_light = 1)).
   COMPUTE E_physicalactivity_level = 1.
ELSE IF (E_physicalactivity_vigorous = 2 OR (E_physicalactivity_moderate = 2) OR (E_physicalactivity_light = 2)).
   COMPUTE E_physicalactivity_level = 2.
ELSE IF (E_physicalactivity_vigorous = 3 OR (E_physicalactivity_moderate = 3) OR (E_physicalactivity_light = 3)).
   COMPUTE E_physicalactivity_level = 3.
ELSE IF (E_physicalactivity_vigorous = 4 OR (E_physicalactivity_moderate = 4) OR (E_physicalactivity_light = 4)).
   COMPUTE E_physicalactivity_level = 4.
END IF .
VARIABLE LABELS E_physicalactivity_level 'Physical Activity level with 4 levels derived from frequency (vigorous/moderate/light) (wave 2)'.
EXECUTE.  
          


# Physical activity wave 6
Raw variable:
elsa harmonised data
Rand data
1. r6vgactx_e -> R Freq vigorous phys activ
2. r6mdactx_e -> R Freq moderate phys activ
3. r6ltactx_e -> R Freq light phys activ
Values: 
      2= > 1 per week
      3= 1 week
      4= 1-3 per month
      5= hardly ever or never
Steps:
1. Recode r6vgactx_e  (vigorous), r6mdactx_e (moderate), r6ltactx_e (light) 
    into Ewv6_physicalactivity_vigorous Ewv6_physicalactivity_moderate Ewv6_physicalactivity_light 
       2->1= more than once a week
       3->2= once a week
       4->3= one to three times a month
       5->4= hardly ever or never
        ELSE (which are missing data)=0
2. Recode Ewv6_physicalactivity_vigorous Ewv6_physicalactivity_moderate Ewv6_physicalactivity_light into "Ewv6_physicalactivity"       
        compute Ewv6_physicalactivity = Ewv6_physicalactivity_vigorous
        if Ewv6_physicalactivity_moderate > max then max = Ewv6_physicalactivity_moderate
        if Ewv6_physicalactivity_light > max then max = Ewv6_physicalactivity_light
3. Turn 0 to missing values
 


RECODE r6vgactx_e r6mdactx_e r6ltactx_e (2=1) (3=2) (4=3) (5=4) (ELSE=0) INTO 
Ewv6_physicalactivity_vigorous Ewv6_physicalactivity_moderate Ewv6_physicalactivity_light.
VARIABLE LABELS  Ewv6_physicalactivity_vigorous 'Vigorous Physical Activity' /Ewv6_physicalactivity_moderate 'Moderate Physical Activity' /Ewv6_physicalactivity_light 'Light Physical Activity'.
EXECUTE.



COMPUTE Ewv6_physicalactivity=Ewv6_physicalactivity_vigorous.
DO IF (Ewv6_physicalactivity_moderate > Ewv6_physicalactivity).
    COMPUTE Ewv6_physicalactivity=Ewv6_physicalactivity_moderate.
ELSE IF (Ewv6_physicalactivity_light > Ewv6_physicalactivity).
    COMPUTE Ewv6_physicalactivity=Ewv6_physicalactivity_light.
END IF.
VARIABLE LABELS Ewv6_physicalactivity 'Physical Activity with 4 levels (wave 6)'.
EXECUTE.


RECODE Ewv6_physicalactivity_vigorous Ewv6_physicalactivity_moderate Ewv6_physicalactivity_light (1=1) (2=2) (3=3) (4=4) (0=SYSMIS) INTO 
Ewv6_physicalactivity_vigorous Ewv6_physicalactivity_moderate Ewv6_physicalactivity_light.
EXECUTE.


RECODE Ewv6_physicalactivity (1=1) (2=2) (3=3) (4=4) (0=SYSMIS) INTO Ewv6_physicalactivity.
EXECUTE.




# Alcohol drinking wave 2
Raw variables: 
1. scako -> How often respondent has had an alcoholic drink during the last 12 months
Values: 
      1= almost every day
      2= 5 or 6 days a week
      3= 3 or 4 days a week
      4= once or twice a week
      5= once or twice a month
      6= 1 every couple of months
      7= 1 or 2 a year
      8= not at all the last12 months
* 810 missing data
2. r2drink -> R ever drinks any alcohol (0-1)
3. r2drinkd_e -> R # days/week drinks (cont) (0-7 days of the week)
* 930 missing data
4. r2drinkn_e -> R # drinks/day (cont)
* 1116 missing data
Steps:
1. Recode r2drinkd_e into "E_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1)
         2= twice/three times a week (2,3)
         3= four to six times a week (4,5,6)
         4= daily or more (7)
2.  Recode "E_alcohol_freq" into alcohol consumption status "E_alcohol_status_rand"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2)
         3= frequent drinker (3+ days per week) (3,4)
3.  Recode "scako" into alcohol consumption status "E_alcohol_8cat"
          1= almost every day
          2= 5 or 6 days a week
          3= 3 or 4 days a week
          4= once or twice a week
          5= once or twice a month
          6= 1 every couple of months
          7= 1 or 2 a year
          8= not at all the last12 months        
4.  Recode "scako" into alcohol consumption status "E_alcohol_status"
         1= abstainer (0 days - doesnt drink) (8)
         2= infrequent drinker (1 or 2 days per week) (4,5,6,7)
         3= frequent drinker (3+ days per week) (1,2,3)
         


RECODE r2drinkd_e (0=0) (1=1) (2=2) (3=2) (4=3) (5=3) (6=3) (7=4) INTO E_alcohol_freq.
VARIABLE LABELS  E_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 2)'.
EXECUTE.

RECODE E_alcohol_freq (0=1) (1=2) (2=2) (3=3) (4=3) INTO E_alcohol_status_rand.
VARIABLE LABELS  E_alcohol_status_rand 'Alcohol consumption status by Rand (wave 2)'.
EXECUTE.

RECODE scako (-9=SYSMIS) (-1=SYSMIS) (ELSE=Copy) INTO E_alcohol_8cat.
VARIABLE LABELS  E_alcohol_8cat 'Frequency of alcohol consumption 8 categories (wave 2)'.
EXECUTE.

RECODE E_alcohol_8cat (1=3) (2=3) (3=3) (4=2) (5=2) (6=2) (7=2) (8=1) INTO E_alcohol_status.
VARIABLE LABELS  E_alcohol_status 'Alcohol consumption status (wave 2)'.
EXECUTE.




# Alcohol drinking wave 6
Raw variable:
elsa harmonised data
Rand data
1. r6drink -> R ever drinks any alcohol (0-1)
2. r6drinkd_e -> R # days/week drinks (cont) (0-7 days of the week)
3. r6drinkn_e -> R # drinks/day (cont)
Steps:
1. Recode r6drinkd_e into "Ewv6_alcohol_freq" -> 5 different levels (0-4) of frequency of alcohol consumtion (# days/week drinks) 
         0 = None or does not drink (0)
         1= less than once per week/once a week (1)
         2= twice/three times a week (2,3)
         3= four to six times a week (4,5,6)
         4= daily or more (7)
2.  Recode "Ewv6_alcohol_freq" into alcohol consumption status "Ewv6_alcohol_status"
         1= abstainer (0 days - doesnt drink) (0)
         2= infrequent drinker (1 or 2 days per week) (1,2)
         3= frequent drinker (3+ days per week) (3,4)



RECODE r6drinkd_e (0=0) (1=1) (2=2) (3=2) (4=3) (5=3) (6=3) (7=4) INTO Ewv6_alcohol_freq.
VARIABLE LABELS  Ewv6_alcohol_freq 'Frequency of alcohol consumption # days/week drinks (wave 6)'.
EXECUTE.

RECODE Ewv6_alcohol_freq (0=1) (1=2) (2=2) (3=3) (4=3) INTO Ewv6_alcohol_status.
VARIABLE LABELS  Ewv6_alcohol_status 'Alcohol consumption status (wave 6)'.
EXECUTE.







# Health variables wave 2

# Cardiovascular diseases-CVD wave 2
Raw variables: 
(6 CVD-related items except blood pressure and diabetes/high blood sugar)
hediman -> (D) Ever reported angina (diagnosed)
hedimmi ->  (D) Ever reported myocardial infarction (diagnosed)
hedimhf -> (D) Ever reported congestive heart failure (diagnosed)
hedimhm -> (D) Ever reported heart murmur (diagnosed)
hedimar -> (D) Ever reported arrhythmia (diagnosed)
hedimst -> (D) Ever reported stroke (diagnosed)
Rand variables:
1. r2hearte -> r ever had heart problems
2. r2stroke -> r ever had stroke
Steps:
1. Recode the 6 cvd diseases: angina, congestive heart failure, myocardial infaction, heart murmur, arrhythmia and stroke (without N/As) 
2. Sum of CVDs
3. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)
4. Recode r2hearte and r2stroke
5. Sum of CVDs
6. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)


RECODE hediman hedimmi hedimhf hedimhm hedimar hedimst (-3=SYSMIS) (-2=SYSMIS) (0=0) (1=1) (2=1) 
     INTO E_cvd_angina E_cvd_myocardial_infarction E_cvd_heartfailure E_cvd_heartmurmur E_cvd_arrhythmia E_cvd_stroke.
VARIABLE LABELS  E_cvd_angina 'Ever reported diagnosis of angina (cvd) (wave 2)' 
    /E_cvd_myocardial_infarction 'Ever reported diagnosis of myocardial infarction diagnosis (cvd) (wave 2)' 
    /E_cvd_heartfailure 'Ever reported diagnosis of congestive heart failure (cvd) (wave 2)' 
    /E_cvd_heartmurmur 'Ever reported diagnosis of heart murmur (cvd) (wave 2)' 
    /E_cvd_arrhythmia 'Ever reported diagnosis of arrhythmia (cvd) (wave 2)' 
    /E_cvd_stroke 'Ever reported diagnosis of stroke (cvd) (wave 2)'.
EXECUTE.

COMPUTE E_cvd_sum=SUM(E_cvd_angina,E_cvd_myocardial_infarction,E_cvd_heartfailure,E_cvd_heartmurmur,
    E_cvd_arrhythmia,E_cvd_stroke).
VARIABLE LABELS  E_cvd_sum 'Sum of 6 Cardiovascular diseases (wave 2)'.
EXECUTE.

RECODE E_cvd_sum (0=0) (1 thru 6=1) INTO E_cvd_comorbidity.
VARIABLE LABELS  E_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease at wave 2'.
EXECUTE.




RECODE r2hearte r2stroke (0=0) (1=1) (ELSE=SYSMIS) INTO E_heart_disease_rand E_stroke_rand.
VARIABLE LABELS  E_heart_disease_rand 'Doctor ever diagnosed heart problem by Rand (wave 2)' 
/E_stroke_rand 'Doctor ever diagnosed stroke by Rand (wave 2)'.
EXECUTE.

COMPUTE E_cvd_sum_rand=SUM(E_heart_disease_rand,E_stroke_rand).
VARIABLE LABELS  E_cvd_sum_rand 'Sum of Cardiovascular diseases (heart problem and stroke) by Rand (wave 2)'.
EXECUTE.

RECODE E_cvd_sum_rand (0=0) (1 thru 2=1) INTO E_cvd_comorbidity_rand.
VARIABLE LABELS  E_cvd_comorbidity_rand 'Comorbidity of at least one cardiovascular disease (heart problem and stroke) by Rand at wave 2'.
EXECUTE.



# Health variables wave 6

# Cardiovascular diseases-CVD wave 6
Raw variables:
1. ELSA core data wave 6
    (6 CVD-related items except blood pressure and diabetes/high blood sugar)
    hediman -> CVD: angina diagnosis newly reported (merged)
    hedimmi -> CVD: heart attack diagnosis newly reported (merged)
    hedimhf -> CVD: congestive heart failure diagnosis newly reported (merged)
    hedimhm -> CVD: heart murmur diagnosis newly reported (merged)
    hedimar -> CVD: abnormal heart rhythm diagnosis newly reported (merged)
    hedimst -> CVD: stroke diagnosis newly reported  (merged)
2. Rand variables in harmonised data
    r6hearte -> r ever had heart problems
    r6stroke -> r ever had stroke
Steps:
1. Recode the 6 cvd diseases: angina, congestive heart failure, myocardial infaction, heart murmur, arrhythmia and stroke (without N/As) 
2. Sum of CVDs
3. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)
4. Recode r6hearte and r6stroke
5. Sum of CVDs
6. Recode into different variables ≥ 1 -> CVD (0 = no CVD, 1= at least one CVD)




RECODE hediman hedimmi hedimhf hedimhm hedimar hedimst (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (0=0) (1=1) 
     INTO Ewv6_cvd_angina Ewv6_cvd_myocardial_infarction Ewv6_cvd_heartfailure Ewv6_cvd_heartmurmur Ewv6_cvd_arrhythmia Ewv6_cvd_stroke.
VARIABLE LABELS  Ewv6_cvd_angina 'Ever reported diagnosis of angina (cvd) (wave 6)' 
    /Ewv6_cvd_myocardial_infarction 'Ever reported diagnosis of myocardial infarction diagnosis (cvd) (wave 6)' 
    /Ewv6_cvd_heartfailure 'Ever reported diagnosis of congestive heart failure (cvd) (wave 6)' 
    /Ewv6_cvd_heartmurmur 'Ever reported diagnosis of heart murmur (cvd) (wave 6)' 
    /Ewv6_cvd_arrhythmia 'Ever reported diagnosis of arrhythmia (cvd) (wave 6)' 
    /Ewv6_cvd_stroke 'Ever reported diagnosis of stroke (cvd) (wave 6)'.
EXECUTE.

COMPUTE Ewv6_cvd_sum=SUM(Ewv6_cvd_angina,Ewv6_cvd_myocardial_infarction,Ewv6_cvd_heartfailure,Ewv6_cvd_heartmurmur,
    Ewv6_cvd_arrhythmia,Ewv6_cvd_stroke).
VARIABLE LABELS  Ewv6_cvd_sum 'Sum of 6 Cardiovascular diseases (wave 6)'.
EXECUTE.

RECODE Ewv6_cvd_sum (0=0) (1 thru 6=1) INTO Ewv6_cvd_comorbidity.
VARIABLE LABELS  Ewv6_cvd_comorbidity 'Comorbidity of at least one cardiovascular disease at wave 6'.
EXECUTE.




RECODE r6hearte r6stroke (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv6_heart_disease_rand Ewv6_stroke_rand.
VARIABLE LABELS  Ewv6_heart_disease_rand 'Doctor ever diagnosed heart problem by Rand (wave 6)' 
/Ewv6_stroke_rand 'Doctor ever diagnosed stroke by Rand (wave 2)'.
EXECUTE.

COMPUTE Ewv6_cvd_sum_rand=SUM(Ewv6_heart_disease_rand,Ewv6_stroke_rand).
VARIABLE LABELS Ewv6_cvd_sum_rand 'Sum of Cardiovascular diseases (heart problem and stroke) by Rand (wave 2)'.
EXECUTE.

RECODE Ewv6_cvd_sum_rand (0=0) (1 thru 2=1) INTO Ewv6_cvd_comorbidity_rand.
VARIABLE LABELS Ewv6_cvd_comorbidity_rand 'Comorbidity of at least one cardiovascular disease (heart problem and stroke) by Rand at wave 6'.
EXECUTE.



# Cognition wave 2
Raw variables:
cfmeind -> (D) Memory Function Index
cfexind -> (D) Executive Function Index (cognitive)
cfind -> (D) Total Cognitive Index (Memory + Executive)
Rand variables:
Memory: 10 word recall
    - r2imrc: r immediate word recall (cont)
    - r2dlrc: r delayed word recall (cont)
    - r2tr20: r recall summary score (cont)
Orientation in time
    - r2mo: r cognition date naming-month (categ)
    - r2dy: r cognition date naming-day of month (categ)
    - r2yr: r cognition date naming-year (categ)
    - r2dw: r cognition date naming-day of week (categ)
    - r2orient: r cognition orient (summary date naming) (cont)
Verbal Fluency
    - r2verbf: r verbal fluency score (cont)
Concetration
    - serial 7s (cont): not available at wave 2
Executive function
    -cognition able to draw assign picture (categ): not available at wave 2
Steps:
    1. Recode the status of cognition according to the memory index (cfmeind), executive index (cfexind) and cognitive index (cfind)
    2. Recode r2tr20, r2orient, r2verbf into new variables that measure memory, orientation and verbal fluency functions respectively
        We cannot develop a holistic variable that estimates cognitive status, we can just use specific cognition measures that capture specific cognitive functions
            1. r2tr20
                    is the summary score for total word recall
                    sums the immediate and delayed word recall scores
                    It is calculated by taking the sum of r2imrc (range 0-10) and r2dlrc (range 0-10)
                    r2tr20 is only calculated when the respondent has non-missing values for r2imrc and r2dlrc
            2. r2orient
                    indicates the orientation to date, month, year and day of week
                    It is the summary measure for the above four variables, ranging from 0 to 4, with four indicating all questions answered correctly
            3. r2verbf 
                    r2verbf  indicates the verbal fluency score
                    The respondents were asked to name members of animals within a time span of one minute, up to 100 animals
                    r2verbf  is the count of the number of acceptable animal names



RECODE cfmeind cfexind cfind (-1=SYSMIS) (-6=SYSMIS) (ELSE=Copy) INTO 
    E_memory_index E_executive_index E_cognitive_index.
VARIABLE LABELS  E_memory_index 'Memory Function Index (wave 2)' 
    /E_executive_index 'Executive Function Index (wave 2)' 
    /E_cognitive_index 'Total Cognitive Index measured by memory and executive Function (wave 2)'.
EXECUTE.

   
RECODE r2tr20 r2orient r2verbf  (ELSE=Copy) INTO E_memory_wordrecall E_orientation_time E_verbal_fluency.
VARIABLE LABELS  E_memory_wordrecall 'Memory Function: summary score for immediate and delayed 10 words recall (rand) (wave 2)' 
    /E_orientation_time 'Orientation in time measure by date naming (month, day of month, year, day of week) (rand) (wave 2)'
    /E_verbal_fluency 'Verbal fluency by naming animals (rand) (wave 2) '.
EXECUTE.






# Cognition wave 6
Raw variables harmonised data
Rand variables:
Memory: 10 word recall (immediate and delayed)
    - r6tr20: r recall summary score (cont)
Orientation in time
    - r6orient: r cognition orient (summary date naming) (cont)
Verbal Fluency
    not available at wave 6
Steps:
    1. Recode r2tr20, r2orient, r2verbf into new variables that measure memory, orientation and verbal fluency functions respectively
        We cannot develop a holistic variable that estimates cognitive status, we can just use specific cognition measures that capture specific cognitive functions
            1. r6tr20
                    is the summary score for total word recall
                    sums the immediate and delayed word recall scores
                    It is calculated by taking the sum of r6imrc (range 0-10) and r6dlrc (range 0-10)
                    r6tr20 is only calculated when the respondent has non-missing values for r6imrc and r6dlrc
            2. r6orient
                    indicates the orientation to date, month, year and day of week
                    It is the summary measure for the above four variables, ranging from 0 to 4, with four indicating all questions answered correctly

   
RECODE r6tr20 r6orient (ELSE=Copy) INTO Ewv6_memory_wordrecall Ewv6_orientation_time.
VARIABLE LABELS  Ewv6_memory_wordrecall 'Memory Function: summary score for immediate and delayed 10 words recall (rand) (wave 6)' 
    /Ewv6_orientation_time 'Orientation in time measure by date naming (month, day of month, year, day of week) (rand) (wave 6)'.
EXECUTE.




# Dementia variables 
(core data and harmonised dataset)
    1. Self-reported doctor diagnosed AD 
    2. Self-reported doctor diagnosed dementia/senility/ or other serious memory impairment
    3. IQCODE
    4. Age, Month and Year of diagnosis
    5. Diagnosis of dementia/AD of deceased and age of diagnosis

# Dementia-related variables:
HeDibW9 -> Which chronic condition from wave 1 referred to (dementia)
HeDiaD9 -> Whether confirms dementia recorded in wave 1
HeDiaM9 -> Reason disputed dementia diagnosis from wave 1
HeDiDS9 -> Whether still had dementia at wave 2
HeAgj -> Age told had dementia
HeAgjR -> Month told had dementia in last 2 years
HeAgjRY -> Year told had dementia in last 2 years
bheagj -> Age told had dementia reported at Wave 1
hedibde -> (D) Ever reported dementia or memory impairment (diagnosed)
EiDiaB9 -> Whether deceased was ever told by a doctor that they had other conditions: 
                 Dementia, organic brain syndrome, senility or any other serious memory impairment
EiAgJ -> How old was deceased when first told had dementia, senility or any other serious memory impairment?
r1demene -> r1demene:w1 r ever had dementia
r2demene -> r2demene:w2 r ever had dementia
r3demene -> r3demene:w3 r ever had dementia
r4demene -> r4demene:w4 r ever had dementia
r5demene -> r5demene:w5 r ever had dementia
r6demene -> r6demene:w6 r ever had dementia
r7demene -> r7demene:w7 r ever had dementia
r1demenf -> r1demenf:w1 r flag chg previous dementia
r2demenf -> r2demenf:w2 r flag chg previous dementia
r3demenf -> r3demenf:w3 r flag chg previous dementia
r4demenf -> r4demenf:w4 r flag chg previous dementia
r5demenf -> r5demenf:w5 r flag chg previous dementia
r6demenf -> r6demenf:w6 r flag chg previous dementia
r7demenf -> r7demenf:w7 r flag chg previous dementia
r2demens -> r2demens:w2 R had dementia since last IW
r3demens -> r3demens:w3 R had dementia since last IW
r4demens -> r4demens:w4 R had dementia since last IW
r5demens -> r5demens:w5 R had dementia since last IW
r6demens -> r6demens:w6 R had dementia since last IW
r7demens -> r7demens:w7 R had dementia since last IW


# Alzheimers disease related variables:
HeDibW8 -> Which chronic condition from wave 1 referred to (Alzheimers disease)
HeDiaD8 -> Whether confirms Alzheimers disease recorded in wave 1
HeDiaM8 -> Reason disputed Alzheimers disease diagnosis from wave 1
HeDiDS8 -> Whether still had Alzheimers disease at wave 2
HeAgi -> Age told had Alzheimers Disease
HeAgiR -> Month told had Alzheimers Disease in last 2 years
HeAgiRY -> Year told had Alzheimers Disease in last 2 years
HeDiaS8 -> Whether still has Alzheimers disease at wave 2
bheagi -> Age told had Alzheimers Disease reported at Wave 1
hedibad -> (D) Ever reported Alzheimers Disease (diagnosed)
EiDiaB8 -> Whether deceased was ever told by a doctor that they had other conditions: Alzheimers disease
EiAgI -> How old was deceased when first told had Alzheimers Disease?
r1alzhe -> r1alzhe:w1 r ever had alzheimer’s
r2alzhe -> r2alzhe:w2 r ever had alzheimer’s
r3alzhe -> r3alzhe:w3 r ever had alzheimer’s
r4alzhe -> r4alzhe:w4 r ever had alzheimer’s
r5alzhe -> r5alzhe:w5 r ever had alzheimer’s
r6alzhe -> r6alzhe:w6 r ever had alzheimer’s
r7alzhe -> r7alzhe:w7 r ever had alzheimer’s
r1alzhf -> r1alzhf:w1 r flag chg previous alzheimer’s
r2alzhf -> r2alzhf:w2 r flag chg previous alzheimer’s
r3alzhf -> r3alzhf:w3 r flag chg previous alzheimer’s
r4alzhf -> r4alzhf:w4 r flag chg previous alzheimer’s
r5alzhf -> r5alzhf:w5 r flag chg previous alzheimer’s
r6alzhf -> r6alzhf:w6 r flag chg previous alzheimer’s
r7alzhf -> r7alzhf:w7 r flag chg previous alzheimer’s
r2alzhs -> r2alzhs:w2 R had alzheimers since last IW
r3alzhs -> r3alzhs:w3 R had alzheimers since last IW
r4alzhs -> r4alzhs:w4 R had alzheimers since last IW
r5alzhs -> r5alzhs:w5 R had alzheimers since last IW
r6alzhs -> r6alzhs:w6 R had alzheimers since last IW
r7alzhs -> r7alzhs:w7 R had alzheimers since last IW


# Memory problem related variables (from harmonised dataset only):
r1memrye -> r1memrye:w1 r ever had memory problem
r2memrye -> r2memrye:w2 r ever had memory problem
r3memrye -> r3memrye:w3 r ever had memory problem
r4memrye -> r4memrye:w4 r ever had memory problem 
r5memrye -> r5memrye:w5 r ever had memory problem
r6memrye -> r6memrye:w6 r ever had memory problem
r7memrye -> r7memrye:w7 r ever had memory problem
r1memryf -> r1memryf:w1 r flag chg previous memory prob
r2memryf -> r2memryf:w2 r flag chg previous memory prob
r3memryf -> r3memryf:w3 r flag chg previous memory prob
r4memryf -> r4memryf:w4 r flag chg previous memory prob
r5memryf -> r5memryf:w5 r flag chg previous memory prob 
r6memryf -> r6memryf:w6 r flag chg previous memory prob
r7memryf -> r7memryf:w7 r flag chg previous memory prob
r2memrys -> r2memrys:w2 R had memory prob since last IW
r3memrys -> r3memrys:w3 R had memory prob since last IW
r4memrys -> r4memrys:w4 R had memory prob since last IW
r5memrys -> r5memrys:w5 R had memory prob since last IW
r6memrys -> r6memrys:w6 R had memory prob since last IW
r7memrys -> r7memrys:w7 R had memory prob since last IW


# IQCODE related variables
From core data find items from "heiqb" - "heiqq" (16 items in total) 
                                                    



## Wave 2 (Baseline)

# 1. Self-reported dementia/AD/memory problem
        HeDiaD9 -> Whether confirms dementia recorded in wave 1
        HeDiDS9 -> Whether still had dementia at wave 2
        hedibde -> (D) Ever reported dementia or memory impairment (diagnosed)
        r2demene -> r2demene:w2 r ever had dementia
        r2demens -> r2demens:w2 R had dementia since last IW
        HeDiaD8 -> Whether confirms Alzheimers disease recorded in wave 1
        HeDiDS8 -> Whether still had Alzheimers disease at wave 2
        HeDiaS8 -> Whether still has Alzheimers disease at wave 2
        hedibad -> (D) Ever reported Alzheimers Disease (diagnosed)
        r2alzhe -> r2alzhe:w2 r ever had alzheimer’s
        r2alzhs -> r2alzhs:w2 R had alzheimers since last IW
        r2memrye -> r2memrye:w2 r ever had memory problem
        r2memrys -> r2memrys:w2 R had memory prob since last IW



RECODE HeDiaD9 HeDiaD8 (-9=SYSMIS) (-8=SYSMIS) (3=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv2_confirm_dementia Ewv2_confirm_ad.
VARIABLE LABELS  Ewv2_confirm_dementia 'Whether confirms dementia recorded in wave 1' /Ewv2_confirm_ad 
    'Whether confirms Alzheimers disease (AD) recorded in wave 1'.
EXECUTE.

RECODE HeDiDS9 HeDiDS8 HeDiaS8 (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv2_still_dementia Ewv2_still_had_ad Ewv2_still_has_ad.
VARIABLE LABELS  Ewv2_still_dementia 'Whether still had dementia at wave 2' /Ewv2_still_had_ad 
    'Whether still had Alzheimers disease at wave 2' /Ewv2_still_has_ad 
    'Whether still has Alzheimers disease at wave 2'.
EXECUTE.

RECODE hedibde hedibad (0=0) (1=1) (2=1) (-2=SYSMIS) (-3=SYSMIS) INTO 
Ewv2_dementia_diagnosed Ewv2_ad_diagnosed.
VARIABLE LABELS  Ewv2_dementia_diagnosed 'Ever reported dementia or memory impairment diagnosed at wave 2' 
/Ewv2_ad_diagnosed 'Ever reported Alzheimers Disease diagnosed at wave 2'.
EXECUTE.



RECODE r2demene r2demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv2_dementia_evr Ewv2_dementia_before.
VARIABLE LABELS Ewv2_dementia_evr 'Ever had dementia (wave 2)' 
/Ewv2_dementia_before 'Had dementia since last interview (wave 1)'.
EXECUTE.



RECODE r2alzhe r2alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv2_ad_evr Ewv2_ad_before.
VARIABLE LABELS Ewv2_ad_evr 'Ever had Alzheimers Disease (wave 2)' 
/Ewv2_ad_before 'Had Alzheimers Disease since last interview (wave 1)'.
EXECUTE.


RECODE r2memrye r2memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv2_memory_evr Ewv2_memory_before.
VARIABLE LABELS Ewv2_memory_evr 'Ever had memory problem (wave 2)' 
/Ewv2_memory_before 'Had memory problem since last interview (wave 1)'.
EXECUTE.



# Recode self-report doctor diagnosed memory-related disease, AD and dementia into one variable indicating dementia cases
Recode as N/A ->N/A,  0->0 = no dementia and 1->1 = memory / dementia / AD
Because we have 3 different questions about memory/dementia/AD, we should recode them into 1 variable
1. Sum new diagnosis of dementia
2. Recode if 5, 4, 3, 2, 1 -> 1 = yes dementia
                   0 -> 0 = no dementia    
3. Sum new diagnosis of AD
4. Recode if 6, 5, 4, 3, 2, 1 -> 1 = yes AD
                   0 -> 0 = no AD
5. Sum new diagnosis memory problem
6. Recode if  2, 1 -> 1 = yes memory-related disease
                   0 -> 0 = no memory-related disease
7. Sum of the two above dementia + AD
8. Recode "Ewv( )_dementia_ad_report"
                if  2 -> 1 = yes dementia
                   1 -> 1 = yes dementia
                   0 -> 0 = no dementia
9. Sum of the three above  dementia + AD + memory 
10. Recode "Ewv( )_anydementia_report"
               if  3 -> 1 = yes dementia
                   2 -> 1 = yes dementia
                   1 -> 1 = yes dementia
                   0 -> 0 = no dementia
11. Sum of the four: dementia + AD + memory + IQCODE 
12. Recode "Ewv( )_anydementia_iqcode_report"
               if  2 -> 1 = yes dementia
                   1 -> 1 = yes dementia
                   0 -> 0 = no dementia   
So, we have some new variables about dementia diagnosis "Ewv2_dementia_ad_report"  "Ewv2_anydementia_report" Ewv2_anydementia_iqcode_report



# Dementia
        - Ewv2_confirm_dementia
        - Ewv2_still_dementia
        - Ewv2_dementia_diagnosed
        - Ewv2_dementia_evr 
        - Ewv2_dementia_before


COMPUTE Ewv2_dementia_sum=SUM(Ewv2_confirm_dementia,Ewv2_still_dementia,Ewv2_dementia_diagnosed,
Ewv2_dementia_evr,Ewv2_dementia_before).
VARIABLE LABELS Ewv2_dementia_sum 'Sum of new diagnosis of dementia at wave 2'.
EXECUTE.

RECODE Ewv2_dementia_sum (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv2_dementia_report.
VARIABLE LABELS  Ewv2_dementia_report 'Whether reported physician-diagnosed dementia new at wave 2'.
EXECUTE.

# Alzheimers disease
        - Ewv2_confirm_ad
        - Ewv2_still_had_ad 
        - Ewv2_still_has_ad
        - Ewv2_ad_diagnosed
        - Ewv2_ad_evr 
        - Ewv2_ad_before


COMPUTE Ewv2_ad_sum=SUM(Ewv2_confirm_ad,Ewv2_still_had_ad,Ewv2_still_has_ad,Ewv2_ad_diagnosed,
Ewv2_ad_evr,Ewv2_ad_before).
VARIABLE LABELS  Ewv2_ad_sum 'Sum of new diagnosis of AD at wave 2'.
EXECUTE.

RECODE Ewv2_ad_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv2_ad_report.
VARIABLE LABELS  Ewv2_ad_report 'Whether reported physician-diagnosed AD new at wave 2'.
EXECUTE.


# Memory-related disease
        - Ewv2_memory_evr 
        - Ewv2_memory_before
        

COMPUTE Ewv2_memory_sum=SUM(Ewv2_memory_evr,Ewv2_memory_before).
VARIABLE LABELS  Ewv2_memory_sum 'Sum of new diagnosis of memory-related disease at wave 2'.
EXECUTE.

RECODE Ewv2_memory_sum (2=1) (1=1) (0=0) INTO Ewv2_memory_report.
VARIABLE LABELS  Ewv2_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 2'.
EXECUTE.


# Dementia + AD 
COMPUTE Ewv2_dementia_ad_sum=SUM(Ewv2_dementia_report,Ewv2_ad_report).
VARIABLE LABELS  Ewv2_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 2'.
EXECUTE.

RECODE Ewv2_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv2_dementia_ad_report.
VARIABLE LABELS  Ewv2_dementia_ad_report 'All new dementia and/or AD cases reported at wave 2'.
EXECUTE.


# Dementia + AD + memory 

COMPUTE Ewv2_anydementia_sum=SUM(Ewv2_dementia_report,Ewv2_ad_report,Ewv2_memory_report).
VARIABLE LABELS  Ewv2_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 2'.
EXECUTE.

RECODE Ewv2_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv2_anydementia_report.
VARIABLE LABELS  Ewv2_anydementia_report 'All new dementia cases reported at wave 2'.
EXECUTE.



# 3. IQCODE 
1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 = N/A)
2. Keep values as they are:
        1 = much improved
        2 = a bit improved
        3 = not much change
        4 = a bit worse
        5 = much worse
3. Sum of 16 items
4. Devide Sum by 16 (Sum/16)
5. Score IQCODE based on the threshold of 3.5  (score ≥3.5 means dementia)
So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                    range value through highest 3.50 -> 1


RECODE Heiqb Heiqc Heiqd Heiqe Heiqf Heiqg Heiqh Heiqi Heiqj Heiqk Heiql Heiqm Heiqn Heiqo Heiqp Heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv2_iqcode1 Ewv2_iqcode2 Ewv2_iqcode3 Ewv2_iqcode4 Ewv2_iqcode5 Ewv2_iqcode6 Ewv2_iqcode7 Ewv2_iqcode8
Ewv2_iqcode9 Ewv2_iqcode10 Ewv2_iqcode11 Ewv2_iqcode12 Ewv2_iqcode13 Ewv2_iqcode14 Ewv2_iqcode15 Ewv2_iqcode16.
VARIABLE LABELS Ewv2_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 2)' 
/Ewv2_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 2)'
/Ewv2_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 2)'
/Ewv2_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 2)'
/Ewv2_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 2)'
/Ewv2_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 2)'
/Ewv2_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 2)'
/Ewv2_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 2)'
/Ewv2_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 2)'
/Ewv2_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 2)'
/Ewv2_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 2)'
/Ewv2_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 2)'
/Ewv2_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 2)'
/Ewv2_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 2)'
/Ewv2_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 2)'
/Ewv2_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 2)'.
EXECUTE.

COMPUTE Ewv2_iqcode_sum=Ewv2_iqcode1 + Ewv2_iqcode2 + Ewv2_iqcode3 + Ewv2_iqcode4 + Ewv2_iqcode5 + 
    Ewv2_iqcode6 + Ewv2_iqcode7 + Ewv2_iqcode8 + Ewv2_iqcode9 + Ewv2_iqcode10 + Ewv2_iqcode11 + Ewv2_iqcode12 + 
    Ewv2_iqcode13 + Ewv2_iqcode14 + Ewv2_iqcode15 + Ewv2_iqcode16.
VARIABLE LABELS  Ewv2_iqcode_sum 'Sum of 16 IQCODE items at wave 2'.
EXECUTE.

COMPUTE Ewv2_iqcode_scoreby16=Ewv2_iqcode_sum / 16.
VARIABLE LABELS  Ewv2_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 2)'.
EXECUTE.

RECODE Ewv2_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) INTO Ewv2_dementia_iqcode.
VARIABLE LABELS  Ewv2_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 2)'.
EXECUTE.




# Dementia + AD + memory + IQCODE (no new cases from iqcode)

COMPUTE Ewv2_anydementia_iqcode_sum=SUM(Ewv2_anydementia_report,Ewv2_dementia_iqcode).
VARIABLE LABELS  Ewv2_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 2'.
EXECUTE.

RECODE Ewv2_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv2_anydementia_iqcode_report.
VARIABLE LABELS  Ewv2_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 2'.
EXECUTE.



# 4. Age, Month and Year of diagnosis
        HeAgj -> Age told had dementia
        HeAgjR -> Month told had dementia in last 2 years
        HeAgjRY -> Year told had dementia in last 2 years
        HeAgi -> Age told had Alzheimers Disease
        HeAgiR -> Month told had Alzheimers Disease in last 2 years
        HeAgiRY -> Year told had Alzheimers Disease in last 2 years
    

RECODE HeAgj HeAgjR HeAgjRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv2_dementia_age Ewv2_dementia_month Ewv2_dementia_year.
VARIABLE LABELS Ewv2_dementia_age 'Age told had dementia (wave 2)' 
/Ewv2_dementia_month 'Month told had dementia in last 2 years (wave 2)' 
/Ewv2_dementia_year 'Year told had dementia in last 2 years (wave 2)'.
EXECUTE.


RECODE HeAgi HeAgiR HeAgiRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv2_ad_age Ewv2_ad_month Ewv2_ad_year.
VARIABLE LABELS Ewv2_ad_age 'Age told had Alzheimers Disease (wave 2)' 
/Ewv2_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 2)' 
/Ewv2_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 2)'.
EXECUTE.




# 5. Diagnosis of dementia/AD of deceased and age of diagnosis
        EiDiaB9 -> Whether deceased was ever told by a doctor that they had other conditions: 
                         Dementia, organic brain syndrome, senility or any other serious memory impairment
        EiAgJ -> How old was deceased when first told had dementia, senility or any other serious memory impairment?
        EiDiaB8 -> Whether deceased was ever told by a doctor that they had other conditions: Alzheimers disease
        EiAgI -> How old was deceased when first told had Alzheimers Disease?



RECODE EiDiaB9 EiDiaB8 (0=0) (1=1) (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) INTO 
Ewv2_dementia_deceased Ewv2_ad_deceased.
VARIABLE LABELS Ewv2_dementia_deceased 'Whether deceased was ever told by a doctor that they had other conditions Dementia, organic brain syndrome, senility or any other serious memory impairment (wave 2)' 
/Ewv2_ad_deceased 'Whether deceased was ever told by a doctor that they had other conditions: Alzheimers disease (wave 2)'.
EXECUTE.


RECODE EiAgJ EiAgI (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv2_dementia_age_deceased Ewv2_ad_age_deceased.
VARIABLE LABELS Ewv2_dementia_age_deceased 'How old was deceased when first told had dementia, senility or any other serious memory impairment? (wave 2)' 
/Ewv2_ad_age_deceased 'How old was deceased when first told had Alzheimers Disease? (wave 2)'.
EXECUTE.




# Wave 3 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv3 raw core data "wave_3_elsa_data_v4"
        Dementia: hedbwde, hedbdde, hedbsde, dhedibde, heagj, heagjr, heagjry, hedibde
        AD: hedbwad, hedbdad, dhedibad, heagi, heagir, heagiry, hedibad
        Memory: -
        IQCODE: heiqb - heiqq
2. Recode variables of interest into different names noting wave 3 (e.g. wv3_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE


# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde dhedibde heagj heagjr heagjry hedibde (ELSE=COPY) INTO 
Ewv3_hedbwde Ewv3_hedbdde Ewv3_hedbsde Ewv3_dhedibde Ewv3_heagj Ewv3_heagjr Ewv3_heagjry Ewv3_hedibde.
VARIABLE LABELS Ewv3_hedbwde 'Chronic: diagnosed dementia fed forward (wave 3)' 
/Ewv3_hedbdde 'Whether confirms dementia diagnosis (wave 3)' /Ewv3_hedbsde 'Whether still has dementia (wave 3)'
/Ewv3_dhedibde 'Chronic: dementia diagnosis newly reported (wave 3)' /Ewv3_heagj 'Age told had dementia (wave 3)' 
/Ewv3_heagjr 'Month told had dementia since last interview (wave 3)' /Ewv3_heagjry 'Year told had dementia since last interview (wave 3)'
/Ewv3_hedibde '(D) Ever reported dementia or memory impairment (diagnosed) (wave 3)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad dhedibad heagi heagir heagiry hedibad (ELSE=COPY) INTO 
Ewv3_hedbwad Ewv3_hedbdad Ewv3_dhedibad Ewv3_heagi Ewv3_heagir Ewv3_heagiry Ewv3_hedibad.
VARIABLE LABELS Ewv3_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 3)' 
/Ewv3_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 3)' 
/Ewv3_dhedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 3)'
/Ewv3_heagi 'Age told had Alzheimers Disease (wave 3)' 
/Ewv3_heagir 'Month told had Alzheimers Disease since last interview (wave 3)' 
/Ewv3_heagiry 'Year told had Alzheimers Disease since last interview (wave 3)'
/Ewv3_hedibad '(D) Ever reported Alzheimer’s Disease (diagnosed) (wave 3)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE heiqb heiqc heiqd heiqe heiqf heiqg heiqh heiqi heiqj heiqk heiql heiqm heiqn heiqo heiqp heiqq (ELSE=COPY) INTO 
Ewv3_heiqb Ewv3_heiqc Ewv3_heiqd Ewv3_heiqe Ewv3_heiqf Ewv3_heiqg Ewv3_heiqh Ewv3_heiqi Ewv3_heiqj
Ewv3_heiqk Ewv3_heiql Ewv3_heiqm Ewv3_heiqn Ewv3_heiqo Ewv3_heiqp Ewv3_heiqq.
VARIABLE LABELS Ewv3_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 3)' 
/Ewv3_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 3)'
/Ewv3_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 3)'
/Ewv3_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 3)'
/Ewv3_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 3)'
/Ewv3_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 3)'
/Ewv3_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 3)'
/Ewv3_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 3)'
/Ewv3_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 3)'
/Ewv3_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 3)'
/Ewv3_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 3)'
/Ewv3_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 3)'
/Ewv3_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 3)'
/Ewv3_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 3)'
/Ewv3_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 3)'
/Ewv3_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 3)'.
EXECUTE.


# 3. Merge variables from wave 3 core data to the main dataset

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet3.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet3'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 3
Self-reported dementia/AD/memory problem
        Ewv3_hedbwde -> Chronic: diagnosed dementia fed forward (wave 3)
        Ewv3_hedbdde -> Whether confirms dementia diagnosis (wave 3)
        Ewv3_hedbsde -> Whether still has dementia (wave 3)
        Ewv3_dhedibde -> Chronic: dementia diagnosis newly reported (wave 3)
        Ewv3_heagj -> Age told had dementia (wave 3)
        Ewv3_heagjr -> Month told had dementia since last interview (wave 3)
        Ewv3_heagjry -> Year told had dementia since last interview (wave 3)
        Ewv3_hedibde -> (D) Ever reported dementia or memory impairment (diagnosed) (wave 3)
        r3demene -> r3demene:w3 r ever had dementia
        r3demens -> r3demens:w3 R had dementia since last IW
        Ewv3_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 3)
        Ewv3_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 3)
        Ewv3_dhedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 3)
        Ewv3_heagi -> Age told had Alzheimers Disease (wave 3)
        Ewv3_heagir -> Month told had Alzheimers Disease since last interview (wave 3)
        Ewv3_heagiry -> Year told had Alzheimers Disease since last interview (wave 3)
        Ewv3_hedibad -> (D) Ever reported Alzheimer’s Disease (diagnosed) (wave 3)
        r3alzhe -> r3alzhe:w3 r ever had alzheimers
        r3alzhs -> r3alzhs:w3 R had alzheimers since last IW
        r3memrye -> r3memrye:w3 r ever had memory problem
        r3memrys -> r3memrys:w3 R had memory prob since last IW



RECODE Ewv3_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (9=1) INTO 
    Ewv3_chronic_dementia.
VARIABLE LABELS  Ewv3_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 3)'.
EXECUTE.


RECODE Ewv3_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (8=1) INTO 
    Ewv3_chronic_ad.
VARIABLE LABELS  Ewv3_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 3)'.
EXECUTE.


RECODE Ewv3_hedbdde Ewv3_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS) (1=1) (2=0) INTO 
Ewv3_confirm_dementia Ewv3_confirm_ad.
VARIABLE LABELS  Ewv3_confirm_dementia 'Whether confirms dementia diagnosis (wave 3)' /Ewv3_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 3)'.
EXECUTE.


RECODE Ewv3_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv3_still_dementia.
VARIABLE LABELS  Ewv3_still_dementia 'Whether still has dementia (wave 3)'.
EXECUTE.


RECODE Ewv3_dhedibde Ewv3_dhedibad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
Ewv3_newreport_dementia Ewv3_newreport_ad.
VARIABLE LABELS  Ewv3_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 3)' 
/Ewv3_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 3)'.
EXECUTE.


RECODE Ewv3_hedibde Ewv3_hedibad (0=0) (1=1) (2=1) (3=1) (-1=SYSMIS) (-2=SYSMIS) (-3=SYSMIS) INTO 
Ewv3_dementia_diagnosed Ewv3_ad_diagnosed.
VARIABLE LABELS  Ewv3_dementia_diagnosed 'Ever reported dementia or memory impairment diagnosed at wave 3' 
/Ewv3_ad_diagnosed 'Ever reported Alzheimers Disease diagnosed at wave 3'.
EXECUTE.



RECODE r3demene r3demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv3_dementia_evr Ewv3_dementia_before.
VARIABLE LABELS Ewv3_dementia_evr 'Ever had dementia (wave 3)' 
/Ewv3_dementia_before 'Had dementia since last interview (wave 2)'.
EXECUTE.



RECODE r3alzhe r3alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv3_ad_evr Ewv3_ad_before.
VARIABLE LABELS Ewv3_ad_evr 'Ever had Alzheimers Disease (wave 3)' 
/Ewv3_ad_before 'Had Alzheimers Disease since last interview (wave 2)'.
EXECUTE.


RECODE r3memrye r3memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv3_memory_evr Ewv3_memory_before.
VARIABLE LABELS Ewv3_memory_evr 'Ever had memory problem (wave 3)' 
/Ewv3_memory_before 'Had memory problem since last interview (wave 2)'.
EXECUTE.


# 4. Age, Month and Year of diagnosis
        Ewv3_heagj -> Age told had dementia (wave 3)
        Ewv3_heagjr -> Month told had dementia since last interview (wave 3)
        Ewv3_heagjry -> Year told had dementia since last interview (wave 3)
        Ewv3_heagi -> Age told had Alzheimers Disease (wave 3)
        Ewv3_heagir -> Month told had Alzheimers Disease since last interview (wave 3)
        Ewv3_heagiry -> Year told had Alzheimers Disease since last interview (wave 3)

    

RECODE Ewv3_heagj Ewv3_heagjr Ewv3_heagjry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv3_dementia_age Ewv3_dementia_month Ewv3_dementia_year.
VARIABLE LABELS Ewv3_dementia_age 'Age told had dementia (wave 3)' 
/Ewv3_dementia_month 'Month told had dementia in last 2 years (wave 3)' 
/Ewv3_dementia_year 'Year told had dementia in last 2 years (wave 3)'.
EXECUTE.


RECODE Ewv3_heagi Ewv3_heagir Ewv3_heagiry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv3_ad_age Ewv3_ad_month Ewv3_ad_year.
VARIABLE LABELS Ewv3_ad_age 'Age told had Alzheimers Disease (wave 3)' 
/Ewv3_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 3)' 
/Ewv3_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 3)'.
EXECUTE.


# 5. Dementia wave 3
        - Ewv3_chronic_dementia
        - Ewv3_confirm_dementia 
        - Ewv3_still_dementia
        - Ewv3_newreport_dementia
        - Ewv3_dementia_diagnosed 
        - Ewv3_dementia_evr 
        - Ewv3_dementia_before 
   

COMPUTE Ewv3_dementia_sum=SUM(Ewv3_chronic_dementia,Ewv3_confirm_dementia,Ewv3_still_dementia,Ewv3_newreport_dementia,
Ewv3_dementia_diagnosed,Ewv3_dementia_evr,Ewv3_dementia_before).
VARIABLE LABELS Ewv3_dementia_sum 'Sum of new diagnosis of dementia at wave 3'.
EXECUTE.

RECODE Ewv3_dementia_sum (7=1) (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv3_dementia_report.
VARIABLE LABELS  Ewv3_dementia_report 'Whether reported physician-diagnosed dementia new at wave 3'.
EXECUTE.



# 5. Alzheimers disease wave 3
        - Ewv3_chronic_ad
        - Ewv3_confirm_ad
        - Ewv3_newreport_ad
        - Ewv3_ad_diagnosed
        - Ewv3_ad_evr 
        - Ewv3_ad_before
       

COMPUTE Ewv3_ad_sum=SUM(Ewv3_chronic_ad,Ewv3_confirm_ad,Ewv3_newreport_ad,Ewv3_ad_diagnosed,
Ewv3_ad_evr,Ewv3_ad_before).
VARIABLE LABELS  Ewv3_ad_sum 'Sum of new diagnosis of AD at wave 3'.
EXECUTE.

RECODE Ewv3_ad_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv3_ad_report.
VARIABLE LABELS  Ewv3_ad_report 'Whether reported physician-diagnosed AD new at wave 3'.
EXECUTE.


# 5. Memory-related disease wave 3
        - Ewv3_memory_evr 
        - Ewv3_memory_before
        

COMPUTE Ewv3_memory_sum=SUM(Ewv3_memory_evr,Ewv3_memory_before).
VARIABLE LABELS  Ewv3_memory_sum 'Sum of new diagnosis of memory-related disease at wave 3'.
EXECUTE.

RECODE Ewv3_memory_sum (2=1) (1=1) (0=0) INTO Ewv3_memory_report.
VARIABLE LABELS  Ewv3_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 3'.
EXECUTE.




# 6. Dementia + AD wave 3

COMPUTE Ewv3_dementia_ad_sum=SUM(Ewv3_dementia_report,Ewv3_ad_report).
VARIABLE LABELS  Ewv3_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 3'.
EXECUTE.

RECODE Ewv3_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv3_dementia_ad_report.
VARIABLE LABELS  Ewv3_dementia_ad_report 'All new dementia and/or AD cases reported at wave 3'.
EXECUTE.


# 6. Dementia + AD + memory wave 3

COMPUTE Ewv3_anydementia_sum=SUM(Ewv3_dementia_report,Ewv3_ad_report,Ewv3_memory_report).
VARIABLE LABELS  Ewv3_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 3'.
EXECUTE.

RECODE Ewv3_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv3_anydementia_report.
VARIABLE LABELS  Ewv3_anydementia_report 'All new dementia cases reported at wave 3'.
EXECUTE.



# 7. IQCODE wave 3 
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 -2 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1


RECODE Ewv3_heiqb Ewv3_heiqc Ewv3_heiqd Ewv3_heiqe Ewv3_heiqf Ewv3_heiqg Ewv3_heiqh Ewv3_heiqi Ewv3_heiqj
Ewv3_heiqk Ewv3_heiql Ewv3_heiqm Ewv3_heiqn Ewv3_heiqo Ewv3_heiqp Ewv3_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv3_iqcode1 Ewv3_iqcode2 Ewv3_iqcode3 Ewv3_iqcode4 Ewv3_iqcode5 Ewv3_iqcode6 Ewv3_iqcode7 Ewv3_iqcode8
Ewv3_iqcode9 Ewv3_iqcode10 Ewv3_iqcode11 Ewv3_iqcode12 Ewv3_iqcode13 Ewv3_iqcode14 Ewv3_iqcode15 Ewv3_iqcode16.
VARIABLE LABELS Ewv3_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 3)' 
/Ewv3_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 3)'
/Ewv3_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 3)'
/Ewv3_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 3)'
/Ewv3_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 3)'
/Ewv3_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 3)'
/Ewv3_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 3)'
/Ewv3_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 3)'
/Ewv3_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 3)'
/Ewv3_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 3)'
/Ewv3_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 3)'
/Ewv3_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 3)'
/Ewv3_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 3)'
/Ewv3_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 3)'
/Ewv3_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 3)'
/Ewv3_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 3)'.
EXECUTE.

COMPUTE Ewv3_iqcode_sum = Ewv3_iqcode1 + Ewv3_iqcode2 + Ewv3_iqcode3 + Ewv3_iqcode4 + Ewv3_iqcode5 + 
    Ewv3_iqcode6 + Ewv3_iqcode7 + Ewv3_iqcode8 + Ewv3_iqcode9 + Ewv3_iqcode10 + Ewv3_iqcode11 + Ewv3_iqcode12 + 
    Ewv3_iqcode13 + Ewv3_iqcode14 + Ewv3_iqcode15 + Ewv3_iqcode16.
VARIABLE LABELS  Ewv3_iqcode_sum 'Sum of 16 IQCODE items at wave 3'.
EXECUTE.

COMPUTE Ewv3_iqcode_scoreby16=Ewv3_iqcode_sum / 16.
VARIABLE LABELS  Ewv3_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 3)'.
EXECUTE.

RECODE Ewv3_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv3_dementia_iqcode.
VARIABLE LABELS  Ewv3_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 3)'.
EXECUTE.




# 7. Dementia + AD + memory + IQCODE 

COMPUTE Ewv3_anydementia_iqcode_sum=SUM(Ewv3_anydementia_report,Ewv3_dementia_iqcode).
VARIABLE LABELS  Ewv3_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 3'.
EXECUTE.

RECODE Ewv3_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv3_anydementia_iqcode_report.
VARIABLE LABELS  Ewv3_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 3'.
EXECUTE.








# Wave 4 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv4 raw core data "wave_4_elsa_data_v3"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde heagj, heagjr, heagjry, HeBdiaDE
        AD: hedbwad, hedbdad, hedibad, heagi, heagir, heagiry, HeBdiaAD
        Memory: -
        IQCODE: heiqb - heiqq
2. Recode variables of interest into different names noting wave 4 (e.g. wv4_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE


# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde heagj heagjr heagjry HeBdiaDE (ELSE=COPY) INTO 
Ewv4_hedbwde Ewv4_hedbdde Ewv4_hedbsde Ewv4_hedibde Ewv4_heagj Ewv4_heagjr Ewv4_heagjry Ewv4_HeBdiaDE.
VARIABLE LABELS Ewv4_hedbwde 'Chronic: diagnosed dementia fed forward (wave 4)' 
/Ewv4_hedbdde 'Whether confirms dementia diagnosis (wave 4)' /Ewv4_hedbsde 'Whether still has dementia (wave 4)'
/Ewv4_hedibde 'Chronic: dementia diagnosis newly reported (wave 4)' /Ewv4_heagj 'Age told had dementia (wave 4)' 
/Ewv4_heagjr 'Month told had dementia since last interview (wave 4)' /Ewv4_heagjry 'Year told had dementia since last interview (wave 4)'
/Ewv4_HeBdiaDE '(D) Wave when diagnosis of dementia or memory impairment was first reported (wave 4)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad heagi heagir heagiry HeBdiaAD (ELSE=COPY) INTO 
Ewv4_hedbwad Ewv4_hedbdad Ewv4_hedibad Ewv4_heagi Ewv4_heagir Ewv4_heagiry Ewv4_HeBdiaAD.
VARIABLE LABELS Ewv4_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 4)' 
/Ewv4_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 4)' 
/Ewv4_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 4)'
/Ewv4_heagi 'Age told had Alzheimers Disease (wave 4)' 
/Ewv4_heagir 'Month told had Alzheimers Disease since last interview (wave 4)' 
/Ewv4_heagiry 'Year told had Alzheimers Disease since last interview (wave 4)'
/Ewv4_HeBdiaAD '(D) Wave when diagnosis of Alzheimers disease was first reported (wave 4)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE heiqb heiqc heiqd heiqe heiqf heiqg heiqh heiqi heiqj heiqk heiql heiqm heiqn heiqo heiqp heiqq (ELSE=COPY) INTO 
Ewv4_heiqb Ewv4_heiqc Ewv4_heiqd Ewv4_heiqe Ewv4_heiqf Ewv4_heiqg Ewv4_heiqh Ewv4_heiqi Ewv4_heiqj
Ewv4_heiqk Ewv4_heiql Ewv4_heiqm Ewv4_heiqn Ewv4_heiqo Ewv4_heiqp Ewv4_heiqq.
VARIABLE LABELS Ewv4_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 4)' 
/Ewv4_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 4)'
/Ewv4_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 4)'
/Ewv4_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 4)'
/Ewv4_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 4)'
/Ewv4_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 4)'
/Ewv4_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 4)'
/Ewv4_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave4)'
/Ewv4_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 4)'
/Ewv4_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 4)'
/Ewv4_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 4)'
/Ewv4_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 4)'
/Ewv4_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 4)'
/Ewv4_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 4)'
/Ewv4_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 4)'
/Ewv4_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 4)'.
EXECUTE.


# 3. Merge variables from wave 4 core data to the main dataset

SORT CASES BY idauniq.
DATASET ACTIVATE DataSet7.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet7'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 4
Self-reported dementia/AD/memory problem
        Ewv4_hedbwde -> Chronic: diagnosed dementia fed forward (wave 4) 
        Ewv4_hedbdde -> Whether confirms dementia diagnosis (wave 4)
        Ewv4_hedbsde -> Whether still has dementia (wave 4)
        Ewv4_hedibde -> Chronic: dementia diagnosis newly reported (wave 4)
        Ewv4_heagj -> Age told had dementia (wave 4)
        Ewv4_heagjr -> Month told had dementia since last interview (wave 4)
        Ewv4_heagjry -> Year told had dementia since last interview (wave 4)
        Ewv4_HeBdiaDE -> (D) Wave when diagnosis of dementia or memory impairment was first reported (wave 4)
        r4demene -> r4demene:w4 r ever had dementia
        r4demens -> r4demens:w4 R had dementia since last IW
        Ewv4_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 4) 
        Ewv4_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 4)
        Ewv4_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 4)
        Ewv4_heagi -> Age told had Alzheimers Disease (wave 4)' 
        Ewv4_heagir -> Month told had Alzheimers Disease since last interview (wave 4) 
        Ewv4_heagiry -> Year told had Alzheimers Disease since last interview (wave 4)
        Ewv4_HeBdiaAD -> (D) Wave when diagnosis of Alzheimers disease was first reported (wave 4)
        r4alzhe -> r4alzhe:w4 r ever had alzheimers
        r4alzhs -> r4alzhs:w4 R had alzheimers since last IW
        r4memrye -> r4memrye:w4 r ever had memory problem
        r4memrys -> r4memrys:w4 R had memory prob since last IW
        


RECODE Ewv4_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (9=1) INTO 
    Ewv4_chronic_dementia.
VARIABLE LABELS  Ewv4_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 4)'.
EXECUTE.


RECODE Ewv4_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (8=1) INTO 
    Ewv4_chronic_ad.
VARIABLE LABELS  Ewv4_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 4)'.
EXECUTE.


RECODE Ewv4_hedbdde Ewv4_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS) (1=1) (2=0) INTO 
Ewv4_confirm_dementia Ewv4_confirm_ad.
VARIABLE LABELS  Ewv4_confirm_dementia 'Whether confirms dementia diagnosis (wave 4)' /Ewv4_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 4)'.
EXECUTE.


RECODE Ewv4_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv4_still_dementia.
VARIABLE LABELS  Ewv4_still_dementia 'Whether still has dementia (wave 4)'.
EXECUTE.


RECODE Ewv4_hedibde Ewv4_hedibad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
Ewv4_newreport_dementia Ewv4_newreport_ad.
VARIABLE LABELS  Ewv4_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 4)' 
/Ewv4_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 4)'.
EXECUTE.


RECODE Ewv4_HeBdiaDE Ewv4_HeBdiaAD (0=0) (1=1) (2=1) (3=1) (4=1) (-8=SYSMIS) (-9=SYSMIS)  INTO 
Ewv4_dementia_diagnosed Ewv4_ad_diagnosed.
VARIABLE LABELS  Ewv4_dementia_diagnosed 'Ever reported dementia or memory impairment diagnosed at wave 4' 
/Ewv4_ad_diagnosed 'Ever reported Alzheimers Disease diagnosed at wave 4'.
EXECUTE.


RECODE r4demene r4demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv4_dementia_evr Ewv4_dementia_before.
VARIABLE LABELS Ewv4_dementia_evr 'Ever had dementia (wave 4)' 
/Ewv4_dementia_before 'Had dementia since last interview (wave 3)'.
EXECUTE.



RECODE r4alzhe r4alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv4_ad_evr Ewv4_ad_before.
VARIABLE LABELS Ewv4_ad_evr 'Ever had Alzheimers Disease (wave 4)' 
/Ewv4_ad_before 'Had Alzheimers Disease since last interview (wave 3)'.
EXECUTE.


RECODE r4memrye r4memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv4_memory_evr Ewv4_memory_before.
VARIABLE LABELS Ewv4_memory_evr 'Ever had memory problem (wave 4)' 
/Ewv4_memory_before 'Had memory problem since last interview (wave 3)'.
EXECUTE.





# 4. Age, Month and Year of diagnosis
        Ewv4_heagj -> Age told had dementia (wave 4)
        Ewv4_heagjr -> Month told had dementia since last interview (wave 4)
        Ewv4_heagjry -> Year told had dementia since last interview (wave 4)
        Ewv4_heagi -> Age told had Alzheimers Disease (wave 4)
        Ewv4_heagir -> Month told had Alzheimers Disease since last interview (wave 4)
        Ewv4_heagiry -> Year told had Alzheimers Disease since last interview (wave 4)

    

RECODE Ewv4_heagj Ewv4_heagjr Ewv4_heagjry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv4_dementia_age Ewv4_dementia_month Ewv4_dementia_year.
VARIABLE LABELS Ewv4_dementia_age 'Age told had dementia (wave 4)' 
/Ewv4_dementia_month 'Month told had dementia in last 2 years (wave 4)' 
/Ewv4_dementia_year 'Year told had dementia in last 2 years (wave 4)'.
EXECUTE.


RECODE Ewv4_heagi Ewv4_heagir Ewv4_heagiry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv4_ad_age Ewv4_ad_month Ewv4_ad_year.
VARIABLE LABELS Ewv4_ad_age 'Age told had Alzheimers Disease (wave 4)' 
/Ewv4_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 4)' 
/Ewv4_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 4)'.
EXECUTE.




# 5. Dementia wave 4
        - Ewv4_chronic_dementia
        - Ewv4_confirm_dementia 
        - Ewv4_still_dementia
        - Ewv4_newreport_dementia
        - Ewv4_dementia_diagnosed 
        - Ewv4_dementia_evr 
        - Ewv4_dementia_before 
   

COMPUTE Ewv4_dementia_sum=SUM(Ewv4_chronic_dementia,Ewv4_confirm_dementia,Ewv4_still_dementia,Ewv4_newreport_dementia,
Ewv4_dementia_diagnosed,Ewv4_dementia_evr,Ewv4_dementia_before).
VARIABLE LABELS Ewv4_dementia_sum 'Sum of new diagnosis of dementia at wave 4'.
EXECUTE.

RECODE Ewv4_dementia_sum (7=1) (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv4_dementia_report.
VARIABLE LABELS  Ewv4_dementia_report 'Whether reported physician-diagnosed dementia new at wave 4'.
EXECUTE.



# 5. Alzheimers disease wave 4
        - Ewv4_chronic_ad
        - Ewv4_confirm_ad
        - Ewv4_newreport_ad
        - Ewv4_ad_diagnosed
        - Ewv4_ad_evr 
        - Ewv4_ad_before
       

COMPUTE Ewv4_ad_sum=SUM(Ewv4_chronic_ad,Ewv4_confirm_ad,Ewv4_newreport_ad,Ewv4_ad_diagnosed,
Ewv4_ad_evr,Ewv4_ad_before).
VARIABLE LABELS  Ewv4_ad_sum 'Sum of new diagnosis of AD at wave 4'.
EXECUTE.

RECODE Ewv4_ad_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv4_ad_report.
VARIABLE LABELS  Ewv4_ad_report 'Whether reported physician-diagnosed AD new at wave 4'.
EXECUTE.


# 5. Memory-related disease wave 4
        - Ewv4_memory_evr 
        - Ewv4_memory_before
        

COMPUTE Ewv4_memory_sum=SUM(Ewv4_memory_evr,Ewv4_memory_before).
VARIABLE LABELS  Ewv4_memory_sum 'Sum of new diagnosis of memory-related disease at wave 4'.
EXECUTE.

RECODE Ewv4_memory_sum (2=1) (1=1) (0=0) INTO Ewv4_memory_report.
VARIABLE LABELS  Ewv4_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 4'.
EXECUTE.



# 6. Dementia + AD wave 4 

COMPUTE Ewv4_dementia_ad_sum=SUM(Ewv4_dementia_report,Ewv4_ad_report).
VARIABLE LABELS  Ewv4_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 4'.
EXECUTE.

RECODE Ewv4_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv4_dementia_ad_report.
VARIABLE LABELS  Ewv4_dementia_ad_report 'All new dementia and/or AD cases reported at wave 4'.
EXECUTE.


# 6. Dementia + AD + memory wave 4

COMPUTE Ewv4_anydementia_sum=SUM(Ewv4_dementia_report,Ewv4_ad_report,Ewv4_memory_report).
VARIABLE LABELS  Ewv4_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 4'.
EXECUTE.

RECODE Ewv4_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv4_anydementia_report.
VARIABLE LABELS  Ewv4_anydementia_report 'All new dementia cases reported at wave 4'.
EXECUTE.





# 7. IQCODE wave 4 
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 -2 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1


RECODE Ewv4_heiqb Ewv4_heiqc Ewv4_heiqd Ewv4_heiqe Ewv4_heiqf Ewv4_heiqg Ewv4_heiqh Ewv4_heiqi Ewv4_heiqj
Ewv4_heiqk Ewv4_heiql Ewv4_heiqm Ewv4_heiqn Ewv4_heiqo Ewv4_heiqp Ewv4_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv4_iqcode1 Ewv4_iqcode2 Ewv4_iqcode3 Ewv4_iqcode4 Ewv4_iqcode5 Ewv4_iqcode6 Ewv4_iqcode7 Ewv4_iqcode8
Ewv4_iqcode9 Ewv4_iqcode10 Ewv4_iqcode11 Ewv4_iqcode12 Ewv4_iqcode13 Ewv4_iqcode14 Ewv4_iqcode15 Ewv4_iqcode16.
VARIABLE LABELS Ewv4_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 4)' 
/Ewv4_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 4)'
/Ewv4_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 4)'
/Ewv4_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 4)'
/Ewv4_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 4)'
/Ewv4_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 4)'
/Ewv4_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 4)'
/Ewv4_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 4)'
/Ewv4_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 4)'
/Ewv4_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 4)'
/Ewv4_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 4)'
/Ewv4_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 4)'
/Ewv4_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 4)'
/Ewv4_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 4)'
/Ewv4_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 4)'
/Ewv4_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 4)'.
EXECUTE.

COMPUTE Ewv4_iqcode_sum = Ewv4_iqcode1 + Ewv4_iqcode2 + Ewv4_iqcode3 + Ewv4_iqcode4 + Ewv4_iqcode5 + 
    Ewv4_iqcode6 + Ewv4_iqcode7 + Ewv4_iqcode8 + Ewv4_iqcode9 + Ewv4_iqcode10 + Ewv4_iqcode11 + Ewv4_iqcode12 + 
    Ewv4_iqcode13 + Ewv4_iqcode14 + Ewv4_iqcode15 + Ewv4_iqcode16.
VARIABLE LABELS  Ewv4_iqcode_sum 'Sum of 16 IQCODE items at wave 4'.
EXECUTE.

COMPUTE Ewv4_iqcode_scoreby16=Ewv4_iqcode_sum / 16.
VARIABLE LABELS  Ewv4_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 4)'.
EXECUTE.

RECODE Ewv4_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv4_dementia_iqcode.
VARIABLE LABELS  Ewv4_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 4)'.
EXECUTE.




# 7. Dementia + AD + memory + IQCODE 

COMPUTE Ewv4_anydementia_iqcode_sum=SUM(Ewv4_anydementia_report,Ewv4_dementia_iqcode).
VARIABLE LABELS  Ewv4_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 4'.
EXECUTE.

RECODE Ewv4_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv4_anydementia_iqcode_report.
VARIABLE LABELS  Ewv4_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 4'.
EXECUTE.







# Wave 5 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv5 raw core data "wave_5_elsa_data_v4"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde heagj, heagjr, heagjry, HeBdiaDE
        AD: hedbwad, hedbdad, hedibad, heagi, heagir, heagiry, HeBdiaAD
        Memory: -
        IQCODE: heiqb - heiqq
2. Recode variables of interest into different names noting wave 5 (e.g. Ewv5_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE



# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde heagj heagjr heagjry HeBdiaDE (ELSE=COPY) INTO 
Ewv5_hedbwde Ewv5_hedbdde Ewv5_hedbsde Ewv5_hedibde Ewv5_heagj Ewv5_heagjr Ewv5_heagjry Ewv5_HeBdiaDE.
VARIABLE LABELS Ewv5_hedbwde 'Chronic: diagnosed dementia fed forward (wave 5)' 
/Ewv5_hedbdde 'Whether confirms dementia diagnosis (wave 5)' /Ewv5_hedbsde 'Whether still has dementia (wave 5)'
/Ewv5_hedibde 'Chronic: dementia diagnosis newly reported (wave 5)' /Ewv5_heagj 'Age told had dementia (wave 5)' 
/Ewv5_heagjr 'Month told had dementia since last interview (wave 5)' /Ewv5_heagjry 'Year told had dementia since last interview (wave 5)'
/Ewv5_HeBdiaDE '(D) Wave when diagnosis of dementia or memory impairment was first reported (wave 5)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad heagi heagir heagiry HeBdiaAD (ELSE=COPY) INTO 
Ewv5_hedbwad Ewv5_hedbdad Ewv5_hedibad Ewv5_heagi Ewv5_heagir Ewv5_heagiry Ewv5_HeBdiaAD.
VARIABLE LABELS Ewv5_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 5)' 
/Ewv5_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 5)' 
/Ewv5_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 5)'
/Ewv5_heagi 'Age told had Alzheimers Disease (wave 5)' 
/Ewv5_heagir 'Month told had Alzheimers Disease since last interview (wave 5)' 
/Ewv5_heagiry 'Year told had Alzheimers Disease since last interview (wave 5)'
/Ewv5_HeBdiaAD '(D) Wave when diagnosis of Alzheimers disease was first reported (wave 5)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE heiqb heiqc heiqd heiqe heiqf heiqg heiqh heiqi heiqj heiqk heiql heiqm heiqn heiqo heiqp heiqq (ELSE=COPY) INTO 
Ewv5_heiqb Ewv5_heiqc Ewv5_heiqd Ewv5_heiqe Ewv5_heiqf Ewv5_heiqg Ewv5_heiqh Ewv5_heiqi Ewv5_heiqj
Ewv5_heiqk Ewv5_heiql Ewv5_heiqm Ewv5_heiqn Ewv5_heiqo Ewv5_heiqp Ewv5_heiqq.
VARIABLE LABELS Ewv5_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 5)' 
/Ewv5_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 5)'
/Ewv5_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 5)'
/Ewv5_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 5)'
/Ewv5_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 5)'
/Ewv5_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 5)'
/Ewv5_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 5)'
/Ewv5_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 5)'
/Ewv5_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 5)'
/Ewv5_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 5)'
/Ewv5_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 5)'
/Ewv5_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 5)'
/Ewv5_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 5)'
/Ewv5_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 5)'
/Ewv5_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 5)'
/Ewv5_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 5)'.
EXECUTE.


# 3. Merge variables from wave 5 core data to the main dataset

DATASET ACTIVATE DataSet2.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet4.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet4'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 5
Self-reported dementia/AD/memory problem
        Ewv5_hedbwde -> Chronic: diagnosed dementia fed forward (wave 5) 
        Ewv5_hedbdde -> Whether confirms dementia diagnosis (wave 5)
        Ewv5_hedbsde -> Whether still has dementia (wave 5)
        Ewv5_hedibde -> Chronic: dementia diagnosis newly reported (wave 5)
        Ewv5_heagj -> Age told had dementia (wave 5)
        Ewv5_heagjr -> Month told had dementia since last interview (wave 5)
        Ewv5_heagjry -> Year told had dementia since last interview (wave 5)
        Ewv5_HeBdiaDE -> (D) Wave when diagnosis of dementia or memory impairment was first reported (wave 5)
        r5demene -> r5demene:w5 r ever had dementia
        r5demens -> r5demens:w5 R had dementia since last IW
        Ewv5_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 5) 
        Ewv5_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 5)
        Ewv5_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 5)
        Ewv5_heagi -> Age told had Alzheimers Disease (wave 5)
        Ewv5_heagir -> Month told had Alzheimers Disease since last interview (wave 5) 
        Ewv5_heagiry -> Year told had Alzheimers Disease since last interview (wave 5)
        Ewv5_HeBdiaAD -> (D) Wave when diagnosis of Alzheimers disease was first reported (wave 5)
        r5alzhe -> r5alzhe:w5 r ever had alzheimers
        r5alzhs -> r5alzhs:w5 R had alzheimers since last IW
        r5memrye -> r5memrye:w5 r ever had memory problem
        r5memrys -> r5memrys:w5 R had memory prob since last IW
        


RECODE Ewv5_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (9=1) INTO 
    Ewv5_chronic_dementia.
VARIABLE LABELS  Ewv5_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 5)'.
EXECUTE.


RECODE Ewv5_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (8=1) INTO 
    Ewv5_chronic_ad.
VARIABLE LABELS  Ewv5_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 5)'.
EXECUTE.


RECODE Ewv5_hedbdde Ewv5_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS) (1=1) (2=0) INTO 
Ewv5_confirm_dementia Ewv5_confirm_ad.
VARIABLE LABELS  Ewv5_confirm_dementia 'Whether confirms dementia diagnosis (wave 5)' /Ewv5_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 5)'.
EXECUTE.


RECODE Ewv5_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv5_still_dementia.
VARIABLE LABELS  Ewv5_still_dementia 'Whether still has dementia (wave 5)'.
EXECUTE.


RECODE Ewv5_hedibde Ewv5_hedibad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
Ewv5_newreport_dementia Ewv5_newreport_ad.
VARIABLE LABELS  Ewv5_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 5)' 
/Ewv5_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 5)'.
EXECUTE.


RECODE Ewv5_HeBdiaDE Ewv5_HeBdiaAD (0=0) (1=1) (2=1) (3=1) (4=1) (5=1) (-8=SYSMIS) (-9=SYSMIS)  INTO 
Ewv5_dementia_diagnosed Ewv5_ad_diagnosed.
VARIABLE LABELS  Ewv5_dementia_diagnosed 'Ever reported dementia or memory impairment diagnosed at wave 5' 
/Ewv5_ad_diagnosed 'Ever reported Alzheimers Disease diagnosed at wave 5'.
EXECUTE.


RECODE r5demene r5demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv5_dementia_evr Ewv5_dementia_before.
VARIABLE LABELS Ewv5_dementia_evr 'Ever had dementia (wave 5)' 
/Ewv5_dementia_before 'Had dementia since last interview (wave 4)'.
EXECUTE.



RECODE r5alzhe r5alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv5_ad_evr Ewv5_ad_before.
VARIABLE LABELS Ewv5_ad_evr 'Ever had Alzheimers Disease (wave 5)' 
/Ewv5_ad_before 'Had Alzheimers Disease since last interview (wave 4)'.
EXECUTE.


RECODE r5memrye r5memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv5_memory_evr Ewv5_memory_before.
VARIABLE LABELS Ewv5_memory_evr 'Ever had memory problem (wave 5)' 
/Ewv5_memory_before 'Had memory problem since last interview (wave 4)'.
EXECUTE.






# 4. Age, Month and Year of diagnosis
        Ewv5_heagj -> Age told had dementia (wave 5)
        Ewv5_heagjr -> Month told had dementia since last interview (wave 5)
        Ewv5_heagjry -> Year told had dementia since last interview (wave 5)
        Ewv5_heagi -> Age told had Alzheimers Disease (wave 5)
        Ewv5_heagir -> Month told had Alzheimers Disease since last interview (wave 5)
        Ewv5_heagiry -> Year told had Alzheimers Disease since last interview (wave 5)

    

RECODE Ewv5_heagj Ewv5_heagjr Ewv5_heagjry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv5_dementia_age Ewv5_dementia_month Ewv5_dementia_year.
VARIABLE LABELS Ewv5_dementia_age 'Age told had dementia (wave 5)' 
/Ewv5_dementia_month 'Month told had dementia in last 2 years (wave 5)' 
/Ewv5_dementia_year 'Year told had dementia in last 2 years (wave 5)'.
EXECUTE.


RECODE Ewv5_heagi Ewv5_heagir Ewv5_heagiry (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv5_ad_age Ewv5_ad_month Ewv5_ad_year.
VARIABLE LABELS Ewv5_ad_age 'Age told had Alzheimers Disease (wave 5)' 
/Ewv5_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 5)' 
/Ewv5_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 5)'.
EXECUTE.



# 5. Dementia wave 5
        - Ewv5_chronic_dementia
        - Ewv5_confirm_dementia 
        - Ewv5_still_dementia
        - Ewv5_newreport_dementia
        - Ewv5_dementia_diagnosed 
        - Ewv5_dementia_evr 
        - Ewv5_dementia_before 
   

COMPUTE Ewv5_dementia_sum=SUM(Ewv5_chronic_dementia,Ewv5_confirm_dementia,Ewv5_still_dementia,Ewv5_newreport_dementia,
Ewv5_dementia_diagnosed,Ewv5_dementia_evr,Ewv5_dementia_before).
VARIABLE LABELS Ewv5_dementia_sum 'Sum of new diagnosis of dementia at wave 5'.
EXECUTE.

RECODE Ewv5_dementia_sum (7=1) (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv5_dementia_report.
VARIABLE LABELS  Ewv5_dementia_report 'Whether reported physician-diagnosed dementia new at wave 5'.
EXECUTE.



# 5. Alzheimers disease wave 5
        - Ewv5_chronic_ad
        - Ewv5_confirm_ad
        - Ewv5_newreport_ad
        - Ewv5_ad_diagnosed
        - Ewv5_ad_evr 
        - Ewv5_ad_before
       

COMPUTE Ewv5_ad_sum=SUM(Ewv5_chronic_ad,Ewv5_confirm_ad,Ewv5_newreport_ad,Ewv5_ad_diagnosed,
Ewv5_ad_evr,Ewv5_ad_before).
VARIABLE LABELS  Ewv5_ad_sum 'Sum of new diagnosis of AD at wave 5'.
EXECUTE.

RECODE Ewv5_ad_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv5_ad_report.
VARIABLE LABELS  Ewv5_ad_report 'Whether reported physician-diagnosed AD new at wave 5'.
EXECUTE.


# 5. Memory-related disease wave 5
        - Ewv5_memory_evr 
        - Ewv5_memory_before
        

COMPUTE Ewv5_memory_sum=SUM(Ewv5_memory_evr,Ewv5_memory_before).
VARIABLE LABELS  Ewv5_memory_sum 'Sum of new diagnosis of memory-related disease at wave 5'.
EXECUTE.

RECODE Ewv5_memory_sum (2=1) (1=1) (0=0) INTO Ewv5_memory_report.
VARIABLE LABELS  Ewv5_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 5'.
EXECUTE.




# 6. Dementia + AD wave 5 

COMPUTE Ewv5_dementia_ad_sum=SUM(Ewv5_dementia_report,Ewv5_ad_report).
VARIABLE LABELS  Ewv5_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 5'.
EXECUTE.

RECODE Ewv5_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv5_dementia_ad_report.
VARIABLE LABELS  Ewv5_dementia_ad_report 'All new dementia and/or AD cases reported at wave 5'.
EXECUTE.


# 6. Dementia + AD + memory wave 5 

COMPUTE Ewv5_anydementia_sum=SUM(Ewv5_dementia_report,Ewv5_ad_report,Ewv5_memory_report).
VARIABLE LABELS  Ewv5_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 5'.
EXECUTE.

RECODE Ewv5_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv5_anydementia_report.
VARIABLE LABELS  Ewv5_anydementia_report 'All new dementia cases reported at wave 5'.
EXECUTE.



# 7. IQCODE wave 5
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 -2 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items (dont use SUM function, just add the items)
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1


RECODE Ewv5_heiqb Ewv5_heiqc Ewv5_heiqd Ewv5_heiqe Ewv5_heiqf Ewv5_heiqg Ewv5_heiqh Ewv5_heiqi Ewv5_heiqj
Ewv5_heiqk Ewv5_heiql Ewv5_heiqm Ewv5_heiqn Ewv5_heiqo Ewv5_heiqp Ewv5_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv5_iqcode1 Ewv5_iqcode2 Ewv5_iqcode3 Ewv5_iqcode4 Ewv5_iqcode5 Ewv5_iqcode6 Ewv5_iqcode7 Ewv5_iqcode8
Ewv5_iqcode9 Ewv5_iqcode10 Ewv5_iqcode11 Ewv5_iqcode12 Ewv5_iqcode13 Ewv5_iqcode14 Ewv5_iqcode15 Ewv5_iqcode16.
VARIABLE LABELS Ewv5_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 5)' 
/Ewv5_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 5)'
/Ewv5_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 5)'
/Ewv5_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 5)'
/Ewv5_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 5)'
/Ewv5_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 5)'
/Ewv5_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 5)'
/Ewv5_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 5)'
/Ewv5_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 5)'
/Ewv5_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 5)'
/Ewv5_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 5)'
/Ewv5_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 5)'
/Ewv5_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 5)'
/Ewv5_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 5)'
/Ewv5_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 5)'
/Ewv5_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 5)'.
EXECUTE.

COMPUTE Ewv5_iqcode_sum = Ewv5_iqcode1 + Ewv5_iqcode2 + Ewv5_iqcode3 + Ewv5_iqcode4 + Ewv5_iqcode5 + 
    Ewv5_iqcode6 + Ewv5_iqcode7 + Ewv5_iqcode8 + Ewv5_iqcode9 + Ewv5_iqcode10 + Ewv5_iqcode11 + Ewv5_iqcode12 + 
    Ewv5_iqcode13 + Ewv5_iqcode14 + Ewv5_iqcode15 + Ewv5_iqcode16.
VARIABLE LABELS  Ewv5_iqcode_sum 'Sum of 16 IQCODE items at wave 5'.
EXECUTE.

COMPUTE Ewv5_iqcode_scoreby16=Ewv5_iqcode_sum / 16.
VARIABLE LABELS  Ewv5_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 5)'.
EXECUTE.

RECODE Ewv5_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv5_dementia_iqcode.
VARIABLE LABELS  Ewv5_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 5)'.
EXECUTE.





# 7. Dementia + AD + memory + IQCODE

COMPUTE Ewv5_anydementia_iqcode_sum=SUM(Ewv5_anydementia_report,Ewv5_dementia_iqcode).
VARIABLE LABELS  Ewv5_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 5'.
EXECUTE.

RECODE Ewv5_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv5_anydementia_iqcode_report.
VARIABLE LABELS  Ewv5_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 5'.
EXECUTE.







# Wave 6 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv6 raw core data "wave_6_elsa_data_v2"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde HeAgj, HeAgjR, HeAgjRY
        AD: hedbwad, hedbdad, hedibad, HeAgi, HeAgiR, HeAgiRY
        Memory: -
        IQCODE: Heiqb - Heiqq
2. Recode variables of interest into different names noting wave 6 (e.g. Ewv6_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE



# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde HeAgj HeAgjR HeAgjRY (ELSE=COPY) INTO 
Ewv6_hedbwde Ewv6_hedbdde Ewv6_hedbsde Ewv6_hedibde Ewv6_HeAgj Ewv6_HeAgjR Ewv6_HeAgjRY.
VARIABLE LABELS Ewv6_hedbwde 'Chronic: diagnosed dementia fed forward (wave 6)' 
/Ewv6_hedbdde 'Whether confirms dementia diagnosis (wave 6)' /Ewv6_hedbsde 'Whether still has dementia (wave 6)'
/Ewv6_hedibde 'Chronic: dementia diagnosis newly reported (wave 6)' /Ewv6_HeAgj 'Age told had dementia (wave 6)' 
/Ewv6_HeAgjR 'Month told had dementia since last interview (wave 6)' /Ewv6_HeAgjRY 'Year told had dementia since last interview (wave 6)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad HeAgi HeAgiR HeAgiRY (ELSE=COPY) INTO 
Ewv6_hedbwad Ewv6_hedbdad Ewv6_hedibad Ewv6_HeAgi Ewv6_HeAgiR Ewv6_HeAgiRY.
VARIABLE LABELS Ewv6_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 6)' 
/Ewv6_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 6)' 
/Ewv6_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 6)'
/Ewv6_HeAgi 'Age told had Alzheimers Disease (wave 6)' 
/Ewv6_HeAgiR 'Month told had Alzheimers Disease since last interview (wave 6)' 
/Ewv6_HeAgiRY 'Year told had Alzheimers Disease since last interview (wave 6)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE Heiqb Heiqc Heiqd Heiqe Heiqf Heiqg Heiqh Heiqi Heiqj Heiqk Heiql Heiqm Heiqn Heiqo Heiqp Heiqq (ELSE=COPY) INTO 
Ewv6_heiqb Ewv6_heiqc Ewv6_heiqd Ewv6_heiqe Ewv6_heiqf Ewv6_heiqg Ewv6_heiqh Ewv6_heiqi Ewv6_heiqj
Ewv6_heiqk Ewv6_heiql Ewv6_heiqm Ewv6_heiqn Ewv6_heiqo Ewv6_heiqp Ewv6_heiqq.
VARIABLE LABELS Ewv6_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 6)' 
/Ewv6_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 6)'
/Ewv6_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 6)'
/Ewv6_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 6)'
/Ewv6_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 6)'
/Ewv6_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 6)'
/Ewv6_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 6)'
/Ewv6_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 6)'
/Ewv6_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 6)'
/Ewv6_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 6)'
/Ewv6_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 6)'
/Ewv6_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 6)'
/Ewv6_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 6)'
/Ewv6_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 6)'
/Ewv6_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 6)'
/Ewv6_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 6)'.
EXECUTE.




# 3. Merge variables from wave 6 core data to the main dataset

DATASET ACTIVATE DataSet2.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet6.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet6'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 6
Self-reported dementia/AD/memory problem
        Ewv6_hedbwde -> Chronic: diagnosed dementia fed forward (wave 6) 
        Ewv6_hedbdde -> Whether confirms dementia diagnosis (wave 6)
        Ewv6_hedbsde -> Whether still has dementia (wave 6)
        Ewv6_hedibde -> Chronic: dementia diagnosis newly reported (wave 6)
        Ewv6_HeAgj -> Age told had dementia (wave 6)
        Ewv6_HeAgjR -> Month told had dementia since last interview (wave 6)
        Ewv6_HeAgjRY -> Year told had dementia since last interview (wave 6)
        r6demene -> r6demene:w6 r ever had dementia
        r6demens -> r6demens:w6 R had dementia since last IW
        Ewv6_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 6) 
        Ewv6_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 6)
        Ewv6_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 6)
        Ewv6_HeAgi -> Age told had Alzheimers Disease (wave 6)
        Ewv6_HeAgiR -> Month told had Alzheimers Disease since last interview (wave 6) 
        Ewv6_HeAgiRY -> Year told had Alzheimers Disease since last interview (wave 6)
        r6alzhe -> r6alzhe:w6 r ever had alzheimers
        r6alzhs -> r6alzhs:w6 R had alzheimers since last IW
        r6memrye -> r6memrye:w6 r ever had memory problem
        r6memrys -> r6memrys:w6 R had memory prob since last IW



RECODE Ewv6_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (9=1) INTO 
    Ewv6_chronic_dementia.
VARIABLE LABELS  Ewv6_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 6)'.
EXECUTE.


RECODE Ewv6_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (8=1) INTO 
    Ewv6_chronic_ad.
VARIABLE LABELS  Ewv6_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 6)'.
EXECUTE.


RECODE Ewv6_hedbdde Ewv6_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS) (1=1) (2=0) INTO 
Ewv6_confirm_dementia Ewv6_confirm_ad.
VARIABLE LABELS  Ewv6_confirm_dementia 'Whether confirms dementia diagnosis (wave 6)' /Ewv6_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 6)'.
EXECUTE.


RECODE Ewv6_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv6_still_dementia.
VARIABLE LABELS  Ewv6_still_dementia 'Whether still has dementia (wave 6)'.
EXECUTE.


RECODE Ewv6_hedibde Ewv6_hedibad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
Ewv6_newreport_dementia Ewv6_newreport_ad.
VARIABLE LABELS  Ewv6_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 6)' 
/Ewv6_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 6)'.
EXECUTE.


RECODE r6demene r6demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv6_dementia_evr Ewv6_dementia_before.
VARIABLE LABELS Ewv6_dementia_evr 'Ever had dementia (wave 6)' 
/Ewv6_dementia_before 'Had dementia since last interview (wave 5)'.
EXECUTE.



RECODE r6alzhe r6alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv6_ad_evr Ewv6_ad_before.
VARIABLE LABELS Ewv6_ad_evr 'Ever had Alzheimers Disease (wave 6)' 
/Ewv6_ad_before 'Had Alzheimers Disease since last interview (wave 5)'.
EXECUTE.


RECODE r6memrye r6memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv6_memory_evr Ewv6_memory_before.
VARIABLE LABELS Ewv6_memory_evr 'Ever had memory problem (wave 6)' 
/Ewv6_memory_before 'Had memory problem since last interview (wave 5)'.
EXECUTE.






# 4. Age, Month and Year of diagnosis
        Ewv6_HeAgj -> Age told had dementia (wave 6)
        Ewv6_HeAgjR -> Month told had dementia since last interview (wave 6)
        Ewv6_HeAgjRY -> Year told had dementia since last interview (wave 6)
        Ewv6_HeAgi -> Age told had Alzheimers Disease (wave 6)
        Ewv6_HeAgiR-> Month told had Alzheimers Disease since last interview (wave 6)
        Ewv6_HeAgiRY -> Year told had Alzheimers Disease since last interview (wave 6)

    

RECODE Ewv6_HeAgj Ewv6_HeAgjR Ewv6_HeAgjRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv6_dementia_age Ewv6_dementia_month Ewv6_dementia_year.
VARIABLE LABELS Ewv6_dementia_age 'Age told had dementia (wave 6)' 
/Ewv6_dementia_month 'Month told had dementia in last 2 years (wave 6)' 
/Ewv6_dementia_year 'Year told had dementia in last 2 years (wave 6)'.
EXECUTE.


RECODE Ewv6_HeAgi Ewv6_HeAgiR Ewv6_HeAgiRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv6_ad_age Ewv6_ad_month Ewv6_ad_year.
VARIABLE LABELS Ewv6_ad_age 'Age told had Alzheimers Disease (wave 6)' 
/Ewv6_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 6)' 
/Ewv6_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 6)'.
EXECUTE.





# 5. Dementia wave 6
        - Ewv6_chronic_dementia
        - Ewv6_confirm_dementia 
        - Ewv6_still_dementia
        - Ewv6_newreport_dementia
        - Ewv6_dementia_evr 
        - Ewv6_dementia_before 
   

COMPUTE Ewv6_dementia_sum=SUM(Ewv6_chronic_dementia,Ewv6_confirm_dementia,Ewv6_still_dementia,Ewv6_newreport_dementia,
Ewv6_dementia_evr,Ewv6_dementia_before).
VARIABLE LABELS Ewv6_dementia_sum 'Sum of new diagnosis of dementia at wave 6'.
EXECUTE.

RECODE Ewv6_dementia_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv6_dementia_report.
VARIABLE LABELS  Ewv6_dementia_report 'Whether reported physician-diagnosed dementia new at wave 6'.
EXECUTE.



# 5. Alzheimers disease wave 6
        - Ewv6_chronic_ad
        - Ewv6_confirm_ad
        - Ewv6_newreport_ad
        - Ewv6_ad_evr 
        - Ewv6_ad_before
       

COMPUTE Ewv6_ad_sum=SUM(Ewv6_chronic_ad,Ewv6_confirm_ad,Ewv6_newreport_ad,
Ewv6_ad_evr,Ewv6_ad_before).
VARIABLE LABELS  Ewv6_ad_sum 'Sum of new diagnosis of AD at wave 6'.
EXECUTE.

RECODE Ewv6_ad_sum (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv6_ad_report.
VARIABLE LABELS  Ewv6_ad_report 'Whether reported physician-diagnosed AD new at wave 6'.
EXECUTE.


# 5. Memory-related disease wave 6
        - Ewv6_memory_evr 
        - Ewv6_memory_before
        

COMPUTE Ewv6_memory_sum=SUM(Ewv6_memory_evr,Ewv6_memory_before).
VARIABLE LABELS  Ewv6_memory_sum 'Sum of new diagnosis of memory-related disease at wave 6'.
EXECUTE.

RECODE Ewv6_memory_sum (2=1) (1=1) (0=0) INTO Ewv6_memory_report.
VARIABLE LABELS  Ewv6_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 6'.
EXECUTE.




# 6. Dementia + AD wave 6 

COMPUTE Ewv6_dementia_ad_sum=SUM(Ewv6_dementia_report,Ewv6_ad_report).
VARIABLE LABELS  Ewv6_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 6'.
EXECUTE.

RECODE Ewv6_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv6_dementia_ad_report.
VARIABLE LABELS  Ewv6_dementia_ad_report 'All new dementia and/or AD cases reported at wave 6'.
EXECUTE.


# 6. Dementia + AD + memory wave 6

COMPUTE Ewv6_anydementia_sum=SUM(Ewv6_dementia_report,Ewv6_ad_report,Ewv6_memory_report).
VARIABLE LABELS  Ewv6_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 6'.
EXECUTE.

RECODE Ewv6_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv6_anydementia_report.
VARIABLE LABELS  Ewv6_anydementia_report 'All new dementia cases reported at wave 6'.
EXECUTE.







# 7. IQCODE wave 6
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 -2 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items (dont use SUM function, just add the items)
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥ 3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1
.


RECODE Ewv6_heiqb Ewv6_heiqc Ewv6_heiqd Ewv6_heiqe Ewv6_heiqf Ewv6_heiqg Ewv6_heiqh Ewv6_heiqi Ewv6_heiqj
Ewv6_heiqk Ewv6_heiql Ewv6_heiqm Ewv6_heiqn Ewv6_heiqo Ewv6_heiqp Ewv6_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv6_iqcode1 Ewv6_iqcode2 Ewv6_iqcode3 Ewv6_iqcode4 Ewv6_iqcode5 Ewv6_iqcode6 Ewv6_iqcode7 Ewv6_iqcode8
Ewv6_iqcode9 Ewv6_iqcode10 Ewv6_iqcode11 Ewv6_iqcode12 Ewv6_iqcode13 Ewv6_iqcode14 Ewv6_iqcode15 Ewv6_iqcode16.
VARIABLE LABELS Ewv6_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 6)' 
/Ewv6_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 6)'
/Ewv6_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 6)'
/Ewv6_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 6)'
/Ewv6_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 6)'
/Ewv6_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 6)'
/Ewv6_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 6)'
/Ewv6_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 6)'
/Ewv6_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 6)'
/Ewv6_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 6)'
/Ewv6_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 6)'
/Ewv6_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 6)'
/Ewv6_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 6)'
/Ewv6_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 6)'
/Ewv6_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 6)'
/Ewv6_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 6)'.
EXECUTE.

COMPUTE Ewv6_iqcode_sum = Ewv6_iqcode1 + Ewv6_iqcode2 + Ewv6_iqcode3 + Ewv6_iqcode4 + Ewv6_iqcode5 + 
    Ewv6_iqcode6 + Ewv6_iqcode7 + Ewv6_iqcode8 + Ewv6_iqcode9 + Ewv6_iqcode10 + Ewv6_iqcode11 + Ewv6_iqcode12 + 
    Ewv6_iqcode13 + Ewv6_iqcode14 + Ewv6_iqcode15 + Ewv6_iqcode16.
VARIABLE LABELS  Ewv6_iqcode_sum 'Sum of 16 IQCODE items at wave 6'.
EXECUTE.

COMPUTE Ewv6_iqcode_scoreby16=Ewv6_iqcode_sum / 16.
VARIABLE LABELS  Ewv6_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 6)'.
EXECUTE.

RECODE Ewv6_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv6_dementia_iqcode.
VARIABLE LABELS  Ewv6_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 6)'.
EXECUTE.




# 7. Dementia + AD + memory + IQCODE 

COMPUTE Ewv6_anydementia_iqcode_sum=SUM(Ewv6_anydementia_report,Ewv6_dementia_iqcode).
VARIABLE LABELS  Ewv6_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 6'.
EXECUTE.

RECODE Ewv6_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv6_anydementia_iqcode_report.
VARIABLE LABELS  Ewv6_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 6'.
EXECUTE.









# Wave 7 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv7 raw core data "wave_7_elsa_data"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde HeAgj, HeAgjR, HeAgjRY
        AD: hedbwad, hedbdad, hedibad, HeAgi, HeAgiR, HeAgiRY
        Memory: -
        IQCODE: Heiqb - Heiqq
2. Recode variables of interest into different names noting wave 7 (e.g. Ewv7_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE




# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde HeAgj HeAgjR HeAgjRY (ELSE=COPY) INTO 
Ewv7_hedbwde Ewv7_hedbdde Ewv7_hedbsde Ewv7_hedibde Ewv7_HeAgj Ewv7_HeAgjR Ewv7_HeAgjRY.
VARIABLE LABELS Ewv7_hedbwde 'Chronic: diagnosed dementia fed forward (wave 7)' 
/Ewv7_hedbdde 'Whether confirms dementia diagnosis (wave 7)' /Ewv7_hedbsde 'Whether still has dementia (wave 7)'
/Ewv7_hedibde 'Chronic: dementia diagnosis newly reported (wave 7)' /Ewv7_HeAgj 'Age told had dementia (wave 7)' 
/Ewv7_HeAgjR 'Month told had dementia since last interview (wave 7)' /Ewv7_HeAgjRY 'Year told had dementia since last interview (wave 7)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad HeAgi HeAgiR HeAgiRY (ELSE=COPY) INTO 
Ewv7_hedbwad Ewv7_hedbdad Ewv7_hedibad Ewv7_HeAgi Ewv7_HeAgiR Ewv7_HeAgiRY.
VARIABLE LABELS Ewv7_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 7)' 
/Ewv7_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 7)' 
/Ewv7_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 7)'
/Ewv7_HeAgi 'Age told had Alzheimers Disease (wave 7)' 
/Ewv7_HeAgiR 'Month told had Alzheimers Disease since last interview (wave 7)' 
/Ewv7_HeAgiRY 'Year told had Alzheimers Disease since last interview (wave 7)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE Heiqb Heiqc Heiqd Heiqe Heiqf Heiqg Heiqh Heiqi Heiqj Heiqk Heiql Heiqm Heiqn Heiqo Heiqp Heiqq (ELSE=COPY) INTO 
Ewv7_heiqb Ewv7_heiqc Ewv7_heiqd Ewv7_heiqe Ewv7_heiqf Ewv7_heiqg Ewv7_heiqh Ewv7_heiqi Ewv7_heiqj
Ewv7_heiqk Ewv7_heiql Ewv7_heiqm Ewv7_heiqn Ewv7_heiqo Ewv7_heiqp Ewv7_heiqq.
VARIABLE LABELS Ewv7_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 7)' 
/Ewv7_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 7)'
/Ewv7_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 7)'
/Ewv7_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 7)'
/Ewv7_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 7)'
/Ewv7_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 7)'
/Ewv7_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 7)'
/Ewv7_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 7)'
/Ewv7_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 7)'
/Ewv7_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 7)'
/Ewv7_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 7)'
/Ewv7_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 7)'
/Ewv7_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 7)'
/Ewv7_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 7)'
/Ewv7_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 7)'
/Ewv7_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 7)'.
EXECUTE.




# 3. Merge variables from wave 7 core data to the main dataset

DATASET ACTIVATE DataSet2.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet8.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet8'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 7
Self-reported dementia/AD/memory problem
        Ewv7_hedbwde -> Chronic: diagnosed dementia fed forward (wave 7) 
        Ewv7_hedbdde -> Whether confirms dementia diagnosis (wave 7)
        Ewv7_hedbsde -> Whether still has dementia (wave 7)
        Ewv7_hedibde -> Chronic: dementia diagnosis newly reported (wave 7)
        Ewv7_HeAgj -> Age told had dementia (wave 7)
        Ewv7_HeAgjR -> Month told had dementia since last interview (wave 7)
        Ewv7_HeAgjRY -> Year told had dementia since last interview (wave 7)
        r7demene -> r7demene:w7 r ever had dementia
        r7demens -> r7demens:w7 R had dementia since last IW
        Ewv7_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 7) 
        Ewv7_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 7)
        Ewv7_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 7)
        Ewv7_HeAgi -> Age told had Alzheimers Disease (wave 7)
        Ewv7_HeAgiR -> Month told had Alzheimers Disease since last interview (wave 7) 
        Ewv7_HeAgiRY -> Year told had Alzheimers Disease since last interview (wave 7)
        r7alzhe -> r7alzhe:w7 r ever had alzheimers
        r7alzhs -> r7alzhs:w7 R had alzheimers since last IW
        r7memrye -> r7memrye:w7 r ever had memory problem
        r7memrys -> r7memrys:w7 R had memory prob since last IW




RECODE Ewv7_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (11=SYSMIS)  (9=1) INTO 
    Ewv7_chronic_dementia.
VARIABLE LABELS  Ewv7_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 7)'.
EXECUTE.


RECODE Ewv7_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=SYSMIS) 
     (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (11=SYSMIS) (8=1) INTO 
    Ewv7_chronic_ad.
VARIABLE LABELS  Ewv7_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 7)'.
EXECUTE.


RECODE Ewv7_hedbdde Ewv7_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS) (1=1) (2=0) INTO 
Ewv7_confirm_dementia Ewv7_confirm_ad.
VARIABLE LABELS  Ewv7_confirm_dementia 'Whether confirms dementia diagnosis (wave 7)' /Ewv7_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 7)'.
EXECUTE.


RECODE Ewv7_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv7_still_dementia.
VARIABLE LABELS  Ewv7_still_dementia 'Whether still has dementia (wave 7)'.
EXECUTE.


RECODE Ewv7_hedibde Ewv7_hedibad (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
Ewv7_newreport_dementia Ewv7_newreport_ad.
VARIABLE LABELS  Ewv7_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 7)' 
/Ewv7_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 7)'.
EXECUTE.


RECODE r7demene r7demens (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv7_dementia_evr Ewv7_dementia_before.
VARIABLE LABELS Ewv7_dementia_evr 'Ever had dementia (wave 7)' 
/Ewv7_dementia_before 'Had dementia since last interview (wave 6)'.
EXECUTE.



RECODE r7alzhe r7alzhs (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv7_ad_evr Ewv7_ad_before.
VARIABLE LABELS Ewv7_ad_evr 'Ever had Alzheimers Disease (wave 7)' 
/Ewv7_ad_before 'Had Alzheimers Disease since last interview (wave 6)'.
EXECUTE.


RECODE r7memrye r7memrys (0=0) (1=1) (ELSE=SYSMIS) INTO 
Ewv7_memory_evr Ewv7_memory_before.
VARIABLE LABELS Ewv7_memory_evr 'Ever had memory problem (wave 7)' 
/Ewv7_memory_before 'Had memory problem since last interview (wave 6)'.
EXECUTE.





# 4. Age, Month and Year of diagnosis
        Ewv7_HeAgj -> Age told had dementia (wave 7)
        Ewv7_HeAgjR -> Month told had dementia since last interview (wave 7)
        Ewv7_HeAgjRY -> Year told had dementia since last interview (wave 7)
        Ewv7_HeAgi -> Age told had Alzheimers Disease (wave 7)
        Ewv7_HeAgiR-> Month told had Alzheimers Disease since last interview (wave 7)
        Ewv7_HeAgiRY -> Year told had Alzheimers Disease since last interview (wave 7)

    

RECODE Ewv7_HeAgj Ewv7_HeAgjR Ewv7_HeAgjRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv7_dementia_age Ewv7_dementia_month Ewv7_dementia_year.
VARIABLE LABELS Ewv7_dementia_age 'Age told had dementia (wave 7)' 
/Ewv7_dementia_month 'Month told had dementia in last 2 years (wave 7)' 
/Ewv7_dementia_year 'Year told had dementia in last 2 years (wave 7)'.
EXECUTE.


RECODE Ewv7_HeAgi Ewv7_HeAgiR Ewv7_HeAgiRY (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv7_ad_age Ewv7_ad_month Ewv7_ad_year.
VARIABLE LABELS Ewv7_ad_age 'Age told had Alzheimers Disease (wave 7)' 
/Ewv7_ad_month 'Month told had Alzheimers Disease in last 2 years (wave 7)' 
/Ewv7_ad_year 'Year told had Alzheimers Disease in last 2 years (wave 7)'.
EXECUTE.





# 5. Dementia wave 7
        - Ewv7_chronic_dementia
        - Ewv7_confirm_dementia 
        - Ewv7_still_dementia
        - Ewv7_newreport_dementia
        - Ewv7_dementia_evr 
        - Ewv7_dementia_before 
   

COMPUTE Ewv7_dementia_sum=SUM(Ewv7_chronic_dementia,Ewv7_confirm_dementia,Ewv7_still_dementia,Ewv7_newreport_dementia,
Ewv7_dementia_evr,Ewv7_dementia_before).
VARIABLE LABELS Ewv7_dementia_sum 'Sum of new diagnosis of dementia at wave 7'.
EXECUTE.

RECODE Ewv7_dementia_sum (6=1) (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv7_dementia_report.
VARIABLE LABELS  Ewv7_dementia_report 'Whether reported physician-diagnosed dementia new at wave 7'.
EXECUTE.



# 5. Alzheimers disease wave 7
        - Ewv7_chronic_ad
        - Ewv7_confirm_ad
        - Ewv7_newreport_ad
        - Ewv7_ad_evr 
        - Ewv7_ad_before
       

COMPUTE Ewv7_ad_sum=SUM(Ewv7_chronic_ad,Ewv7_confirm_ad,Ewv7_newreport_ad,
Ewv7_ad_evr,Ewv7_ad_before).
VARIABLE LABELS  Ewv7_ad_sum 'Sum of new diagnosis of AD at wave 7'.
EXECUTE.

RECODE Ewv7_ad_sum (5=1) (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv7_ad_report.
VARIABLE LABELS  Ewv7_ad_report 'Whether reported physician-diagnosed AD new at wave 7'.
EXECUTE.


# 5. Memory-related disease wave 7
        - Ewv7_memory_evr 
        - Ewv7_memory_before
        

COMPUTE Ewv7_memory_sum=SUM(Ewv7_memory_evr,Ewv7_memory_before).
VARIABLE LABELS  Ewv7_memory_sum 'Sum of new diagnosis of memory-related disease at wave 7'.
EXECUTE.

RECODE Ewv7_memory_sum (2=1) (1=1) (0=0) INTO Ewv7_memory_report.
VARIABLE LABELS  Ewv7_memory_report 'Whether reported physician-diagnosed memory-related disease new at wave 7'.
EXECUTE.





# 6. Dementia + AD wave 7

COMPUTE Ewv7_dementia_ad_sum=SUM(Ewv7_dementia_report,Ewv7_ad_report).
VARIABLE LABELS  Ewv7_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 7'.
EXECUTE.

RECODE Ewv7_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv7_dementia_ad_report.
VARIABLE LABELS  Ewv7_dementia_ad_report 'All new dementia and/or AD cases reported at wave 7'.
EXECUTE.


# 6. Dementia + AD + memory wave 7

COMPUTE Ewv7_anydementia_sum=SUM(Ewv7_dementia_report,Ewv7_ad_report,Ewv7_memory_report).
VARIABLE LABELS  Ewv7_anydementia_sum 'Sum of new diagnosis of any type of dementia (dementia/AD/memory) at wave 7'.
EXECUTE.

RECODE Ewv7_anydementia_sum (3=1) (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv7_anydementia_report.
VARIABLE LABELS  Ewv7_anydementia_report 'All new dementia cases reported at wave 7'.
EXECUTE.







# 7. IQCODE wave 7
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 -2 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items (dont use SUM function, just add the items)
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥ 3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1



RECODE Ewv7_heiqb Ewv7_heiqc Ewv7_heiqd Ewv7_heiqe Ewv7_heiqf Ewv7_heiqg Ewv7_heiqh Ewv7_heiqi Ewv7_heiqj
Ewv7_heiqk Ewv7_heiql Ewv7_heiqm Ewv7_heiqn Ewv7_heiqo Ewv7_heiqp Ewv7_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv7_iqcode1 Ewv7_iqcode2 Ewv7_iqcode3 Ewv7_iqcode4 Ewv7_iqcode5 Ewv7_iqcode6 Ewv7_iqcode7 Ewv7_iqcode8
Ewv7_iqcode9 Ewv7_iqcode10 Ewv7_iqcode11 Ewv7_iqcode12 Ewv7_iqcode13 Ewv7_iqcode14 Ewv7_iqcode15 Ewv7_iqcode16.
VARIABLE LABELS Ewv7_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 7)' 
/Ewv7_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 7)'
/Ewv7_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 7)'
/Ewv7_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 7)'
/Ewv7_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 7)'
/Ewv7_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 7)'
/Ewv7_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 7)'
/Ewv7_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 7)'
/Ewv7_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 7)'
/Ewv7_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 7)'
/Ewv7_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 7)'
/Ewv7_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 7)'
/Ewv7_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 7)'
/Ewv7_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 7)'
/Ewv7_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 7)'
/Ewv7_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 7)'.
EXECUTE.

COMPUTE Ewv7_iqcode_sum = Ewv7_iqcode1 + Ewv7_iqcode2 + Ewv7_iqcode3 + Ewv7_iqcode4 + Ewv7_iqcode5 + 
    Ewv7_iqcode6 + Ewv7_iqcode7 + Ewv7_iqcode8 + Ewv7_iqcode9 + Ewv7_iqcode10 + Ewv7_iqcode11 + Ewv7_iqcode12 + 
    Ewv7_iqcode13 + Ewv7_iqcode14 + Ewv7_iqcode15 + Ewv7_iqcode16.
VARIABLE LABELS  Ewv7_iqcode_sum 'Sum of 16 IQCODE items at wave 7'.
EXECUTE.

COMPUTE Ewv7_iqcode_scoreby16=Ewv7_iqcode_sum / 16.
VARIABLE LABELS  Ewv7_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 7)'.
EXECUTE.

RECODE Ewv7_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv7_dementia_iqcode.
VARIABLE LABELS  Ewv7_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 7)'.
EXECUTE.




# 7. Dementia + AD + memory + IQCODE

COMPUTE Ewv7_anydementia_iqcode_sum=SUM(Ewv7_anydementia_report,Ewv7_dementia_iqcode).
VARIABLE LABELS  Ewv7_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 7'.
EXECUTE.

RECODE Ewv7_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv7_anydementia_iqcode_report.
VARIABLE LABELS  Ewv7_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 7'.
EXECUTE.










# Wave 8 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv8 raw core data "wave_8_elsa_data_eul_v2"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde heagj
        AD: hedbwad, hedbdad, hedibad, heagi
        Memory: -
        IQCODE: heiqb - heiqq
2. Recode variables of interest into different names noting wave 8 (e.g. Ewv8_hedbwde) 
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE




# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde heagj (ELSE=COPY) INTO 
Ewv8_hedbwde Ewv8_hedbdde Ewv8_hedbsde Ewv8_hedibde Ewv8_heagj.
VARIABLE LABELS Ewv8_hedbwde 'Chronic: diagnosed dementia fed forward (wave 8)' 
/Ewv8_hedbdde 'Whether confirms dementia diagnosis (wave 8)' /Ewv8_hedbsde 'Whether still has dementia (wave 8)'
/Ewv8_hedibde 'Chronic: dementia diagnosis newly reported (wave 8)' /Ewv8_heagj 'Age told had dementia (wave 8)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad heagi (ELSE=COPY) INTO 
Ewv8_hedbwad Ewv8_hedbdad Ewv8_hedibad Ewv8_heagi.
VARIABLE LABELS Ewv8_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 8)' 
/Ewv8_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 8)' 
/Ewv8_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 8)'
/Ewv8_heagi 'Age told had Alzheimers Disease (wave 8)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE heiqb heiqc heiqd heiqe heiqf heiqg heiqh heiqi heiqj heiqk heiql heiqm heiqn heiqo heiqp heiqq (ELSE=COPY) INTO 
Ewv8_heiqb Ewv8_heiqc Ewv8_heiqd Ewv8_heiqe Ewv8_heiqf Ewv8_heiqg Ewv8_heiqh Ewv8_heiqi Ewv8_heiqj
Ewv8_heiqk Ewv8_heiql Ewv8_heiqm Ewv8_heiqn Ewv8_heiqo Ewv8_heiqp Ewv8_heiqq.
VARIABLE LABELS Ewv8_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 8)' 
/Ewv8_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 8)'
/Ewv8_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 8)'
/Ewv8_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 8)'
/Ewv8_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 8)'
/Ewv8_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 8)'
/Ewv8_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 8)'
/Ewv8_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 8)'
/Ewv8_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 8)'
/Ewv8_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 8)'
/Ewv8_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 8)'
/Ewv8_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 8)'
/Ewv8_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 8)'
/Ewv8_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 8)'
/Ewv8_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 8)'
/Ewv8_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 8)'.
EXECUTE.




# 3. Merge variables from wave 8 core data to the main dataset

DATASET ACTIVATE DataSet2.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet10.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet10'
  /BY idauniq.
EXECUTE.



# 4. Recode dementia variables wave 8
Self-reported dementia/AD/memory problem
        Ewv8_hedbwde -> Chronic: diagnosed dementia fed forward (wave 8) 
        Ewv8_hedbdde -> Whether confirms dementia diagnosis (wave 8)
        Ewv8_hedbsde -> Whether still has dementia (wave 8)
        Ewv8_hedibde -> Chronic: dementia diagnosis newly reported (wave 8)
        Ewv8_heagj-> Age told had dementia (wave 8)
        Ewv8_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 8) 
        Ewv8_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 8)
        Ewv8_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 8)
        Ewv8_heagi -> Age told had Alzheimers Disease (wave 8)




RECODE Ewv8_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS)
     (1=SYSMIS) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (11=SYSMIS)  (9=1) INTO 
    Ewv8_chronic_dementia.
VARIABLE LABELS  Ewv8_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 8)'.
EXECUTE.


RECODE Ewv8_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) 
     (1=SYSMIS) (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (11=SYSMIS) (8=1) INTO 
    Ewv8_chronic_ad.
VARIABLE LABELS  Ewv8_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 8)'.
EXECUTE.


RECODE Ewv8_hedbdde Ewv8_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS)  (-2=SYSMIS) (-1=SYSMIS) 
(3=SYSMIS) (1=1) (2=0) INTO Ewv8_confirm_dementia Ewv8_confirm_ad.
VARIABLE LABELS  Ewv8_confirm_dementia 'Whether confirms dementia diagnosis (wave 8)' /Ewv8_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 8)'.
EXECUTE.


RECODE Ewv8_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv8_still_dementia.
VARIABLE LABELS  Ewv8_still_dementia 'Whether still has dementia (wave 8)'.
EXECUTE.


RECODE Ewv8_hedibde Ewv8_hedibad (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) 
(-1=SYSMIS) (1=1) (0=0) INTO Ewv8_newreport_dementia Ewv8_newreport_ad.
VARIABLE LABELS  Ewv8_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 8)' 
/Ewv8_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 8)'.
EXECUTE.




# 4. Age of diagnosis
        Ewv8_heagj -> Age told had dementia (wave 8)
        Ewv8_heagi -> Age told had Alzheimers Disease (wave 8)
        

RECODE  Ewv8_heagj (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv8_dementia_age.
VARIABLE LABELS Ewv8_dementia_age 'Age told had dementia (wave 8)'.
EXECUTE.


RECODE Ewv8_heagi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-1=SYSMIS) (-2=SYSMIS) (ELSE=COPY) INTO 
Ewv8_ad_age.
VARIABLE LABELS Ewv8_ad_age 'Age told had Alzheimers Disease (wave 8)'.
EXECUTE.





# 5. Dementia wave 8
        - Ewv8_chronic_dementia
        - Ewv8_confirm_dementia 
        - Ewv8_still_dementia
        - Ewv8_newreport_dementia


COMPUTE Ewv8_dementia_sum=SUM(Ewv8_chronic_dementia,Ewv8_confirm_dementia,Ewv8_still_dementia,Ewv8_newreport_dementia).
VARIABLE LABELS Ewv8_dementia_sum 'Sum of new diagnosis of dementia at wave 8'.
EXECUTE.

RECODE Ewv8_dementia_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv8_dementia_report.
VARIABLE LABELS  Ewv8_dementia_report 'Whether reported physician-diagnosed dementia new at wave 8'.
EXECUTE.



# 5. Alzheimers disease wave 8
        - Ewv8_chronic_ad
        - Ewv8_confirm_ad
        - Ewv8_newreport_ad
       

COMPUTE Ewv8_ad_sum=SUM(Ewv8_chronic_ad,Ewv8_confirm_ad,Ewv8_newreport_ad).
VARIABLE LABELS  Ewv8_ad_sum 'Sum of new diagnosis of AD at wave 8'.
EXECUTE.

RECODE Ewv8_ad_sum (3=1) (2=1) (1=1) (0=0) INTO Ewv8_ad_report.
VARIABLE LABELS  Ewv8_ad_report 'Whether reported physician-diagnosed AD new at wave 8'.
EXECUTE.




# 6. Dementia + AD wave 8 

COMPUTE Ewv8_dementia_ad_sum=SUM(Ewv8_dementia_report,Ewv8_ad_report).
VARIABLE LABELS  Ewv8_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 8'.
EXECUTE.

RECODE Ewv8_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv8_dementia_ad_report.
VARIABLE LABELS  Ewv8_dementia_ad_report 'All new dementia and/or AD cases reported at wave 8'.
EXECUTE.





# 7. IQCODE wave 8
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -4, -3, -2, -1 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items (dont use SUM function, just add the items)
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥ 3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1



RECODE Ewv8_heiqb Ewv8_heiqc Ewv8_heiqd Ewv8_heiqe Ewv8_heiqf Ewv8_heiqg Ewv8_heiqh Ewv8_heiqi Ewv8_heiqj
Ewv8_heiqk Ewv8_heiql Ewv8_heiqm Ewv8_heiqn Ewv8_heiqo Ewv8_heiqp Ewv8_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS)  (-1=SYSMIS) (-2=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv8_iqcode1 Ewv8_iqcode2 Ewv8_iqcode3 Ewv8_iqcode4 Ewv8_iqcode5 Ewv8_iqcode6 Ewv8_iqcode7 Ewv8_iqcode8
Ewv8_iqcode9 Ewv8_iqcode10 Ewv8_iqcode11 Ewv8_iqcode12 Ewv8_iqcode13 Ewv8_iqcode14 Ewv8_iqcode15 Ewv8_iqcode16.
VARIABLE LABELS Ewv8_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 8)' 
/Ewv8_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 8)'
/Ewv8_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 8)'
/Ewv8_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 8)'
/Ewv8_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 8)'
/Ewv8_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 8)'
/Ewv8_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 8)'
/Ewv8_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 8)'
/Ewv8_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 8)'
/Ewv8_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 8)'
/Ewv8_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 8)'
/Ewv8_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 8)'
/Ewv8_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 8)'
/Ewv8_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 8)'
/Ewv8_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 8)'
/Ewv8_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 8)'.
EXECUTE.

COMPUTE Ewv8_iqcode_sum = Ewv8_iqcode1 + Ewv8_iqcode2 + Ewv8_iqcode3 + Ewv8_iqcode4 + Ewv8_iqcode5 + 
    Ewv8_iqcode6 + Ewv8_iqcode7 + Ewv8_iqcode8 + Ewv8_iqcode9 + Ewv8_iqcode10 + Ewv8_iqcode11 + Ewv8_iqcode12 + 
    Ewv8_iqcode13 + Ewv8_iqcode14 + Ewv8_iqcode15 + Ewv8_iqcode16.
VARIABLE LABELS  Ewv8_iqcode_sum 'Sum of 16 IQCODE items at wave 8'.
EXECUTE.

COMPUTE Ewv8_iqcode_scoreby16=Ewv8_iqcode_sum / 16.
VARIABLE LABELS  Ewv8_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 8)'.
EXECUTE.

RECODE Ewv8_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv8_dementia_iqcode.
VARIABLE LABELS  Ewv8_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 8)'.
EXECUTE.




# 7. Dementia + AD + IQCODE 

COMPUTE Ewv8_anydementia_iqcode_sum=SUM(Ewv8_dementia_ad_report,Ewv8_dementia_iqcode).
VARIABLE LABELS  Ewv8_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 8'.
EXECUTE.

RECODE Ewv8_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv8_anydementia_iqcode_report.
VARIABLE LABELS  Ewv8_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 8'.
EXECUTE.







# Wave 9 (Follow-up)
1. Find dementia, AD, memory and IQCODE related variables from wv9 raw core data "wave_9_elsa_data_eul_v1"
        Dementia: hedbwde, hedbdde, hedbsde, hedibde, heagj
        AD: hedbwad, hedbdad, hedibad, heagi
        IQCODE: heiqb - heiqq
2. Recode variables of interest into different names noting wave 8 (e.g. Ewv9_hedbwde)
3. Merge the new variables into the main dataset
4. Recode to create the final dementia-related variables
5. Sum and Recode for Dementia, AD, Memory
6. Final variables of any dementia
7. Recode dementia assessed by the IQCODE


# 2. Recode names for Dementia

RECODE hedbwde hedbdde hedbsde hedibde heagj (ELSE=COPY) INTO 
Ewv9_hedbwde Ewv9_hedbdde Ewv9_hedbsde Ewv9_hedibde Ewv9_heagj.
VARIABLE LABELS Ewv9_hedbwde 'Chronic: diagnosed dementia fed forward (wave 9)' 
/Ewv9_hedbdde 'Whether confirms dementia diagnosis (wave 9)' /Ewv9_hedbsde 'Whether still has dementia (wave 9)'
/Ewv9_hedibde 'Chronic: dementia diagnosis newly reported (wave 9)' /Ewv9_heagj 'Age told had dementia (wave 9)'.
EXECUTE.

# 2. Recode names for AD

RECODE hedbwad hedbdad hedibad heagi (ELSE=COPY) INTO 
Ewv9_hedbwad Ewv9_hedbdad Ewv9_hedibad Ewv9_heagi.
VARIABLE LABELS Ewv9_hedbwad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 9)' 
/Ewv9_hedbdad 'Whether confirms Alzheimers Disease diagnosis (wave 9)' 
/Ewv9_hedibad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 9)'
/Ewv9_heagi 'Age told had Alzheimers Disease (wave 9)'.
EXECUTE.


# 2. Recode names for IQCODE

RECODE heiqb heiqc heiqd heiqe heiqf heiqg heiqh heiqi heiqj 
heiqk heiql heiqm heiqn heiqo heiqp heiqq (ELSE=COPY) INTO 
Ewv9_heiqb Ewv9_heiqc Ewv9_heiqd Ewv9_heiqe Ewv9_heiqf Ewv9_heiqg Ewv9_heiqh Ewv9_heiqi Ewv9_heiqj
Ewv9_heiqk Ewv9_heiql Ewv9_heiqm Ewv9_heiqn Ewv9_heiqo Ewv9_heiqp Ewv9_heiqq.
VARIABLE LABELS Ewv9_heiqb 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 9)' 
/Ewv9_heiqc 'iqcode2: Ability to remember recent events compared to last interview (wave 9)'
/Ewv9_heiqd 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 9)'
/Ewv9_heiqe 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 9)'
/Ewv9_heiqf 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 9)'
/Ewv9_heiqg 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 9)'
/Ewv9_heiqh 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 9)'
/Ewv9_heiqi 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 9)'
/Ewv9_heiqj 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 9)'
/Ewv9_heiqk 'iqcode10: Ability to learn new things in general compared to last interview (wave 9)'
/Ewv9_heiql 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 9)'
/Ewv9_heiqm 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 9)'
/Ewv9_heiqn 'iqcode13: Ability to handle money for shopping compared to last interview (wave 9)'
/Ewv9_heiqo 'iqcode14: Ability to handle financial matters compared to last interview (wave 9)'
/Ewv9_heiqp 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 9)'
/Ewv9_heiqq 'iqcode16: Ability to reason things through compared to last interview (wave 9)'.
EXECUTE.




# 3. Merge variables from wave 9 core data 'wave_9_elsa_data_eul_v1' to the main dataset


DATASET ACTIVATE DataSet4.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet5.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet4.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /BY idauniq.
EXECUTE.




# 4. Recode dementia variables wave 9
Self-reported dementia/AD/memory problem
        Ewv9_hedbwde -> Chronic: diagnosed dementia fed forward (wave 9) 
        Ewv9_hedbdde -> Whether confirms dementia diagnosis (wave 9)
        Ewv9_hedbsde -> Whether still has dementia (wave 9)
        Ewv9_hedibde -> Chronic: dementia diagnosis newly reported (wave 9)
        Ewv9_heagj-> Age told had dementia (wave 9)
        Ewv9_hedbwad -> Chronic: diagnosed Alzheimers Disease fed forward (wave 9) 
        Ewv9_hedbdad -> Whether confirms Alzheimers Disease diagnosis (wave 9)
        Ewv9_hedibad -> Chronic: Alzheimers Disease diagnosis newly reported (wave 0)
        Ewv9_heagi -> Age told had Alzheimers Disease (wave 9)




RECODE Ewv9_hedbwde (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS)
     (1=SYSMIS) (2=SYSMIS) (3=SYSMIS) (4=SYSMIS) (5=SYSMIS) (6=SYSMIS) (7=SYSMIS) (8=SYSMIS) (10=SYSMIS) (11=SYSMIS) (9=1) INTO 
    Ewv9_chronic_dementia.
VARIABLE LABELS  Ewv9_chronic_dementia 'Chronic: diagnosed dementia fed forward (wave 9)'.
EXECUTE.


RECODE Ewv9_hedbwad (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) 
     (1=SYSMIS) (2=SYSMIS)  (3=SYSMIS)  (4=SYSMIS)  (5=SYSMIS)  (6=SYSMIS)  (7=SYSMIS) (9=SYSMIS) (10=SYSMIS) (11=SYSMIS) (8=1) INTO 
    Ewv9_chronic_ad.
VARIABLE LABELS  Ewv9_chronic_ad 'Chronic: diagnosed Alzheimers Disease fed forward (wave 9)'.
EXECUTE.


RECODE Ewv9_hedbdde Ewv9_hedbdad (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) 
(3=SYSMIS) (1=1) (2=0) INTO Ewv9_confirm_dementia Ewv9_confirm_ad.
VARIABLE LABELS  Ewv9_confirm_dementia 'Whether confirms dementia diagnosis (wave 9)' /Ewv9_confirm_ad 
    'Whether confirms Alzheimers Disease diagnosis (wave 9)'.
EXECUTE.


RECODE Ewv9_hedbsde (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
    Ewv9_still_dementia.
VARIABLE LABELS  Ewv9_still_dementia 'Whether still has dementia (wave 9)'.
EXECUTE.


RECODE Ewv9_hedibde Ewv9_hedibad (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (0=0) INTO 
    Ewv9_newreport_dementia Ewv9_newreport_ad.
VARIABLE LABELS  Ewv9_newreport_dementia 'Chronic: dementia diagnosis newly reported (wave 9)' 
/Ewv9_newreport_ad 'Chronic: Alzheimers Disease diagnosis newly reported (wave 9)'.
EXECUTE.




# 4. Age of diagnosis
        Ewv9_heagj -> Age told had dementia (wave 9)
        Ewv9_heagi -> Age told had Alzheimers Disease (wave 9)
        

RECODE  Ewv9_heagj (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv9_dementia_age.
VARIABLE LABELS Ewv9_dementia_age 'Age told had dementia (wave 9)'.
EXECUTE.


RECODE Ewv9_heagi (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=COPY) INTO 
Ewv9_ad_age.
VARIABLE LABELS Ewv9_ad_age 'Age told had Alzheimers Disease (wave 9)'.
EXECUTE.





# 5. Dementia wave 9
        - Ewv9_chronic_dementia
        - Ewv9_confirm_dementia 
        - Ewv9_still_dementia
        - Ewv9_newreport_dementia


COMPUTE Ewv9_dementia_sum=SUM(Ewv9_chronic_dementia,Ewv9_confirm_dementia,Ewv9_still_dementia,Ewv9_newreport_dementia).
VARIABLE LABELS Ewv9_dementia_sum 'Sum of new diagnosis of dementia at wave 9'.
EXECUTE.

RECODE Ewv9_dementia_sum (4=1) (3=1) (2=1) (1=1) (0=0) INTO Ewv9_dementia_report.
VARIABLE LABELS  Ewv9_dementia_report 'Whether reported physician-diagnosed dementia new at wave 9'.
EXECUTE.



# 5. Alzheimers disease wave 9
        - Ewv9_chronic_ad
        - Ewv9_confirm_ad
        - Ewv9_newreport_ad
       

COMPUTE Ewv9_ad_sum=SUM(Ewv9_chronic_ad,Ewv9_confirm_ad,Ewv9_newreport_ad).
VARIABLE LABELS  Ewv9_ad_sum 'Sum of new diagnosis of AD at wave 9'.
EXECUTE.

RECODE Ewv9_ad_sum (3=1) (2=1) (1=1) (0=0) INTO Ewv9_ad_report.
VARIABLE LABELS  Ewv9_ad_report 'Whether reported physician-diagnosed AD new at wave 9'.
EXECUTE.




# 6. Dementia + AD wave 9 

COMPUTE Ewv9_dementia_ad_sum=SUM(Ewv9_dementia_report,Ewv9_ad_report).
VARIABLE LABELS  Ewv9_dementia_ad_sum 'Sum of new diagnosis of AD and/or dementia at wave 9'.
EXECUTE.

RECODE Ewv9_dementia_ad_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv9_dementia_ad_report.
VARIABLE LABELS  Ewv9_dementia_ad_report 'All new dementia and/or AD cases reported at wave 9'.
EXECUTE.





# 7. IQCODE wave 9
    1. 16 items from "heiqb" - "heiqq" for missing data (-9, -8, -1 = N/A)
    2. Keep values as they are:
            1 = much improved
            2 = a bit improved
            3 = not much change
            4 = a bit worse
            5 = much worse
    3. Sum of 16 items (dont use SUM function, just add the items)
    4. Devide Sum by 16 (Sum/16)
    5. Score IQCODE based on the threshold of 3.5  (score ≥ 3.5 means dementia)
    So, Recode into different variables: range lowest through value 3.49 -> 0 
                                                        range value through highest 3.50 -> 1


RECODE Ewv9_heiqb Ewv9_heiqc Ewv9_heiqd Ewv9_heiqe Ewv9_heiqf Ewv9_heiqg Ewv9_heiqh Ewv9_heiqi Ewv9_heiqj
Ewv9_heiqk Ewv9_heiql Ewv9_heiqm Ewv9_heiqn Ewv9_heiqo Ewv9_heiqp Ewv9_heiqq 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=2) (3=3) (4=4) (5=5)  INTO 
Ewv9_iqcode1 Ewv9_iqcode2 Ewv9_iqcode3 Ewv9_iqcode4 Ewv9_iqcode5 Ewv9_iqcode6 Ewv9_iqcode7 Ewv9_iqcode8
Ewv9_iqcode9 Ewv9_iqcode10 Ewv9_iqcode11 Ewv9_iqcode12 Ewv9_iqcode13 Ewv9_iqcode14 Ewv9_iqcode15 Ewv9_iqcode16.
VARIABLE LABELS Ewv9_iqcode1 'iqcode1: Ability to remember things about family/friends compared to last interview (wave 9)' 
/Ewv9_iqcode2 'iqcode2: Ability to remember recent events compared to last interview (wave 9)'
/Ewv9_iqcode3 'iqcode3: Ability to remember conversations a few days later compared to last interview (wave 9)'
/Ewv9_iqcode4 'iqcode4: Ability to remember own address/telephone number compared to last interview (wave 9)'
/Ewv9_iqcode5 'iqcode5: Ability to remember what day/month it is compared to last interview (wave 9)'
/Ewv9_iqcode6 'iqcode6: Ability to remember where things are usually kept compared to last interview (wave 9)'
/Ewv9_iqcode7 'iqcode7: Ability to remember things kept in different place compared to last interview (wave 9)'
/Ewv9_iqcode8 'iqcode8: Knowledge of how to work familiar machines compared to last interview (wave 9)'
/Ewv9_iqcode9 'iqcode9: Ability to learn to use new gadgets compared to last interview (wave 9)'
/Ewv9_iqcode10 'iqcode10: Ability to learn new things in general compared to last interview (wave 9)'
/Ewv9_iqcode11 'iqcode11: Ability to follow a story in a book/TV compared to last interview (wave 9)'
/Ewv9_iqcode12 'iqcode12: Ability to make decisions on everyday matters compared to last interview (wave 9)'
/Ewv9_iqcode13 'iqcode13: Ability to handle money for shopping compared to last interview (wave 9)'
/Ewv9_iqcode14 'iqcode14: Ability to handle financial matters compared to last interview (wave 9)'
/Ewv9_iqcode15 'iqcode15: Ability to handle arthrimetic problems compared to last interview (wave 9)'
/Ewv9_iqcode16 'iqcode16: Ability to reason things through compared to last interview (wave 9)'.
EXECUTE.



COMPUTE Ewv9_iqcode_sum=Ewv9_iqcode1 + Ewv9_iqcode2 + Ewv9_iqcode3 + Ewv9_iqcode4 + Ewv9_iqcode5 + 
    Ewv9_iqcode6 + Ewv9_iqcode7 + Ewv9_iqcode8 + Ewv9_iqcode9 + Ewv9_iqcode10 + Ewv9_iqcode11 + 
    Ewv9_iqcode12 + Ewv9_iqcode13 + Ewv9_iqcode14 + Ewv9_iqcode15 + Ewv9_iqcode16.
VARIABLE LABELS  Ewv9_iqcode_sum 'Sum of 16 IQCODE items at wave 9'.
EXECUTE.



COMPUTE Ewv9_iqcode_scoreby16=Ewv9_iqcode_sum / 16.
VARIABLE LABELS  Ewv9_iqcode_scoreby16 'Score of IQCODE (16 items) divided by 16 (wave 9)'.
EXECUTE.

RECODE Ewv9_iqcode_scoreby16 (Lowest thru 3.49=0) (3.50 thru Highest=1) (SYSMIS=SYSMIS) INTO Ewv9_dementia_iqcode.
VARIABLE LABELS  Ewv9_dementia_iqcode 'Dementia symptoms dichotomized into yes/no based on IQCODE using cut off score of 3.5 (wave 9)'.
EXECUTE.




# 7. Dementia + AD + IQCODE 

COMPUTE Ewv9_anydementia_iqcode_sum=SUM(Ewv9_dementia_ad_report,Ewv9_dementia_iqcode).
VARIABLE LABELS  Ewv9_anydementia_iqcode_sum 'Sum of self-reported dementia plus IQCODE cases at wave 9'.
EXECUTE.

RECODE Ewv9_anydementia_iqcode_sum (2=1) (1=1) (0=0) (SYSMIS=SYSMIS) INTO Ewv9_anydementia_iqcode_report.
VARIABLE LABELS  Ewv9_anydementia_iqcode_report 'All new self-reported dementia and IQCODE cases reported at wave 9'.
EXECUTE.





*** Create a new dataset "elsa_data2020 to exclude baseline dementia (wave 2)
Remove baseline dementia cases and in a cognitively intact sample estimate the event to dementia variable during the follow-up waves (3-8)
Then, merge event to dementia related variables with the full-sample dataset. Excluded cases will be showed as missing data (N/As).




# Event to Dementia (variable created in a seperate dataset where all baseline dementia cases were excluded)
Step 1: event to dementia (cases with dementia/AD/IQCODE) -> Ewv3to9_dementia_event
      1. Sum of new dementia cases in all the follow-up waves (waves 3-9)
            Name of variable: "Ewv3to9_dementia_sum"
      2. Recode into 0 - 1 (yes/no dementia)
                     0 -> 0 no dementia until the last interview (wave 9)
                     1 -> 1 yes dementia
                     2 -> 1 yes dementia
                     3 -> 1 yes dementia
                     4 -> 1 yes dementia
                     5 -> 1 yes dementia
                     6 -> 1 yes dementia
                     7 -> 1 yes dementia
            Name of variable: "Ewv3to9_dementia_event" 
Step 2: event to dementia without IQCODE (cases with dementia/AD) -> Ewv3to9_dementia_event_no_iqcode
         1. Sum of new dementia cases in all the follow-up waves (waves 3-9)
            Name of variable: "Ewv3to9_dementia_sum_no_iqcode"
         2. Recode into 0 - 1 (yes/no dementia)
                     0 -> 0 no dementia until the last interview (wave 9)
                     1 -> 1 yes dementia
                     2 -> 1 yes dementia
                     3 -> 1 yes dementia
                     4 -> 1 yes dementia
                     5 -> 1 yes dementia
                     6 -> 1 yes dementia
                     7 -> 1 yes dementia
            Name of variable: "Ewv3to9_dementia_event_no_iqcode" 


# Step 1: event to dementia with IQCODE

COMPUTE Ewv3to9_dementia_sum=SUM(Ewv3_anydementia_iqcode_report,Ewv4_anydementia_iqcode_report,
Ewv5_anydementia_iqcode_report,Ewv6_anydementia_iqcode_report,Ewv7_anydementia_iqcode_report,
Ewv8_anydementia_iqcode_report,Ewv9_anydementia_iqcode_report).
VARIABLE LABELS  Ewv3to9_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 3-9'.
EXECUTE.

RECODE Ewv3to9_dementia_sum (0=0) (1=1) (2=1) (3=1) (4=1) (5=1) (6=1) (7=1) INTO Ewv3to9_dementia_event.
VARIABLE LABELS Ewv3to9_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis and/or IQCODE (wave 3-9)'.
EXECUTE.


# Step 2: event to dementia without IQCODE

COMPUTE Ewv3to9_dementia_sum_no_iqcode=SUM(Ewv3_anydementia_report,Ewv4_anydementia_report,
Ewv5_anydementia_report,Ewv6_anydementia_report,Ewv7_anydementia_report,Ewv8_dementia_ad_report,Ewv9_dementia_ad_report).
VARIABLE LABELS  Ewv3to9_dementia_sum_no_iqcode 'Sum of new self-reported dementia diagnosis without IQCODE in waves 3-9'.
EXECUTE.

RECODE  Ewv3to9_dementia_sum_no_iqcode (0=0) (1=1) (2=1) (3=1) (4=1) (5=1) (6=1) (7=1) INTO Ewv3to9_dementia_event_no_iqcode.
VARIABLE LABELS Ewv3to9_dementia_event_no_iqcode 'Event of dementia (0-1) according to self-reported doctor diagnosis only without IQCODE (wave 3-9)'.
EXECUTE.



# Merge Ewv3to9_dementia_sum, Ewv3to9_dementia_event, Ewv3to9_dementia_sum_no_iqcode, Ewv3to9_dementia_event_no_iqcode with the main dataset
where the baseline cases of dementia are recorded as N/A.


DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /BY idauniq.
EXECUTE.





# Time of Event - Time of Dementia Incidence
Steps:
1. year and month of interview (plus year and month of diagosis of dementia/AD already recoded)
2. date of interview and date of dementia/ad diagnosis
3. time difference
4. midpoint


## Step 1 -  Interview dates (year and month) (cont)
Recode variables related to time of interview (waves 2-9)
Harmonised data
        year of interview: r2iwindy, r3iwindy, r4iwindy, r5iwindy, r6iwindy, r7iwindy
        month of interview: r2iwindm, r3iwindm, r4iwindm, r5iwindm, r6iwindm, r7iwindm
Data from core datasets
        year of individual interview: iintdty
        month of individual interview: iintdtm
Check if harmonised and core data are the same
So, month and year of interview will be used for the calculation of the date of interview.

## Step 2 - date of interview and date of dementia/ad diagnosis
Recode into a new variable of date of interview based on month and year of interview
            Date properties: dd.mm.yyyy (data on the day is unavailable so consistently use "01")
Recode into a new variable of date of dementia/ad based on month and year of dementia/ad diagnosis
            Date properties: dd.mm.yyyy (data on the day is unavailable so consistently use "01")


# Wave 2 (baseline)

RECODE iintdtm iintdty (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=Copy) INTO Ewv2_interview_month 
    Ewv2_interview_year.
VARIABLE LABELS  Ewv2_interview_month 'Month of individual interview wave 2' /Ewv2_interview_year 'Year of individual interview wave 2'.
EXECUTE.

RECODE r2iwindm r2iwindy (ELSE=Copy) INTO Ewv2harmo_interview_month 
    Ewv2harmo_interview_year.
VARIABLE LABELS  Ewv2harmo_interview_month 'Month of individual interview harmonised wave 2' 
/Ewv2harmo_interview_year 'Year of individual interview harmonised wave 2'.
EXECUTE.

COMPUTE Ewv2_interview_date=DATE.MOYR(Ewv2_interview_month,Ewv2_interview_year).
VARIABLE LABELS  Ewv2_interview_date 'Date of interview (01 for day / month / year) at wave 2 (baseline)'.
EXECUTE.


# Wave 3

RECODE iintdatm iintdaty (ELSE=Copy) INTO Ewv3_iintdatm 
    Ewv3_iintdaty.
VARIABLE LABELS  Ewv3_iintdatm 'Month of Individual Interview' /Ewv3_iintdaty 'Year of Individual Interview'.
EXECUTE.

DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet5.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /BY idauniq.
EXECUTE.


RECODE Ewv3_iintdatm Ewv3_iintdaty (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=Copy) INTO Ewv3_interview_month 
    Ewv3_interview_year.
VARIABLE LABELS  Ewv3_interview_month 'Month of individual interview wave 3' /Ewv3_interview_year 'Year of individual interview wave 3'.
EXECUTE.

RECODE r3iwindm r3iwindy (ELSE=Copy) INTO Ewv3harmo_interview_month 
    Ewv3harmo_interview_year.
VARIABLE LABELS  Ewv3harmo_interview_month 'Month of individual interview harmonised wave 3' 
/Ewv3harmo_interview_year 'Year of individual interview harmonised wave 3'.
EXECUTE.

COMPUTE Ewv3_interview_date=DATE.MOYR(Ewv3_interview_month,Ewv3_interview_year).
VARIABLE LABELS  Ewv3_interview_date 'Date of interview (01 for day / month / year) at wave 3'.
EXECUTE.

* Data about month and year of interview are the same both at core and harmonised dataset. So keep and recode harmonised data which are already merged.

COMPUTE Ewv3_dementia_date=DATE.MOYR(Ewv3_dementia_month,Ewv3_dementia_year).
VARIABLE LABELS  Ewv3_dementia_date 'Date of dementia diagnosis (01 for day / month / year) at wave 3'.
EXECUTE.

COMPUTE Ewv3_ad_date=DATE.MOYR(Ewv3_ad_month,Ewv3_ad_year).
VARIABLE LABELS  Ewv3_ad_date 'Date of AD diagnosis (01 for day / month / year) at wave 3'.
EXECUTE.



# Wave 4

RECODE r4iwindm r4iwindy (ELSE=Copy) INTO Ewv4_interview_month Ewv4_interview_year.
VARIABLE LABELS  Ewv4_interview_month 'Month of individual interview wave 4' 
/Ewv4_interview_year 'Year of individual interview wave 4'.
EXECUTE.

COMPUTE Ewv4_interview_date=DATE.MOYR(Ewv4_interview_month,Ewv4_interview_year).
VARIABLE LABELS  Ewv4_interview_date 'Date of interview (01 for day / month / year) at wave 4'.
EXECUTE.


COMPUTE Ewv4_dementia_date=DATE.MOYR(Ewv4_dementia_month,Ewv4_dementia_year).
VARIABLE LABELS  Ewv4_dementia_date 'Date of dementia diagnosis (01 for day / month / year) at wave 4'.
EXECUTE.

COMPUTE Ewv4_ad_date=DATE.MOYR(Ewv4_ad_month,Ewv4_ad_year).
VARIABLE LABELS  Ewv4_ad_date 'Date of AD diagnosis (01 for day / month / year) at wave 4'.
EXECUTE.



# Wave 5

RECODE r5iwindm r5iwindy (ELSE=Copy) INTO Ewv5_interview_month Ewv5_interview_year.
VARIABLE LABELS  Ewv5_interview_month 'Month of individual interview wave 5' 
/Ewv5_interview_year 'Year of individual interview wave 5'.
EXECUTE.

COMPUTE Ewv5_interview_date=DATE.MOYR(Ewv5_interview_month,Ewv5_interview_year).
VARIABLE LABELS  Ewv5_interview_date 'Date of interview (01 for day / month / year) at wave 5'.
EXECUTE.



COMPUTE Ewv5_dementia_date=DATE.MOYR(Ewv5_dementia_month,Ewv5_dementia_year).
VARIABLE LABELS  Ewv5_dementia_date 'Date of dementia diagnosis (01 for day / month / year) at wave 5'.
EXECUTE.

COMPUTE Ewv5_ad_date=DATE.MOYR(Ewv5_ad_month,Ewv5_ad_year).
VARIABLE LABELS  Ewv5_ad_date 'Date of AD diagnosis (01 for day / month / year) at wave 5'.
EXECUTE.





# Wave 6

RECODE r6iwindm r6iwindy (ELSE=Copy) INTO Ewv6_interview_month Ewv6_interview_year.
VARIABLE LABELS  Ewv6_interview_month 'Month of individual interview wave 6' 
/Ewv6_interview_year 'Year of individual interview wave 6'.
EXECUTE.

COMPUTE Ewv6_interview_date=DATE.MOYR(Ewv6_interview_month,Ewv6_interview_year).
VARIABLE LABELS  Ewv6_interview_date 'Date of interview (01 for day / month / year) at wave 6'.
EXECUTE.




COMPUTE Ewv6_dementia_date=DATE.MOYR(Ewv6_dementia_month,Ewv6_dementia_year).
VARIABLE LABELS  Ewv6_dementia_date 'Date of dementia diagnosis (01 for day / month / year) at wave 6'.
EXECUTE.

COMPUTE Ewv6_ad_date=DATE.MOYR(Ewv6_ad_month,Ewv6_ad_year).
VARIABLE LABELS  Ewv6_ad_date 'Date of AD diagnosis (01 for day / month / year) at wave 6'.
EXECUTE.





# Wave 7

RECODE r7iwindm r7iwindy (ELSE=Copy) INTO Ewv7_interview_month Ewv7_interview_year.
VARIABLE LABELS  Ewv7_interview_month 'Month of individual interview wave 7' 
/Ewv7_interview_year 'Year of individual interview wave 7'.
EXECUTE.

COMPUTE Ewv7_interview_date=DATE.MOYR(Ewv7_interview_month,Ewv7_interview_year).
VARIABLE LABELS  Ewv7_interview_date 'Date of interview (01 for day / month / year) at wave 7'.
EXECUTE.



COMPUTE Ewv7_dementia_date=DATE.MOYR(Ewv7_dementia_month,Ewv7_dementia_year).
VARIABLE LABELS  Ewv7_dementia_date 'Date of dementia diagnosis (01 for day / month / year) at wave 7'.
EXECUTE.

COMPUTE Ewv7_ad_date=DATE.MOYR(Ewv7_ad_month,Ewv7_ad_year).
VARIABLE LABELS  Ewv7_ad_date 'Date of AD diagnosis (01 for day / month / year) at wave 7'.
EXECUTE.



# Wave 8


RECODE iintdatm iintdaty (ELSE=Copy) INTO Ewv8_iintdatm Ewv8_iintdaty.
VARIABLE LABELS  Ewv8_iintdatm 'Month of Individual Interview' /Ewv8_iintdaty 'Year of Individual Interview'.
EXECUTE.

DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet7.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet7'
  /BY idauniq.
EXECUTE.


RECODE Ewv8_iintdatm (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (7=7) (8=8) (9=9) (10=10) (11=11) (12=12) 
(-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (ELSE=Copy) 
INTO Ewv8_interview_month.
VARIABLE LABELS  Ewv8_interview_month 'Month of individual interview wave 8'.
EXECUTE.

RECODE Ewv8_iintdaty (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (ELSE=Copy) 
    INTO Ewv8_interview_year.
VARIABLE LABELS  Ewv8_interview_year 'Year of individual interview wave 8'.
EXECUTE.

COMPUTE Ewv8_interview_date=DATE.MOYR(Ewv8_interview_month,Ewv8_interview_year).
VARIABLE LABELS  Ewv8_interview_date 'Date of interview (01 for day / month / year) at wave 8'.
EXECUTE.



# Wave 9


RECODE w9iintdatm w9iintdaty (ELSE=Copy) INTO Ewv9_iintdatm Ewv9_iintdaty.
VARIABLE LABELS  Ewv9_iintdatm 'Month of Individual Interview (wave 9 )' /Ewv9_iintdaty 'Year of Individual Interview (wave 9)'.
EXECUTE.


RECODE Ewv9_iintdatm (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (7=7) (8=8) (9=9) (10=10) (11=11) (12=12) 
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (ELSE=Copy) 
INTO Ewv9_interview_month.
VARIABLE LABELS  Ewv9_interview_month 'Month of individual interview wave 9'.
EXECUTE.

RECODE Ewv9_iintdaty (SYSMIS=SYSMIS) (ELSE=Copy) 
    INTO Ewv9_interview_year.
VARIABLE LABELS  Ewv9_interview_year 'Year of individual interview wave 9'.
EXECUTE.

COMPUTE Ewv9_interview_date=DATE.MOYR(Ewv9_interview_month,Ewv9_interview_year).
VARIABLE LABELS  Ewv9_interview_date 'Date of interview (01 for day / month / year) at wave 9'.
EXECUTE.




# Step 3 - time difference
   - Create a variable "Ewv3to9_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 2 date of interview "Ewv2_interview_date"
   - Create a variable "E_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 2 2004) and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"
            



* Date and Time Wizard: H_time_dementia_months.
COMPUTE  E_time_dementia_months=RND((Ewv3to9_newdementia_or_lastinterview_date - 
    Ewv2_interview_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  E_time_dementia_months "Time in months from the baseline (wave 2) to the date "+
    "of dementia diagnosis or last date of study assessment".
VARIABLE LEVEL  E_time_dementia_months (SCALE).
FORMATS  E_time_dementia_months (F5.0).
VARIABLE WIDTH  E_time_dementia_months(5).
EXECUTE.

# OR

COMPUTE E_time_dementia_months=DATEDIFF(Ewv3to9_newdementia_or_lastinterview_date,Ewv2_interview_date,"months").
VARIABLE LABELS  E_time_dementia_months 'Time in months from the baseline (wave 2) to the date of '+
    'dementia diagnosis or last date of study assessment'.
EXECUTE.


*** For those who reported dementia, follow-up time was calculated as the time elapsed (in
                months) between the date of the baseline interview date and the date of the reported diagnosis
                of dementia. For those who reported dementia but did not report the associated date of diagnosis,
                the follow-up time was calculated as the time elapsed from to the baseline interview date to the
                midpoint between (a) the last assessment in which they reported not having dementia and (b)
                the assessment in which they did report having dementia. For those who did not report dementia,
                follow-up time was calculated as the time elapsed between the date of baseline and most recent interview

# Step 4 - midpoint    
   - Create a variable "Ewv3to9_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
           Only for the cases identified by IQCODE and those who did not report the associated date of diagnosis, we calculate the midpoint 
           between the date free of dementia and the date of new diagnosis of dementia [manual work]
               For these cases we use the last interview when the participant was dementia free
               For the cases with a report for date of diagnosis we keep the original date from the variable"Ewv3to9_newdementia_or_lastinterview_date" (this will lead to 0 values -months- after the calculation of midpoint)
               For those who never developed dementia (censored), the value remains N/A
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "E_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("E_time_dementia_midpoint_final") for the cases with a report of date of dmeentia diagnosis
           (if you do not do this the time _of_event_dementia will be wrong, which means the mean of E_time_dementia_months, E_time_dementia_midpoint will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored "E_time_event_dementia" 
            measured in months and adjusted for midpoint between interviews for those identified by IQCODE or did not report a date of diagnosis (people lost or without dementia until the last date of assessment)
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (E_time_dementia_months,E_time_dementia_midpoint_final)



* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  E_time_dementia_midpoint=RND((Ewv3to9_newdementia_or_lastinterview_date - 
    Ewv3to9_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  E_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  E_time_dementia_midpoint (SCALE).
FORMATS  E_time_dementia_midpoint (F5.0).
VARIABLE WIDTH  E_time_dementia_midpoint(5).
EXECUTE.


RECODE E_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO E_time_dementia_midpoint_final.
VARIABLE LABELS E_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE E_time_event_dementia=MEAN(E_time_dementia_months,E_time_dementia_midpoint_final).
VARIABLE LABELS  E_time_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.




*** Repeat Step 3 and 4 to calculate time of dementia for the cases with self-reported dementia/AD only (without IQCODE)



# Step 3 - time difference
   - Create a variable "Ewv3to9_dementia_report_or_lastinterview_date_no_iqcode" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 2 date of interview "Ewv2_interview_date"
   - Create a variable "E_time_dementia_report_months_no_iqcode" of Time in months: Calculate time difference between baseline date (wave 2 2004) and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"
            



* Date and Time Wizard: H_time_dementia_months.
COMPUTE  E_time_dementia_report_months_no_iqcode=RND((Ewv3to9_dementia_report_or_lastinterview_date_no_iqcode - 
    Ewv2_interview_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  E_time_dementia_report_months_no_iqcode
 "Time in months from the baseline to the date of  self-reported dementia diagnosis or last date of study assessment".
VARIABLE LEVEL  E_time_dementia_report_months_no_iqcode (SCALE).
FORMATS  E_time_dementia_report_months_no_iqcode (F5.0).
VARIABLE WIDTH  E_time_dementia_report_months_no_iqcode(5).
EXECUTE.

# OR

COMPUTE E_time_dementia_report_months_no_iqcode=DATEDIFF(Ewv3to9_dementia_report_or_lastinterview_date_no_iqcode,Ewv2_interview_date,"months").
VARIABLE LABELS  E_time_dementia_report_months_no_iqcode
 'Time in months from the baseline to the date of  self-reported dementia diagnosis or last date of study assessment'.
EXECUTE.




# Step 4 - midpoint
           *** For those who reported dementia, follow-up time was calculated as the time elapsed (in
                months) between the date of the baseline interview date and the date of the reported diagnosis
                of dementia. For those who reported dementia but did not report the associated date of diagnosis,
                the follow-up time was calculated as the time elapsed from to the baseline interview date to the
                midpoint between (a) the last assessment in which they reported not having dementia and (b)
                the assessment in which they did report having dementia. For those who did not report dementia,
                follow-up time was calculated as the time elapsed between the date of baseline and most recent interview
   - Create a variable "Ewv3to9_dementia_report_free_date_no_iqcode" of the last date of being free of dementia before the date of the event of dementia
           Only for the cases who did not report the associated date of diagnosis, we calculate the midpoint 
           between the date free of dementia and the date of new diagnosis of dementia [manual work]
               For these cases we use the last interview when the participant was dementia free
               For the cases with a report for date of diagnosis we keep the original date from the variable"Ewv3to9_dementia_report_or_lastinterview_date_no_iqcode" (this will lead to 0 values -months- after the calculation of midpoint)
               For those who never developed dementia (censored), the value remains N/A
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "E_time_dementia_report_midpoint_no_iqcode"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("E_time_dementia_report_midpoint_no_iqcode_final") for the cases with a report of date of dementia diagnosis
           (if you do not do this the time _of_event_dementia will be wrong, which means the mean of E_time_dementia_report_months_no_iqcode, E_time_dementia_report_midpoint_no_iqcode will be incorrectly calculated) 
   - Create a variable of Time of event of dementia or censored "E_time_of_event_dementia_report_no_iqcode" 
            measured in months and adjusted for midpoint between interviews for those who did not report a date of diagnosis (people lost or without dementia until the last date of assessment)
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (E_time_dementia_report_months_no_iqcode,E_time_dementia_report_midpoint_no_iqcode_final)



* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  E_time_dementia_report_midpoint_no_iqcode=RND((Ewv3to9_dementia_report_or_lastinterview_date_no_iqcode - 
    Ewv3to9_dementia_report_free_date_no_iqcode) / (30.4375 * time.days(1))).
VARIABLE LABELS  E_time_dementia_report_midpoint_no_iqcode
 "Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (self-report only)".
VARIABLE LEVEL  E_time_dementia_report_midpoint_no_iqcode (SCALE).
FORMATS  E_time_dementia_report_midpoint_no_iqcode (F5.0).
VARIABLE WIDTH  E_time_dementia_report_midpoint_no_iqcode(5).
EXECUTE.


RECODE E_time_dementia_report_midpoint_no_iqcode (0=SYSMIS) (ELSE=Copy) INTO E_time_dementia_midpoint_no_iqcode_final.
VARIABLE LABELS E_time_dementia_midpoint_no_iqcode_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (self-report only) (0 turned to N/A)'.


COMPUTE E_time_event_dementia_report_no_iqcode=MEAN(E_time_dementia_report_months_no_iqcode,E_time_dementia_midpoint_no_iqcode_final).
VARIABLE LABELS E_time_event_dementia_report_no_iqcode "Time of event of dementia or censored measured in months adjusted for midpoint between interviews (self-report only)".
EXECUTE.






# Dementia Incidence WAVES 6-9


# Event to Dementia with IQCODE
Step 1: event to dementia (cases with dementia/AD/IQCODE) -> Ewv6to9_dementia_event
      1. Sum of new dementia cases in all the follow-up waves (waves 6-9)
            Name of variable: "Ewv6to9_dementia_sum"
      2. Recode into 0 - 1 (yes/no dementia)
                     0 -> 0 no dementia until the last interview (wave 9)
                     1 -> 1 yes dementia
                     2 -> 1 yes dementia
                     3 -> 1 yes dementia
                     4 -> 1 yes dementia
            Name of variable: "Ewv6to9_dementia_event" 



COMPUTE Ewv6to9_dementia_sum=SUM(Ewv6_anydementia_iqcode_report,Ewv7_anydementia_iqcode_report,
Ewv8_anydementia_iqcode_report,Ewv9_anydementia_iqcode_report).
VARIABLE LABELS  Ewv6to9_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 6-9'.
EXECUTE.

RECODE Ewv6to9_dementia_sum (0=0) (1=1) (2=1) (3=1) (4=1) INTO Ewv6to9_dementia_event.
VARIABLE LABELS Ewv6to9_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis and/or IQCODE (wave 6-9)'.
EXECUTE.



# Event to Dementia without IQCODE
Step 2: event to dementia without IQCODE-> Ewv6to9_dementia_event_no_iqcode


    
COMPUTE Ewv6to9_dementia_sum_no_iqcode=SUM(Ewv6_anydementia_report,Ewv7_anydementia_report,Ewv8_dementia_ad_report,Ewv9_dementia_ad_report).
VARIABLE LABELS  Ewv6to9_dementia_sum_no_iqcode 'Sum of new self-reported dementia diagnosis without IQCODE in waves 6-9'.
EXECUTE.

RECODE  Ewv6to9_dementia_sum_no_iqcode (0=0) (1=1) (2=1) (3=1) (4=1) INTO Ewv6to9_dementia_event_no_iqcode.
VARIABLE LABELS Ewv6to9_dementia_event_no_iqcode 'Event of dementia (0-1) according to self-reported doctor diagnosis and/or IQCODE (wave 6-9)'.
EXECUTE.





# Time of Event - Time of Dementia Incidence
Survival time was measured in months, from the date of interview in the final wave of exposure measurement (wave 5)
to the date of dementia diagnosis or last interview, whichever was first
1. date of interview (add year and month of interview for waves 6, 7, 8, 9)
2. time difference
4. midpoint


# Date of interview
    

*Baseline interview (waves 2,3,4,5)

COMPUTE Ewv2_interview_date=DATE.MOYR(Ewv2_interview_month,Ewv2_interview_year).
VARIABLE LABELS  Ewv2_interview_date 'Date of interview (01 for day / month / year) at wave 2'.
EXECUTE.


COMPUTE Ewv3_interview_date=DATE.MOYR(Ewv3_interview_month,Ewv3_interview_year).
VARIABLE LABELS  Ewv3_interview_date 'Date of interview (01 for day / month / year) at wave 3'.
EXECUTE.


COMPUTE Ewv4_interview_date=DATE.MOYR(Ewv4_interview_month,Ewv4_interview_year).
VARIABLE LABELS  Ewv4_interview_date 'Date of interview (01 for day / month / year) at wave 4'.
EXECUTE.


COMPUTE Ewv5_interview_date=DATE.MOYR(Ewv5_interview_month,Ewv5_interview_year).
VARIABLE LABELS  Ewv5_interview_date 'Date of interview (01 for day / month / year) at wave 5'.
EXECUTE.


*Follow up (waves 6, 7,8,9)
    


COMPUTE Ewv6_interview_date=DATE.MOYR(Ewv6_interview_month,Ewv6_interview_year).
VARIABLE LABELS  Ewv6_interview_date 'Date of interview (01 for day / month / year) at wave 6'.
EXECUTE.


COMPUTE Ewv7_interview_date=DATE.MOYR(Ewv7_interview_month,Ewv7_interview_year).
VARIABLE LABELS  Ewv7_interview_date 'Date of interview (01 for day / month / year) at wave 7'.
EXECUTE.



COMPUTE Ewv8_interview_date=DATE.MOYR(Ewv8_interview_month,Ewv8_interview_year).
VARIABLE LABELS  Ewv8_interview_date 'Date of interview (01 for day / month / year) at wave 8'.
EXECUTE.



COMPUTE Ewv9_interview_date=DATE.MOYR(Ewv9_interview_month,Ewv9_interview_year).
VARIABLE LABELS  Ewv9_interview_date 'Date of interview (01 for day / month / year) at wave 9'.
EXECUTE.




# Time difference
   - Create a variable "Ewv6to9_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 5 date of interview "Ewv5_interview_date"
   - Create a variable "Ewv6to9_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 5 2010) and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"
            



COMPUTE Ewv6to9_time_dementia_months=DATEDIFF(Ewv6to9_newdementia_or_lastinterview_date,Ewv5_interview_date,"months").
VARIABLE LABELS  Ewv6to9_time_dementia_months 'Time in months from the baseline (wave 5) to the date of '+
    'dementia diagnosis or last date of study assessment'.
EXECUTE.



# Midpoint
    

   - Create a variable "Ewv6to9_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
           Only for the cases identified by IQCODE and those who did not report the associated date of diagnosis, we calculate the midpoint 
           between the date free of dementia and the date of new diagnosis of dementia [manual work]
               For these cases we use the last interview when the participant was dementia free
               For those who never developed dementia (censored), the value remains N/A
   - Calculate the midpoint (in months) between the date free of dementia and the date of new diagnosis of dementia -> "Ewv6to9_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("Ewv6to9_time_dementia_midpoint") for the cases with a report of date of dmeentia diagnosis
   - Create a variable of Time of event of dementia or censored "Ewv6to9_time_event_dementia" 
            measured in months and adjusted for midpoint between interviews for those identified by IQCODE or did not report a date of diagnosis (people lost or without dementia until the last date of assessment)
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" (Ewv6to9_time_dementia_months,Ewv6to9_time_dementia_midpoint_final)



* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  Ewv6to9_time_dementia_midpoint=RND((Ewv6to9_newdementia_or_lastinterview_date - 
    Ewv6to9_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  Ewv6to9_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  Ewv6to9_time_dementia_midpoint (SCALE).
FORMATS  Ewv6to9_time_dementia_midpoint (F5.0).
VARIABLE WIDTH Ewv6to9_time_dementia_midpoint(5).
EXECUTE.


RECODE Ewv6to9_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO Ewv6to9_time_dementia_midpoint_final.
VARIABLE LABELS Ewv6to9_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE Ewv6to9_time_event_dementia=MEAN(Ewv6to9_time_dementia_months,Ewv6to9_time_dementia_midpoint_final).
VARIABLE LABELS  Ewv6to9_time_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.









# Predictors (Depressive symptoms and Cardiometabolic risk factors)


# Depressive symptoms (CES-D 8 items):
        Raw variables from core dataset: PScedA PScedB PScedC PScedD PScedE PScedF PScedG PScedH   
                totpsc: Sum of all eight CES-D items, psceda - pscedh
        RAND variables: r2depres r2effort r2sleepr r2whappy r2flone r2fsad r2going r2enlife
                r2cesd: Sum of the 8 questions with reserve positives (2 items)
                Sum of RwDEPRES, RwEFFORT, RwSLEEPR, RwFLONE, RwFSAD, RwGOING, (1-RwWHAPPY) and (1-RwENLIFE) 
Thus the higher the score, the more negative the respondents feelings were during the past week
Assessed at waves 2-7 by RAND, wave 8 assessed by core data
Yes/No (0-1) questions, so the highest score is 8
cutoff score 4/8 (4 or above)
If 1 or more items are missing do not score
Steps to do: 
*Only for wave 2 check if RAND variables are equal to ELSA original data
1. Recode reverse-scored questions (happy and enjoyed life: PScedD PScedF / r2whappy r2enlife) 
    Recode the rest items to exclude missing data both in ELSA and RAND data
2. Sum of 8 items from original ELSA data and from RAND data 
    (do not use SUM function, use + to add all the items excluding those with missing values) 
    and sum of CESD score "totpsc" as measured by ELSA 
    and sum of CESD score "r2cesd" as measured by RAND 
    *In total 4 columns of sum ces-d score will be created to compare and check that the scores are the same
    *The comparison showed that ELSA and RAND data produce equal sum scores, so for waves 3-7 use RAND data to measure depressive symptoms
3. Recode into "Ewv2_depressive_symptoms" (0=no/low depressive symptoms, 1= high depressive symptoms)



# Wave 2

# Step 1: Reverse scored questions and Recode ces-d items to exclude missing data 
ELSA original data
    1=yes -> 0
    2=no  -> 1
RAND data
    1=yes -> 0
    0=no  -> 1




RECODE PScedD PScedF (-1=SYSMIS) (-9=SYSMIS) (-8=SYSMIS) (1=0) (2=1) INTO Ewv2_cesd_happy_raw Ewv2_cesd_enlife_raw.
VARIABLE LABELS  Ewv2_cesd_happy_raw 'Whether respondent was happy much of the time during the past week (wave 2)' 
    /Ewv2_cesd_enlife_raw 'Whether respondent enjoyed life much of the time during the past week (wave 2)'.
EXECUTE.


RECODE PScedA PScedB PScedC PScedE PScedG PScedH (-1=SYSMIS) (-9=SYSMIS) (-8=SYSMIS) (1=1) (2=0) INTO 
Ewv2_cesd_depressed_raw Ewv2_cesd_effort_raw Ewv2_cesd_sleep_raw Ewv2_cesd_lonely_raw Ewv2_cesd_sad_raw Ewv2_cesd_going_raw.
VARIABLE LABELS  Ewv2_cesd_depressed_raw 'Whether respondent has felt depressed much of the time during the past week (wave 2)' 
/Ewv2_cesd_effort_raw 'Whether respondent felt everything they did during the past week was an effort (wave 2)'
/Ewv2_cesd_sleep_raw 'Whether respondent felt their sleep was restless during the past week (wave 2)'
/Ewv2_cesd_lonely_raw 'Whether respondent felt lonely much of the time during the past week (wave 2)'
/Ewv2_cesd_sad_raw 'Whether respondent felt sad much of the time during the past week (wave 2)'
/Ewv2_cesd_going_raw 'Whether respondent could not get going much of the time during the past week (wave 2)'.
EXECUTE.






RECODE r2whappy r2enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv2_cesd_happy_rand Ewv2_cesd_enlife_rand.
VARIABLE LABELS  Ewv2_cesd_happy_rand 'CESD Was happy (0,1) (wave 2)' 
    /Ewv2_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 2)'.
EXECUTE.


RECODE r2depres r2effort r2sleepr r2flone r2fsad r2going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv2_cesd_depressed_rand Ewv2_cesd_effort_rand Ewv2_cesd_sleep_rand Ewv2_cesd_lonely_rand Ewv2_cesd_sad_rand Ewv2_cesd_going_rand.
VARIABLE LABELS  Ewv2_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 2)' 
/Ewv2_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 2)' 
/Ewv2_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 2)' 
/Ewv2_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 2)' 
/Ewv2_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 2)'
/Ewv2_cesd_going_rand 'CESD Could not get going (0,1) (wave 2)'.
EXECUTE.






# Step 2: Sum of 8 items (elsa and rand data 4 new variables of sum score)


COMPUTE Ewv2_cesd_sumscore_raw = Ewv2_cesd_depressed_raw + Ewv2_cesd_effort_raw + Ewv2_cesd_sleep_raw + Ewv2_cesd_lonely_raw
     + Ewv2_cesd_sad_raw + Ewv2_cesd_going_raw + Ewv2_cesd_happy_raw + Ewv2_cesd_enlife_raw.
VARIABLE LABELS  Ewv2_cesd_sumscore_raw 'Sum of 8 items of CESD (wave 2)'.
EXECUTE.

RECODE  totpsc (-1=SYSMIS) (-9=SYSMIS) (-8=SYSMIS) (ELSE=Copy) INTO Ewv2_cesd_sumitems.
VARIABLE LABELS  Ewv2_cesd_sumitems 'Sum CES-D 8 items measured by ELSA (wave 2)'.
EXECUTE.





COMPUTE Ewv2_cesd_sumscore_rand = Ewv2_cesd_depressed_rand + Ewv2_cesd_effort_rand + Ewv2_cesd_sleep_rand + Ewv2_cesd_lonely_rand
     + Ewv2_cesd_sad_rand + Ewv2_cesd_going_rand + Ewv2_cesd_happy_rand + Ewv2_cesd_enlife_rand.
VARIABLE LABELS  Ewv2_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 2)'.
EXECUTE.


RECODE r2cesd (ELSE=Copy) INTO Ewv2_cesd_score.
VARIABLE LABELS  Ewv2_cesd_score 'CESD total score of 8 items by Rand (wave 2)'.
EXECUTE.






# Step 3: Recode into "Ewv2_depressive_symptoms" (0=no/low depressive symptoms, 1= high depressive symptoms)



RECODE Ewv2_cesd_sumscore_raw (4 thru 8=1) (0 thru 3=0) INTO Ewv2_depressive_symptoms_raw.
VARIABLE LABELS  Ewv2_depressive_symptoms_raw 'Depressive symptoms measured by CES-D at wave 2 (4-8= high, 0-3 = low or no depressive symptoms)'.
EXECUTE.


RECODE Ewv2_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 2 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.




# Wave 3


RECODE r3whappy r3enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv3_cesd_happy_rand Ewv3_cesd_enlife_rand.
VARIABLE LABELS  Ewv3_cesd_happy_rand 'CESD Was happy (0,1) (wave 3)' 
    /Ewv3_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 3)'.
EXECUTE.


RECODE r3depres r3effort r3sleepr r3flone r3fsad r3going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv3_cesd_depressed_rand Ewv3_cesd_effort_rand Ewv3_cesd_sleep_rand Ewv3_cesd_lonely_rand Ewv3_cesd_sad_rand Ewv3_cesd_going_rand.
VARIABLE LABELS  Ewv3_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 3)' 
/Ewv3_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 3)' 
/Ewv3_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 3)' 
/Ewv3_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 3)' 
/Ewv3_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 3)'
/Ewv3_cesd_going_rand 'CESD Could not get going (0,1) (wave 3)'.
EXECUTE.


COMPUTE Ewv3_cesd_sumscore_rand = Ewv3_cesd_depressed_rand + Ewv3_cesd_effort_rand + Ewv3_cesd_sleep_rand + Ewv3_cesd_lonely_rand
     + Ewv3_cesd_sad_rand + Ewv3_cesd_going_rand + Ewv3_cesd_happy_rand + Ewv3_cesd_enlife_rand.
VARIABLE LABELS  Ewv3_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 3)'.
EXECUTE.


RECODE Ewv3_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv3_depressive_symptoms.
VARIABLE LABELS  Ewv3_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 3 (4-8 = high depressive symptoms and 0-3 = low or no depressive symptoms)'.
EXECUTE.





# Wave 4


RECODE r4whappy r4enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv4_cesd_happy_rand Ewv4_cesd_enlife_rand.
VARIABLE LABELS  Ewv4_cesd_happy_rand 'CESD Was happy (0,1) (wave 4)' 
    /Ewv4_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 4)'.
EXECUTE.


RECODE r4depres r4effort r4sleepr r4flone r4fsad r4going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv4_cesd_depressed_rand Ewv4_cesd_effort_rand Ewv4_cesd_sleep_rand Ewv4_cesd_lonely_rand Ewv4_cesd_sad_rand Ewv4_cesd_going_rand.
VARIABLE LABELS  Ewv4_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 4)' 
/Ewv4_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 4)' 
/Ewv4_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 4)' 
/Ewv4_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 4)' 
/Ewv4_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 4)'
/Ewv4_cesd_going_rand 'CESD Could not get going (0,1) (wave 4)'.
EXECUTE.


COMPUTE Ewv4_cesd_sumscore_rand = Ewv4_cesd_depressed_rand + Ewv4_cesd_effort_rand + Ewv4_cesd_sleep_rand + Ewv4_cesd_lonely_rand
     + Ewv4_cesd_sad_rand + Ewv4_cesd_going_rand + Ewv4_cesd_happy_rand + Ewv4_cesd_enlife_rand.
VARIABLE LABELS  Ewv4_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 4)'.
EXECUTE.


RECODE Ewv4_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv4_depressive_symptoms.
VARIABLE LABELS  Ewv4_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 4 (4-8 = high, 0-3 = low or no depressive symptoms)'.
EXECUTE.



# Wave 5


RECODE r5whappy r5enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv5_cesd_happy_rand Ewv5_cesd_enlife_rand.
VARIABLE LABELS  Ewv5_cesd_happy_rand 'CESD Was happy (0,1) (wave 5)' 
    /Ewv5_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 5)'.
EXECUTE.


RECODE r5depres r5effort r5sleepr r5flone r5fsad r5going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv5_cesd_depressed_rand Ewv5_cesd_effort_rand Ewv5_cesd_sleep_rand Ewv5_cesd_lonely_rand Ewv5_cesd_sad_rand Ewv5_cesd_going_rand.
VARIABLE LABELS  Ewv5_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 5)' 
/Ewv5_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 5)' 
/Ewv5_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 5)' 
/Ewv5_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 5)' 
/Ewv5_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 5)'
/Ewv5_cesd_going_rand 'CESD Could not get going (0,1) (wave 5)'.
EXECUTE.


COMPUTE Ewv5_cesd_sumscore_rand = Ewv5_cesd_depressed_rand + Ewv5_cesd_effort_rand + Ewv5_cesd_sleep_rand + Ewv5_cesd_lonely_rand
     + Ewv5_cesd_sad_rand + Ewv5_cesd_going_rand + Ewv5_cesd_happy_rand + Ewv5_cesd_enlife_rand.
VARIABLE LABELS  Ewv5_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 5)'.
EXECUTE.


RECODE Ewv5_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv5_depressive_symptoms.
VARIABLE LABELS  Ewv5_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 5 (4-8 = high, 0-3 = low or no depressive symptoms)'.
EXECUTE.






# Wave 6


RECODE r6whappy r6enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv6_cesd_happy_rand Ewv6_cesd_enlife_rand.
VARIABLE LABELS  Ewv6_cesd_happy_rand 'CESD Was happy (0,1) (wave 6)' 
    /Ewv6_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 6)'.
EXECUTE.


RECODE r6depres r6effort r6sleepr r6flone r6fsad r6going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv6_cesd_depressed_rand Ewv6_cesd_effort_rand Ewv6_cesd_sleep_rand Ewv6_cesd_lonely_rand Ewv6_cesd_sad_rand Ewv6_cesd_going_rand.
VARIABLE LABELS  Ewv6_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 6)' 
/Ewv6_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 6)' 
/Ewv6_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 6)' 
/Ewv6_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 6)' 
/Ewv6_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 6)'
/Ewv6_cesd_going_rand 'CESD Could not get going (0,1) (wave 6)'.
EXECUTE.


COMPUTE Ewv6_cesd_sumscore_rand = Ewv6_cesd_depressed_rand + Ewv6_cesd_effort_rand + Ewv6_cesd_sleep_rand + Ewv6_cesd_lonely_rand
     + Ewv6_cesd_sad_rand + Ewv6_cesd_going_rand + Ewv6_cesd_happy_rand + Ewv6_cesd_enlife_rand.
VARIABLE LABELS  Ewv6_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 6)'.
EXECUTE.


RECODE Ewv6_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv6_depressive_symptoms.
VARIABLE LABELS  Ewv6_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 6 (4-8 = high, 0-3 = low or no depressive symptoms)'.
EXECUTE.





# Wave 7


RECODE r7whappy r7enlife (0=1) (1=0) (ELSE=SYSMIS) INTO Ewv7_cesd_happy_rand Ewv7_cesd_enlife_rand.
VARIABLE LABELS  Ewv7_cesd_happy_rand 'CESD Was happy (0,1) (wave 7)' 
    /Ewv7_cesd_enlife_rand  'CESD Enjoyed life (0,1) (wave 7)'.
EXECUTE.


RECODE r7depres r7effort r7sleepr r7flone r7fsad r7going (0=0) (1=1) (SYSMIS=SYSMIS) INTO 
Ewv7_cesd_depressed_rand Ewv7_cesd_effort_rand Ewv7_cesd_sleep_rand Ewv7_cesd_lonely_rand Ewv7_cesd_sad_rand Ewv7_cesd_going_rand.
VARIABLE LABELS  Ewv7_cesd_depressed_rand 'CES-D Felt depressed (0,1) (wave 7)' 
/Ewv7_cesd_effort_rand 'CES-D Everything an effort (0,1) (wave 7)' 
/Ewv7_cesd_sleep_rand 'CESD Sleep was restless (0,1) (wave 7)' 
/Ewv7_cesd_lonely_rand 'CESD Felt lonely (0,1) (wave 7)' 
/Ewv7_cesd_sad_rand 'CESD Felt sad (0,1)  (wave 7)'
/Ewv7_cesd_going_rand 'CESD Could not get going (0,1) (wave 7)'.
EXECUTE.


COMPUTE Ewv7_cesd_sumscore_rand = Ewv7_cesd_depressed_rand + Ewv7_cesd_effort_rand + Ewv7_cesd_sleep_rand + Ewv7_cesd_lonely_rand
     + Ewv7_cesd_sad_rand + Ewv7_cesd_going_rand + Ewv7_cesd_happy_rand + Ewv7_cesd_enlife_rand.
VARIABLE LABELS  Ewv7_cesd_sumscore_rand 'Sum of 8 items of CESD by Rand (wave 7)'.
EXECUTE.


RECODE Ewv7_cesd_sumscore_rand (4 thru 8=1) (0 thru 3=0)  INTO Ewv7_depressive_symptoms.
VARIABLE LABELS  Ewv7_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 7 (4-8 = high, 0-3 = low or no depressive symptoms)'.
EXECUTE.





# Wave 8
From core dataset "wave_8_elsa_data_eul_v2" recode variables of CES-D:
psceda, pscedb, pscedc, pscedd, pscede, pscedf, pscedg, pscedh
Recode to Ewv8_psceda and merge to the main dataset


RECODE psceda pscedb pscedc pscedd pscede pscedf pscedg pscedh (ELSE=Copy) INTO 
Ewv8_psceda Ewv8_pscedb Ewv8_pscedc Ewv8_pscedd Ewv8_pscede Ewv8_pscedf Ewv8_pscedg Ewv8_pscedh.
VARIABLE LABELS  Ewv8_psceda 'Whether felt depressed much of the time during past week' 
    /Ewv8_pscedb  'Whether felt everything they did during past week was an effort'
    /Ewv8_pscedc  'Whether felt their sleep was restless during past week'
    /Ewv8_pscedd  'Whether was happy much of the time during past week'
    /Ewv8_pscede  'Whether felt lonely much of the time during past week'
    /Ewv8_pscedf   'Whether enjoyed life much of the time during past week'
    /Ewv8_pscedg  'Whether felt sad much of the time during past week'
    /Ewv8_pscedh   'Whether could not get going much of the time during past week'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet11.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet11'
  /BY idauniq.
EXECUTE.





RECODE Ewv8_pscedd Ewv8_pscedf   (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=0) (2=1) INTO 
Ewv8_cesd_happy Ewv8_cesd_enlife.
VARIABLE LABELS  Ewv8_cesd_happy 'Whether respondent was happy much of the time during the past week (wave 8)' 
    /Ewv8_cesd_enlife 'Whether respondent enjoyed life much of the time during the past week (wave 8)'.
EXECUTE.


RECODE Ewv8_psceda Ewv8_pscedb Ewv8_pscedc Ewv8_pscede Ewv8_pscedg Ewv8_pscedh 
(-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO 
Ewv8_cesd_depressed Ewv8_cesd_effort Ewv8_cesd_sleep Ewv8_cesd_lonely Ewv8_cesd_sad Ewv8_cesd_going.
VARIABLE LABELS  Ewv8_cesd_depressed 'Whether respondent has felt depressed much of the time during the past week (wave 8)' 
/Ewv8_cesd_effort 'Whether respondent felt everything they did during the past week was an effort (wave 8)'
/Ewv8_cesd_sleep 'Whether respondent felt their sleep was restless during the past week (wave 8)'
/Ewv8_cesd_lonely 'Whether respondent felt lonely much of the time during the past week (wave 8)'
/Ewv8_cesd_sad 'Whether respondent felt sad much of the time during the past week (wave 8)'
/Ewv8_cesd_going 'Whether respondent could not get going much of the time during the past week (wave 8)'.
EXECUTE.




COMPUTE Ewv8_cesd_sumscore = Ewv8_cesd_depressed + Ewv8_cesd_effort + Ewv8_cesd_sleep + Ewv8_cesd_lonely
     + Ewv8_cesd_sad + Ewv8_cesd_going + Ewv8_cesd_happy + Ewv8_cesd_enlife.
VARIABLE LABELS  Ewv8_cesd_sumscore 'Sum of 8 items of CESD (wave 8)'.
EXECUTE.



RECODE Ewv8_cesd_sumscore (4 thru 8=1) (0 thru 3=0) INTO Ewv8_depressive_symptoms.
VARIABLE LABELS  Ewv8_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 8 (4-8= high, 0-3 = low or no depressive symptoms)'.
EXECUTE.







# Wave 9


RECODE w9psceda w9pscedb w9pscedc w9pscedd w9pscede w9pscedf w9pscedg w9pscedh (ELSE=Copy) INTO 
Ewv9_psceda Ewv9_pscedb Ewv9_pscedc Ewv9_pscedd Ewv9_pscede Ewv9_pscedf Ewv9_pscedg Ewv9_pscedh.
VARIABLE LABELS  Ewv9_psceda 'Whether felt depressed much of the time during past week' 
    /Ewv9_pscedb  'Whether felt everything they did during past week was an effort'
    /Ewv9_pscedc  'Whether felt their sleep was restless during past week'
    /Ewv9_pscedd  'Whether was happy much of the time during past week'
    /Ewv9_pscede  'Whether felt lonely much of the time during past week'
    /Ewv9_pscedf   'Whether enjoyed life much of the time during past week'
    /Ewv9_pscedg  'Whether felt sad much of the time during past week'
    /Ewv9_pscedh   'Whether could not get going much of the time during past week'.
EXECUTE.



RECODE Ewv9_pscedd Ewv9_pscedf  (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=0) (2=1) INTO 
Ewv9_cesd_happy Ewv9_cesd_enlife.
VARIABLE LABELS  Ewv9_cesd_happy 'Whether respondent was happy much of the time during the past week (wave 9)' 
    /Ewv9_cesd_enlife 'Whether respondent enjoyed life much of the time during the past week (wave 9)'.
EXECUTE.


RECODE Ewv9_psceda Ewv9_pscedb Ewv9_pscedc Ewv9_pscede Ewv9_pscedg Ewv9_pscedh
(-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO Ewv9_cesd_depressed Ewv9_cesd_effort Ewv9_cesd_sleep Ewv9_cesd_lonely Ewv9_cesd_sad Ewv9_cesd_going.
VARIABLE LABELS  Ewv9_cesd_depressed 'Whether respondent has felt depressed much of the time during the past week (wave 9)' 
/Ewv9_cesd_effort 'Whether respondent felt everything they did during the past week was an effort (wave 9)'
/Ewv9_cesd_sleep 'Whether respondent felt their sleep was restless during the past week (wave 9)'
/Ewv9_cesd_lonely 'Whether respondent felt lonely much of the time during the past week (wave 9)'
/Ewv9_cesd_sad 'Whether respondent felt sad much of the time during the past week (wave 9)'
/Ewv9_cesd_going 'Whether respondent could not get going much of the time during the past week (wave 9)'.
EXECUTE.



COMPUTE Ewv9_cesd_sumscore = Ewv9_cesd_depressed + Ewv9_cesd_effort + Ewv9_cesd_sleep + Ewv9_cesd_lonely
     + Ewv9_cesd_sad + Ewv9_cesd_going + Ewv9_cesd_happy + Ewv9_cesd_enlife.
VARIABLE LABELS  Ewv9_cesd_sumscore 'Sum of 8 items of CESD (wave 9)'.
EXECUTE.



RECODE Ewv9_cesd_sumscore (4 thru 8=1) (0 thru 3=0) INTO Ewv9_depressive_symptoms.
VARIABLE LABELS  Ewv9_depressive_symptoms 'Depressive symptoms measured by CES-D at wave 9 (4-8= high, 0-3 = low or no depressive symptoms)'.
EXECUTE.







# Cardiometabolic markers
Cardiometabolic markers assessememt takes place at the baseline wave 2 and at the follow-up waves 4, 6 and 8
Criteria for metabolic biomarkers according to the International Diabetes Federation (IDF)
1. Inflammation indicator of high-sensitivity C-reactive protein (CRP) 
2. Blood pressure (BP)
3. Diabetes
4. Glucose (HbA1c)
4. Abdomical obesity (waist circumference)
5. HDL cholesterol 




# Wave 2 (baseline)

# Inflammation CRP 
Raw variable: hscrp (measured in mg/l)
Normal level of CRP ≤ 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L see: http://unitslab.com/node/67)
Steps: 
1. Recode hscrp into a new CRP variable to exclude missing data
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE hscrp (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv2_crp_level.
VARIABLE LABELS  Ewv2_crp_level 'CRP level (ug/mL) without n/a (wave 2)'.
EXECUTE.

RECODE Ewv2_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Ewv2_crp.
VARIABLE LABELS Ewv2_crp 'CRP level dichotomised into normal/high (normal CRP ≤ 3 ug/mL) (wave 2)'.
EXECUTE.




# HDL cholesterol
Raw variable: hdl
Unit of measurment mmol/L
Self-reported cholesterol: r2hchole (rand data)
Medication for choloesterol: hechoa
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
      or specific treatment for this lipid abnormality
Steps:
1. Recode hdl into HDL cholesterol level without missing data
2. Recode according to male and female level criteria
3. Sum of male and female HDL 
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE hdl (-11.0=SYSMIS) (-9.0=SYSMIS) (-8.0=SYSMIS) (-7.0=SYSMIS) (-6.0=SYSMIS) (-5.0=SYSMIS) 
    (-4.0=SYSMIS) (-3.0=SYSMIS) (-2.0=SYSMIS) (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv2_hdl_level.
VARIABLE LABELS  Ewv2_hdl_level 'HDL cholesterol level (mmol/L) without n/a (wave 2)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv2_hdl_level (Lowest thru 1.02=1) (1.03 thru Highest=0) 
    INTO Ewv2_male_hdl.
END IF.
VARIABLE LABELS  Ewv2_male_hdl 'Male HDL cholesterol (wave 2): IDF criteria < 1.03 mg/dL'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv2_hdl_level (Lowest thru 1.28=1) (1.29 thru Highest=0) 
    INTO Ewv2_female_hdl.
END IF.
VARIABLE LABELS  Ewv2_female_hdl 'Female HDL cholesterol (wave 2): IDF criteria < 1.29 mmol/L'.
EXECUTE.



* Sum of male, female HDL, and recode into 0-1 variable

COMPUTE Ewv2_hdl_sum=SUM(Ewv2_male_hdl,Ewv2_female_hdl).
VARIABLE LABELS  Ewv2_hdl_sum 'Sum of male and female HDL cholesterol (wave 2)'.
EXECUTE.

RECODE Ewv2_hdl_sum (0=0) (1 thru Highest=1) INTO Ewv2_hdl_cholesterol.
VARIABLE LABELS Ewv2_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 2)'.
EXECUTE.





# Abdominal obesity (waist circumference or BMI > 30 kg/m²) 
Raw variable: 
- r2bmi -> r body mass index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- wstval -> waist measurement
    Unit of measurement: cm
    IDF criteria (ethnic group: Europids)
          Abdominal obesity 
          Male ≥ 94 cm
          Female ≥ 80 cm
Steps:
Waist circumference
    1. Recode wstval into waist circumference score without n/a
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode r2bmi into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)



RECODE wstval (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv2_waist.
VARIABLE LABELS  Ewv2_waist 'Waist circumference in cm (wave 2)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv2_waist (Lowest thru 93.99=0) (94.00 thru Highest=1) INTO Ewv2_malewaist_ao.
END IF.
VARIABLE LABELS  Ewv2_malewaist_ao 'Male Waist circumference (cm) (wave 2): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv2_waist (Lowest thru 79.99=0) (80.00 thru Highest=1) INTO Ewv2_femalewaist_ao.
END IF.
VARIABLE LABELS  Ewv2_femalewaist_ao 'Female Waist circumference (cm) (wave 2): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

COMPUTE Ewv2_obesity_waist_sum=SUM(Ewv2_malewaist_ao,Ewv2_femalewaist_ao).
VARIABLE LABELS  Ewv2_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 2)'.
EXECUTE.

RECODE Ewv2_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Ewv2_obesity_waist.
VARIABLE LABELS  Ewv2_obesity_waist 'Abdominal obesity based on waist circumference at wave 2 (yes/no)'.
EXECUTE.



RECODE r2bmi (ELSE=Copy) INTO Ewv2_bmi_score.
VARIABLE LABELS  Ewv2_bmi_score 'BMI score kg/m² (wave 2)'.
EXECUTE.


RECODE Ewv2_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Ewv2_obesity_bmi.
VARIABLE LABELS  Ewv2_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 2 (yes/no)'.
EXECUTE.


COMPUTE Ewv2_waist_bmi_sum=SUM(Ewv2_obesity_waist,Ewv2_obesity_bmi).
VARIABLE LABELS  Ewv2_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 2)'.
EXECUTE.


RECODE Ewv2_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Ewv2_obesity.
VARIABLE LABELS  Ewv2_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 2'.
EXECUTE.




# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables to use measured in mm Hg
Systolic reading: sysval (Valid Mean Systolic BP)
Diastolic reading: diaval (Valid Mean Diastolic BP)
Medication: Hemda
Self-reported hypertension: hedimbp (elsa original data), r2hibpe (Rand data)
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Recode Diastolic BP
2. Recode Systolic BP
3. Sum of diastolic, systolic
4. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP

RECODE sysval diaval (-1.0=SYSMIS)  (ELSE=Copy) INTO Ewv2_systolic_mean Ewv2_diastolic_mean.
VARIABLE LABELS  Ewv2_systolic_mean 'Mean Systolic blood pressure (BP) (wave 2)' 
/Ewv2_diastolic_mean 'Mean Diastolic BP (wave 2)'.
EXECUTE.


RECODE Ewv2_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Ewv2_systolic_bp.
VARIABLE LABELS  Ewv2_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130  (wave 2)'.
EXECUTE.

RECODE Ewv2_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Ewv2_diastolic_bp.
VARIABLE LABELS  Ewv2_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 2)'.
EXECUTE.


RECODE r2hibpe (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv2_bp_before.
VARIABLE LABELS  Ewv2_bp_before 'Ever had high blood pressure measured by Rand (wave 2)'.
EXECUTE.

COMPUTE Ewv2_bp_diagnosed_sum=SUM(Ewv2_bp_reportevr,Ewv2_bp_before).
VARIABLE LABELS  Ewv2_bp_diagnosed_sum 'Sum of ever reported previously diagnosed high blood pressure at wave 2'.
EXECUTE.

RECODE Ewv2_bp_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv2_bp_diagnosed.
VARIABLE LABELS  Ewv2_bp_diagnosed  'Ever reported previously diagnosed high blood pressure at wave 2'.
EXECUTE.



* Sum of systolic, diastolic and recode into a 0-1 variable

COMPUTE Ewv2_bp_sum=SUM(Ewv2_systolic_bp,Ewv2_diastolic_bp).
VARIABLE LABELS Ewv2_bp_sum 'Sum of BP including mean systolic, diastolic for high BP (wave 2)'.
EXECUTE.

RECODE Ewv2_bp_sum (0=0) (1 thru Highest=1) INTO Ewv2_bp.
VARIABLE LABELS  Ewv2_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 2'.
EXECUTE.







# Diabetes and Glycemia
Raw variables: 
fglu: Blood glucose level (mmol/L) - fasting samples only
hba1c: Blood glycated haemoglobin level (%)
Type 2 diabetes previously diagnosed: HeACd, cheacd, hedimdi, hedbts, r2diabe (rand data)
Medication: HeMdb, HeIns, HeAcea
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode Glucose ≥ 5.6 mmol/L
3. Recode HbA1c ≥ 6.5% (48 mmol/mol)
4. Sum of glucose and self-reported diabetes diagnosis
5. Dichotomous variable of glycemia (yes/no)



* Self-reported diabetes diagnosis

RECODE HeACd (-9=SYSMIS) (-8=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO Ewv2_diabetes_doctor1.
VARIABLE LABELS  Ewv2_diabetes_doctor1 'Whether ever been told has diabetes by doctor (wave 2)'.
EXECUTE.

RECODE cheacd (-9=SYSMIS) (-8=SYSMIS) (-6=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO Ewv2_diabetes_doctor2.
VARIABLE LABELS  Ewv2_diabetes_doctor2 'Whether ever been told has diabetes by doctor (wave 2)'.
EXECUTE.

RECODE hedimdi (-2=SYSMIS) (-3=SYSMIS) (1=1) (2=1) (0=0) INTO Ewv2_diabetes_report.
VARIABLE LABELS  Ewv2_diabetes_report 'Ever reported diabetes or high blood sugar (diagnosed) (wave 2)'.
EXECUTE.

RECODE hedbts (-2=SYSMIS) (-3=SYSMIS) (-8=SYSMIS) (1=1) (2=1) (0=0) INTO Ewv2_diabetes_evr.
VARIABLE LABELS  Ewv2_diabetes_evr 'Ever reported diabetes (diagnosed) (wave 2)'.
EXECUTE.

RECODE r2diabe (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv2_diabetes_before.
VARIABLE LABELS  Ewv2_diabetes_before 'Ever had diabetes measured by Rand (wave 1)'.
EXECUTE.


COMPUTE Ewv2_diabetes_diagnosed_sum=SUM(Ewv2_diabetes_doctor1,Ewv2_diabetes_doctor2,Ewv2_diabetes_report,Ewv2_diabetes_evr,Ewv2_diabetes_before).
VARIABLE LABELS  Ewv2_diabetes_diagnosed_sum 'Sum of ever reported previously diagnosed diabetes at wave 2'.
EXECUTE.

RECODE Ewv2_diabetes_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv2_diabetes_diagnosed.
VARIABLE LABELS  Ewv2_diabetes_diagnosed  'Ever reported previously diagnosed diabetes at wave 2'.
EXECUTE.



*Glucose level (FPG)


RECODE fglu (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv2_glucose_level.
VARIABLE LABELS  Ewv2_glucose_level 'Fasting plasma glucose level (mmol/L) at wave 2'.
EXECUTE.

RECODE Ewv2_glucose_level (Lowest thru 5.59=0) (5.6 thru Highest=1) INTO Ewv2_glucose.
VARIABLE LABELS  Ewv2_glucose 'Glucose (mmol/L): IDF criteria FPG ≥ 5.6 mmol/L (wave 2)'.
EXECUTE.



* HbA1c level


RECODE hba1c (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv2_HbA1c_level.
VARIABLE LABELS  Ewv2_HbA1c_level 'Blood glycated haemoglobin (HbA1c) level (%) at wave 2'.
EXECUTE.

RECODE Ewv2_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Ewv2_HbA1c.
VARIABLE LABELS  Ewv2_HbA1c 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 2)'.
EXECUTE.



*Sum of glucose and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Ewv2_diabetes_glucose_sum=SUM(Ewv2_diabetes_diagnosed,Ewv2_glucose).
VARIABLE LABELS Ewv2_diabetes_glucose_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 2)'.
EXECUTE.

RECODE Ewv2_diabetes_glucose_sum (0=0) (1 thru Highest=1) INTO Ewv2_glycemia.
VARIABLE LABELS  Ewv2_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 2)'.
EXECUTE.



# Wave 4
Variables to merge: 
Core dataset
        HDL cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, hechmd, hechme
        BP: hedawbp, hedacbp, hedasbp, hediabp, hedimbp, hemda, hemdab
        Glycemia: hedawdi, hedacdi, hediadi, hedimdi, heacd, heins, hemdb, heacea, hehrtmd
Nurse dataset
        Inflammation: hscrp, cfib
        HDL cholesterol: hdl
        Obesity: wstval
        Triglycerides: trig
        BP: sysval, diaval
        Glycemia: fglu, hba1c
        



RECODE hedawch hedacch hedasch hediach hedimch hechmd hechme 
hedawbp hedacbp hedasbp hediabp hedimbp hemda hemdab
hedawdi hedacdi hediadi hedimdi heacd heins hemdb heacea hehrtmd (ELSE=Copy) INTO 
Ewv4_hedawch Ewv4_hedacch Ewv4_hedasch Ewv4_hediach Ewv4_hedimch Ewv4_hechmd Ewv4_hechme 
Ewv4_hedawbp Ewv4_hedacbp Ewv4_hedasbp Ewv4_hediabp Ewv4_hedimbp Ewv4_hemda Ewv4_hemdab
Ewv4_hedawdi Ewv4_hedacdi Ewv4_hediadi Ewv4_hedimdi Ewv4_heacd Ewv4_heins Ewv4_hemdb Ewv4_heacea Ewv4_hehrtmd.
VARIABLE LABELS  Ewv4_hedawch 'Diagnosed high cholesterol fed forward' 
    /Ewv4_hedacch  'Whether confirms high cholesterol diagnosis'
    /Ewv4_hedasch  'Whether still has high cholesterol'
    /Ewv4_hediach  'CVD: high cholesterol diagnosis newly reported'
    /Ewv4_hedimch  'CVD: high cholesterol diagnosis newly reported (merged)'
    /Ewv4_hechmd  'Cholesterol: whether taking medication to lower cholesterol level'
    /Ewv4_hechme  'Cholesterol: whether taking medication to prevent level becoming high'
    /Ewv4_hedawbp 'Diagnosed high blood pressure fed forward'
    /Ewv4_hedacbp 'Whether confirms high blood pressure diagnosis'
    /Ewv4_hedasbp 'Whether still has high blood pressure'
    /Ewv4_hediabp 'CVD: high blood pressure diagnosis newly reported'
    /Ewv4_hedimbp 'CVD: high blood pressure diagnosis newly reported (merged)'
    /Ewv4_hemda 'High blood pressure: whether taking medication'
    /Ewv4_hemdab 'High blood pressure: whether taking medication to prevent high level returning'
    /Ewv4_hedawdi 'Diagnosed diabetes or high blood sugar fed forward'
    /Ewv4_hedacdi 'Whether confirms diabetes or high blood sugar diagnosis'
    /Ewv4_hediadi 'CVD: diabetes or high blood sugar diagnosis newly reported'
    /Ewv4_hedimdi 'CVD: diabetes or high blood sugar diagnosis newly reported (merged)'
    /Ewv4_heacd 'Whether ever been told has diabetes by doctor'
    /Ewv4_heins 'Diabetes: whether currently injects insulin'
    /Ewv4_hemdb 'Diabetes: whether taking medication'
    /Ewv4_heacea 'Diabetes: whether taking ACE inhibitor or A2 receptor blocker'
    /Ewv4_hehrtmd 'Angina, MI, diabetes, stroke: whether taking blood-thinning medication'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet15.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet15'
  /BY idauniq.
EXECUTE.





RECODE hscrp hdl wstval sysval diaval fglu hba1c (ELSE=Copy) INTO 
Ewv4_hscrp Ewv4_hdl Ewv4_wstval Ewv4_sysval Ewv4_diaval Ewv4_fglu Ewv4_hba1c.
VARIABLE LABELS  Ewv4_hscrp 'Blood CRP level (mg/l)' 
    /Ewv4_hdl  'Blood HDL level (mmol/l)'
    /Ewv4_wstval  '(D) Valid Mean Waist (cm)'
    /Ewv4_sysval   '(D) Valid Mean Systolic BP'
    /Ewv4_diaval  '(D) Valid Mean Diastolic BP'
    /Ewv4_fglu 'Blood glucose level (mmol/L) - fasting samples only'
    /Ewv4_hba1c 'Blood glycated haemoglobin level (%)'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet14.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet14'
  /BY idauniq.
EXECUTE.




# Inflammation CRP 
Raw variable: hscrp (measured in mg/l)
Normal level of CRP ≤ 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L see: http://unitslab.com/node/67)
Steps: 
1. Recode hscrp into a new CRP variable to exclude missing data
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE Ewv4_hscrp (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv4_crp_level.
VARIABLE LABELS  Ewv4_crp_level 'CRP level (ug/mL) without n/a (wave 4)'.
EXECUTE.

RECODE Ewv4_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Ewv4_crp.
VARIABLE LABELS Ewv4_crp 'CRP level dichotomised into normal/high (normal CRP ≤ 3 ug/mL) (wave 4)'.
EXECUTE.






# HDL cholesterol
Raw variable: hdl
Unit of measurment mmol/L
Self-reported cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, r4hchole (rand data)
Medication for choloesterol: hechmd, hechme 
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
      or specific treatment for this lipid abnormality
Steps:
1. Recode hdl into HDL cholesterol level without missing data
2. Recode according to male and female level criteria
3. Sum of male and female HDL
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE Ewv4_hdl (-11.0=SYSMIS) (-9.0=SYSMIS) (-8.0=SYSMIS) (-7.0=SYSMIS) (-6.0=SYSMIS) (-5.0=SYSMIS) 
    (-4.0=SYSMIS) (-3.0=SYSMIS) (-2.0=SYSMIS) (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv4_hdl_level.
VARIABLE LABELS  Ewv4_hdl_level 'HDL cholesterol level (mmol/L) without n/a (wave 4)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv4_hdl_level (Lowest thru 1.02=1) (1.03 thru Highest=0) 
    INTO Ewv4_male_hdl.
END IF.
VARIABLE LABELS  Ewv4_male_hdl 'Male HDL cholesterol (wave 4): IDF criteria < 1.03 mg/dL'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv4_hdl_level (Lowest thru 1.28=1) (1.29 thru Highest=0) 
    INTO Ewv4_female_hdl.
END IF.
VARIABLE LABELS  Ewv4_female_hdl 'Female HDL cholesterol (wave 4): IDF criteria < 1.29 mmol/L'.
EXECUTE.





* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Ewv4_hdl_sum=SUM(Ewv4_male_hdl,Ewv4_female_hdl).
VARIABLE LABELS  Ewv4_hdl_sum 'Sum of male and female HDL cholesterol (wave 4)'.
EXECUTE.

RECODE Ewv4_hdl_sum (0=0) (1 thru Highest=1) INTO Ewv4_hdl_cholesterol.
VARIABLE LABELS Ewv4_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 4)'.
EXECUTE. 





# Abdominal obesity (waist circumference or BMI > 30 kg/m²) 
Raw variable: 
- r4bmi -> r body mass index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- wstval -> waist measurement
    Unit of measurement: cm
    IDFcriteria (ethnic group: Europids)
          Abdominal obesity 
          Male ≥ 94 cm
          Female ≥ 80 cm
Steps:
Waist circumference
    1. Recode wstval into waist circumference score without n/a
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode r4bmi into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)



RECODE Ewv4_wstval (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv4_waist.
VARIABLE LABELS  Ewv4_waist 'Waist circumference in cm (wave 4)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv4_waist (Lowest thru 93.99=0) (94.00 thru Highest=1) INTO Ewv4_malewaist_ao.
END IF.
VARIABLE LABELS  Ewv4_malewaist_ao 'Male Waist circumference (cm) (wave 4): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv4_waist (Lowest thru 79.99=0) (80.00 thru Highest=1) INTO Ewv4_femalewaist_ao.
END IF.
VARIABLE LABELS  Ewv4_femalewaist_ao 'Female Waist circumference (cm) (wave 4): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

COMPUTE Ewv4_obesity_waist_sum=SUM(Ewv4_malewaist_ao,Ewv4_femalewaist_ao).
VARIABLE LABELS  Ewv4_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 4)'.
EXECUTE.

RECODE Ewv4_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Ewv4_obesity_waist.
VARIABLE LABELS  Ewv4_obesity_waist 'Abdominal obesity based on waist circumference at wave 4 (yes/no)'.
EXECUTE.



RECODE r4bmi (ELSE=Copy) INTO Ewv4_bmi_score.
VARIABLE LABELS  Ewv4_bmi_score 'BMI score kg/m² (wave 4)'.
EXECUTE.


RECODE Ewv4_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Ewv4_obesity_bmi.
VARIABLE LABELS  Ewv4_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 4 (yes/no)'.
EXECUTE.


COMPUTE Ewv4_waist_bmi_sum=SUM(Ewv4_obesity_waist,Ewv4_obesity_bmi).
VARIABLE LABELS  Ewv4_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 4)'.
EXECUTE.


RECODE Ewv4_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Ewv4_obesity.
VARIABLE LABELS  Ewv4_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 4'.
EXECUTE.




# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables to use measured in mm Hg
Systolic reading: sysval (Valid Mean Systolic BP)
Diastolic reading: diaval (Valid Mean Diastolic BP)
Medication: hemda, hemdab
Self-reported hypertension: hedawbp, hedacbp, hedasbp, hediabp, hedimbp (elsa original data), r4hibpe (Rand data)
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Recode Diastolic BP
2. Recode Systolic BP
3. Sum of diastolic, systolic BP
4. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP

RECODE Ewv4_sysval Ewv4_diaval (-1.0=SYSMIS)  (ELSE=Copy) INTO Ewv4_systolic_mean Ewv4_diastolic_mean.
VARIABLE LABELS  Ewv4_systolic_mean 'Mean Systolic blood pressure (BP) (wave 4)' 
/Ewv4_diastolic_mean 'Mean Diastolic BP (wave 4)'.
EXECUTE.


RECODE Ewv4_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Ewv4_systolic_bp.
VARIABLE LABELS  Ewv4_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130  (wave 4)'.
EXECUTE.

RECODE Ewv4_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Ewv4_diastolic_bp.
VARIABLE LABELS  Ewv4_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 4)'.
EXECUTE.



* Sum of systolic, diastolic, hypertension diagnosis and recode into a 0-1 variable

COMPUTE Ewv4_bp_sum=SUM(Ewv4_systolic_bp,Ewv4_diastolic_bp).
VARIABLE LABELS Ewv4_bp_sum 'Sum of BP including mean systolic, diastolic  BP (wave 4)'.
EXECUTE.

RECODE Ewv4_bp_sum (0=0) (1 thru Highest=1) INTO Ewv4_bp.
VARIABLE LABELS  Ewv4_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 4'.
EXECUTE.









# Diabetes and Glycemia
Raw variables: 
fglu: Blood glucose level (mmol/L) - fasting samples only
hba1c: Blood glycated haemoglobin level (%)
Type 2 diabetes previously diagnosed: hedawdi, hedacdi, hediadi, hedimdi, heacd (original elsa data), r4diabe (rand data)
Medication: heins, hemdb, heacea, hehrtmd
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode Glucose ≥ 5.6 mmol/L
3. Recode HbA1c ≥ 6.5% (48 mmol/mol)
4. Sum of glucose and self-reported diabetes diagnosis
5. Dichotomous variable of glycemia (yes/no)



* Self-reported diabetes diagnosis (hedawdi, hedacdi, hediadi, hedimdi, heacd, r4diabe)


RECODE Ewv4_hedawdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (7=1)
INTO Ewv4_diabetes_before.
VARIABLE LABELS  Ewv4_diabetes_before 'Diagnosed diabetes or high blood sugar fed forward at wave 4'.
EXECUTE.

RECODE Ewv4_hedacdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS)  (1=1) (2=0)
INTO Ewv4_diabetes_confirm.
VARIABLE LABELS  Ewv4_diabetes_confirm 'Whether confirms diabetes or high blood sugar diagnosis at wave 4 (yes/no)'.
EXECUTE.


RECODE Ewv4_hediadi Ewv4_hedimdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0)
INTO Ewv4_diabetes_new Ewv4_diabetes_newreport.
VARIABLE LABELS  Ewv4_diabetes_new 'Diabetes or high blood sugar diagnosis newly reported at wave 4 (yes/no)' 
/Ewv4_diabetes_newreport 'diabetes or high blood sugar diagnosis newly reported (merged) at wave 4 (yes/no)'.
EXECUTE.


RECODE Ewv4_heacd (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO Ewv4_diabetes_doctor.
VARIABLE LABELS  Ewv4_diabetes_doctor 'Whether ever been told has diabetes by doctor (wave 4)'.
EXECUTE.


RECODE r4diabe (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv4_diabetes_evr.
VARIABLE LABELS  Ewv4_diabetes_evr 'Ever had diabetes measured by Rand (wave 4)'.
EXECUTE.


COMPUTE Ewv4_diabetes_diagnosed_sum=
SUM(Ewv4_diabetes_before,Ewv4_diabetes_confirm,Ewv4_diabetes_new,Ewv4_diabetes_newreport,Ewv4_diabetes_doctor,Ewv4_diabetes_evr).
VARIABLE LABELS  Ewv4_diabetes_diagnosed_sum 'Sum of ever reported previously diagnosed diabetes at wave 4'.
EXECUTE.

RECODE Ewv4_diabetes_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv4_diabetes_diagnosed.
VARIABLE LABELS  Ewv4_diabetes_diagnosed  'Ever reported previously diagnosed diabetes at wave 4'.
EXECUTE.



*Glucose level (FPG)


RECODE Ewv4_fglu (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv4_glucose_level.
VARIABLE LABELS  Ewv4_glucose_level 'Fasting plasma glucose level (mmol/L) at wave 4'.
EXECUTE.

RECODE Ewv4_glucose_level (Lowest thru 5.59=0) (5.6 thru Highest=1) INTO Ewv4_glucose.
VARIABLE LABELS  Ewv4_glucose 'Glucose (mmol/L): IDF criteria FPG ≥ 5.6 mmol/L (wave 4)'.
EXECUTE.



* HbA1c level


RECODE Ewv4_hba1c (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv4_HbA1c_level.
VARIABLE LABELS  Ewv4_HbA1c_level 'Blood glycated haemoglobin (HbA1c) level (%) at wave 4'.
EXECUTE.

RECODE Ewv4_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Ewv4_HbA1c_who.
VARIABLE LABELS  Ewv4_HbA1c_who 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 4)'.
EXECUTE.



*Sum of glucose and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Ewv4_diabetes_glucose_sum=SUM(Ewv4_diabetes_diagnosed,Ewv4_glucose).
VARIABLE LABELS Ewv4_diabetes_glucose_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 4)'.
EXECUTE.

RECODE Ewv4_diabetes_glucose_sum (0=0) (1 thru Highest=1) INTO Ewv4_glycemia.
VARIABLE LABELS  Ewv4_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 4)'.
EXECUTE.





# Wave 6
Variables to merge: 
Core dataset
        HDL cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, HeChMd, HeChMe
        BP: hedawbp, hedacbp, hedasbp, hediabp, hedimbp, HeMDa, HeMdab
        Glycemia: hedawdi, hedacdi, hediadi, hedimdi, HeACd, HeIns, HeMdb, HeAcea
Nurse dataset
        Inflammation: hscrp, cfib
        HDL cholesterol: hdl
        Obesity: WSTVAL
        Triglycerides: trig
        BP: SYSVAL, DIAVAL
        Glycemia: fglu, hba1c
        

RECODE hedawch hedacch hedasch hediach hedimch HeChMd HeChMe 
hedawbp hedacbp hedasbp hediabp hedimbp HeMDa HeMdab
hedawdi hedacdi hediadi hedimdi HeACd HeIns HeMdb HeAcea (ELSE=Copy) INTO 
Ewv6_hedawch Ewv6_hedacch Ewv6_hedasch Ewv6_hediach Ewv6_hedimch Ewv6_hechmd Ewv6_hechme 
Ewv6_hedawbp Ewv6_hedacbp Ewv6_hedasbp Ewv6_hediabp Ewv6_hedimbp Ewv6_hemda Ewv6_hemdab
Ewv6_hedawdi Ewv6_hedacdi Ewv6_hediadi Ewv6_hedimdi Ewv6_heacd Ewv6_heins Ewv6_hemdb Ewv6_heacea.
VARIABLE LABELS  Ewv6_hedawch 'Diagnosed high cholesterol fed forward' 
    /Ewv6_hedacch  'Whether confirms high cholesterol diagnosis'
    /Ewv6_hedasch  'Whether still has high cholesterol'
    /Ewv6_hediach  'CVD: high cholesterol diagnosis newly reported'
    /Ewv6_hedimch  'CVD: high cholesterol diagnosis newly reported (merged)'
    /Ewv6_hechmd  'Cholesterol: whether taking medication to lower cholesterol level'
    /Ewv6_hechme  'Cholesterol: whether taking medication to prevent level becoming high'
    /Ewv6_hedawbp 'Diagnosed high blood pressure fed forward'
    /Ewv6_hedacbp 'Whether confirms high blood pressure diagnosis'
    /Ewv6_hedasbp 'Whether still has high blood pressure'
    /Ewv6_hediabp 'CVD: high blood pressure diagnosis newly reported'
    /Ewv6_hedimbp 'CVD: high blood pressure diagnosis newly reported (merged)'
    /Ewv6_hemda 'High blood pressure: whether taking medication'
    /Ewv6_hemdab 'High blood pressure: whether taking medication to prevent high level returning'
    /Ewv6_hedawdi 'Diagnosed diabetes or high blood sugar fed forward'
    /Ewv6_hedacdi 'Whether confirms diabetes or high blood sugar diagnosis'
    /Ewv6_hediadi 'CVD: diabetes or high blood sugar diagnosis newly reported'
    /Ewv6_hedimdi 'CVD: diabetes or high blood sugar diagnosis newly reported (merged)'
    /Ewv6_heacd 'Whether ever been told has diabetes by doctor'
    /Ewv6_heins 'Diabetes: whether currently injects insulin'
    /Ewv6_hemdb 'Diabetes: whether taking medication'
    /Ewv6_heacea 'Diabetes: whether taking ACE inhibitor or A2 receptor blocker'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet17.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet17'
  /BY idauniq.
EXECUTE.




RECODE hscrp hdl WSTVAL SYSVAL DIAVAL fglu hba1c (ELSE=Copy) INTO 
Ewv6_hscrp Ewv6_hdl Ewv6_wstval Ewv6_sysval Ewv6_diaval Ewv6_fglu Ewv6_hba1c.
VARIABLE LABELS  Ewv6_hscrp 'Blood CRP level (mg/l)' 
    /Ewv6_hdl  'Blood HDL level (mmol/l)'
    /Ewv6_wstval  '(D) Valid Mean Waist (cm)'
    /Ewv6_sysval   '(D) Valid Mean Systolic BP'
    /Ewv6_diaval  '(D) Valid Mean Diastolic BP'
    /Ewv6_fglu 'Blood glucose level (mmol/L) - fasting samples only'
    /Ewv6_hba1c 'Blood glycated haemoglobin level (%)'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet16.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet16'
  /BY idauniq.
EXECUTE.






# Inflammation CRP 
Raw variable: hscrp (measured in mg/l)
Normal level of CRP ≤ 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L see: http://unitslab.com/node/67)
Steps: 
1. Recode hscrp into a new CRP variable to exclude missing data
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE Ewv6_hscrp (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv6_crp_level.
VARIABLE LABELS  Ewv6_crp_level 'CRP level (ug/mL) without n/a (wave 6)'.
EXECUTE.

RECODE Ewv6_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Ewv6_crp.
VARIABLE LABELS Ewv6_crp 'CRP level dichotomised into normal/high (normal CRP ≤ 3 ug/mL) (wave 6)'.
EXECUTE.




# HDL cholesterol
Raw variable: hdl
Unit of measurment mmol/L
Self-reported cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, r6hchole (rand data)
Medication for choloesterol: HeChMd, HeChMe
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
      or specific treatment for this lipid abnormality
Steps:
1. Recode hdl into HDL cholesterol level without missing data
2. Recode according to male and female level criteria
3. Sum of male and female HDL 
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE Ewv6_hdl (-11.0=SYSMIS) (-9.0=SYSMIS) (-8.0=SYSMIS) (-7.0=SYSMIS) (-6.0=SYSMIS) (-5.0=SYSMIS) 
    (-4.0=SYSMIS) (-3.0=SYSMIS) (-2.0=SYSMIS) (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv6_hdl_level.
VARIABLE LABELS  Ewv6_hdl_level 'HDL cholesterol level (mmol/L) without n/a (wave 6)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv6_hdl_level (Lowest thru 1.02=1) (1.03 thru Highest=0) 
    INTO Ewv6_male_hdl.
END IF.
VARIABLE LABELS  Ewv6_male_hdl 'Male HDL cholesterol (wave 6): IDF criteria < 1.03 mg/dL'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv6_hdl_level (Lowest thru 1.28=1) (1.29 thru Highest=0) 
    INTO Ewv6_female_hdl.
END IF.
VARIABLE LABELS  Ewv6_female_hdl 'Female HDL cholesterol (wave 6): IDF criteria < 1.29 mmol/L'.
EXECUTE.



* Sum of male, female HDL  and recode into 0-1 variable

COMPUTE Ewv6_hdl_sum=SUM(Ewv6_male_hdl,Ewv6_female_hdl).
VARIABLE LABELS  Ewv6_hdl_sum 'Sum of male and female HDL cholesterol (wave 6)'.
EXECUTE.

RECODE Ewv6_hdl_sum (0=0) (1 thru Highest=1) INTO Ewv6_hdl_cholesterol.
VARIABLE LABELS Ewv6_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 6)'.
EXECUTE. 





# Abdominal obesity (waist circumference or BMI > 30 kg/m²) 
Raw variable: 
- r6bmi -> r body mass index=kg/m2
    IDF criteria: If BMI is >30kg/m², central obesity can be assumed and waist circumference does not need to be measured
- wstval -> waist measurement
    Unit of measurement: cm
    IDFcriteria (ethnic group: Europids)
          Abdominal obesity 
          Male ≥ 94 cm
          Female ≥ 80 cm
Steps:
Waist circumference
    1. Recode wstval into waist circumference score without n/a
    2. Recode according to male and female level criteria
    3. Sum of male and female abdominal obesity
    4. Recode into dichotomous variable of obesity based on waist circumference (yes/no)
BMI
    5. Recode r6bmi into BMI score without n/a
    6. Recode into dichotomous variable >30 = 1 abdominal obesity (yes/no)
Obesity
    7. Sum of waist and BMI
    8. Recode into dichotomous variable of obesity (yes/no) (0=0) (1=1) (2=1)



RECODE Ewv6_wstval (-1.0=SYSMIS) (ELSE=Copy) INTO Ewv6_waist.
VARIABLE LABELS  Ewv6_waist 'Waist circumference in cm (wave 6)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv6_waist (Lowest thru 93.99=0) (94.00 thru Highest=1) INTO Ewv6_malewaist_ao.
END IF.
VARIABLE LABELS  Ewv6_malewaist_ao 'Male Waist circumference (cm) (wave 6): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv6_waist (Lowest thru 79.99=0) (80.00 thru Highest=1) INTO Ewv6_femalewaist_ao.
END IF.
VARIABLE LABELS  Ewv6_femalewaist_ao 'Female Waist circumference (cm) (wave 6): IDF criteria Europids ethnic group Abdominal Obesity'.
EXECUTE.

COMPUTE Ewv6_obesity_waist_sum=SUM(Ewv6_malewaist_ao,Ewv6_femalewaist_ao).
VARIABLE LABELS  Ewv6_obesity_waist_sum 'Sum of male and female abdominal obesity based on waist circumference (wave 6)'.
EXECUTE.

RECODE Ewv6_obesity_waist_sum (0=0) (1 thru Highest=1) INTO Ewv6_obesity_waist.
VARIABLE LABELS  Ewv6_obesity_waist 'Abdominal obesity based on waist circumference at wave 6 (yes/no)'.
EXECUTE.



RECODE r6bmi (ELSE=Copy) INTO Ewv6_bmi_score.
VARIABLE LABELS  Ewv6_bmi_score 'BMI score kg/m² (wave 6)'.
EXECUTE.


RECODE Ewv6_bmi_score (Lowest thru 30.00=0) (30.01 thru Highest=1) INTO Ewv6_obesity_bmi.
VARIABLE LABELS  Ewv6_obesity_bmi 'Abdominal obesity based on BMI (IDF: BMI >30kg/m²) at wave 6 (yes/no)'.
EXECUTE.


COMPUTE Ewv6_waist_bmi_sum=SUM(Ewv6_obesity_waist,Ewv6_obesity_bmi).
VARIABLE LABELS  Ewv6_waist_bmi_sum 'Sum of waist and bmi to show if r has abdominal obesity (wave 6)'.
EXECUTE.


RECODE Ewv6_waist_bmi_sum (0=0)  (1=1)  (2=1) INTO Ewv6_obesity.
VARIABLE LABELS  Ewv6_obesity 'Abdominal obesity based on BMI and waist circumference (yes/no) at wave 6'.
EXECUTE.





# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables to use measured in mm Hg
Systolic reading: sysval (Valid Mean Systolic BP)
Diastolic reading: diaval (Valid Mean Diastolic BP)
Medication: HeMDa, HeMdab
Self-reported hypertension: hedawbp, hedacbp, hedasbp, hediabp, hedimbp (elsa original data), r6hibpe (Rand data)
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Recode Diastolic BP
2. Recode Systolic BP
3. Sum of diastolic, systolic
4. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP

RECODE Ewv6_sysval Ewv6_diaval (-1.0=SYSMIS)  (ELSE=Copy) INTO Ewv6_systolic_mean Ewv6_diastolic_mean.
VARIABLE LABELS  Ewv6_systolic_mean 'Mean Systolic blood pressure (BP) (wave 6)' 
/Ewv6_diastolic_mean 'Mean Diastolic BP (wave 6)'.
EXECUTE.


RECODE Ewv6_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Ewv6_systolic_bp.
VARIABLE LABELS  Ewv6_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130 (wave 6)'.
EXECUTE.

RECODE Ewv6_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Ewv6_diastolic_bp.
VARIABLE LABELS  Ewv6_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 6)'.
EXECUTE.


* Sum of systolic, diastolic, hypertension diagnosis and recode into a 0-1 variable

COMPUTE Ewv6_bp_sum=SUM(Ewv6_systolic_bp,Ewv6_diastolic_bp).
VARIABLE LABELS Ewv6_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 6)'.
EXECUTE.

RECODE Ewv6_bp_sum (0=0) (1 thru Highest=1) INTO Ewv6_bp.
VARIABLE LABELS  Ewv6_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 6'.
EXECUTE.





# Diabetes and Glycemia
Raw variables: 
fglu: Blood glucose level (mmol/L) - fasting samples only
hba1c: Blood glycated haemoglobin level (%)
Type 2 diabetes previously diagnosed: hedawdi, hedacdi, hediadi, hedimdi, HeACd (original elsa data), r6diabe (rand data)
Medication: HeIns, HeMdb, HeAcea
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode Glucose ≥ 5.6 mmol/L
3. Recode HbA1c ≥ 6.5% (48 mmol/mol)
4. Sum of glucose and self-reported diabetes diagnosis
5. Dichotomous variable of glycemia (yes/no)



* Self-reported diabetes diagnosis (hedawdi, hedacdi, hediadi, hedimdi, HeACd, r6diabe)


RECODE Ewv6_hedawdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (7=1)
INTO Ewv6_diabetes_before.
VARIABLE LABELS  Ewv6_diabetes_before 'Diagnosed diabetes or high blood sugar fed forward at wave 6'.
EXECUTE.

RECODE Ewv6_hedacdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS)  (1=1) (2=0)
INTO Ewv6_diabetes_confirm.
VARIABLE LABELS  Ewv6_diabetes_confirm 'Whether confirms diabetes or high blood sugar diagnosis at wave 6 (yes/no)'.
EXECUTE.


RECODE Ewv6_hediadi Ewv6_hedimdi (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0)
INTO Ewv6_diabetes_new Ewv6_diabetes_newreport.
VARIABLE LABELS  Ewv6_diabetes_new 'Diabetes or high blood sugar diagnosis newly reported at wave 6 (yes/no)' 
/Ewv6_diabetes_newreport 'diabetes or high blood sugar diagnosis newly reported (merged) at wave 6 (yes/no)'.
EXECUTE.


RECODE Ewv6_heacd (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (2=0) INTO Ewv6_diabetes_doctor.
VARIABLE LABELS  Ewv6_diabetes_doctor 'Whether ever been told has diabetes by doctor (wave 6)'.
EXECUTE.


RECODE r6diabe (0=0) (1=1) (ELSE=SYSMIS) INTO Ewv6_diabetes_evr.
VARIABLE LABELS  Ewv6_diabetes_evr 'Ever had diabetes measured by Rand (wave 6)'.
EXECUTE.


COMPUTE Ewv6_diabetes_diagnosed_sum=
SUM(Ewv6_diabetes_before,Ewv6_diabetes_confirm,Ewv6_diabetes_new,Ewv6_diabetes_newreport,Ewv6_diabetes_doctor,Ewv6_diabetes_evr).
VARIABLE LABELS  Ewv6_diabetes_diagnosed_sum 'Sum of ever reported previously diagnosed diabetes at wave 6'.
EXECUTE.

RECODE Ewv6_diabetes_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv6_diabetes_diagnosed.
VARIABLE LABELS  Ewv6_diabetes_diagnosed  'Ever reported previously diagnosed diabetes at wave 6'.
EXECUTE.



*Glucose level (FPG)


RECODE Ewv6_fglu (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv6_glucose_level.
VARIABLE LABELS  Ewv6_glucose_level 'Fasting plasma glucose level (mmol/L) at wave 6'.
EXECUTE.

RECODE Ewv6_glucose_level (Lowest thru 5.59=0) (5.6 thru Highest=1) INTO Ewv6_glucose.
VARIABLE LABELS  Ewv6_glucose 'Glucose (mmol/L): IDF criteria FPG ≥ 5.6 mmol/L (wave 6)'.
EXECUTE.



* HbA1c level


RECODE Ewv6_hba1c (-11.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv6_HbA1c_level.
VARIABLE LABELS  Ewv6_HbA1c_level 'Blood glycated haemoglobin (HbA1c) level (%) at wave 6'.
EXECUTE.

RECODE Ewv6_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Ewv6_HbA1c_who.
VARIABLE LABELS  Ewv6_HbA1c_who 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 6)'.
EXECUTE.



*Sum of glucose and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Ewv6_diabetes_glucose_sum=SUM(Ewv6_diabetes_diagnosed,Ewv6_glucose).
VARIABLE LABELS Ewv6_diabetes_glucose_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 6)'.
EXECUTE.

RECODE Ewv6_diabetes_glucose_sum (0=0) (1 thru Highest=1) INTO Ewv6_glycemia.
VARIABLE LABELS  Ewv6_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 6)'.
EXECUTE.




# Wave 8
Variables to merge: 
Core dataset
        HDL cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, hechmd, hechme
        BP: hedawbp, hedacbp, hedasbp, hediabp, hedimbp, hemda, hemdab
        Glycemia: hedawdi, hedacdi, hediadi, hedimdi, heacd, heins, hemdb, heacea
Nurse dataset
        Inflammation: hscrp, cfib
        HDL cholesterol: hdl
        Obesity: * no available data about waist or height at wave 8 (only weight measured)
        Triglycerides: trig
        BP: sysval, diaval
        Glycemia: fglu, hba1c




RECODE hedawch hedacch hedasch hediach hedimch hechmd hechme 
hedawbp hedacbp hedasbp hediabp hedimbp hemda hemdab
hedawdi hedacdi hediadi hedimdi heacd heins hemdb heacea (ELSE=Copy) INTO 
Ewv8_hedawch Ewv8_hedacch Ewv8_hedasch Ewv8_hediach Ewv8_hedimch Ewv8_hechmd Ewv8_hechme 
Ewv8_hedawbp Ewv8_hedacbp Ewv8_hedasbp Ewv8_hediabp Ewv8_hedimbp Ewv8_hemda Ewv8_hemdab
Ewv8_hedawdi Ewv8_hedacdi Ewv8_hediadi Ewv8_hedimdi Ewv8_heacd Ewv8_heins Ewv8_hemdb Ewv8_heacea.
VARIABLE LABELS  Ewv8_hedawch 'Diagnosed high cholesterol fed forward' 
    /Ewv8_hedacch  'Whether confirms high cholesterol diagnosis'
    /Ewv8_hedasch  'Whether still has high cholesterol'
    /Ewv8_hediach  'CVD: high cholesterol diagnosis newly reported'
    /Ewv8_hedimch  'CVD: high cholesterol diagnosis newly reported (merged)'
    /Ewv8_hechmd  'Cholesterol: whether taking medication to lower cholesterol level'
    /Ewv8_hechme  'Cholesterol: whether taking medication to prevent level becoming high'
    /Ewv8_hedawbp 'Diagnosed high blood pressure fed forward'
    /Ewv8_hedacbp 'Whether confirms high blood pressure diagnosis'
    /Ewv8_hedasbp 'Whether still has high blood pressure'
    /Ewv8_hediabp 'CVD: high blood pressure diagnosis newly reported'
    /Ewv8_hedimbp 'CVD: high blood pressure diagnosis newly reported (merged)'
    /Ewv8_hemda 'High blood pressure: whether taking medication'
    /Ewv8_hemdab 'High blood pressure: whether taking medication to prevent high level returning'
    /Ewv8_hedawdi 'Diagnosed diabetes or high blood sugar fed forward'
    /Ewv8_hedacdi 'Whether confirms diabetes or high blood sugar diagnosis'
    /Ewv8_hediadi 'CVD: diabetes or high blood sugar diagnosis newly reported'
    /Ewv8_hedimdi 'CVD: diabetes or high blood sugar diagnosis newly reported (merged)'
    /Ewv8_heacd 'Whether ever been told has diabetes by doctor'
    /Ewv8_heins 'Diabetes: whether currently injects insulin'
    /Ewv8_hemdb 'Diabetes: whether taking medication'
    /Ewv8_heacea 'Diabetes: whether taking ACE inhibitor or A2 receptor blocker'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet23.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet23'
  /BY idauniq.
EXECUTE.





RECODE hscrp hdl sysval diaval fglu hba1c (ELSE=Copy) INTO 
Ewv8_hscrp Ewv8_hdl Ewv8_sysval Ewv8_diaval Ewv8_fglu Ewv8_hba1c.
VARIABLE LABELS  Ewv8_hscrp 'Blood CRP level (mg/l)' 
    /Ewv8_hdl  'Blood HDL level (mmol/l)'
    /Ewv8_sysval   'Valid Mean Systolic BP'
    /Ewv8_diaval  'Valid Mean Diastolic BP'
    /Ewv8_fglu 'Blood glucose level (mmol/L) - fasting samples only'
    /Ewv8_hba1c 'Blood glycated haemoglobin level (%)'.
EXECUTE.



DATASET ACTIVATE DataSet1.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet22.
SORT CASES BY idauniq.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet22'
  /BY idauniq.
EXECUTE.





# Inflammation CRP 
Raw variable: hscrp (measured in mg/l)
Normal level of CRP ≤ 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L see: http://unitslab.com/node/67)
Steps: 
1. Recode hscrp into a new CRP variable to exclude missing data
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE Ewv8_hscrp (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv8_crp_level.
VARIABLE LABELS  Ewv8_crp_level 'CRP level (ug/mL) without n/a (wave 8)'.
EXECUTE.

RECODE Ewv8_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Ewv8_crp.
VARIABLE LABELS Ewv8_crp 'CRP level dichotomised into normal/high (normal CRP ≤ 3 ug/mL) (wave 8)'.
EXECUTE.


# HDL cholesterol
Raw variable: hdl
Unit of measurment mmol/L
Self-reported cholesterol: hedawch, hedacch, hedasch, hediach, hedimch
Medication for choloesterol: hechmd, hechme
IDFcriteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
      or specific treatment for this lipid abnormality
Steps:
1. Recode hdl into HDL cholesterol level without missing data
2. Recode according to male and female level criteria
3. Sum of male and female HDL 
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE Ewv8_hdl (-9.0=SYSMIS) (-8.0=SYSMIS) (-7.0=SYSMIS) (-6.0=SYSMIS) (-3.0=SYSMIS) (-2.0=SYSMIS) (-1.0=SYSMIS)
 (ELSE=Copy) INTO Ewv8_hdl_level.
VARIABLE LABELS  Ewv8_hdl_level 'HDL cholesterol level (mmol/L) without n/a (wave 8)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv8_hdl_level (Lowest thru 1.02=1) (1.03 thru Highest=0) 
    INTO Ewv8_male_hdl.
END IF.
VARIABLE LABELS  Ewv8_male_hdl 'Male HDL cholesterol (wave 8): IDF criteria < 1.03 mg/dL'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv8_hdl_level (Lowest thru 1.28=1) (1.29 thru Highest=0) 
    INTO Ewv8_female_hdl.
END IF.
VARIABLE LABELS  Ewv8_female_hdl 'Female HDL cholesterol (wave 8): IDF criteria < 1.29 mmol/L'.
EXECUTE.



COMPUTE Ewv8_cholesterol_diagnosed_sum=
SUM(Ewv8_cholesterol_before,Ewv8_cholesterol_confirm,Ewv8_cholesterol_still,Ewv8_cholesterol_new,Ewv8_cholesterol_newreport).
VARIABLE LABELS  Ewv8_cholesterol_diagnosed_sum 'Sum of ever reported previously high cholesterol diagnosis (wave 8)'.
EXECUTE.

RECODE Ewv8_cholesterol_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv8_cholesterol_diagnosed.
VARIABLE LABELS Ewv8_cholesterol_diagnosed 'Ever reported previously high cholesterol diagnosis (wave 8)'.
EXECUTE. 



* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Ewv8_hdl_sum=SUM(Ewv8_male_hdl,Ewv8_female_hdl).
VARIABLE LABELS  Ewv8_hdl_sum 'Sum of male and female HDL cholesterol (wave 8)'.
EXECUTE.

RECODE Ewv8_hdl_sum (0=0) (1 thru Highest=1) INTO Ewv8_hdl_cholesterol.
VARIABLE LABELS Ewv8_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 8)'.
EXECUTE. 





# Abdominal obesity 

** no available data about waist circumference or BMI or height at wave 8 (only weight measured)







# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables to use measured in mm Hg
Systolic reading: sysval (Valid Mean Systolic BP)
Diastolic reading: diaval (Valid Mean Diastolic BP)
Medication: hemda, hemdab
Self-reported hypertension: hedawbp, hedacbp, hedasbp, hediabp, hedimbp
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Recode Diastolic BP
2. Recode Systolic BP
3. Sum of diastolic, systolic
4. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP

RECODE Ewv8_sysval Ewv8_diaval (-1.0=SYSMIS)  (ELSE=Copy) INTO Ewv8_systolic_mean Ewv8_diastolic_mean.
VARIABLE LABELS  Ewv8_systolic_mean 'Mean Systolic blood pressure (BP) (wave 8)' 
/Ewv8_diastolic_mean 'Mean Diastolic BP (wave 8)'.
EXECUTE.


RECODE Ewv8_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Ewv8_systolic_bp.
VARIABLE LABELS  Ewv8_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130 (wave 8)'.
EXECUTE.

RECODE Ewv8_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Ewv8_diastolic_bp.
VARIABLE LABELS  Ewv8_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 8)'.
EXECUTE.



* Sum of systolic, diastolic, hypertension diagnosisand recode into a 0-1 variable

COMPUTE Ewv8_bp_sum=SUM(Ewv8_systolic_bp,Ewv8_diastolic_bp).
VARIABLE LABELS Ewv8_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 8)'.
EXECUTE.

RECODE Ewv8_bp_sum (0=0) (1 thru Highest=1) INTO Ewv8_bp.
VARIABLE LABELS  Ewv8_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 8'.
EXECUTE.





# Diabetes and Glycemia
Raw variables: 
fglu: Blood glucose level (mmol/L) - fasting samples only
hba1c: Blood glycated haemoglobin level (%)
Type 2 diabetes previously diagnosed: hedawdi, hedacdi, hediadi, hedimdi, heacd 
Medication: heins, hemdb, heacea
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode Glucose ≥ 5.6 mmol/L
3. Recode HbA1c ≥ 6.5% (48 mmol/mol)
4. Sum of glucose and self-reported diabetes diagnosis
5. Dichotomous variable of glycemia (yes/no)



* Self-reported diabetes diagnosis (hedawdi, hedacdi, hediadi, hedimdi, heacd)


RECODE Ewv8_hedawdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (7=1)
INTO Ewv8_diabetes_before.
VARIABLE LABELS  Ewv8_diabetes_before 'Diagnosed diabetes or high blood sugar fed forward at wave 8'.
EXECUTE.

RECODE Ewv8_hedacdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS)  (1=1) (2=0)
INTO Ewv8_diabetes_confirm.
VARIABLE LABELS  Ewv8_diabetes_confirm 'Whether confirms diabetes or high blood sugar diagnosis at wave 8 (yes/no)'.
EXECUTE.


RECODE Ewv8_hediadi Ewv8_hedimdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0)
INTO Ewv8_diabetes_new Ewv8_diabetes_newreport.
VARIABLE LABELS  Ewv8_diabetes_new 'Diabetes or high blood sugar diagnosis newly reported at wave 8 (yes/no)' 
/Ewv8_diabetes_newreport 'diabetes or high blood sugar diagnosis newly reported (merged) at wave 8 (yes/no)'.
EXECUTE.


RECODE Ewv8_heacd (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) 
(1=1) (2=0) INTO Ewv8_diabetes_doctor.
VARIABLE LABELS  Ewv8_diabetes_doctor 'Whether ever been told has diabetes by doctor (wave 8)'.
EXECUTE.



COMPUTE Ewv8_diabetes_diagnosed_sum=
SUM(Ewv8_diabetes_before,Ewv8_diabetes_confirm,Ewv8_diabetes_new,Ewv8_diabetes_newreport,Ewv8_diabetes_doctor).
VARIABLE LABELS  Ewv8_diabetes_diagnosed_sum 'Sum of ever reported previously diagnosed diabetes at wave 8'.
EXECUTE.

RECODE Ewv8_diabetes_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv8_diabetes_diagnosed.
VARIABLE LABELS  Ewv8_diabetes_diagnosed  'Ever reported previously diagnosed diabetes at wave 8'.
EXECUTE.



*Glucose level (FPG)


RECODE Ewv8_fglu (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv8_glucose_level.
VARIABLE LABELS  Ewv8_glucose_level 'Fasting plasma glucose level (mmol/L) at wave 8'.
EXECUTE.

RECODE Ewv8_glucose_level (Lowest thru 5.59=0) (5.6 thru Highest=1) INTO Ewv8_glucose.
VARIABLE LABELS  Ewv8_glucose 'Glucose (mmol/L): IDF criteria FPG ≥ 5.6 mmol/L (wave 8)'.
EXECUTE.



* HbA1c level


RECODE Ewv8_hba1c (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv8_HbA1c_level.
VARIABLE LABELS  Ewv8_HbA1c_level 'Blood glycated haemoglobin (HbA1c) level (%) at wave 8'.
EXECUTE.

RECODE Ewv8_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Ewv8_HbA1c_who.
VARIABLE LABELS  Ewv8_HbA1c_who 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 8)'.
EXECUTE.



*Sum of glucose and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Ewv8_diabetes_glucose_sum=SUM(Ewv8_diabetes_diagnosed,Ewv8_glucose).
VARIABLE LABELS Ewv8_diabetes_glucose_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 8)'.
EXECUTE.

RECODE Ewv8_diabetes_glucose_sum (0=0) (1 thru Highest=1) INTO Ewv8_glycemia.
VARIABLE LABELS  Ewv8_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 8)'.
EXECUTE.






# Wave 9
Variables to merge: 
Core dataset
        HDL cholesterol: hedawch, hedacch, hedasch, hediach, hedimch, hechmd, hechme
        BP: hedawbp, hedacbp, hedasbp, hediabp, hedimbp, hemda, hemdab
        Glycemia: hedawdi, hedacdi, hediadi, hedimdi, heacd, heins, hemdb, heacea
Nurse dataset
        Inflammation: hscrp, cfib
        HDL cholesterol: hdl
        Obesity: * no available data about waist or height at wave 9 (only weight measured)
        Triglycerides: trig
        BP: sysval, diaval
        Glycemia: fglu, hba1c




RECODE w9hedawch w9hedacch w9hedasch w9hediach w9hedimch w9hechmd w9hechme 
w9hedawbp w9hedacbp w9hedasbp w9hediabp w9hedimbp w9hemda w9hemdab
w9hedawdi w9hedacdi w9hediadi w9hedimdi w9heacd w9heins w9hemdb w9heacea (ELSE=Copy) INTO 
Ewv9_hedawch Ewv9_hedacch Ewv9_hedasch Ewv9_hediach Ewv9_hedimch Ewv9_hechmd Ewv9_hechme 
Ewv9_hedawbp Ewv9_hedacbp Ewv9_hedasbp Ewv9_hediabp Ewv9_hedimbp Ewv9_hemda Ewv9_hemdab
Ewv9_hedawdi Ewv9_hedacdi Ewv9_hediadi Ewv9_hedimdi Ewv9_heacd Ewv9_heins Ewv9_hemdb Ewv9_heacea.
VARIABLE LABELS  Ewv9_hedawch 'Diagnosed high cholesterol fed forward' 
    /Ewv9_hedacch  'Whether confirms high cholesterol diagnosis'
    /Ewv9_hedasch  'Whether still has high cholesterol'
    /Ewv9_hediach  'CVD: high cholesterol diagnosis newly reported'
    /Ewv9_hedimch  'CVD: high cholesterol diagnosis newly reported (merged)'
    /Ewv9_hechmd  'Cholesterol: whether taking medication to lower cholesterol level'
    /Ewv9_hechme  'Cholesterol: whether taking medication to prevent level becoming high'
    /Ewv9_hedawbp 'Diagnosed high blood pressure fed forward'
    /Ewv9_hedacbp 'Whether confirms high blood pressure diagnosis'
    /Ewv9_hedasbp 'Whether still has high blood pressure'
    /Ewv9_hediabp 'CVD: high blood pressure diagnosis newly reported'
    /Ewv9_hedimbp 'CVD: high blood pressure diagnosis newly reported (merged)'
    /Ewv9_hemda 'High blood pressure: whether taking medication'
    /Ewv9_hemdab 'High blood pressure: whether taking medication to prevent high level returning'
    /Ewv9_hedawdi 'Diagnosed diabetes or high blood sugar fed forward'
    /Ewv9_hedacdi 'Whether confirms diabetes or high blood sugar diagnosis'
    /Ewv9_hediadi 'CVD: diabetes or high blood sugar diagnosis newly reported'
    /Ewv9_hedimdi 'CVD: diabetes or high blood sugar diagnosis newly reported (merged)'
    /Ewv9_heacd 'Whether ever been told has diabetes by doctor'
    /Ewv9_heins 'Diabetes: whether currently injects insulin'
    /Ewv9_hemdb 'Diabetes: whether taking medication'
    /Ewv9_heacea 'Diabetes: whether taking ACE inhibitor or A2 receptor blocker'.
EXECUTE.





RECODE w9hscrp w9hdl w9sysval w9diaval w9fglu w9hba1c (ELSE=Copy) INTO 
Ewv9_hscrp Ewv9_cfib Ewv9_hdl Ewv9_trig Ewv9_sysval Ewv9_diaval Ewv9_fglu Ewv9_hba1c.
VARIABLE LABELS  Ewv9_hscrp 'Blood CRP level (mg/l)' 
    /Ewv9_hdl  'Blood HDL level (mmol/l)'
    /Ewv9_sysval   'Valid Mean Systolic BP'
    /Ewv9_diaval  'Valid Mean Diastolic BP'
    /Ewv9_fglu 'Blood glucose level (mmol/L) - fasting samples only'
    /Ewv9_hba1c 'Blood glycated haemoglobin level (%)'.
EXECUTE.




# Inflammation CRP 
Raw variable: hscrp (measured in mg/l)
Normal level of CRP ≤ 3 ug/mL 
units of measurement: (ug/mL means μg/mL = microgram per milliliter) (μg/mL = mg/L see: http://unitslab.com/node/67)
Steps: 
1. Recode hscrp into a new CRP variable to exclude missing data
2. Recode into dichotomised variable to divide into normal and high level of inflammation (0-1)


RECODE Ewv9_hscrp (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv9_crp_level.
VARIABLE LABELS  Ewv9_crp_level 'CRP level (ug/mL) without n/a (wave 9)'.
EXECUTE.

RECODE Ewv9_crp_level (Lowest thru 3=0) (3.01 thru Highest=1) INTO Ewv9_crp.
VARIABLE LABELS Ewv9_crp 'CRP level dichotomised into normal/high (normal CRP ≤ 3 ug/mL) (wave 9)'.
EXECUTE.




# HDL cholesterol
Raw variable: hdl
Unit of measurment mmol/L
Self-reported cholesterol: hedawch, hedacch, hedasch, hediach, hedimch
Medication for choloesterol: hechmd, hechme
IDF criteria
      Reduced HDL cholesterol 
      < 40 mg/dL (1.03 mmol/L) in males
      < 50 mg/dL (1.29 mmol/L) in females
      or specific treatment for this lipid abnormality
Steps:
1. Recode hdl into HDL cholesterol level without missing data
2. Recode according to male and female level criteria
3. Sum of male and female HDL 
4. Dichotomous variable of HDL cholesterol (normal/abnormal)


* HDL level (males/females)

RECODE Ewv9_hdl (-9.0=SYSMIS) (-8.0=SYSMIS) (-7.0=SYSMIS) (-6.0=SYSMIS) (-3.0=SYSMIS) (-2.0=SYSMIS) (-1.0=SYSMIS)
 (ELSE=Copy) INTO Ewv9_hdl_level.
VARIABLE LABELS  Ewv9_hdl_level 'HDL cholesterol level (mmol/L) without n/a (wave 9)'.
EXECUTE.

DO IF  (E_sex = 0).
RECODE Ewv9_hdl_level (Lowest thru 1.02=1) (1.03 thru Highest=0) 
    INTO Ewv9_male_hdl.
END IF.
VARIABLE LABELS  Ewv9_male_hdl 'Male HDL cholesterol (wave 9): IDF criteria < 1.03 mg/dL'.
EXECUTE.

DO IF  (E_sex = 1).
RECODE Ewv9_hdl_level (Lowest thru 1.28=1) (1.29 thru Highest=0) 
    INTO Ewv9_female_hdl.
END IF.
VARIABLE LABELS  Ewv9_female_hdl 'Female HDL cholesterol (wave 9): IDF criteria < 1.29 mmol/L'.
EXECUTE.



* Sum of male, female HDL and recode into 0-1 variable

COMPUTE Ewv9_hdl_sum=SUM(Ewv9_male_hdl,Ewv9_female_hdl).
VARIABLE LABELS  Ewv9_hdl_sum 'Sum of male and female HDL cholesterol (wave 9)'.
EXECUTE.

RECODE Ewv9_hdl_sum (0=0) (1 thru Highest=1) INTO Ewv9_hdl_cholesterol.
VARIABLE LABELS Ewv9_hdl_cholesterol 'HDL cholesterol dichotomised into normal/abnormal (wave 9)'.
EXECUTE. 





# Abdominal obesity 

** no available data about waist circumference or BMI or height at wave 9 (only weight measured)




# Blood pressure (BP)
measured three times with 3 measures for systolic diastolic and pulse
Raw variables to use measured in mm Hg
Systolic reading: sysval (Valid Mean Systolic BP)
Diastolic reading: diaval (Valid Mean Diastolic BP)
Medication: hemda, hemdab
Self-reported hypertension: hedawbp, hedacbp, hedasbp, hediabp, hedimbp
IDF criteria for raised blood pressure: systolic BP ≥ 130 or diastolic BP ≥ 85 mm Hg, or treatment of previously diagnosed hypertension
Steps: 
1. Recode Diastolic BP
2. Recode Systolic BP
3. Sum of diastolic, systolic
4. Dichotomous variable of BP (yes/no)


* Systolic and Diastolic BP

RECODE Ewv9_sysval Ewv9_diaval (-9=SYSMIS) (-8=SYSMIS) (-2=SYSMIS) (-1.0=SYSMIS) 
     (ELSE=Copy) INTO Ewv9_systolic_mean Ewv9_diastolic_mean.
VARIABLE LABELS  Ewv9_systolic_mean 'Mean Systolic blood pressure (BP) (wave 9)' 
/Ewv9_diastolic_mean 'Mean Diastolic BP (wave 9)'.
EXECUTE.


RECODE Ewv9_systolic_mean (Lowest thru 129.99=0) (130 thru Highest=1) INTO Ewv9_systolic_bp.
VARIABLE LABELS  Ewv9_systolic_bp 'Systolic Blood Pressure (mm Hg): IDF criteria ≥ 130 (wave 9)'.
EXECUTE.

RECODE Ewv9_diastolic_mean (Lowest thru 84.99=0) (85 thru Highest=1) INTO Ewv9_diastolic_bp.
VARIABLE LABELS  Ewv9_diastolic_bp 'Diastolic Blood Pressure (mm Hg): IDF criteria ≥ 85 (wave 9)'.
EXECUTE.


* Sum of systolic, diastolic BP and recode into a 0-1 variable

COMPUTE Ewv9_bp_sum=SUM(Ewv9_systolic_bp,Ewv9_diastolic_bp).
VARIABLE LABELS Ewv9_bp_sum 'Sum of BP including mean systolic, diastolic BP (wave 9)'.
EXECUTE.

RECODE Ewv9_bp_sum (0=0) (1 thru Highest=1) INTO Ewv9_bp.
VARIABLE LABELS  Ewv9_bp 'Blood Pressure (BP) dichotomised into normal/abnormal (0-1) at wave 9'.
EXECUTE.





# Diabetes and Glycemia
Raw variables: 
fglu: Blood glucose level (mmol/L) - fasting samples only
hba1c: Blood glycated haemoglobin level (%)
Type 2 diabetes previously diagnosed: hedawdi, hedacdi, hediadi, hedimdi, heacd 
Medication: heins, hemdb, heacea
IDF criteria for raised fasting plasma glucose (FPG) ≥ 100 mg/dL (5.6 mmol/L), or previously diagnosed type 2 diabetes
Steps:
1. Recode self-reported diabetes diagnosis
2. Recode Glucose ≥ 5.6 mmol/L
3. Recode HbA1c ≥ 6.5% (48 mmol/mol)
4. Sum of glucose and self-reported diabetes diagnosis
5. Dichotomous variable of glycemia (yes/no)



* Self-reported diabetes diagnosis (hedawdi, hedacdi, hediadi, hedimdi, heacd)


RECODE Ewv9_hedawdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (7=1)
INTO Ewv9_diabetes_before.
VARIABLE LABELS  Ewv9_diabetes_before 'Diagnosed diabetes or high blood sugar fed forward at wave 9'.
EXECUTE.

RECODE Ewv9_hedacdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (3=SYSMIS)  (1=1) (2=0)
INTO Ewv9_diabetes_confirm.
VARIABLE LABELS  Ewv9_diabetes_confirm 'Whether confirms diabetes or high blood sugar diagnosis at wave 9 (yes/no)'.
EXECUTE.


RECODE Ewv9_hediadi Ewv9_hedimdi (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) (1=1) (0=0)
INTO Ewv9_diabetes_new Ewv9_diabetes_newreport.
VARIABLE LABELS  Ewv9_diabetes_new 'Diabetes or high blood sugar diagnosis newly reported at wave 9 (yes/no)' 
/Ewv9_diabetes_newreport 'diabetes or high blood sugar diagnosis newly reported (merged) at wave 9 (yes/no)'.
EXECUTE.


RECODE Ewv9_heacd (-9=SYSMIS) (-8=SYSMIS) (-4=SYSMIS) (-3=SYSMIS) (-2=SYSMIS) (-1=SYSMIS) 
(1=1) (2=0) INTO Ewv9_diabetes_doctor.
VARIABLE LABELS  Ewv9_diabetes_doctor 'Whether ever been told has diabetes by doctor (wave 9)'.
EXECUTE.



COMPUTE Ewv9_diabetes_diagnosed_sum=
SUM(Ewv9_diabetes_before,Ewv9_diabetes_confirm,Ewv9_diabetes_new,Ewv9_diabetes_newreport,Ewv9_diabetes_doctor).
VARIABLE LABELS  Ewv9_diabetes_diagnosed_sum 'Sum of ever reported previously diagnosed diabetes at wave 9'.
EXECUTE.

RECODE Ewv9_diabetes_diagnosed_sum (0=0) (1 thru Highest=1) INTO Ewv9_diabetes_diagnosed.
VARIABLE LABELS  Ewv9_diabetes_diagnosed  'Ever reported previously diagnosed diabetes at wave 9'.
EXECUTE.



*Glucose level (FPG)


RECODE Ewv9_fglu (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv9_glucose_level.
VARIABLE LABELS  Ewv9_glucose_level 'Fasting plasma glucose level (mmol/L) at wave 9'.
EXECUTE.

RECODE Ewv9_glucose_level (Lowest thru 5.59=0) (5.6 thru Highest=1) INTO Ewv9_glucose.
VARIABLE LABELS  Ewv9_glucose 'Glucose (mmol/L): IDF criteria FPG ≥ 5.6 mmol/L (wave 9)'.
EXECUTE.



* HbA1c level


RECODE Ewv9_hba1c (-9.0 thru -1.0=SYSMIS) (ELSE=Copy) INTO Ewv9_HbA1c_level.
VARIABLE LABELS  Ewv9_HbA1c_level 'Blood glycated haemoglobin (HbA1c) level (%) at wave 9'.
EXECUTE.

RECODE Ewv9_HbA1c_level (Lowest thru 6.49=0) (6.5 thru Highest=1) INTO Ewv9_HbA1c_who.
VARIABLE LABELS  Ewv9_HbA1c_who 'HbA1c (%): IDF and WHO criteria ≥ 6.5% (48 mmol/mol) (wave 9)'.
EXECUTE.




*Sum of glucose and previously diagnosed diabetes and recode into a 0-1 variable


COMPUTE Ewv9_diabetes_glucose_sum=SUM(Ewv9_diabetes_diagnosed,Ewv9_glucose).
VARIABLE LABELS Ewv9_diabetes_glucose_sum 'Sum of glucose and self-reported diabetes diagnosis (wave 9)'.
EXECUTE.

RECODE Ewv9_diabetes_glucose_sum (0=0) (1 thru Highest=1) INTO Ewv9_glycemia.
VARIABLE LABELS  Ewv9_glycemia 'Glycemia based on diagnosed diabetes and/or glucose level dichotomised into normal/abnormal (wave 9)'.
EXECUTE.




# Grouping Predictors 

# Step 1: Individual cardiometabolic markers

# Step 2: depressive symptoms and individual cardiometabolic markers

 

*** Wave 2 (baseline) grouping of cardiometabolic markers and depressive symptoms
    


# Waist obesity (waist) + depressive symptoms (depress)
Steps:
1. Ewv2_waist_depress_sum
2. Grouping based on the presence of waist cir obesity and depressive symptoms (N=no, Y=yes)
    Ewv2_Nwaist_Ndepress
    Ewv2_Nwaist_Ydepress
    Ewv2_Ywaist_Ndepress
    Ewv2_Ywaist_Ydepress
3. Ewv2_waist_depress_group


COMPUTE Ewv2_waist_depress_sum=SUM(Ewv2_obesity_waist,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_waist_depress_sum 'Sum of Waist Obesity and Depressive symptoms (wave 2)'.
EXECUTE.


IF  (Ewv2_waist_depress_sum = 0) Ewv2_Nwaist_Ndepress=Ewv2_waist_depress_sum.
VARIABLE LABELS  Ewv2_Nwaist_Ndepress 'Group of healthy controls without waist obesity or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nwaist_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nwaist_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_obesity_waist = 1) Ewv2_Ywaist_Ndepress=Ewv2_obesity_waist.
VARIABLE LABELS  Ewv2_Ywaist_Ndepress 'Group of those with waist obesity only (wave 2)'.
EXECUTE.

IF  (Ewv2_waist_depress_sum = 2) Ewv2_Ywaist_Ydepress=Ewv2_waist_depress_sum.
VARIABLE LABELS  Ewv2_Ywaist_Ydepress 'Group of those with both waist obesity and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Nwaist_Ndepress = 0 AND MISSING(Ewv2_Nwaist_Ydepress) AND MISSING(Ewv2_Ywaist_Ndepress) AND MISSING(Ewv2_Ywaist_Ydepress)) .
   COMPUTE Ewv2_waist_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nwaist_Ndepress) AND Ewv2_Nwaist_Ydepress=1 AND MISSING(Ewv2_Ywaist_Ndepress) AND MISSING(Ewv2_Ywaist_Ydepress)) .
   COMPUTE Ewv2_waist_depress_group=1.
ELSE IF (MISSING(Ewv2_Nwaist_Ndepress) AND MISSING(Ewv2_Nwaist_Ydepress) AND Ewv2_Ywaist_Ndepress= 1 AND MISSING(Ewv2_Ywaist_Ydepress)).
   COMPUTE Ewv2_waist_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nwaist_Ndepress) AND Ewv2_Nwaist_Ydepress=1 AND Ewv2_Ywaist_Ndepress= 1 AND Ewv2_Ywaist_Ydepress=2)).
   COMPUTE Ewv2_waist_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_waist_depress_group 'Grouping for waist obesity and/or depressive symptoms (wave 2)'.
EXECUTE . 



# Diabetes: (diabet) + depressive symptoms (depress)
Steps:
1. Ewv2_diabet_depress_sum
2. Grouping based on the presence of diabetes and depressive symptoms (N=no, Y=yes)
   Ewv2_Ndiabet_Ndepress
   Ewv2_Ndiabet_Ydepress
   Ewv2_Ydiabet_Ndepress
   Ewv2_Ydiabet_Ydepress
3. Ewv2_diabet_depress_group


COMPUTE Ewv2_diabet_depress_sum=SUM(Ewv2_diabetes_diagnosed,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_diabet_depress_sum 'Sum of Diabetes and Depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_diabet_depress_sum = 0) Ewv2_Ndiabet_Ndepress=Ewv2_diabet_depress_sum.
VARIABLE LABELS  Ewv2_Ndiabet_Ndepress 'Group of healthy controls without diabetes or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Ndiabet_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Ndiabet_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_diabetes_diagnosed = 1) Ewv2_Ydiabet_Ndepress=Ewv2_diabetes_diagnosed.
VARIABLE LABELS  Ewv2_Ydiabet_Ndepress 'Group of those with diabetes only (wave 2)'.
EXECUTE.

IF  (Ewv2_diabet_depress_sum = 2) Ewv2_Ydiabet_Ydepress=Ewv2_diabet_depress_sum.
VARIABLE LABELS  Ewv2_Ydiabet_Ydepress 'Group of those with both diabetes and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Ndiabet_Ndepress = 0 AND MISSING(Ewv2_Ndiabet_Ydepress) AND MISSING(Ewv2_Ydiabet_Ndepress) AND MISSING(Ewv2_Ydiabet_Ydepress)) .
   COMPUTE Ewv2_diabet_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Ndiabet_Ndepress) AND Ewv2_Ndiabet_Ydepress=1 AND MISSING(Ewv2_Ydiabet_Ndepress) AND MISSING(Ewv2_Ydiabet_Ydepress)) .
   COMPUTE Ewv2_diabet_depress_group=1.
ELSE IF (MISSING(Ewv2_Ndiabet_Ndepress) AND MISSING(Ewv2_Ndiabet_Ydepress) AND Ewv2_Ydiabet_Ndepress= 1 AND MISSING(Ewv2_Ydiabet_Ydepress)).
   COMPUTE Ewv2_diabet_depress_group=2.
ELSE IF ((MISSING(Ewv2_Ndiabet_Ndepress) AND Ewv2_Ndiabet_Ydepress=1 AND Ewv2_Ydiabet_Ndepress= 1 AND Ewv2_Ydiabet_Ydepress=2)).
   COMPUTE Ewv2_diabet_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_diabet_depress_group 'Grouping for diabetes and/or depressive symptoms (wave 2)'.
EXECUTE. 




# HbA1c: (hba1c) + depressive symptoms (depress)
Steps:
1. Ewv2_hba1c_depress_sum
2. Grouping based on the presence of hba1c and depressive symptoms (N=no, Y=yes)
   Ewv2_Nhba1c_Ndepress
   Ewv2_Nhba1c_Ydepress
   Ewv2_Yhba1c_Ndepress
   Ewv2_Yhba1c_Ydepress
3. Ewv2_hba1c_depress_group


COMPUTE Ewv2_hba1c_depress_sum=SUM(Ewv2_HbA1c,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_hba1c_depress_sum 'Sum of HbA1c and Depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_hba1c_depress_sum = 0) Ewv2_Nhba1c_Ndepress=Ewv2_hba1c_depress_sum.
VARIABLE LABELS  Ewv2_Nhba1c_Ndepress 'Group of healthy controls without hba1c or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nhba1c_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nhba1c_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_HbA1c = 1) Ewv2_Yhba1c_Ndepress=Ewv2_HbA1c.
VARIABLE LABELS  Ewv2_Yhba1c_Ndepress 'Group of those with hba1c only (wave 2)'.
EXECUTE.

IF  (Ewv2_hba1c_depress_sum = 2) Ewv2_Yhba1c_Ydepress=Ewv2_hba1c_depress_sum.
VARIABLE LABELS  Ewv2_Yhba1c_Ydepress 'Group of those with both hba1c and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Nhba1c_Ndepress = 0 AND MISSING(Ewv2_Nhba1c_Ydepress) AND MISSING(Ewv2_Yhba1c_Ndepress) AND MISSING(Ewv2_Yhba1c_Ydepress)) .
   COMPUTE Ewv2_hba1c_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nhba1c_Ndepress) AND Ewv2_Nhba1c_Ydepress=1 AND MISSING(Ewv2_Yhba1c_Ndepress) AND MISSING(Ewv2_Yhba1c_Ydepress)) .
   COMPUTE Ewv2_hba1c_depress_group=1.
ELSE IF (MISSING(Ewv2_Nhba1c_Ndepress) AND MISSING(Ewv2_Nhba1c_Ydepress) AND Ewv2_Yhba1c_Ndepress= 1 AND MISSING(Ewv2_Yhba1c_Ydepress)).
   COMPUTE Ewv2_hba1c_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nhba1c_Ndepress) AND Ewv2_Nhba1c_Ydepress=1 AND Ewv2_Yhba1c_Ndepress= 1 AND Ewv2_Yhba1c_Ydepress=2)).
   COMPUTE Ewv2_hba1c_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_hba1c_depress_group 'Grouping for hba1c and/or depressive symptoms (wave 2)'.
EXECUTE. 







# HDL cholesterol (hdl) + depressive symptoms (depress)
Steps:
1. Ewv2_hdl_depress_sum
2. Grouping based on the presence of low HDL cholesterol and depressive symptoms (N=no, Y=yes)
   Ewv2_Nhdl_Ndepress
   Ewv2_Nhdl_Ydepress
   Ewv2_Yhdl_Ndepress
   Ewv2_Yhdl_Ydepress
3. Ewv2_hdl_depress_group



COMPUTE Ewv2_hdl_depress_sum=SUM(Ewv2_hdl_cholesterol,Ewv2_depressive_symptoms).
VARIABLE LABELS Ewv2_hdl_depress_sum 'Sum of HDL cholesterol and Depressive symptoms (wave 2)'.
EXECUTE.


IF  (Ewv2_hdl_depress_sum = 0) Ewv2_Nhdl_Ndepress=Ewv2_hdl_depress_sum.
VARIABLE LABELS  Ewv2_Nhdl_Ndepress 'Group of healthy controls without low HDL cholesterol or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nhdl_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nhdl_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_hdl_cholesterol = 1) Ewv2_Yhdl_Ndepress=Ewv2_hdl_cholesterol.
VARIABLE LABELS  Ewv2_Yhdl_Ndepress 'Group of those with low HDL cholesterol only (wave 2)'.
EXECUTE.

IF  (Ewv2_hdl_depress_sum = 2) Ewv2_Yhdl_Ydepress=Ewv2_hdl_depress_sum.
VARIABLE LABELS  Ewv2_Yhdl_Ydepress 'Group of those with both low HDL cholesterol and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Nhdl_Ndepress = 0 AND MISSING(Ewv2_Nhdl_Ydepress) AND MISSING(Ewv2_Yhdl_Ndepress) AND MISSING(Ewv2_Yhdl_Ydepress)) .
   COMPUTE Ewv2_hdl_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nhdl_Ndepress) AND Ewv2_Nhdl_Ydepress=1 AND MISSING(Ewv2_Yhdl_Ndepress) AND MISSING(Ewv2_Yhdl_Ydepress)) .
   COMPUTE Ewv2_hdl_depress_group=1.
ELSE IF (MISSING(Ewv2_Nhdl_Ndepress) AND MISSING(Ewv2_Nhdl_Ydepress) AND Ewv2_Yhdl_Ndepress= 1 AND MISSING(Ewv2_Yhdl_Ydepress)).
   COMPUTE Ewv2_hdl_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nhdl_Ndepress) AND Ewv2_Nhdl_Ydepress=1 AND Ewv2_Yhdl_Ndepress= 1 AND Ewv2_Yhdl_Ydepress=2)).
   COMPUTE Ewv2_hdl_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_hdl_depress_group 'Grouping for low HDL cholesterol and/or depressive symptoms (wave 2)'.
EXECUTE . 




# Systolic blood pressure (sbp) + depressive symptoms (depress)
Steps:
1. Ewv2_sbp_depress_sum
2. Grouping based on the presence of high SBP and depressive symptoms (N=no, Y=yes)
   Ewv2_Nsbp_Ndepress
   Ewv2_Nsbp_Ydepress
   Ewv2_Ysbp_Ndepress
   Ewv2_Ysbp_Ydepress
3. Ewv2_sbp_depress_group


COMPUTE Ewv2_sbp_depress_sum=SUM(Ewv2_systolic_bp,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_sbp_depress_sum 'Sum of SBP and Depressive symptoms (wave 2)'.
EXECUTE.


IF  (Ewv2_sbp_depress_sum = 0) Ewv2_Nsbp_Ndepress=Ewv2_sbp_depress_sum.
VARIABLE LABELS  Ewv2_Nsbp_Ndepress 'Group of healthy controls without SBP or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nsbp_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nsbp_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_systolic_bp = 1) Ewv2_Ysbp_Ndepress=Ewv2_systolic_bp.
VARIABLE LABELS  Ewv2_Ysbp_Ndepress 'Group of those with SBP only (wave 2)'.
EXECUTE.

IF  (Ewv2_sbp_depress_sum = 2) Ewv2_Ysbp_Ydepress=Ewv2_sbp_depress_sum.
VARIABLE LABELS  Ewv2_Ysbp_Ydepress 'Group of those with both SBP and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Nsbp_Ndepress = 0 AND MISSING(Ewv2_Nsbp_Ydepress) AND MISSING(Ewv2_Ysbp_Ndepress) AND MISSING(Ewv2_Ysbp_Ydepress)) .
   COMPUTE Ewv2_sbp_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nsbp_Ndepress) AND Ewv2_Nsbp_Ydepress=1 AND MISSING(Ewv2_Ysbp_Ndepress) AND MISSING(Ewv2_Ysbp_Ydepress)) .
   COMPUTE Ewv2_sbp_depress_group=1.
ELSE IF (MISSING(Ewv2_Nsbp_Ndepress) AND MISSING(Ewv2_Nsbp_Ydepress) AND Ewv2_Ysbp_Ndepress= 1 AND MISSING(Ewv2_Ysbp_Ydepress)).
   COMPUTE Ewv2_sbp_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nsbp_Ndepress) AND Ewv2_Nsbp_Ydepress=1 AND Ewv2_Ysbp_Ndepress= 1 AND Ewv2_Ysbp_Ydepress=2)).
   COMPUTE Ewv2_sbp_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_sbp_depress_group 'Grouping for SBP and/or depressive symptoms (wave 2)'.
EXECUTE . 






# Diastolic blood pressure (dbp) + depressive symptoms (depress)
Steps:
1. Ewv2_dbp_depress_sum
2. Grouping based on the presence of high DBP and depressive symptoms (N=no, Y=yes)
   Ewv2_Ndbp_Ndepress
   Ewv2_Ndbp_Ydepress
   Ewv2_Ydbp_Ndepress
   Ewv2_Ydbp_Ydepress
3. Ewv2_dbp_depress_group


COMPUTE Ewv2_dbp_depress_sum=SUM(Ewv2_diastolic_bp,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_dbp_depress_sum 'Sum of DBP and Depressive symptoms (wave 2)'.
EXECUTE.


IF  (Ewv2_dbp_depress_sum = 0) Ewv2_Ndbp_Ndepress=Ewv2_dbp_depress_sum.
VARIABLE LABELS  Ewv2_Ndbp_Ndepress 'Group of healthy controls without DBP or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Ndbp_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Ndbp_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_diastolic_bp = 1) Ewv2_Ydbp_Ndepress=Ewv2_diastolic_bp.
VARIABLE LABELS  Ewv2_Ydbp_Ndepress 'Group of those with DBP only (wave 2)'.
EXECUTE.

IF  (Ewv2_dbp_depress_sum = 2) Ewv2_Ydbp_Ydepress=Ewv2_dbp_depress_sum.
VARIABLE LABELS  Ewv2_Ydbp_Ydepress 'Group of those with both DBP and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Ndbp_Ndepress = 0 AND MISSING(Ewv2_Ndbp_Ydepress) AND MISSING(Ewv2_Ydbp_Ndepress) AND MISSING(Ewv2_Ydbp_Ydepress)) .
   COMPUTE Ewv2_dbp_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Ndbp_Ndepress) AND Ewv2_Ndbp_Ydepress=1 AND MISSING(Ewv2_Ydbp_Ndepress) AND MISSING(Ewv2_Ydbp_Ydepress)) .
   COMPUTE Ewv2_dbp_depress_group=1.
ELSE IF (MISSING(Ewv2_Ndbp_Ndepress) AND MISSING(Ewv2_Ndbp_Ydepress) AND Ewv2_Ydbp_Ndepress= 1 AND MISSING(Ewv2_Ydbp_Ydepress)).
   COMPUTE Ewv2_dbp_depress_group=2.
ELSE IF ((MISSING(Ewv2_Ndbp_Ndepress) AND Ewv2_Ndbp_Ydepress=1 AND Ewv2_Ydbp_Ndepress= 1 AND Ewv2_Ydbp_Ydepress=2)).
   COMPUTE Ewv2_dbp_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_dbp_depress_group 'Grouping for DBP and/or depressive symptoms (wave 2)'.
EXECUTE . 





# CRP (crp) + depressive symptoms (depress)
Steps:
1. Ewv2_crp_depress_sum
2. Grouping based on the presence of high CRP and depressive symptoms (N=no, Y=yes)
   Ewv2_Ncrp_Ndepress
   Ewv2_Ncrp_Ydepress
   Ewv2_Ycrp_Ndepress
   Ewv2_Ycrp_Ydepress
3. Ewv2_crp_depress_group


COMPUTE Ewv2_crp_depress_sum=SUM(Ewv2_crp,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_crp_depress_sum 'Sum of CRP and Depressive symptoms (wave 2)'.
EXECUTE.


IF  (Ewv2_crp_depress_sum = 0) Ewv2_Ncrp_Ndepress=Ewv2_crp_depress_sum.
VARIABLE LABELS  Ewv2_Ncrp_Ndepress 'Group of healthy controls without high CRP or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Ncrp_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Ncrp_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_crp = 1) Ewv2_Ycrp_Ndepress=Ewv2_crp.
VARIABLE LABELS  Ewv2_Ycrp_Ndepress 'Group of those with high CRP only (wave 2)'.
EXECUTE.

IF  (Ewv2_crp_depress_sum = 2) Ewv2_Ycrp_Ydepress=Ewv2_crp_depress_sum.
VARIABLE LABELS Ewv2_Ycrp_Ydepress 'Group of those with both high CRP and depressive symptoms (wave 2)'.
EXECUTE.

DO IF (Ewv2_Ncrp_Ndepress = 0 AND MISSING(Ewv2_Ncrp_Ydepress) AND MISSING(Ewv2_Ycrp_Ndepress) AND MISSING(Ewv2_Ycrp_Ydepress)) .
   COMPUTE Ewv2_crp_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Ncrp_Ndepress) AND Ewv2_Ncrp_Ydepress=1 AND MISSING(Ewv2_Ycrp_Ndepress) AND MISSING(Ewv2_Ycrp_Ydepress)) .
   COMPUTE Ewv2_crp_depress_group=1.
ELSE IF (MISSING(Ewv2_Ncrp_Ndepress) AND MISSING(Ewv2_Ncrp_Ydepress) AND Ewv2_Ycrp_Ndepress= 1 AND MISSING(Ewv2_Ycrp_Ydepress)).
   COMPUTE Ewv2_crp_depress_group=2.
ELSE IF ((MISSING(Ewv2_Ncrp_Ndepress) AND Ewv2_Ncrp_Ydepress=1 AND Ewv2_Ycrp_Ndepress= 1 AND Ewv2_Ycrp_Ydepress=2)).
   COMPUTE Ewv2_crp_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_crp_depress_group 'Grouping for high CRP and/or depressive symptoms (wave 2)'.
EXECUTE. 






# Step 3: Composite measure of cardiometabolic abnormalities 
(Ewv2_cardio_number) of cardiometabolic markers
(Ewv2_obesity_waist,Ewv2_hdl_cholesterol,Ewv2_systolic_bp,Ewv2_diastolic_bp,Ewv2_diabetes_diagnosed,Ewv2_HbA1c,Ewv2_crp)
(Ewv4_cardio_number) of cardiometabolic markers
(Ewv4_obesity_waist,Ewv4_hdl_cholesterol,Ewv4_systolic_bp,Ewv4_diastolic_bp,Ewv4_diabetes_diagnosed,Ewv4_HbA1c_who,Ewv4_crp)
Use of SUM.1( , ) function which means that it calculates sum only if 1 out of 7 markers have a valid value/answer (if more than 1 value are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited 0,1,2,3,4+
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any cardiomeatbolic markers
1 -> Those with one CA
2 -> Those with two CA
3 -> Those with three CA
4 -> Those with four ore more CA




COMPUTE Ewv2_cardio_number_sum=SUM.1(Ewv2_obesity_waist,Ewv2_hdl_cholesterol,Ewv2_systolic_bp,Ewv2_diastolic_bp,Ewv2_diabetes_diagnosed,Ewv2_HbA1c,Ewv2_crp).
VARIABLE LABELS  Ewv2_cardio_number_sum 'Sum of cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (cont) (wave 2)'.
EXECUTE.


RECODE Ewv2_cardio_number_sum (0=0) (1=1) (2=2) (3=3) (4 thru 7=4) INTO Ewv2_cardio_number.
VARIABLE LABELS  Ewv2_cardio_number 'Composite measure of cardiometabolic abnormality defined by the number of CA markers (0,1,2,3,4+) (wave 2)'.
EXECUTE.




COMPUTE Ewv4_cardio_number_sum=SUM.1(Ewv4_obesity_waist,Ewv4_hdl_cholesterol,Ewv4_systolic_bp,Ewv4_diastolic_bp,Ewv4_diabetes_diagnosed,Ewv4_HbA1c_who,Ewv4_crp).
VARIABLE LABELS  Ewv4_cardio_number_sum 'Sum of cardiometabolic markers: waist hdl sbp dbp diabetes hba1c crp (cont) (wave 4)'.
EXECUTE.


RECODE Ewv4_cardio_number_sum (0=0) (1=1) (2=2) (3=3) (4 thru 7=4) INTO Ewv4_cardio_number.
VARIABLE LABELS  Ewv4_cardio_number 'Composite measure of cardiometabolic abnormality defined by the number of CA markers (0,1,2,3,4+) (wave 4)'.
EXECUTE.



# Wave 4 CA clusters of 3 components
Cardiometabolic Abnormality (Ewv4_cardio3) cluster of  at least 3 cardiometabolic markers
(Ewv4_obesity_waist,Ewv4_hdl_cholesterol,Ewv4_systolic_bp,Ewv4_diastolic_bp,Ewv4_diabetes_diagnosed,Ewv4_HbA1c_who,Ewv4_crp)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors


RECODE Ewv4_cardio_number_sum (0 thru 2=0) (3 thru 7=1) INTO Ewv4_cardio3.
VARIABLE LABELS  Ewv4_cardio3 'Cardiometabolic Abnormality defined by the co-existance of at least 3 markers (wave 4)'.
EXECUTE.




# Wave 4 CA clusters of 4 components
Cardiometabolic Abnormality (Ewv4_cardio4) cluster of  at least 4 cardiometabolic markers
(Ewv4_obesity_waist,Ewv4_hdl_cholesterol,Ewv4_systolic_bp,Ewv4_diastolic_bp,Ewv4_diabetes_diagnosed,Ewv4_HbA1c_who,Ewv4_crp)
Use of SUM.3( , ) function which means that it calculates sum only if 3 out of 7 markers have a valid value/answer (if more than 3 values are missing then define as N/A)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of four of the above cardiometabolic risk factors


RECODE Ewv4_cardio_number_sum (0 thru 3=0) (4 thru 7=1) INTO Ewv4_cardio4.
VARIABLE LABELS  Ewv4_cardio4 'Cardiometabolic Abnormality defined by the co-existance of at least 4 markers (wave 4)'.
EXECUTE.




# Step 4: Depressive symptoms and/or Cardiometabolic Abnormality (Ewv2_cardio3) cluster of 
at least 3 cardiometabolic markers (Ewv2_obesity_waist,Ewv2_hdl_cholesterol,Ewv2_systolic_bp,Ewv2_diastolic_bp,Ewv2_diabetes_diagnosed,Ewv2_HbA1c,Ewv2_crp)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers


RECODE Ewv2_cardio_number_sum (0 thru 2=0) (3 thru 7=1) INTO Ewv2_cardio3.
VARIABLE LABELS  Ewv2_cardio3 'Cardiometabolic Abnormality defined by the co-existance of at least 3 markers (wave 2)'.
EXECUTE.


COMPUTE Ewv2_ca3_depress_sum=SUM(Ewv2_cardio3,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_ca3_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 2)'.
EXECUTE.




IF  (Ewv2_ca3_depress_sum = 0) Ewv2_Nca3_Ndepress=Ewv2_ca3_depress_sum.
VARIABLE LABELS  Ewv2_Nca3_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nca3_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nca3_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_cardio3 = 1) Ewv2_Yca3_Ndepress=Ewv2_cardio3.
VARIABLE LABELS  Ewv2_Yca3_Ndepress 'Group of those with cardiometabolic abnormality only (wave 2)'.
EXECUTE.

IF  (Ewv2_ca3_depress_sum = 2) Ewv2_Yca3_Ydepress=Ewv2_ca3_depress_sum.
VARIABLE LABELS  Ewv2_Yca3_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 2)'.
EXECUTE.


DO IF (Ewv2_Nca3_Ndepress = 0 AND MISSING(Ewv2_Nca3_Ydepress) AND MISSING(Ewv2_Yca3_Ndepress) AND MISSING(Ewv2_Yca3_Ydepress)) .
   COMPUTE Ewv2_ca3_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nca3_Ndepress) AND Ewv2_Nca3_Ydepress=1 AND MISSING(Ewv2_Yca3_Ndepress) AND MISSING(Ewv2_Yca3_Ydepress)) .
   COMPUTE Ewv2_ca3_depress_group=1.
ELSE IF (MISSING(Ewv2_Nca3_Ndepress) AND MISSING(Ewv2_Nca3_Ydepress) AND Ewv2_Yca3_Ndepress= 1 AND MISSING(Ewv2_Yca3_Ydepress)).
   COMPUTE Ewv2_ca3_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nca3_Ndepress) AND Ewv2_Nca3_Ydepress=1 AND Ewv2_Yca3_Ndepress= 1 AND Ewv2_Yca3_Ydepress=2)).
   COMPUTE Ewv2_ca3_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_ca3_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 2)'.
EXECUTE. 



# Step 5: Depressive symptoms and/or Cardiometabolic Abnormality (Ewv2_cardio4) cluster of 
at least 4 cardiometabolic markers (Ewv2_obesity_waist,Ewv2_hdl_cholesterol,Ewv2_systolic_bp,Ewv2_diastolic_bp,Ewv2_diabetes_diagnosed,Ewv2_HbA1c,Ewv2_crp)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers



RECODE Ewv2_cardio_number_sum (0 thru 3=0) (4 thru 7=1) INTO Ewv2_cardio4.
VARIABLE LABELS  Ewv2_cardio4 'Cardiometabolic Abnormality defined by the co-existance of at least 4 markers (wave 2)'.
EXECUTE.


COMPUTE Ewv2_ca4_depress_sum=SUM(Ewv2_cardio4,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_ca4_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 2)'.
EXECUTE.




IF  (Ewv2_ca4_depress_sum = 0) Ewv2_Nca4_Ndepress=Ewv2_ca4_depress_sum.
VARIABLE LABELS  Ewv2_Nca4_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nca4_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nca4_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_cardio4 = 1) Ewv2_Yca4_Ndepress=Ewv2_cardio4.
VARIABLE LABELS  Ewv2_Yca4_Ndepress 'Group of those with cardiometabolic abnormality only (wave 2)'.
EXECUTE.

IF  (Ewv2_ca4_depress_sum = 2) Ewv2_Yca4_Ydepress=Ewv2_ca4_depress_sum.
VARIABLE LABELS  Ewv2_Yca4_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 2)'.
EXECUTE.


DO IF (Ewv2_Nca4_Ndepress = 0 AND MISSING(Ewv2_Nca4_Ydepress) AND MISSING(Ewv2_Yca4_Ndepress) AND MISSING(Ewv2_Yca4_Ydepress)) .
   COMPUTE Ewv2_ca4_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nca4_Ndepress) AND Ewv2_Nca4_Ydepress=1 AND MISSING(Ewv2_Yca4_Ndepress) AND MISSING(Ewv2_Yca4_Ydepress)) .
   COMPUTE Ewv2_ca4_depress_group=1.
ELSE IF (MISSING(Ewv2_Nca4_Ndepress) AND MISSING(Ewv2_Nca4_Ydepress) AND Ewv2_Yca4_Ndepress= 1 AND MISSING(Ewv2_Yca4_Ydepress)).
   COMPUTE Ewv2_ca4_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nca4_Ndepress) AND Ewv2_Nca4_Ydepress=1 AND Ewv2_Yca4_Ndepress= 1 AND Ewv2_Yca4_Ydepress=2)).
   COMPUTE Ewv2_ca4_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_ca4_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 2)'.
EXECUTE. 






## Step 6: Depressive symptoms and/or Cardiometabolic Abnormality (Ewv2_cardio2) cluster of 
at least 2 cardiometabolic markers (Ewv2_obesity_waist,Ewv2_hdl_cholesterol,Ewv2_systolic_bp,Ewv2_diastolic_bp,Ewv2_diabetes_diagnosed,Ewv2_HbA1c,Ewv2_crp)
Participants were categorised as having cardiometabolic abnormalities if they exhibited a minimum of three of the above cardiometabolic risk factors
4 groups based on the presence of depressive symptoms and cardiomeatbolic biomarkers
0 -> Healthy controls: those without any condition (neither depressive symptoms nor cardiomeatbolic biomarkers)
1 -> Those with depressive symptoms only
2 -> Those with cardiometabolic biomarkers only
3 -> Those with both depressive symptoms and cardiometabolic biomarkers


RECODE Ewv2_cardio_number_sum (0 thru 1=0) (2 thru 7=1) INTO Ewv2_cardio2.
VARIABLE LABELS  Ewv2_cardio2 'Cardiometabolic Abnormality defined by the co-existance of at least 2 markers (wave 2)'.
EXECUTE.


COMPUTE Ewv2_ca2_depress_sum=SUM(Ewv2_cardio2,Ewv2_depressive_symptoms).
VARIABLE LABELS  Ewv2_ca2_depress_sum 'Sum of Cardiometabolic abnormality and Depressive symptoms (wave 2)'.
EXECUTE.




IF  (Ewv2_ca2_depress_sum = 0) Ewv2_Nca2_Ndepress=Ewv2_ca2_depress_sum.
VARIABLE LABELS  Ewv2_Nca2_Ndepress 'Group of healthy controls without cardiometabolic abnormality or depressive symptoms (wave 2)'.
EXECUTE.

IF  (Ewv2_depressive_symptoms = 1) Ewv2_Nca2_Ydepress=Ewv2_depressive_symptoms.
VARIABLE LABELS  Ewv2_Nca2_Ydepress 'Group of those with depressive symptoms only (wave 2)'.
EXECUTE.

IF  (Ewv2_cardio2 = 1) Ewv2_Yca2_Ndepress=Ewv2_cardio2.
VARIABLE LABELS  Ewv2_Yca2_Ndepress 'Group of those with cardiometabolic abnormality only (wave 2)'.
EXECUTE.

IF  (Ewv2_ca2_depress_sum = 2) Ewv2_Yca2_Ydepress=Ewv2_ca2_depress_sum.
VARIABLE LABELS  Ewv2_Yca2_Ydepress 'Group of those with both cardiometabolic abnormality and depressive symptoms (wave 2)'.
EXECUTE.


DO IF (Ewv2_Nca2_Ndepress = 0 AND MISSING(Ewv2_Nca2_Ydepress) AND MISSING(Ewv2_Yca2_Ndepress) AND MISSING(Ewv2_Yca2_Ydepress)) .
   COMPUTE Ewv2_ca2_depress_group = 0 .
ELSE IF (MISSING(Ewv2_Nca2_Ndepress) AND Ewv2_Nca2_Ydepress=1 AND MISSING(Ewv2_Yca2_Ndepress) AND MISSING(Ewv2_Yca2_Ydepress)) .
   COMPUTE Ewv2_ca2_depress_group=1.
ELSE IF (MISSING(Ewv2_Nca2_Ndepress) AND MISSING(Ewv2_Nca2_Ydepress) AND Ewv2_Yca2_Ndepress= 1 AND MISSING(Ewv2_Yca2_Ydepress)).
   COMPUTE Ewv2_ca2_depress_group=2.
ELSE IF ((MISSING(Ewv2_Nca2_Ndepress) AND Ewv2_Nca2_Ydepress=1 AND Ewv2_Yca2_Ndepress= 1 AND Ewv2_Yca2_Ydepress=2)).
   COMPUTE Ewv2_ca2_depress_group=3.
END IF .
VARIABLE LABELS  Ewv2_ca2_depress_group 'Grouping for cardiometabolic abnormality and/or depressive symptoms (wave 2)'.
EXECUTE. 



# Sensitivity analysis to run survival analysis limiting to 5 year follow-up period
    elsa follow-up wave 3-6


# Event to Dementia from wave 3-6
Step 1: event to dementia (cases with dementia/AD/IQCODE) -> Ewv3to6_dementia_event
      1. Sum of new dementia cases in all the follow-up waves (waves 3-6)
            Name of variable: "Ewv3to6_dementia_sum"
      2. Recode into 0 - 1 (yes/no dementia)
                     0 -> 0 no dementia until the last interview (wave 6)
                     1 -> 1 yes dementia
                     2 -> 1 yes dementia
                     3 -> 1 yes dementia
                     4 -> 1 yes dementia
            Name of variable: "Ewv3to6_dementia_event" 



COMPUTE Ewv3to6_dementia_sum=SUM(Ewv3_anydementia_iqcode_report,Ewv4_anydementia_iqcode_report,
Ewv5_anydementia_iqcode_report,Ewv6_anydementia_iqcode_report).
VARIABLE LABELS  Ewv3to6_dementia_sum 'Sum of new self-reported dementia diagnosis in waves 3-6'.
EXECUTE.

RECODE Ewv3to6_dementia_sum (0=0) (1=1) (2=1) (3=1) (4=1) INTO Ewv3to6_dementia_event.
VARIABLE LABELS Ewv3to6_dementia_event 'Event of dementia (0-1) according to self-reported doctor diagnosis and/or IQCODE (wave 3-6)'.
EXECUTE.




# Time of Event - Time of Dementia Incidence
Survival time was measured in months, from the date of interview in the final wave of exposure measurement (wave 6)
to the date of dementia diagnosis or last interview, whichever was first
1. date of interview (add year and month of interview for waves 3, 4, 5, 6)
2. time difference
4. midpoint




# Time difference
   - Create a variable "Ewv3to6_newdementia_or_lastinterview_date" of date of a new dementia diagnosis 
       or the last date of assessment for dementia (last interview) [manual work]
   - Baseline date = Wave 2 date of interview "Ewv2_interview_date"
   - Create a variable "Ewv3to6_time_dementia_months" of Time in months: Calculate time difference between baseline date (wave 2 2004) 
           and date of diagnosis or last assessment in units months
            Use the command of Data Time Wizard (https://www.youtube.com/watch?v=SfAv-TdiXhM)
            OR
            Use the command of DATEDIFF (https://www.youtube.com/watch?v=X_NJeivd7-Q): 
            Transform -> Compute variable -> from Function group select " Date arithmetic" and then "Datediff": 
            Numeric Expression will be DATEFIDD (?,?,?) = DATEDIFF (datetime2, datetime1, "unit"), for unit type e.g. "months"
            



COMPUTE Ewv3to6_time_dementia_months=DATEDIFF(Ewv3to6_newdementia_or_lastinterview_date,Ewv2_interview_date,"months").
VARIABLE LABELS  Ewv3to6_time_dementia_months 'Time in months from the baseline (wave 2) to the date of '+
    'dementia diagnosis or last date of study assessment'.
EXECUTE.




# Midpoint
    

   - Create a variable "Ewv3to6_dementia_free_date" of the last date of being free of dementia before the date of the event of dementia
           Only for the cases identified by IQCODE and those who did not report the associated date of diagnosis, we calculate the midpoint 
           between the date free of dementia and the date of new diagnosis of dementia [manual work]
               For these cases we use the last interview when the participant was dementia free
               For those who never developed dementia (censored), the value remains N/A
   - Calculate the midpoint (in months) between the date free of dementia and the date of new 
       diagnosis of dementia -> "Ewv3to6_time_dementia_midpoint"
            Use the command of Data Time Wizard 
   - Change value of 0 to N/A ("Ewv3to6_time_dementia_midpoint") for the cases with a report of date of dmeentia diagnosis
   - Create a variable of Time of event of dementia or censored "Ewv3to6_time_event_dementia" 
            measured in months and adjusted for midpoint between interviews for those identified by IQCODE or did not report 
            a date of diagnosis (people lost or without dementia until the last date of assessment)
            Use commnad of Statistical mean
            Transform -> Compute -> from Function group select "Statistical Mean" 
            (Ewv3to6_time_dementia_months,Ewv3to6_time_dementia_midpoint_final)



* Date and Time Wizard: H_time_dementia_midpoint.
COMPUTE  Ewv3to6_time_dementia_midpoint=RND((Ewv3to6_newdementia_or_lastinterview_date - 
    Ewv3to6_dementia_free_date) / (30.4375 * time.days(1))).
VARIABLE LABELS  Ewv3to6_time_dementia_midpoint "Midpoint (in months) between the "+
    "interview of being dementia free and the interview of dementia diagnosis".
VARIABLE LEVEL  Ewv3to6_time_dementia_midpoint (SCALE).
FORMATS  Ewv3to6_time_dementia_midpoint (F5.0).
VARIABLE WIDTH Ewv3to6_time_dementia_midpoint(5).
EXECUTE.


RECODE Ewv3to6_time_dementia_midpoint (0=SYSMIS) (ELSE=Copy) INTO Ewv3to6_time_dementia_midpoint_final.
VARIABLE LABELS Ewv3to6_time_dementia_midpoint_final 'Midpoint (in months) between the interview of being dementia free and the interview of dementia diagnosis (0 turned to N/A)'.


COMPUTE Ewv3to6_time_event_dementia=MEAN(Ewv3to6_time_dementia_months,Ewv3to6_time_dementia_midpoint_final).
VARIABLE LABELS  Ewv3to6_time_event_dementia 'Time of event of dementia or censored measured in '+
    'months and adjusting for midpoint between interviews'.
EXECUTE.



------------------------------------


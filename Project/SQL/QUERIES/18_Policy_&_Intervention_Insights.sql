--1. Which adolescent group needs urgent intervention?
select
    age,
    sex_label,
    FIES_category,
    monthly_allowance_category,
    case
        when overall_cyber_abuse > 0 
			then 'Cyber abuse present'
        else 'No cyber abuse'
    end as cyber_abuse_status,
    count(*) as total_high_risk
from FINAL_Clean_Dataset
where any_mental_health_risk = 'At Risk'
group by
    age,
    sex_label,
    FIES_category,
    monthly_allowance_category,
    case
        when overall_cyber_abuse > 0 
			then 'Cyber abuse present'
        else 'No cyber abuse'
    end
order by total_high_risk desc;


--2. Should mental health programs be gender-focused?
select
    sex_label,
    Stress_category,
    Anxiety_category,
    Depression_category,
    count(*) as total
from FINAL_Clean_Dataset
where any_mental_health_risk = 'At Risk'
group by 
	sex_label, 
	Stress_category, 
	Anxiety_category, 
	Depression_category
order by sex_label;


--3. Do schools need digital safety programs?
select
    communication_access_level,
    case
        when overall_cyber_abuse > 0 
			then 'Cyber abuse present'
        else 'No cyber abuse'
    end as cyber_abuse_status,
    Anxiety_category,
    Stress_category,
	AIS_category,
    count(*) as total
from FINAL_Clean_Dataset
group by
    communication_access_level,
    case
        when overall_cyber_abuse > 0 
			then 'Cyber abuse present'
        else 'No cyber abuse'
    end,
    Anxiety_category,
    Stress_category,
	AIS_category
order by communication_access_level;


--4. Should food security be prioritized in mental health policy?
select
    FIES_category,
    Depression_category,
    Anxiety_category,
    Stress_category,
	AIS_category,
    count(*) as total
from FINAL_Clean_Dataset
group by
    FIES_category,
    Depression_category,
    Anxiety_category,
    Stress_category,
	AIS_category
order by FIES_category;


--5. Which factors are modifiable through social policy?
select
    'Food security' as policy_factor,
    count(*) as affected
from FINAL_Clean_Dataset
where FIES_category <> 'Food secure'

union all

select
    'Positive parenting support',
    count(*)
from FINAL_Clean_Dataset
where Positive_parenting_total_score <
      (select avg(Positive_parenting_total_score) from FINAL_Clean_Dataset)

union all

select
    'Digital safety',
    count(*)
from FINAL_Clean_Dataset
where overall_cyber_abuse > 0

union all

select
    'Transport access',
    count(*)
from FINAL_Clean_Dataset
where transport_access_level = 'Limited Transport'
order by affected desc;


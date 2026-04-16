--1. Who are the most mentally vulnerable adolescents?
select
    age,
    sex_label,
    FIES_category,
    monthly_allowance_category,
    transport_access_level,
    communication_access_level,
    count(*) as total_high_risk
from FINAL_Clean_Dataset
where any_mental_health_risk = 'At Risk'
group by
    age,
    sex_label,
    FIES_category,
    monthly_allowance_category,
    transport_access_level,
    communication_access_level
order by total_high_risk desc;


--2. What common traits define high-risk individuals?
select
    sex_label,
    SWEMWS_category,
    Stress_category,
    Anxiety_category,
    Depression_category,
	AIS_category,
	count(*) as total
from FINAL_Clean_Dataset
where any_mental_health_risk = 'At Risk'
group by
    sex_label,
    SWEMWS_category,
    Stress_category,
    Anxiety_category,
    Depression_category,
	AIS_category
order by total desc;


--3. Do high-risk adolescents share economic disadvantages?
select
    FIES_category,
    monthly_allowance_category,
    count(*) as total
from FINAL_Clean_Dataset
where any_mental_health_risk = 'At Risk'
group by 
	FIES_category, 
	monthly_allowance_category
order by total desc;


--4. Are multiple risks (cyber, food, family) clustered together?
with average_parenting as (
	select 
		avg(Positive_parenting_total_score) as average_score
	from FINAL_Clean_Dataset
)
select 
	f.FIES_category,
	case	
		when f.overall_cyber_abuse > 0 
			then 'Cyber abuse present'
		else 'No cyber abuse'
	end as cyber_abuse_status,
	case
		when f.Positive_parenting_total_score < a.average_score		
			then 'Low parenting support'
		else 'High parenting support'
	end as parenting_support_level,
	count(*) as total
from FINAL_Clean_Dataset f
cross join average_parenting a
where f.any_mental_health_risk = 'At Risk'
group by 
	f.FIES_category,
	case	
		when f.overall_cyber_abuse > 0 
			then 'Cyber abuse present'
		else 'No cyber abuse'
	end,
	case
		when f.Positive_parenting_total_score < a.average_score		
			then 'Low parenting support'
		else 'High parenting support'
	end
order by total desc;


--5. Which protective factors reduce risk most effectively?
select
    Positive_parenting_total_score,
    transport_access_level,
    communication_access_level,
    SWEMWS_category,
    count(*) as total
from FINAL_Clean_Dataset
where any_mental_health_risk = 'Low Risk'
group by
    Positive_parenting_total_score,
    transport_access_level,
    communication_access_level,
    SWEMWS_category
order by total desc;

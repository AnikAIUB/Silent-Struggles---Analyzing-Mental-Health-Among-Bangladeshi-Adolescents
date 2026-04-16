--1. Does positive parenting reduce depression risk?
with average_parenting as (
	select
		avg(Positive_parenting_total_score) as average_score
	from FINAL_Clean_Dataset
)
select
	case	
		when f.Positive_parenting_total_score < a.average_score
			then 'Low parenting support'
		else 'High parenting support'
	end as parenting_support_level,
	f.Depression_category,
	count(*) as total
from FINAL_Clean_Dataset f
cross join average_parenting a
group by 
	case	
		when f.Positive_parenting_total_score < a.average_score
			then 'Low parenting support'
		else 'High parenting support'
	end,
	f.Depression_category
	order by parenting_support_level;


--2. Can good communication access improve wellbeing?
select
    communication_access_level,
    SWEMWS_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	communication_access_level, 
	SWEMWS_category
order by communication_access_level;


--3. Does family support offset economic stress?
with average_parenting as (
	select
		avg(Positive_parenting_total_score) as average_score
	from FINAL_Clean_Dataset
)
select
    f.FIES_category,
	case	
		when f.Positive_parenting_total_score < a.average_score
			then 'Low parenting support'
		else 'High parenting support'
	end as parenting_support_level,
    f.any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset f
cross join average_parenting a
group by
    f.FIES_category,
	case	
		when f.Positive_parenting_total_score < a.average_score
			then 'Low parenting support'
		else 'High parenting support'
	end,
    f.any_mental_health_risk
order by FIES_category;


--4. Are physically healthy adolescents mentally more resilient?
select
    health_category_by_BMI,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	health_category_by_BMI, 
	any_mental_health_risk
order by health_category_by_BMI;




--5. Which single factor is the strongest mental health protector?
select
    'Positive parenting' as protective_factor,
    count(*) as total_resilient
from FINAL_Clean_Dataset
where any_mental_health_risk = 'Low Risk'
  and Positive_parenting_total_score >=
      (select avg(Positive_parenting_total_score) from FINAL_Clean_Dataset)

union all

select
    'Good communication access',
    count(*)
from FINAL_Clean_Dataset
where any_mental_health_risk = 'Low Risk'
  and communication_access_level in ('Limited access', 'High access')

union all

select
    'Healthy BMI',
    count(*)
from FINAL_Clean_Dataset
where any_mental_health_risk = 'Low Risk'
  and health_category_by_BMI = 'Healthy'

union all

select
    'High mobility',
    count(*)
from FINAL_Clean_Dataset
where any_mental_health_risk = 'Low Risk'
  and transport_access_level = 'Multiple Transport Options'
order by total_resilient desc;




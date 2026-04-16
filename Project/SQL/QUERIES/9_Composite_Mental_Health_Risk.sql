--1. What proportion of adolescents are at any mental health risk?
select

	any_mental_health_risk,
	count(*) as total_adolescents,
	cast(
		100.0 * count(*) / sum(count(*)) over()
		as decimal(5, 2)
	) as percentage
from FINAL_Clean_Dataset
group by any_mental_health_risk;


--2. Which demographic groups are most vulnerable?
select 
	age,
	sex_label,
	marital_status,
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	age,
	sex_label,
	marital_status,
	any_mental_health_risk
order by age, total desc;


--3. Are females at higher combined risk than males?
select 
	sex_label,
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	sex_label,
	any_mental_health_risk
order by 
	sex_label;


--4. Does socioeconomic disadvantage increase overall mental health risk?
select
	monthly_allowance_category,
	FIES_category,
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	monthly_allowance_category,
	FIES_category,
	any_mental_health_risk
order by 
	monthly_allowance_category,
	FIES_category;


--5. Which combination of factors produces the highest risk profile?
select
	age,
	sex_label,
	FIES_category,
	Positive_parenting_total_score,
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	age,
	sex_label,
	FIES_category,
	Positive_parenting_total_score,
	any_mental_health_risk
order by total desc;

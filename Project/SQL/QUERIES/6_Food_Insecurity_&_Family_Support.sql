--1. What proportion of adolescents experience food insecurity?
select 
	FIES_category, 
	count(*) as total_adolescents,
	cast(
	100.0 * count(*) / sum(count(*)) over () 
	as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by FIES_category;


--2. How does food insecurity relate to depression and anxiety?
select 
	FIES_category,
	Depression_category,
	Anxiety_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	FIES_category,
	Depression_category,
	Anxiety_category
order by FIES_category;


--3. Are food-secure adolescents mentally healthier?
select 
	FIES_category,
	SWEMWS_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	FIES_category,
	SWEMWS_category
order by 
	FIES_category,
	SWEMWS_category;


--4. Does positive parenting reduce the impact of food insecurity?
select 
	FIES_category,
	SWEMWS_category,
	avg(cast(Positive_parenting_total_score as float)) as avg_parenting_score
from FINAL_Clean_Dataset
group by 
	FIES_category,
	SWEMWS_category
order by
	FIES_category,
	SWEMWS_category;


--5. Can strong parenting buffer mental health risks despite economic hardship?
with average_parenting as (
	select 
		avg(Positive_parenting_total_score) as average_score
	from FINAL_Clean_Dataset
)
select 
	FIES_category,
	any_mental_health_risk,
	case
		when Positive_parenting_total_score >= average_score 
			then 'High parenting support'
		else 'Low parenting support'
	end as parenting_support_level,
	count(*) as total
from FINAL_Clean_Dataset
cross join average_parenting    -- average_parenting has one row. CROSS JOIN attaches average_score to every row of the dataset
group by 
	FIES_category,
	any_mental_health_risk,
	case
		when Positive_parenting_total_score >= average_score 
			then 'High parenting support'
		else 'Low parenting support'
	end
order by FIES_category;
	



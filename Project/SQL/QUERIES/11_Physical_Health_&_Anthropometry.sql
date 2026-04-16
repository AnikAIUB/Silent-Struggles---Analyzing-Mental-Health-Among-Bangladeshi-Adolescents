--1. What is the BMI distribution among adolescents?
select 
	health_category_by_BMI,
	count(*) as total,
	cast(
		100.0 * count(*) / sum(count(*)) over () 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by health_category_by_BMI
order by percentage desc;


--2. How many adolescents are underweight or overweight?
select
    health_category_by_BMI,
    count(*) as total
from FINAL_Clean_Dataset
where health_category_by_BMI in ('Underweight', 'Overweight')
group by health_category_by_BMI;


--3. Is poor bmi associated with mental health risk?
select
    health_category_by_BMI,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	health_category_by_BMI, 
	any_mental_health_risk
order by health_category_by_BMI;


--4. Are underweight adolescents more anxious or depressed?
select
    Anxiety_category,
    Depression_category,
    count(*) as total
from FINAL_Clean_Dataset
where health_category_by_BMI = 'Overweight'
group by 
	Anxiety_category,
	Depression_category
order by total desc;


--5. Does obesity correlate with lower mental wellbeing?
select
    SWEMWS_category,
    count(*) as total
from FINAL_Clean_Dataset
where health_category_by_BMI = 'Obese'
group by SWEMWS_category
order by total desc;




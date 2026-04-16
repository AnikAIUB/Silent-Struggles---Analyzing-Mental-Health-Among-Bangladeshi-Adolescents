--1. What proportion of adolescents have abnormal blood pressure?
select
    bp_category,
    count(*) as total,
    cast(
		100.0 * count(*) / sum(count(*)) over () 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by bp_category
order by percentage desc;

-- for only abnormal cases
select
    sum(case when bp_category <> 'Normal' then 1 else 0 end) as abnormal_bp_total,
    cast(
        100.0 * sum(case when bp_category <> 'Normal' then 1 else 0 end)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS percentage
FROM FINAL_Clean_Dataset;


--2. Is Elevated BP associated with stress or anxiety?
select
    bp_category,
    Stress_category,
    Anxiety_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	bp_category, 
	Stress_category, 
	Anxiety_category
order by bp_category;

-- focused on Elevated BP Only
select
	bp_category,
    Stress_category,
    Anxiety_category,
    count(*) as total
from FINAL_Clean_Dataset
where bp_category = 'Elevated' 
	or bp_category like 'Hypertension Stage%'
group by 
	bp_category,
	Stress_category, 
	Anxiety_category
order by total desc;


--3. Does cardiovascular risk cluster with mental health risk?
select
    bp_category,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	bp_category, 
	any_mental_health_risk
order by bp_category;

-- percentage view
select
    bp_category,
    any_mental_health_risk,
	cast(
		100.0 * count(*) / sum(count(*)) over (partition by bp_category) 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by bp_category, any_mental_health_risk;


--4. Are adolescents with high pulse pressure more stressed?
select
	pulse_pressure,
    Stress_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	pulse_pressure,
    Stress_category
order by pulse_pressure;


--5. Does poor physical health amplify psychological vulnerability?
select
    bp_category,
    health_category_by_BMI,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by bp_category, health_category_by_BMI, any_mental_health_risk
order by bp_category, health_category_by_BMI;

--focused high-risk profile
select
    count(*) as high_risk_total
from FINAL_Clean_Dataset
where bp_category <> 'Normal'
  and health_category_by_BMI in ('Underweight', 'Overweight', 'Obese')
  and any_mental_health_risk = 'At Risk';

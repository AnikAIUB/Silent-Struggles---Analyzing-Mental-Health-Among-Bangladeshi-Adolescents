--1. How are adolescents distributed across monthly allowance categories?
select 
	monthly_allowance,
	monthly_allowance_category,
	count(*) as total_adolescents
from FINAL_Clean_Dataset
group by 
	monthly_allowance, 
	monthly_allowance_category
order by monthly_allowance desc;


--2. Does lower allowance correlate with higher anxiety or depression?
select
	monthly_allowance_category,
	Anxiety_category,
	Depression_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	monthly_allowance_category,
	Anxiety_category,
	Depression_category
order by 
	monthly_allowance_category;


--3. Are financially independent adolescents mentally better off?
select
	monthly_allowance_category,
	SWEMWS_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	monthly_allowance_category, 
	SWEMWS_category
order by 
	monthly_allowance_category, 
	SWEMWS_category;


--4. Is allowance level associated with food insecurity?
select 
	monthly_allowance_category,
	FIES_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	monthly_allowance_category, 
	FIES_category
order by 
	monthly_allowance_category, 
	FIES_category;


--5. Does economic constraint amplify stress levels?
select
	monthly_allowance_category,
	Stress_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	monthly_allowance_category, 
	Stress_category
order by 
	monthly_allowance_category, 
	Stress_category;



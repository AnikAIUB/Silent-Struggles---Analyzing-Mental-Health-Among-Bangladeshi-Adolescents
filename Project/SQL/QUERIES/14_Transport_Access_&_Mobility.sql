--1. How mobile(able to move) are adolescents based on transport access?
select
    transport_access_level,
    count(*) as total_adolescents,
    cast(
		100.0 * count(*) / sum(count(*)) over () 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by transport_access_level
order by percentage desc;


--2. Does limited transport access relate to stress or depression?
select 
	transport_access_level,
	Stress_category,
	Depression_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	transport_access_level,
	Stress_category,
	Depression_category
order by transport_access_level;


--3. Are adolescents with higher mobility mentally healthier?
select 
	transport_access_level,
	SWEMWS_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	transport_access_level,
	SWEMWS_category
order by transport_access_level;


--4. Is transport access a proxy for socioeconomic advantage?
select
    transport_access_level,
    monthly_allowance_category,
    FIES_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	transport_access_level, 
	monthly_allowance_category, 
	FIES_category
order by transport_access_level;


--5. Does mobility influence social participation and wellbeing?
select
    transport_access_level,
    SWEMWS_category,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	transport_access_level, 
	SWEMWS_category, 
	any_mental_health_risk
order by transport_access_level;

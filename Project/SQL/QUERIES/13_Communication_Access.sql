--1. What level of digital access do adolescents have?
select
    communication_access_level,
    count(*) as total_adolescents,
    cast(
		100.0 * count(*) / sum(count(*)) over () 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by communication_access_level
order by percentage desc;


--2. Does higher communication access increase cyber abuse exposure?
select
    communication_access_level,
    case
        when overall_cyber_abuse > 0 
			then 'Experienced cyber abuse'
        else 'No cyber abuse'
    end as cyber_abuse_status,
    count(*) as total,
	cast(
		100.0 * count(*) / sum(count(*)) over () 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by communication_access_level, 
    case
        when overall_cyber_abuse > 0 
			then 'Experienced cyber abuse'
        else 'No cyber abuse'
    end
order by communication_access_level;


--3. Are digitally connected adolescents more anxious?
select
    communication_access_level,
    Anxiety_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	communication_access_level, 
	Anxiety_category
order by communication_access_level;


--4. Does limited access isolate adolescents mentally?
select
    communication_access_level,
    SWEMWS_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	communication_access_level, 
	SWEMWS_category
order by communication_access_level;


--5. Is communication access protective or harmful to mental health?
select
    communication_access_level,
    any_mental_health_risk,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	communication_access_level, 
	any_mental_health_risk
order by communication_access_level;




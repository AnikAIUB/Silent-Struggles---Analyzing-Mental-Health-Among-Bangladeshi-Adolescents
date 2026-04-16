--1. What percentage of adolescents experience high stress?
select
	Stress_category,
	count(*) as total_adolescents,
	cast(
		100.0 * count(*) / sum(count(*)) over() 
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by Stress_category;


--2. Is anxiety more prevalent than depression?
select
    'anxiety' as condition,				-- 'anxiety' → a literal string. It is not a column from your table. AS condition → gives a name to this new column
    anxiety_category as category,
    count(*) as total
from FINAL_Clean_Dataset
group by anxiety_category

union all

select
    'depression' as condition,
    depression_category as category,
    count(*) as total
from final_clean_dataset
group by depression_category
order by condition, total desc;


--3. Do stress, anxiety, and depression co-occur?
select
    Stress_category,
    Anxiety_category,
    Depression_category,
    count(*) as total
from FINAL_Clean_Dataset
group by
    Stress_category,
    Anxiety_category,
    Depression_category
order by total desc;


--4. Are older adolescents more depressed than younger ones?
select
    case
        when age between 10 and 14 then 'Early adolescence (10–14)'
        when age between 15 and 19 then 'Late adolescence (15–19)'
    end as age_group,
    Depression_category,
    count(*) as total
from FINAL_Clean_Dataset
group by
    case
        when age between 10 and 14 then 'Early adolescence (10–14)'
        when age between 15 and 19 then 'Late adolescence (15–19)'
    end,
    Depression_category
order by 
	age_group,
	Depression_category;


--5. Does academic pressure contribute to stress indicators (AIS category)?
select 
	AIS_category,
	Stress_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	AIS_category, 
	Stress_category
order by 
	AIS_category, 
	Stress_category;


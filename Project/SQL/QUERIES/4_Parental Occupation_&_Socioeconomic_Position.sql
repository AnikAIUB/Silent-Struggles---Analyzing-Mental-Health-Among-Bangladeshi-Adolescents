--1. What are the dominant occupational groups of fathers and mothers?
with parent_occupation as (
	select 
		'Father' as parent_type,
		father_occupation_group as occupation_group
	from FINAL_Clean_Dataset
	
	union all
	
	select
		'Mother' as parent_type,
		mother_occupation_group as occupation_group
	from FINAL_Clean_Dataset
)
select
	occupation_group,
	sum(case when parent_type = 'Father' then 1 else 0 end) as father_total,
	sum(case when parent_type = 'Mother' then 1 else 0 end) as mother_total
from parent_occupation
group by occupation_group
order by occupation_group;


--2. Do adolescents with unemployed parents show higher stress or depression?
with parent_occupation as (
	-- Father rows
	select 
		'Father' as parent_type,
		father_occupation_group as occupation_group,
		Stress_category,
		Depression_category
	from FINAL_Clean_Dataset
	where father_occupation_group = 'Not Economically Active'

	union all
	
	-- Mother rows
	select
		'Mother' as parent_type,
		mother_occupation_group as occupation_group,
		Stress_category,
		Depression_category
	from FINAL_Clean_Dataset
	where mother_occupation_group = 'Not Economically Active'

)
select
	--occupation_group,
	Stress_category,
    Depression_category,
	sum(case when parent_type = 'Father' then 1 else 0 end) as father_total,
	sum(case when parent_type = 'Mother' then 1 else 0 end) as mother_total
from parent_occupation
group by
    Stress_category,
    Depression_category
ORDER BY
    Stress_category,
    Depression_category;


--3. Is parental occupation stability associated with lower mental health risk?
with parent_occupation as  (
    -- Father rows
    select
        'Father' as parent_type,
        father_occupation_group as occupation_group,
        any_mental_health_risk
    from FINAL_Clean_Dataset

    union all

    -- Mother rows
    select
        'Mother' as parent_type,
        mother_occupation_group as occupation_group,
        any_mental_health_risk
    from FINAL_Clean_Dataset
)
select
    occupation_group,
    any_mental_health_risk,
    sum(case when parent_type = 'Father' then 1 else 0 end) as father_total,
    sum(case when parent_type = 'Mother' then 1 else 0 end) as mother_total
from parent_occupation
group by
    occupation_group,
    any_mental_health_risk
order by
    occupation_group,
    any_mental_health_risk;


--4. Does mother’s employment status influence adolescent anxiety levels?
select
    mother_occupation_group,
    Anxiety_category,
    count(*) as  total
from FINAL_Clean_Dataset
group by 
	mother_occupation_group, 
	Anxiety_category
order by 
	mother_occupation_group;


--5. Are adolescents from labor-intensive households more stressed?
select
    father_occupation_category,
	mother_occupation_category,
    Stress_category,
    count(*) as total
from FINAL_Clean_Dataset
where father_occupation_category IN ('Agriculture / Farming', 'Homemaker', 'Health Services', 'Police / Armed Forces') and mother_occupation_category IN ('Agriculture / Farming', 'Homemaker', 'Health Services', 'Police / Armed Forces')
group by father_occupation_category, mother_occupation_category, Stress_category
order by father_occupation_category, mother_occupation_category, Stress_category;


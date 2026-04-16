--1. What is the distribution of father’s education levels?
select 
	father_qualification_category,
	count(*) as total_adolescents
from FINAL_Clean_Dataset
group by 
	father_qualification_category
order by total_adolescents desc; 


--2. What is the distribution of mother’s education levels?
select 
	mother_qualification_category,
	count(*) as total_adolescents
from FINAL_Clean_Dataset
group by 
	mother_qualification_category
order by total_adolescents desc; 


--3. Is higher parental education linked to better adolescent mental wellbeing?
select
	father_qualification_category,
	mother_qualification_category,
	SWEMWS_category, 
	SWEMWS_risk_level,
	count(*) as total
from FINAL_Clean_Dataset
GROUP BY
    father_qualification_category,
    mother_qualification_category,
    SWEMWS_category, 
	SWEMWS_risk_level
ORDER BY
    father_qualification_category,
    mother_qualification_category;


--4. Does mother’s education have a stronger association with mental health than father’s?
with parent_education as(
    select
        'Father' as parent_type,
        father_qualification_category as education_level,
        SWEMWS_category
    from FINAL_Clean_Dataset

    union all

    select
        'Mother' as parent_type,
        mother_qualification_category as education_level,
        SWEMWS_category
    from FINAL_Clean_Dataset
)
select
    education_level,
    SWEMWS_category,
    sum(case when parent_type = 'Father' then 1 else 0 end) as father_total,
    sum(case when parent_type = 'Mother' then 1 else 0 end) as mother_total
from parent_education
group by
    education_level,
    SWEMWS_category
order by
    education_level, 
	SWEMWS_category;


--5. Are low-education households more prone to adolescent mental health risk?
select 
	father_qualification_category,
	mother_qualification_category,
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by
	father_qualification_category,
	mother_qualification_category,
	any_mental_health_risk
order by 
	father_qualification_category desc,
	mother_qualification_category desc;
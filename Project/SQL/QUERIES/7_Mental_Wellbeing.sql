--1. What is the overall mental wellbeing distribution?
select
	SWEMWS_category,
	SWEMWS_risk_level,
	count(*) as total_adolescents
from FINAL_Clean_Dataset
group by 
	SWEMWS_category,
	SWEMWS_risk_level
order by total_adolescents;


--2. How many adolescents fall into low wellbeing categories?
select 
	count(*) as low_wellbeing_count
from FINAL_Clean_Dataset
where SWEMWS_category in ('Low Wellbeing');


--3. Does mental wellbeing vary significantly by age?
select 
	age,
	SWEMWS_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	age,
	SWEMWS_category
order by 
	age,
	SWEMWS_category;


--4. Are girls more likely to have lower wellbeing scores?
select
	SWEMWS_category,
	sum(
		case
			when sex_label = 'Female'
				then 1
			else 0
		end) as female_total,
	sum(
		case
			when sex_label = 'Male'
				then 1
			else 0
		end) as Male_total
from FINAL_Clean_Dataset
group by SWEMWS_category
order by SWEMWS_category;


--5. Is wellbeing affected by family size or sibling count?
-- a) Family size vs wellbeing
SELECT
    CASE
        WHEN total_family_members <= 4 THEN 'Small family (≤4)'
        WHEN total_family_members BETWEEN 5 AND 6 THEN 'Medium family (5–6)'
        ELSE 'Large family (7+)'
    END AS family_size_group,
    SWEMWS_category,
    COUNT(*) AS total
FROM FINAL_Clean_Dataset
GROUP BY
    CASE
        WHEN total_family_members <= 4 THEN 'Small family (≤4)'
        WHEN total_family_members BETWEEN 5 AND 6 THEN 'Medium family (5–6)'
        ELSE 'Large family (7+)'
    END,
    SWEMWS_category
ORDER BY family_size_group;

--b) Sibling count vs wellbeing
SELECT
    total_siblings,
    SWEMWS_category,
    COUNT(*) AS total
FROM FINAL_Clean_Dataset
GROUP BY total_siblings, SWEMWS_category
ORDER BY total_siblings;




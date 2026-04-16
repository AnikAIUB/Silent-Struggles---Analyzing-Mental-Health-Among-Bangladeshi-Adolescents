--1. Are females more vulnerable to anxiety and depression?
select
    sex_label,
    Anxiety_category,
    Depression_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	sex_label, 
	Anxiety_category, 
	Depression_category
order by sex_label;


--2. Are males more exposed to physical or behavioral stress?
select
    sex_label,
    Stress_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	sex_label, 
	Stress_category
order by sex_label;


--3. Does family expectation differ by gender?
SELECT
    Positive_parenting_total_score,
    sum(case when sex_label = 'Male' then 1 else 0 end) as male_total,
    SUM(case when sex_label = 'Female' then 1 else 0 end) as  female_total
FROM FINAL_Clean_Dataset
GROUP BY Positive_parenting_total_score
ORDER BY Positive_parenting_total_score;


--4. Are coping outcomes different between genders?
select
    sex_label,
    SWEMWS_category,
    count(*) as total
from FINAL_Clean_Dataset
group by 
	sex_label, 
	SWEMWS_category
order by sex_label;


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


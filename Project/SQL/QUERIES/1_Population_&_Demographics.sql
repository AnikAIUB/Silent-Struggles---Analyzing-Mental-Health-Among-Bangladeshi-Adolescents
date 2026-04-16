--1️ What is the age composition of the adolescent population?
select 
	age,
	count(*) as total_adolescents
from FINAL_Clean_Dataset
group by age
order by age;


--2. Are early adolescents (10–14) or late adolescents (15–19) more represented?
select 
	case 
		when age between 10 and 14 then 'Early Adolescence (10-14)'
		when age between 15 and 19 then 'Late Adolescence (15-19)'
		else 'Out of Range'
	end as group_age,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	case 
		when age between 10 and 14 then 'Early Adolescence (10-14)'
		when age between 15 and 19 then 'Late Adolescence (15-19)'
		else 'Out of Range'
		end; 


--3. How does gender distribution vary across ages?
select 
	age,
	sex_label, 
	count(*) as total
from FINAL_Clean_Dataset
group by age, sex_label
order by age, sex_label;


--4. Are married adolescents present, and in which age groups?
select
	age,
	marital_status_category, 
	count(*) as total
from FINAL_Clean_Dataset
where marital_status_category = 'Married' -- the question about still married adolescents; not married at any point in their lifetime.
group by age, marital_status_category
order by age, marital_status_category;


--5. Does gender influence marital status among adolescents?
select
	sex_label, 
	marital_status_category, 
	count(*) as total
from FINAL_Clean_Dataset
group by sex_label, marital_status_category
order by sex_label, marital_status_category;
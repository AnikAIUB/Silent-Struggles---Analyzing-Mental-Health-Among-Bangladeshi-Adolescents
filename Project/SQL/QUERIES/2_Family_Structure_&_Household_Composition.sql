--1. What is the average family size of adolescents?
select
	AVG(total_family_members) as [Average Family Size]
from FINAL_Clean_Dataset;


--2. How many adolescents come from male-dominated vs female-dominated households?
select
	case
		when family_member_male > family_member_female then 'Male-dominated households'
		when family_member_female > family_member_male then 'Female-dominated households'
		else 'Balanced Household'
	end as house_type,
	COUNT(*) as total_adolescents
from FINAL_Clean_Dataset
group by 
	case
		when family_member_male > family_member_female then 'Male-dominated households'
		when family_member_female > family_member_male then 'Female-dominated households'
		else 'Balanced Household'
	end;


--3. Does number of siblings influence mental health risk?
select
	total_siblings, 
	any_mental_health_risk,
	count(*) as total
from FINAL_Clean_Dataset
group by total_siblings, any_mental_health_risk
order by total_siblings, any_mental_health_risk;


--4. Are adolescents from larger families more vulnerable to stress or anxiety?
select
	record_id,
	case	
		when total_family_members <=4 then 'Samll Family (≤4)'
		when total_family_members between 5 and 6 then 'Medium Family (5-6)'
		else 'Large Family (7+)'
	end as  family_size_group,
	total_family_members,
	Stress_category,
	Anxiety_category
from FINAL_Clean_Dataset
group by 
	record_id,
	case	
		when total_family_members <=4 then 'Samll Family (≤4)'
		when total_family_members between 5 and 6 then 'Medium Family (5-6)'
		else 'Large Family (7+)'
	end,
	total_family_members,
	Stress_category,
	Anxiety_category
order by family_size_group;


--5. Is being an only child associated with better or worse mental wellbeing?
select
	case 
		when total_siblings = 0 then 'Only Child'
		else 'Has Siblings'
	end as sibling_status,
	SWEMWS_category,
	count(*) as total
from FINAL_Clean_Dataset
group by
	case 
		when total_siblings = 0 then 'Only Child'
		else 'Has Siblings'
	end,
	SWEMWS_category
order by sibling_status;



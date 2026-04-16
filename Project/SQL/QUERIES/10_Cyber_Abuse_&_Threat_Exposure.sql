--1. How prevalent is cyber abuse among adolescents?
select 
	case
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end as cyber_abuse_status,
	count(*) as total_adolescents,
	cast(
		100.0 * count(*) / sum(count(*)) over()
		as decimal(5,2)
	) as percentage
from FINAL_Clean_Dataset
group by 
	case
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end;


--2. Is cyber abuse higher among those with greater communication access?
select
	communication_access_score,
	communication_access_level,
	case
		when overall_cyber_abuse > 0 
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end as cyber_abise_status,
	count(*) as total
from FINAL_Clean_Dataset
group by
	communication_access_score,
	communication_access_level,
	case
		when overall_cyber_abuse > 0 
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end
order by communication_access_level;


--3. Does cyber threat exposure increase anxiety or stress?
select
	case
		when overall_cyber_threat > 0
			then 'Exposed to cyber threat'
		else 'No cyber threat'
	end as cyber_threat_status,
	Anxiety_category,
	Stress_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	case
		when overall_cyber_threat > 0
			then 'Exposed to cyber threat'
		else 'No cyber threat'
	end,
	Anxiety_category,
	Stress_category
order by cyber_threat_status;	


--4. Are adolescents facing cyber abuse more likely to be depressed?
select
	case 
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end as cyber_abuse_status,
	Depression_category,
	count(*) as total
from FINAL_Clean_Dataset
group by 
	case 
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end,
	Depression_category
order by cyber_abuse_status


--5. Is cyber abuse an independent(MOST IMPORTANT) mental health risk factor?
select
	case	
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end as cyber_abuse_status,
	any_mental_health_risk,
	count(*) as total,
	cast(
        100.0 * count(*) / sum(count(*)) over (partition by
            case
                when overall_cyber_abuse > 0 
					then'Experienced cyber abuse'
                else 'No cyber abuse'
            end
			)
        as decimal(5,2)
    ) as percentage
from FINAL_Clean_Dataset
group by 
	case	
		when overall_cyber_abuse > 0
			then 'Experienced cyber abuse'
		else 'No cyber abuse'
	end,
	any_mental_health_risk
order by cyber_abuse_status;



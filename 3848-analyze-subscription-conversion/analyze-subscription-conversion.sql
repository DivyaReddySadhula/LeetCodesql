/* Write your PL/SQL query statement below */
select 
user_id
,round(avg(case when activity_type= 'free_trial' then activity_duration end),2)  as trial_avg_duration
,round(avg(case when activity_type= 'paid' then activity_duration end),2)  as paid_avg_duration
from UserActivity
group by user_id
having sum(case when activity_type = 'free_trial' then 1 else 0 end)>0
and sum(case when activity_type = 'paid' then 1 else 0 end)>0
order by user_id
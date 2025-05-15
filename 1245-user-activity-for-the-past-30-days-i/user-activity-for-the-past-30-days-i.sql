/* Write your PL/SQL query statement below */
select 
to_char(activity_date,'YYYY-MM-DD') as day
,count(distinct user_id)  as active_users
from Activity 
where activity_date  between (to_date('2019-07-27','YYYY-MM-DD')-29) and to_date('2019-07-27','YYYY-MM-DD')
group by activity_date  
order by activity_date

/* Write your PL/SQL query statement below */
with res as
(select 
user_id
,count(distinct session_id) as cnt
from activity
where activity_date between to_date('2019-07-27','YYYY-MM-DD')-29 and to_date('2019-07-27','YYYY-MM-DD')
group by user_id
)select NVL(round(sum(cnt)/count(distinct user_id),2),0) as average_sessions_per_user from res

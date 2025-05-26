/* Write your PL/SQL query statement below */
with res as (select
user_id
,time_stamp
,RANK() OVER(PARTITION BY user_id order by time_stamp desc) as rnk
from Logins
where to_char(time_stamp,'YYYY') = '2020'
) select user_id,time_stamp as last_stamp from res where rnk =1 

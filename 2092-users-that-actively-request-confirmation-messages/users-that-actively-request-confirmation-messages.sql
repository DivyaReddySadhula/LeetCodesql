/* Write your PL/SQL query statement below */
with res as 
(select
user_id
,(time_stamp - lag(time_stamp) over(partition by user_id order by time_stamp)) as diff
from Confirmations
)select distinct user_id from res where diff<=1
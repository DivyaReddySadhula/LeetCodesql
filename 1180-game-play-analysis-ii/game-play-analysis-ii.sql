/* Write your PL/SQL query statement below */
select 
player_id
,device_id
from (select  player_id
,device_id
,event_date
,min(event_date) over(partition by player_id ) as first_login
from Activity)
where event_date = first_login
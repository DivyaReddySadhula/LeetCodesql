/* Write your PL/SQL query statement below */
select 
distinct player_id
,to_char(min(event_date) over(partition by player_id),'YYYY-MM-DD') as first_login
from Activity

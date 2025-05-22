/* Write your PL/SQL query statement below */
select 
to_char(event_day,'YYYY-MM-DD') as day
,emp_id
,SUM(out_time - in_time) as total_time
from Employees
GROUP BY event_day,emp_id
order by event_day 
/* Write your PL/SQL query statement below */
select
employee_id
,count(employee_id) over(partition by team_id) as team_size
from Employee
order by employee_id

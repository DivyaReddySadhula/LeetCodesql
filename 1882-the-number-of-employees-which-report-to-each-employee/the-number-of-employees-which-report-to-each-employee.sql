/* Write your PL/SQL query statement below */
select
e.employee_id
,e.name
,count(r.employee_id) reports_count
,ROUND(avg(r.age)) average_age
from Employees e
 join Employees r
on  r.reports_to = e.employee_id 
group by e.employee_id,e.name 
order by e.employee_id
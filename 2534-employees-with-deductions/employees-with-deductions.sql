/* Write your PL/SQL query statement below */
with workingHours as 
(select
e.employee_id
,NVL(SUM(round((to_date(l.out_time)-to_date(l.in_time))*24*60)/60),0) as working_hrs
from employees e
left join logs l on
l.employee_id = e.employee_id
group by e.employee_id
) select wh.employee_id from workingHours wh
join employees e
on e.employee_id = wh.employee_id
where wh.working_hrs<e.needed_hours
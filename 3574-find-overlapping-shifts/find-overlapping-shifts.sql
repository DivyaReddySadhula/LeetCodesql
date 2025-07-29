/* Write your PL/SQL query statement below */
select
e1.employee_id
,count(*) as overlapping_shifts
from employeeShifts e1
join employeeShifts e2
on e1.employee_id = e2.employee_id
and e1.start_time<e2.start_time
and e1.end_time>e2.start_time
group by e1.employee_id
order by e1.employee_id asc
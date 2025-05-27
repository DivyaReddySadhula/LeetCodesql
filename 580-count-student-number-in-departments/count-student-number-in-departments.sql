/* Write your PL/SQL query statement below */
select
d.dept_name
,count(s.student_id) as student_number
from Department d
left join Student s
on d.dept_id = s.dept_id
group by d.dept_name
order by count(s.student_id) desc,dept_name
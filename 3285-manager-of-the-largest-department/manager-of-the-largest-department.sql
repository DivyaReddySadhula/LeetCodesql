/* Write your PL/SQL query statement below */
with cte as 
(select
dep_id
,count(emp_id)  as cnt
from employees
group by dep_id
order by dep_id
)select 
e.emp_name as manager_name
,c.dep_id
from cte c
join employees e
on c.dep_id = e.dep_id
where c.cnt = (select max(cnt) from cte) and e.position = 'Manager'



/* Write your PL/SQL query statement below */
-- with  indirect(employee_id) as 
-- (
-- select
-- employee_id
-- from employees
-- where manager_id = 1
-- union all
-- select e.employee_id
-- from employees e
-- join indirect i
-- on e.manager_id = i.employee_id
-- )select * from indirect

select distinct employee_id 
from 
(select
employee_id
from 
Employees
start with manager_id = 1
connect by nocycle prior employee_id = manager_id) a
where employee_id!=1



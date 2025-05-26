/* Write your PL/SQL query statement below */
with res as (select
emp_id
,firstname
,lastname
,salary
,department_id
,rank() over(partition by emp_id order by salary desc) rnk
from Salary)
select emp_id,firstname,lastname,salary,department_id
from res where rnk =1

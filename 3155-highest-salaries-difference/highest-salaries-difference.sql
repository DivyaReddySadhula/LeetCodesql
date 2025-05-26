/* Write your PL/SQL query statement below */
select max(sal) - min(sal) as salary_difference from 
(select
department
,max(salary) as sal
from Salaries
where department in ('Engineering','Marketing')
group by department)t 

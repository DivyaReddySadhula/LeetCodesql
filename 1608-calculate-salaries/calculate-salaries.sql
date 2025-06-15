/* Write your PL/SQL query statement below */
with maxSal as 
(
    select
    company_id
    ,employee_id
    ,employee_name
    ,salary
    ,max(salary) over(partition by company_id) as max_sal
    from Salaries
)select 
company_id
,employee_id
,employee_name
,case when max_sal <1000 then salary 
    when max_sal  between 1001 and 10000 then round(salary-0.24*salary)
    when max_sal >10000 then round(salary - 0.49*salary)
    end as salary
from maxSal



/* Write your PL/SQL query statement below */
with res as
(
    select p.project_id
    ,count(p.employee_id) as cnt
    from Project p
    join Employee e
    on p.employee_id = e.employee_id
    group by p.project_id
)select project_id
from res 
where cnt = (select max(cnt) from res)

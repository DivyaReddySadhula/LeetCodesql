/* Write your PL/SQL query statement below */
select
e.name
,eu.unique_id
from Employees e
left join EmployeeUni eu
on e.id = eu.id
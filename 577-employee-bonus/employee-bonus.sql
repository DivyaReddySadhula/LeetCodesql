/* Write your PL/SQL query statement below */
/*report name and bonus of each employee with bonus <1000*/
select e.name,b.bonus
from Employee e
left join Bonus b
on e.empId = b.empId
where b.bonus<1000 or b.bonus is null
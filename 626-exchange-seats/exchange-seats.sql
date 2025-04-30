# Write your MySQL query statement below
select id,
case when id%2=0 then lag(student) over(order by id)
when id%2!=0 and id =(select max(id) from seat) then student
when id%2!=0 then lead(student) over(order by id)
end as student
from seat
order by id
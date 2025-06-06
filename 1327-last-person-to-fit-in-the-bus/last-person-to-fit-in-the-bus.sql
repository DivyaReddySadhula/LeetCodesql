/* Write your PL/SQL query statement below */
with lastPerson as
(
    select
    turn
    ,person_name
    ,sum(weight) over(order by turn asc) as cumSum
    from Queue
)select person_name
from 
(select person_name
 from lastPerson
 where  cumSum<=1000
 order by turn desc
)where rownum = 1
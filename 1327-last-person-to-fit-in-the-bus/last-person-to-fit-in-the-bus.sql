/* Write your PL/SQL query statement below */
with lastPerson as
(
    select
    turn
    ,person_name
    ,sum(weight) over(order by turn asc) as cumSum
    ,row_number() over(order by turn ) as rnk
    from Queue
)select person_name
from 
(select person_name,turn
 from lastPerson
 where  cumSum<=1000
 order by turn desc
)where rownum = 1
/* Write your PL/SQL query statement below */
with recArea as
(
    select 
    r1.id as p1
    ,r2.id as p2
    ,ABS(r1.x_value-r2.x_value)*ABS(r1.y_value-r2.y_value) as area
    from points r1
    cross join points r2
)select distinct p1, p2,area 
from recArea
where area!=0 and p1<p2
order by area desc,p1,p2

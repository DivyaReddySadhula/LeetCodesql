/* Write your PL/SQL query statement below */
with res as 
(
    select
    activity
    ,count(id) as cnt
    from friends
    group by activity
)select activity 
from res
where cnt != (select max(cnt) from res) and cnt!=(select min(cnt) from res)

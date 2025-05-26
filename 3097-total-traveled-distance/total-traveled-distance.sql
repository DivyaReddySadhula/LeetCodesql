/* Write your PL/SQL query statement below */
select
u.user_id
,u.name
,NVL(sum(r.distance),0) as "traveled distance"
from users u
left join rides r
on u.user_id = r.user_id
group by u.user_id,u.name
order by u.user_id
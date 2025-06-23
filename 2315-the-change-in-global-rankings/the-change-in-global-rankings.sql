/* Write your PL/SQL query statement below */
with res as 
(select
tp.team_id
,tp.name
,tp.points
,(tp.points+pc.points_change) as updated_points
,rank() over(order by tp.points desc,tp.name asc) 
-rank() over(order by (tp.points+pc.points_change) desc,tp.name asc)as rank_diff
from teampoints tp
join pointschange pc
on tp.team_id = pc.team_id
)select team_id,name,rank_diff from res order by updated_points desc,name asc
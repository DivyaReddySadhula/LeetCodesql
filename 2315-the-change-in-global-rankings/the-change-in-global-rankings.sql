/* Write your PL/SQL query statement below */
select
tp.team_id
,tp.name
,row_number() over(order by tp.points desc,tp.name asc) 
-row_number() over(order by (tp.points+pc.points_change) desc,tp.name asc)as rank_diff
from teampoints tp
join pointschange pc
on tp.team_id = pc.team_id

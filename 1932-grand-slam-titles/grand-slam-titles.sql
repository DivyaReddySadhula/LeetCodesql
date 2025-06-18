/* Write your PL/SQL query statement below */
with longFormChampionships as 
(select year,tournament,winner
from championships
unpivot
(
    winner for tournament  in (Wimbledon,Fr_open,US_open,Au_open)
)
order by year,tournament
)
select
p.player_id
,p.player_name
,count(*) as grand_slams_count
from Players p
join longFormChampionships c
on p.player_id = c.winner 
group by p.player_id,p.player_name

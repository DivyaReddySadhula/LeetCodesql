with firstLogin as(
    select player_id,
    min(event_date) as first_login
    from activity
    group by player_id
),
nextDayLogin as(
    select f.player_id
    from firstLogin f
    join Activity a
    on f.player_id = a.player_id and
    a.event_date = f.first_login+1
),totalPlayers as(
    select count(distinct player_id) as total_cnt from Activity
), returningPlayers as (
    select count(distinct player_id) as return_cnt from nextDayLogin
)select ROUND(r.return_cnt / t.total_cnt, 2) AS fraction
from returningPlayers r, totalPlayers t;
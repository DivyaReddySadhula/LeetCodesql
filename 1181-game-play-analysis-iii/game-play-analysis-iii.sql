/* Write your PL/SQL query statement below */
select player_id,to_char(event_date,'YYYY-MM-DD') as event_date,
sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from Activity
order by games_played_so_far desc, player_id asc
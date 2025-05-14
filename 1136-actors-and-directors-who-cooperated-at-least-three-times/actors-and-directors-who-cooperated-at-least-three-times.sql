/* Write your PL/SQL query statement below */
-- with res as (
--     select actor_id
-- ,director_id
-- ,timestamp
-- ,row_number() over(partition by actor_id,director_id order by actor_id) as rnk
-- from actordirector
-- )
-- select actor_id,director_id
-- from res
-- where rnk>=3

select actor_id,director_id
from ActorDirector
group by actor_id,director_id
having count(*)>=3


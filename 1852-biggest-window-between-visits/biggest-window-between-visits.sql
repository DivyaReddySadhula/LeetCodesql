/* Write your PL/SQL query statement below */
with prevNextVisists as 
(   select
    user_id
    ,visit_date
    ,lag(visit_date) over(partition by user_id order by visit_date) as prev_visit
    ,NVL(lead(visit_date) over(partition by user_id order by visit_date) , to_date('2021-01-01','YYYY-MM-DD'))as next_visit
    from UserVisits
), windowCal as 
(
    select user_id,visit_date,(next_visit-visit_date) as window
    from prevNextVisists
)
select user_id, max(window) as biggest_window
from windowCal
group by user_id
order by user_id


-- user_id,visit_date, (next_visit-prev_visit) as window

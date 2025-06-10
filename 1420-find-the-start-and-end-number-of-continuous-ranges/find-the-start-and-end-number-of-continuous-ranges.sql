/* Write your PL/SQL query statement below */
with ranking as 
(
    select
    log_id
    ,row_number() over(order by log_id) as rnk
    ,(log_id-row_number() over(order by log_id)) as gaps
    from logs
)
SELECT 
MIN(log_id) as start_id
,MAX(log_id) as end_id
from ranking
group by gaps
order by start_id

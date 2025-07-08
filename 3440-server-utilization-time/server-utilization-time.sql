/* Write your PL/SQL query statement below */
with cte as 
(select
server_id
,status_time
,session_status
,row_number() over(partition by server_id,session_status order by status_time asc) as rnk
from servers
)select floor(sum(c2.status_time - c1.status_time)) as total_uptime_days from cte c1
join cte c2
on c1.server_id = c2.server_id
and c1.rnk = c2.rnk
where c1.session_status = 'start' and c2.session_status = 'stop'
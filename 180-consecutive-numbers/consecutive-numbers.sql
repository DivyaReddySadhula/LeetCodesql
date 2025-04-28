# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (SELECT 
LAG(id) OVER(ORDER BY id) as 'prev_id',
id,
LEAD(id) OVER(ORDER BY id) as  'next_id',
LAG(num) OVER(ORDER BY id) as 'prev_num',
num,
LEAD(num) OVER(ORDER BY id) as 'next_num'
FROM Logs
) sq
WHERE prev_num = num AND num = next_num
AND id -1 = prev_id
AND next_id -1 = id

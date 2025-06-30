/* Write your PL/SQL query statement below */
with cte1 as 
(select
student_id
,student_name
,(assignment1+assignment2+assignment3) as sum_3
from scores
order by (assignment1+assignment2+assignment3)
),cte2 as 
(
    select min(sum_3) as mini_mum
    ,max(sum_3) as maximus from cte1
)select (maximus-mini_mum) as difference_in_score from cte2
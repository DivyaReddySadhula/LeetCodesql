/* Write your PL/SQL query statement below */
select problem_id 
from 
(select
problem_id
,(likes/(likes+dislikes))*100 as per
from Problems
) t
where per<60
order by problem_id

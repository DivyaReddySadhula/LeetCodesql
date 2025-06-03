/* Write your PL/SQL query statement below */
with res as (
select
student_id
,course_id
,grade
,rank() over(partition by student_id order by grade desc,course_id asc) as rnk
from Enrollments
)
select student_id,course_id,grade from res where rnk =1
order by student_id asc
/* Write your PL/SQL query statement below */
with res as 
(select
s.school_id
,e.score
,rank() over(partition by s.school_id order by e.score) as rnk
from schools s
cross join exam e
where s.capacity>=e.student_count
)
select 
s.school_id
,NVL(r.score,-1) as score
from schools s
left join res r
on s.school_id = r.school_id
and r.rnk =1
order by school_id
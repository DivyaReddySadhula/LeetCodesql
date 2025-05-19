/* Write your PL/SQL query statement below */
select
distinct title 
from Content c
left join TVProgram t
on c.content_id = t.content_id
where EXTRACT(YEAR FROM t.program_date)= 2020 and EXTRACT(MONTH FROM t.program_date) = 06
and c.kids_content = 'Y'
and c.content_type = 'Movies'
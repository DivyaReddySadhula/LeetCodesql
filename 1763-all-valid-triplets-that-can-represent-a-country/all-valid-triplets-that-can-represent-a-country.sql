/* Write your PL/SQL query statement below */
select member_A,member_B,member_C from (select 
a.student_id id_a
,a.student_name member_A
,b.student_id id_b
,b.student_name member_B
,c.student_id id_c
,c.student_name member_C
from 
SchoolA a
cross join SchoolB b
cross join SchoolC c
where a.student_id <>b.student_id AND
a.student_id<> c.student_id AND
b.student_id<>c.student_id AND
a.student_name <> b.student_name AND
a.student_name <> c.student_name AND
b.student_name <> c.student_name) t 



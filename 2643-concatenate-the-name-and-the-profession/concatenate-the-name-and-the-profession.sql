/* Write your PL/SQL query statement below */
select
person_id
,name||'('||SUBSTR(profession,1,1)||')' as name
from Person
order by person_id desc
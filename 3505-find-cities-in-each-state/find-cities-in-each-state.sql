/* Write your PL/SQL query statement below */
select
state
,LISTAGG(city,', ') WITHIN GROUP(ORDER BY state) as "cities"
from cities
group by state

/* Write your PL/SQL query statement below */
select
e1.symbol as metal
,e2.symbol as nonmetal
from Elements e1
cross join Elements e2
where e1.type = 'Metal' and e2.type = 'Nonmetal'
order by e2.symbol


/* Write your PL/SQL query statement below */
select
product_id
,name
from products
where REGEXP_LIKE(name, '(^|[^0-9])\d{3}([^0-9]|$)')
order by product_id asc
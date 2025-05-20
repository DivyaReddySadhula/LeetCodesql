/* Write your PL/SQL query statement below */
select
lower(trim(BOTH ' ' FROM product_name)) as product_name
,to_char(sale_date,'YYYY-MM') as sale_date
,count(sale_id) as total
from Sales
group by to_char(sale_date,'YYYY-MM'), lower(trim(BOTH ' ' FROM product_name))
order by product_name,sale_date


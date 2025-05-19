/* Write your PL/SQL query statement below */
select
to_char(sell_date) as sell_date
,count( product) as num_sold
,LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) as products
from 
(select distinct sell_date,product from Activities)
group by sell_date
order by sell_date

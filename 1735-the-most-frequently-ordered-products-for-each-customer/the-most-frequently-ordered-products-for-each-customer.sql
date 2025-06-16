/* Write your PL/SQL query statement below */
with res as 
(select
c.customer_id
,o.product_id
,p.product_name
,count(o.product_id)  as cnt
,DENSE_RANK() OVER (PARTITION BY c.customer_id ORDER BY COUNT(*) DESC) AS rnk
from orders o
join customers c
on c.customer_id = o.customer_id
join products p
on p.product_id = o.product_id
group by c.customer_id,o.product_id,p.product_name
order by c.customer_id
)select customer_id,product_id,product_name
from res where rnk = 1
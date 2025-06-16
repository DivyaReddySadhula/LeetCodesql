/* Write your PL/SQL query statement below */
with res as 
(select
p.product_name
,p.product_id
,o.order_id
,to_char(o.order_date,'YYYY-MM-DD') as order_date
,rank() over(partition by p.product_id order by o.order_date desc) as rnk
from Orders o
right  join products p
on p.product_id = o.product_id
join customers c
on o.customer_id = c.customer_id
order by p.product_name,p.product_id,o.order_id
) select  
product_name
,product_id
,order_id
,order_date
from res where rnk = 1
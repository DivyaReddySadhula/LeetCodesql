/* Write your PL/SQL query statement below */
with res as 
(select
c.name as customer_name
,c.customer_id
,o.order_id
,o.order_date
,row_number() over(partition by o.customer_id order by o.order_date desc) as rnk
from Customers c
join Orders o
on c.customer_id = o.customer_id
order by c.name,c.customer_id,o.order_date desc
)select customer_name,customer_id,order_id,to_char(order_date,'YYYY-MM-DD') as order_date from res where rnk<=3
-- select * from res

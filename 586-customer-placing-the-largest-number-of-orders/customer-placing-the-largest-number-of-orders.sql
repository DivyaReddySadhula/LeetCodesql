/* Write your PL/SQL query statement below */
with totalOrders as (
select customer_number
,count(order_number) over(partition by customer_number) as total_orders
from Orders
order by total_orders desc)
select distinct customer_number
from totalOrders
where rownum = 1;
-- fetch first 1 row only



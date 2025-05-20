/* Write your PL/SQL query statement below */
select
count(order_id) order_count
,count(distinct customer_id) customer_count
,to_char(order_date,'YYYY-MM') month
from Orders
where invoice >20 
group by to_char(order_date,'YYYY-MM') 


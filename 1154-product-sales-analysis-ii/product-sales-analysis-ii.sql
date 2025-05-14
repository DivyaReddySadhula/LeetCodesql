/* Write your PL/SQL query statement below */
select 
distinct product_id,sum(quantity) over(partition by product_id order by product_id) as total_quantity
from Sales

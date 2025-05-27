/* Write your PL/SQL query statement below */
with cte as 
(select
product_id
,year 
,quantity
,price
,rank() over(partition by product_id order by year asc) as rnk 
from Sales
)select product_id,year as first_year,quantity,price from cte where rnk =1

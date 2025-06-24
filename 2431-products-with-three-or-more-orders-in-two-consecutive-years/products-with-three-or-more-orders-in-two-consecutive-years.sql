/* Write your PL/SQL query statement below */
with order_years as 
(select 
product_id
,extract(year from purchase_date) as yr
,count(*) as cnt
from orders
group by product_id, extract(year from purchase_date)
),res as
(
        SELECT 
        o1.product_id
    FROM order_years o1
    JOIN order_years o2
      ON o1.product_id = o2.product_id
     AND o2.yr = o1.yr + 1
    WHERE o1.cnt >= 3 AND o2.cnt >= 3
)select distinct product_id from res


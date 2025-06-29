/* Write your PL/SQL query statement below */
with cte as 
(SELECT 
  FLOOR(((minute - 1) / 6) + 1) AS interval_no,
  SUM(order_count) AS total_orders_cnt
FROM Orders
GROUP BY ((minute - 1) / 6) + 1
ORDER BY interval_no;
)select interval_no, SUM(total_orders_cnt)  as total_orders
from cte
group by interval_no
order by interval_no

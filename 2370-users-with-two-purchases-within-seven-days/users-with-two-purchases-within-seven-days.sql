/* Write your PL/SQL query statement below */
with res as 
(select
distinct user_id
,count(purchase_id) over(partition by user_id order by purchase_date range between current row and  7 following) as cnt
from purchases
)select user_id from res where cnt>=2 order by user_id
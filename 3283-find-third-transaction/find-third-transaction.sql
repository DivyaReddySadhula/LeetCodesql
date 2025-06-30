/* Write your PL/SQL query statement below */
with cte as 
(select
user_id
,spend
,transaction_date
,rank() over(partition by user_id order by transaction_date asc) as rnk
from transactions
),third_txn AS (
    SELECT * FROM cte WHERE rnk = 3
),
first_second_txn AS (
    SELECT * FROM cte WHERE rnk IN (1, 2)
),
check_conditions AS (
    SELECT
        t.user_id,
        t.spend AS third_spend,
        MAX(f.spend) AS max_prev_spend
    FROM third_txn t
    JOIN first_second_txn f ON t.user_id = f.user_id
    GROUP BY t.user_id, t.spend
)
SELECT 
    t.user_id
    ,t.spend as third_transaction_spend
    ,t.transaction_date as third_transaction_date  
FROM third_txn t
JOIN check_conditions c 
  ON t.user_id = c.user_id AND t.spend > c.max_prev_spend;

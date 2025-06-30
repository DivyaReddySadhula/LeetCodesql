/* Write your PL/SQL query statement below */
WITH ranked_txns AS (
    SELECT
        user_id,
        spend,
        transaction_date,
        RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rnk,
        LAG(spend, 1) OVER (PARTITION BY user_id ORDER BY transaction_date) AS prev_spend_1,
        LAG(spend, 2) OVER (PARTITION BY user_id ORDER BY transaction_date) AS prev_spend_2
    FROM transactions
)
SELECT
    user_id,
    spend as third_transaction_spend,
    transaction_date as third_transaction_date
FROM ranked_txns
WHERE rnk = 3
  AND spend > prev_spend_1
  AND spend > prev_spend_2;


/* Write your PL/SQL query statement below */
--month,country(group by)-->cnt approved_transacs,total_amt,cnt chargebacks, total amount

WITH approved AS (
    SELECT 
        TO_CHAR(trans_date, 'YYYY-MM') AS month,
        country,
        COUNT(*) AS approved_count,
        SUM(amount) AS approved_amount
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country
),
chargeback AS (
    SELECT 
        TO_CHAR(c.trans_date, 'YYYY-MM') AS month,
        t.country,
        COUNT(*) AS chargeback_count,
        SUM(t.amount) AS chargeback_amount
    FROM Chargebacks c
    JOIN Transactions t ON c.trans_id = t.id
    GROUP BY TO_CHAR(c.trans_date, 'YYYY-MM'), t.country
)
SELECT 
    COALESCE(a.month, cb.month) AS month,
    COALESCE(a.country, cb.country) AS country,
    NVL(a.approved_count, 0) AS approved_count,
    NVL(a.approved_amount, 0) AS approved_amount,
    NVL(cb.chargeback_count, 0) AS chargeback_count,
    NVL(cb.chargeback_amount, 0) AS chargeback_amount
FROM approved a
FULL OUTER JOIN chargeback cb
ON a.month = cb.month AND a.country = cb.country
ORDER BY month, country;

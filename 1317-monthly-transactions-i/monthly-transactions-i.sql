/* Write your PL/SQL query statement below */
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(amount) AS trans_total_amount,
    NVL(COUNT(CASE WHEN state = 'approved' THEN id END),0) AS approved_count,
    NVL(SUM(CASE WHEN state = 'approved' THEN amount END),0) AS approved_total_amount
FROM transactions
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country
ORDER BY month, country;




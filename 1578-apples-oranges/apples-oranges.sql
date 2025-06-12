/* Write your PL/SQL query statement below */
SELECT
  to_char(sale_date,'YYYY-MM-DD') as sale_date,
  SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) -
  SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

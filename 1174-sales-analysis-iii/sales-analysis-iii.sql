/* Write your PL/SQL query statement below */
SELECT DISTINCT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN TO_DATE('2019-01-01', 'YYYY-MM-DD') AND TO_DATE('2019-03-31', 'YYYY-MM-DD')
  AND p.product_id NOT IN (
    SELECT s2.product_id
    FROM Sales s2
    WHERE s2.sale_date > TO_DATE('2019-03-31', 'YYYY-MM-DD') or s2.sale_date< TO_DATE('2019-01-01','YYYY-MM-DD')
);


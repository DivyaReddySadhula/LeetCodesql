/* Write your PL/SQL query statement below */
WITH totalpricemonthly AS (
    SELECT 
        o.customer_id,
        TO_CHAR(o.order_date, 'YYYY-MM') AS order_date,
        SUM(o.quantity * p.price) AS total
    FROM Orders o
    LEFT JOIN Product p ON o.product_id = p.product_id
    WHERE TO_CHAR(o.order_date, 'YYYY-MM') IN ('2020-06', '2020-07')
    GROUP BY o.customer_id, TO_CHAR(o.order_date, 'YYYY-MM')
),
qualified_customers AS (
    SELECT customer_id
    FROM totalpricemonthly
    WHERE total >= 100
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_date) = 2  
)
SELECT c.customer_id, c.name
FROM Customers c
JOIN qualified_customers qc ON c.customer_id = qc.customer_id;

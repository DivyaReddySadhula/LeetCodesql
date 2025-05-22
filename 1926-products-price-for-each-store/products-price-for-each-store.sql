/* Write your PL/SQL query statement below */
SELECT *
FROM (
    SELECT product_id, store, price
    FROM Products
)
PIVOT (
    SUM(price)
    FOR store IN ('store1' AS store1, 'store2' AS store2, 'store3' AS store3)
);


/* Write your PL/SQL query statement below */
SELECT product_id, product_name, description
FROM products
WHERE REGEXP_LIKE(description, '(^|[^0-9A-Za-z])SN[0-9]{4}-[0-9]{4}([^0-9]|$)')
ORDER BY product_id;



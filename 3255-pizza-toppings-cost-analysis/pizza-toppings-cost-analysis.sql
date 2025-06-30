/* Write your PL/SQL query statement below */
-- SELECT 
--   LISTAGG(t1.topping_name || ',' || t2.topping_name || ',' || t3.topping_name, '') AS pizza,
--   t1.cost + t2.cost + t3.cost AS total_cost
-- FROM toppings t1
-- JOIN toppings t2 ON t1.topping_name < t2.topping_name
-- JOIN toppings t3 ON t2.topping_name < t3.topping_name
-- GROUP BY 
--   t1.topping_name, t2.topping_name, t3.topping_name,
--   t1.cost, t2.cost, t3.cost
-- ORDER BY total_cost DESC;
with cte as 
(
    select 
    t1.topping_name as t1_topp,t2.topping_name as t2_topp,t3.topping_name as t3_topp
    ,t1.cost as t1_cost,t2.cost as t2_cost,t3.cost as t3_cost
    from toppings t1
    join toppings t2 on t1.topping_name<t2.topping_name
    join toppings t3 on t2.topping_name<t3.topping_name
)SELECT
    t1_topp || ',' || t2_topp || ',' || t3_topp AS pizza,
    ROUND(t1_cost + t2_cost + t3_cost, 2) AS total_cost
FROM cte
ORDER BY total_cost desc,pizza;

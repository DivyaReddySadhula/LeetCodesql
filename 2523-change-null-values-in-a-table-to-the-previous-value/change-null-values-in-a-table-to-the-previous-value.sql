/* Write your PL/SQL query statement below */
with cte as 
(select 
id,
drink, 
sum(case when drink is not null then 1 else 0 end) over(order by rownum) rn
from CoffeeShop
) select id, first_value(drink) over(partition by rn order by rownum) drink from cte
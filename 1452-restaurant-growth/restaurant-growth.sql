# Write your MySQL query statement below
-- select date(visited_on), round(avg(amount) over(order by date(visited_on) ROWS BETWEEN 6 preceding and CURRENT ROW  ),2) as average_amount from Customer
-- order by 1  
-- fetch NEXT 1 rows only;amount from cust
-- with tmp as (select visited_on,amount from customer)
-- select visited_on, sum(average_amount) as amount,round(sum(amount) over(order by (visited_on) ROWS BETWEEN 6 preceding and CURRENT ROW  ),2) as average_amount from tmp
-- group by visited_on
-- order  by visited_on
-- limit 10
-- -- offset 6 


with tmp as (
select visited_on, sum(amount) amount
from Customer
group by visited_on
order by visited_on ) 
select visited_on, sum(amount) over(order by (visited_on) ROWS BETWEEN 6 preceding and CURRENT ROW  )as amount,round(sum(amount) over(order by (visited_on) ROWS BETWEEN 6 preceding and CURRENT ROW  )/7 ,2)as average_amount from tmp
limit 100000 offset 6
/* Write your PL/SQL query statement below */
with cte as 
(select
stock_name
,operation
,sum(price) as ttl
from Stocks
group by stock_name,operation
)select 
stock_name
,sum(case when operation = 'Sell' then ttl else 0 end)- sum(case when operation = 'Buy' then ttl else 0 end) as capital_gain_loss  
from cte
group by stock_name
order by stock_name
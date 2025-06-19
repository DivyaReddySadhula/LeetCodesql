/* Write your PL/SQL query statement below */
with cte as (select
transaction_id
,to_char(cast(day as date),'YYYY-MM-DD')
,amount
,dense_rank() over(partition by to_char(cast(day as date),'YYYY-MM-DD') order by amount desc) as rnk
from transactions
) select transaction_id from cte where rnk = 1
order by transaction_id
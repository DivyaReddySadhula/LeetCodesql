/* Write your PL/SQL query statement below */
with cte as 
(select
purchase_date
,amount_spend
,trunc(purchase_date,'iw')+4 as fridays
from purchases
order by purchase_date
)select 
cast(to_char(purchase_date,'w') as number) as week_of_month
,to_char(purchase_date,'YYYY-MM-DD') as purchase_date
,sum(amount_spend) as total_amount
from cte
where purchase_date in (fridays)
group by purchase_date
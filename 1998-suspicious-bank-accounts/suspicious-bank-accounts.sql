/* Write your PL/SQL query statement below */
with total_income as 
(
    select 
    account_id
    ,extract(month from day) as tran_month
    ,sum(amount) as tot_amt
    from transactions 
    where type = 'Creditor'
    group by account_id,extract(month from day)
    order by account_id
), res as 
(
    select 
    a.account_id
    ,t.tran_month
    ,t.tot_amt
    ,row_number() over(partition by t.account_id order by t.tran_month) as rnk
    ,t.tran_month - row_number() over(partition by t.account_id order by t.tran_month) as gap
    from accounts a
    join total_income t
    on a.account_id = t.account_id
    where t.tot_amt>a.max_income
)select distinct account_id
from res 
group by account_id,gap
having count(*)>=2




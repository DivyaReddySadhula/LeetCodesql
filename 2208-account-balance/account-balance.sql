/* Write your PL/SQL query statement below */
select 
account_id
,to_char(day,'YYYY-MM-DD') as day
,SUM(case when type = 'Deposit' then amount
when type = 'Withdraw' then -amount
else 0 end) over(partition by account_id order by account_id,day rows between unbounded preceding and current row)as balance
from transactions

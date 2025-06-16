/* Write your PL/SQL query statement below */
with spend as 
(
    select
     u.user_id
    ,u.user_name
    ,u.credit
    ,NVL(SUM(t.amount),0) as spendings
    from Users u
    left join transactions t
    on u.user_id = t.paid_by
    group by u.user_id,u.user_name,u.credit
)
,earned as 
(
    select 
    s.user_id
    ,s.user_name
    ,s.credit
    ,NVL(SUM(t.amount),0) as earnings
    from spend s
    left join transactions t
    on s.user_id = t.paid_to
    group by s.user_id,s.user_name,s.credit
)select 
s.user_id
,s.user_name
,(e.earnings+s.credit-s.spendings) as credit 
,case when (e.earnings+s.credit-s.spendings)<0 then 'Yes'
else 'No'
end as credit_limit_breached
from spend s 
join earned e 
on s.user_id = e.user_id 



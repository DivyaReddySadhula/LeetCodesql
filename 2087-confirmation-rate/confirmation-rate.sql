/* Write your PL/SQL query statement below */
-- select
-- distinct s.user_id
-- ,NVL(ROUND((select count(*) from Confirmations where action = 'confirmed' group by user_id)/(select count(*) from Confirmations group by user_id),2),0) as confirmation_rate
-- from Signups s
-- left join confirmations c
-- on s.user_id = c.user_id

with totalRequests as 
(select 
user_id
,count(action)  as tot_req
from confirmations
group by user_id
), confirmationRequests as
(
    select 
    user_id
    ,NVL(count(user_id),0) as confirm_req
    from confirmations
    where action = 'confirmed'
    group by user_id
), confirmedRate as 
(
    select
    t.user_id 
    ,NVL(round(confirm_req/tot_req,2),0) as confirmation_rate
    from totalRequests t
    left join confirmationRequests c
    on t.user_id = c.user_id
)select 
s.user_id
,NVL(cr.confirmation_rate,0) as confirmation_rate
 from signups s
 left join confirmedRate cr
 on s.user_id = cr.user_id

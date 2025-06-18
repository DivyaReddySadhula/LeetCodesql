/* Write your PL/SQL query statement below */
select
distinct a.account_id
from LogInfo a
join LogInfo b
on a.account_id = b.account_id
and a.ip_address<>b.ip_address
and to_char(cast(a.login as date),'YYYY-MM-DD') = to_char(cast(b.login as date),'YYYY-MM-DD')
and a.login<=b.logout
and b.login<=a.logout
-- and to_char(cast(a.login as date),'YYYY-MM-DD') < to_char(cast(b.logout as date),'YYYY-MM-DD')
-- and to_char(cast(b.login as date),'YYYY-MM-DD') < to_char(cast(a.logout as date),'YYYY-MM-DD')


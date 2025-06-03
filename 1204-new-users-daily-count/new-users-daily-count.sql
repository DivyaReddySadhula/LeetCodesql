-- /* Write your PL/SQL query statement below */
with firstlogin as (select
user_id 
,min(activity_date) as first_login
from Traffic
where activity = 'login' 
group by user_id)
select to_char(first_login) as login_date, count(user_id) as user_count
from firstlogin
where first_login between to_date('2019-04-01','yyyy-mm-dd') and to_date('2019-06-30','yyyy-mm-dd')
group by first_login
order by first_login




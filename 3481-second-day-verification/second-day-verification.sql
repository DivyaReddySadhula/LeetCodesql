/* Write your PL/SQL query statement below */
select
e.user_id
from emails e
join texts t
on e.email_id = t.email_id
where t.signup_action = 'Verified' and trunc(t.action_date) = trunc(e.signup_date) +1
order by e.user_id asc


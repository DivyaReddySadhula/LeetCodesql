/* Write your PL/SQL query statement below */
with uniqLogins as 
(
    select distinct login_date,id from Logins
),res as 
(select
a.id as id
,a.name as name
,u.login_date
,row_number() over(partition by a.id order by u.login_date) as rnk
,u.login_date - ROW_NUMBER() OVER (PARTITION BY a.id ORDER BY u.login_date) AS gap
from Accounts a
join uniqLogins u
on a.id = u.id
),consec as 
(
    select
    id
    ,name
    ,gap
    ,count(*) as cnt
    from res
    group by id,name,gap
    having count(*)>=5
)select distinct id,name from consec order by id



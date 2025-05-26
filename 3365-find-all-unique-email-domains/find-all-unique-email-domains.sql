/* Write your PL/SQL query statement below */
select
SUBSTR(email,INSTR(email,'@')+1) as email_domain
,count(id) as count
from Emails
where SUBSTR(email,INSTR(email,'.',-1)) ='.com'
group by SUBSTR(email,INSTR(email,'@')+1)
order by email_domain asc
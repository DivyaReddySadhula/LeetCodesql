/* Write your PL/SQL query statement below */
select
user_id
from Loans
group by user_id
having count(distinct case when loan_type = 'Refinance' then loan_type END)>0 AND
count(distinct case when loan_type = 'Mortgage' then loan_type END)>0
order by user_id

/* Write your PL/SQL query statement below */
with res as 
(select
user_id
,gender
,row_number() over(partition by gender order by user_id) as rnk
,case when gender = 'female' then 1
    when gender = 'other' then 2
    when gender = 'male' then 3
    end as gender_rank
from genders
)select user_id,gender
from res
order by rnk,gender_rank
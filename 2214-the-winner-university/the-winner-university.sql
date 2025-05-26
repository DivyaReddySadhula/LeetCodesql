/* Write your PL/SQL query statement below */
with nyu as 
(
    select count(student_id) as nycnt
    from newyork
    where score>=90
),cu as (
    select count(student_id) as ccnt
    from california
    where score>=90
)
select
case when nycnt>ccnt then 'New York University'
when ccnt>nycnt then 'California University'
else 'No Winner'
end as winner
from nyu,cu

/* Write your PL/SQL query statement below */
with result as (select
class,
count(student) over(partition by class order by class) cnt
from Courses)
select distinct class
from result
where cnt>=5

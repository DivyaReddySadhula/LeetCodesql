/* Write your PL/SQL query statement below */
select
count(distinct customer_id) as rich_count
from store
where amount>500

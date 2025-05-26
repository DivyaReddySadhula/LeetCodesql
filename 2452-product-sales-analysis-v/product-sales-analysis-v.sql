/* Write your PL/SQL query statement below */
select
s.user_id
, SUM(s.quantity *p.price) AS spending
from Sales s
left join Product p
on s.product_id = p.product_id
group by s.user_id
order by SUM(s.quantity *p.price) desc,user_id asc
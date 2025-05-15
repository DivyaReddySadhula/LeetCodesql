/* Write your PL/SQL query statement below */
with res as (
select
seller_id
,sum(price) as total_sales
,rank() over(order by sum(price) desc) rnk
from Sales s
join Product p
on s.product_id = p.product_id
group by seller_id
)
select seller_id from res
where rnk =1

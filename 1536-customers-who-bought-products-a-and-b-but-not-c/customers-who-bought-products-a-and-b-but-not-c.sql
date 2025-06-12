/* Write your PL/SQL query statement below */
select
c.customer_id
,c.customer_name
from Customers c
join Orders o
on c.customer_id = o.customer_id
where o.product_name IN('A','B','C') 
group by c.customer_id,c.customer_name
having count(distinct case when o.product_name IN ('A','B') then o.product_name END) = 2
and count(distinct case when o.product_name = 'C' then o.product_name END)= 0
order by c.customer_id
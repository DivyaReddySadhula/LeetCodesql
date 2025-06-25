/* Write your PL/SQL query statement below */
select
sp.salesperson_id
,sp.name
,coalesce(sum(s.price),0) as total
from salesperson sp
left join customer c
on sp.salesperson_id = c.salesperson_id
left join sales s
on c.customer_id = s.customer_id
group by sp.salesperson_id,sp.name
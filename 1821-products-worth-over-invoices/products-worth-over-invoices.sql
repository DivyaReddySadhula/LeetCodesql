/* Write your PL/SQL query statement below */
select name, NVL(sum(rest),0) rest,NVL(sum(paid),0) paid,NVL(sum(canceled),0) canceled,NVL(sum(refunded),0) refunded from (select
p.name
,i.rest
,i.paid
,i.canceled
,i.refunded
from Product p
left join Invoice i
on p.product_id = i.product_id)t 
group by name
order by name
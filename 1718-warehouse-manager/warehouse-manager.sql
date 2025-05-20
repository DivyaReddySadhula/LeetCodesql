/* Write your PL/SQL query statement below */
select
w.name as warehouse_name
,sum((p.width*p.length*p.height)*w.units) as volume
from Warehouse w
left join Products p
on w.product_id = p.product_id
group by w.name
select
s.name
from SalesPerson s
where s.sales_id NOT IN (
select o.sales_id
from Orders o
left join Company c
on o.com_id = c.com_id
where c.name = 'RED' 
) 
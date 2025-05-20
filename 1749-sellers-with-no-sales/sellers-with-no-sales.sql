/* Write your PL/SQL query statement below */
select
s.seller_name
from Seller s
left join Orders o
on s.seller_id = o.seller_id and to_char(sale_date,'YYYY') = 2020
where o.sale_date is null
order by seller_name
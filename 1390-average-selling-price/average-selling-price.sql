/* Write your PL/SQL query statement below */
select 
p.product_id
,round(coalesce(nullif(sum(u.units*p.price),0)/nullif(sum(u.units),0),0),2) as average_price
from Prices p
left join UnitsSold u
on p.product_id = u.product_id
and u.purchase_date between p.start_date and p.end_date
group by p.product_id

/* Write your PL/SQL query statement below */
with orders as 
(select order_date
,count(case when order_date = customer_pref_delivery_date then 1  end) as immediateOrders
,count(case when order_date!=customer_pref_delivery_date then 1  end) as scheduledOrders
from delivery
group by order_date
)
select 
distinct to_char(d.order_date,'YYYY-MM-DD') as order_date,
NVL(round(o.immediateOrders*100/(o.immediateOrders+o.scheduledOrders),2),0) as immediate_percentage
from delivery d
left join orders o
on d.order_date = o.order_date
order by order_date
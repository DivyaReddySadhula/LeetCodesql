/* Write your PL/SQL query statement below */
with firstorders as 
(
    select
    customer_id 
    ,row_number() over(partition by customer_id order by order_date) as rnk
    ,order_date
    ,customer_pref_delivery_date
    from Delivery
),firstImmediateOrders as 
(select count(*) as cntimmediate 
from firstorders 
where rnk = 1 
and order_date = customer_pref_delivery_date)
,firstOrdersCount as 
(
    select
    count(*) as cntfirst
    from firstorders 
where rnk = 1 
)select round(cntimmediate*100/cntfirst,2) as immediate_percentage
from firstImmediateOrders,firstOrdersCount
/* Write your PL/SQL query statement below */
with res as 
(select
order_id
,product_id
,max(quantity) over(partition by order_id order by order_id) as max_qty
,sum(quantity) over(partition by order_id order by order_id)as tot_sum
,count(product_id) over(partition by order_id order by order_id) as products_cnt
from OrdersDetails
), imbalancedOrder as 
(
    select 
    order_id
    ,max_qty
    ,tot_sum/products_cnt as avg_qty
    from res
)
select i1.order_id
from imbalancedOrder i1
cross join imbalancedOrder i2
group by i1.order_id, i1.max_qty
having MIN(i2.avg_qty) > 0 AND i1.max_qty > MAX(i2.avg_qty);



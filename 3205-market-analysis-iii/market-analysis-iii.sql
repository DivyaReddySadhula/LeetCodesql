/* Write your PL/SQL query statement below */
with non_fav_items as 
(select
o.seller_id
,i.item_id
from orders o
join users u on u.seller_id = o.seller_id 
join items i on o.item_id = i.item_id 
where u.favorite_brand!=i.item_brand
), unique_items as
(
    select distinct seller_id,  item_id
    from non_fav_items
),seller_item_counts as 
(select seller_id
,count(item_id) as num_items
 from unique_items
 group by seller_id
),top_seller as 
(
    select max(num_items) as max_items from seller_item_counts
)select s.seller_id
,s.num_items
from seller_item_counts s
join top_seller t
on s.num_items = t.max_items
order by s.seller_id

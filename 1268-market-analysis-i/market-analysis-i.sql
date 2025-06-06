/* Write your PL/SQL query statement below */
/*find for each user, the join date and no of orders they made as a buyer in 2019*/
select
u.user_id as buyer_id
,to_char(u.join_date,'YYYY-MM-DD') as join_date
,NVL(count(order_id),0) as orders_in_2019
from Users u
left join Orders o
on u.user_id = o.buyer_id
AND  TO_CHAR(o.order_date, 'YYYY') = '2019'
group by u.user_id,u.join_date



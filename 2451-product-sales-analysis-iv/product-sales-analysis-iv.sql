/* Write your PL/SQL query statement below */
with cte as 
(
    select 
    s.user_id
    ,s.product_id
    ,sum(s.quantity*p.price) over(partition by s.user_id,s.product_id order by (s.quantity*p.price) desc)as total_sum
    from sales s
    join product p
    on s.product_id = p.product_id
), ranking as (
    select user_id
    ,product_id
    ,dense_rank() over(partition by user_id order by total_sum desc) as rnk
    from cte
)select distinct user_id
,product_id
 from ranking
 where rnk = 1
/* Write your PL/SQL query statement below */
with cte as
(
    select x
    ,y
    ,row_number() over(order by x,y) as rwnum
    from coordinates
),cte1 as 
(
    select
    a.x as x1
    ,a.y as y1
    ,b.x as x2
    ,b.y as y2
    from cte a
    join cte b
    on a.x = b.y and a.y = b.x and a.rwnum<>b.rwnum
)select distinct x1 as x,y1 as y
 from cte1
 where x1<=y1
 order by x1,y1
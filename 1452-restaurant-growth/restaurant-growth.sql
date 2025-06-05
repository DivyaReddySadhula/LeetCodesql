/* Write your PL/SQL query statement below */
with dailysum as 
(
    select 
    distinct visited_on
    ,sum(amount) as ttlsum
    from Customer
    group by visited_on
    order by visited_on
)
,movingsum as 
(
    select
    visited_on
    ,sum(ttlsum) over(order by  visited_on rows between 6 preceding and current row) as movingttlsum
    ,  ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    from dailysum
)select to_char(visited_on) as visited_on,movingttlsum as amount, round(movingttlsum/7,2) as average_amount from movingsum  
where rn>=7



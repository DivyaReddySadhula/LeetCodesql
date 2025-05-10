/* Write your PL/SQL query statement below */
with result as(
    select id
    ,recordDate
    ,temperature
    ,lag(temperature) over(order by recordDate) as yesterday_temp
    ,lag(recordDate) over(order by recordDate) as prev_day
    from
    Weather
)select id  
from result
where recordDate = prev_day+1
and temperature>yesterday_temp


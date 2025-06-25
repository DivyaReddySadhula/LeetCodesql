/* Write your PL/SQL query statement below */
with maxDegree as 
(select
city_id
,to_char(day,'YYYY-MM-DD') as day
,degree
,dense_rank() over(partition by city_id order by degree desc,day asc) as rnk
from weather
)select city_id,day,degree from maxDegree where rnk =1

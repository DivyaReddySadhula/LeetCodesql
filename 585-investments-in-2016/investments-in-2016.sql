/* Write your PL/SQL query statement below */
with cte as (select
pid
,TIV_2015
,TIV_2016
,count(concat(lat,lon)) over(partition by concat(lat,lon))as cnt1,count(TIV_2015) over(partition by TIV_2015) as cnt2
from insurance) select round(sum(tiv_2016),2) as tiv_2016 from cte where cnt1 = 1 and cnt2!=1
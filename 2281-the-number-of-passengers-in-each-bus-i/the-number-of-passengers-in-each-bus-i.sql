/* Write your PL/SQL query statement below */
with arrivals as 
(select
b.bus_id
,b.arrival_time
,p.arrival_time
,row_number() over(partition by p.passenger_id order by b.arrival_time) as rnk
,p.passenger_id
from buses b
left join passengers p
on p.arrival_time<=b.arrival_time
), firstBoard as 
(
    select bus_id, passenger_id from arrivals where rnk =1
)select b.bus_id
,count(fb.passenger_id) as passengers_cnt
from buses b
left join firstBoard fb
on b.bus_id = fb.bus_id
group by b.bus_id
order by b.bus_id
/* Write your PL/SQL query statement below */
with airports as 
(select
departure_airport as airport_id
,flights_count
from flights
union all
select
arrival_airport as airport_id
,flights_count
from flights
),traffic as 
(select 
airport_id,
sum(flights_count) as flights
from airports
group by airport_id
), ranking as 
(
    select airport_id,dense_rank() over(order by flights desc) as rnk
    from traffic
)select airport_id from ranking where rnk =1 
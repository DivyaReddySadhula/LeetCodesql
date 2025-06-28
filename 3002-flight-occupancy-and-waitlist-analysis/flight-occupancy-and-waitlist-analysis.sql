/* Write your PL/SQL query statement below */
with runningbalance as 
(
    select
    f.flight_id
    ,count(p.passenger_id) as totcnt
    from flights f
    left join passengers p
    on f.flight_id = p.flight_id
    group by f.flight_id
)select 
f.flight_id
,    CASE 
        WHEN r.totcnt <= f.capacity THEN r.totcnt 
        ELSE f.capacity 
    END AS booked_cnt
,NVL(GREATEST(r.totcnt - f.capacity, 0),0) as waitlist_cnt
from flights f
left join runningbalance r
on f.flight_id = r.flight_id
order by f.flight_id 
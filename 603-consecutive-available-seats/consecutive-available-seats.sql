-- /* Write your PL/SQL query statement below */
-- select seat_id from 
-- (select seat_id
-- ,free
-- ,lag(seat_id) over(order by seat_id) prev_seat
-- from Cinema)
-- where seat_id = nvl(prev_seat,0)+1 and free = '1'

with available as (select seat_id
,row_number() over(order by seat_id) as rnk
,(seat_id- row_number() over(order  by seat_id)) as gaps
,free
from Cinema
where free = '1')
,abc as (
    select 
    seat_id
    -- ,gaps
    -- ,rnk
    -- ,free
    ,count(seat_id) over(partition by gaps) as gap_cnt
    from available
)select seat_id from abc
where gap_cnt>1
order by seat_id
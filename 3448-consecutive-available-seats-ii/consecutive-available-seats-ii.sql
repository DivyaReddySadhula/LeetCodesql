/* Write your PL/SQL query statement below */
with cte as 
(
    select
    seat_id
    ,(seat_id - row_number() over(order by seat_id)) as gaps
    from cinema
    where free = 1
),cte2 as
(
    select
    seat_id
    ,gaps
    from cte
),cte3 as
(
    select min(seat_id) as first_seat_id
    ,max(seat_id) as last_seat_id
    ,(max(seat_id)-min(seat_id)+1) as consecutive_seats_len
    ,rank() over(order by (max(seat_id)-min(seat_id)+1) desc) as rnk
    from cte2
    group by gaps
)select first_seat_id,last_seat_id,consecutive_seats_len
 from cte3
 where rnk =1
 order by first_seat_id

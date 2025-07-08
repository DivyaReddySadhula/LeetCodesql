/* Write your PL/SQL query statement below */
with cte as (
    select
car_id
,lot_id
,sum(fee_paid) over(partition by car_id order by car_id) as total_fee_paid
,sum((exit_time-entry_time)*24) over(partition by car_id order by car_id) as total_hrs
,sum((exit_time-entry_time)) over(partition by car_id,lot_id order by car_id desc) as total_time_lot
from ParkingTransactions
),cte1 as 
(
    select 
    car_id,lot_id,total_fee_paid,round(total_fee_paid/total_hrs,2) as avg_hourly_fee
    ,rank() over(partition by car_id order by total_time_lot desc) as rnk
    from cte
)
select distinct car_id
,total_fee_paid
,avg_hourly_fee
,lot_id as most_time_lot
from cte1 
where rnk = 1
order by car_id
/* Write your PL/SQL query statement below */
with noOfCalls as
(
    select
    case when from_id<to_id then from_id else to_id end as person1,
    case when from_id<to_id then to_id else from_id end as person2,
    duration
    from calls
)select
person1,person2,count(*) as call_count,sum(duration) as total_duration
from noOfCalls
group by person1,person2
order by person1
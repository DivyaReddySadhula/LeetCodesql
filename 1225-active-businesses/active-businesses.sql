/* Write your PL/SQL query statement below */
with avgActivity as
(
    select
    event_type
    ,avg(occurrences)  as avgOccur
    from Events
    group by event_type
),
activityBusiness as
(
    select 
     e.business_id
    ,e.event_type
    from Events e
    join avgActivity a
    on a.event_type = e.event_type
    where e.occurrences > a.avgOccur
)SELECT business_id
FROM activityBusiness
GROUP BY business_id
HAVING COUNT(DISTINCT event_type) > 1
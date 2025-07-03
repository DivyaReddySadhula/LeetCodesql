/* Write your PL/SQL query statement below */
with activity_with_age as
(
    select
    a.user_id
    ,ag.age_bucket
    ,a.activity_type
    ,a.time_spent
    from activities a
    join age ag on a.user_id = ag.user_id
), agg_activity as 
(
    select
    age_bucket
    ,activity_type
    ,sum(time_spent) as activity_time
    from activity_with_age
    group by age_bucket,activity_type
),tot_time as
(
    select 
    age_bucket
    ,sum(activity_time) as total_time
    from agg_activity
    group by age_bucket
)SELECT 
    t.age_bucket,
    ROUND(CASE WHEN s.activity_time IS NOT NULL THEN s.activity_time * 100 / t.total_time ELSE 0 END, 2) AS send_perc,
    ROUND(CASE WHEN o.activity_time IS NOT NULL THEN o.activity_time * 100 / t.total_time ELSE 0 END, 2) AS open_perc
FROM tot_time t
LEFT JOIN agg_activity s 
    ON t.age_bucket = s.age_bucket AND s.activity_type = 'send'
LEFT JOIN agg_activity o 
    ON t.age_bucket = o.age_bucket AND o.activity_type = 'open';
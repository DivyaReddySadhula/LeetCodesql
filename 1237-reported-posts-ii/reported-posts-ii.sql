/* Write your PL/SQL query statement below */
with spam_posts as
(
    select distinct action_date,post_id from Actions
    where action = 'report' and extra = 'spam'
)
,daily_spams as 
(
    select
    s.action_date
    ,count(*) as total_posts
    ,count(r.post_id) as removed_posts
    from spam_posts s
    left join removals r
    on s.post_id = r.post_id
    group by s.action_date
)
,daily_percentage as
(
    select 
    action_date
    ,round(removed_posts*100/ total_posts,2) as daily_percent
    from daily_spams
)
select round(avg(daily_percent),2) as average_daily_percent from daily_percentage
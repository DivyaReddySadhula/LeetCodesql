/* Write your PL/SQL query statement below */
with qualitytmp as 
(
    select 
    query_name
    ,round(avg(rating/position),2)  as quality
    from Queries
    group by query_name
    order by query_name
),poorpercent as 
(
    select query_name
    , round((count(case when rating<3 then 1 end)/count(*))*100,2) as poor
    from Queries
    group by query_name
    order by query_name
)
select q.query_name,q.quality,p.poor as poor_query_percentage from poorpercent p
join qualitytmp q
on p.query_name = q.query_name



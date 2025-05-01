/* Write your PL/SQL query statement below */
with tmp as (
    select mr.user_id, u.name,count(mr.movie_id) as count_movies_max
    from MovieRating mr
    join  Users u
    on mr.user_id = u.user_id
    group by mr.user_id, u.name
    order by u.name asc   
    ) 
,tmp1 as(
    select avg(rating) as avg_rating,mr.movie_id,m.title 
    from MovieRating mr
    join  Movies m
    on mr.movie_id = m.movie_id 
    where to_char(created_at,'YYYYMM') = '202002'
    group by mr.movie_id, m.title
    order by m.title asc
)
select u.name results from tmp t
    join Users u on t.user_id = u.user_id where count_movies_max = (select max(count_movies_max) from tmp) and rownum =1 
union all
select m.title  from tmp1 t1 
join Movies m  on m.movie_id = t1.movie_id where avg_rating = (select max(avg_rating) from tmp1) and rownum = 1


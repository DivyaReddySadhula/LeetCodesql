# Write your MySQL query statement below
with temp as(
    select 
    id,
    LAG(people) OVER(ORDER BY id asc) as prev_id_1,
    LEAD(people) OVER(ORDER BY id asc) as next_id_1,
    LAG(people,2) OVER(ORDER BY id asc) as prev_id_2,
    LEAD(people,2) OVER(ORDER BY id asc) as next_id_2,
    visit_date,
    people
    from Stadium

)
select id,visit_date,people from temp
        where (people>=100 and prev_id_1>=100 and next_id_1>=100) OR
           (people>=100 and prev_id_1>=100 and prev_id_2>=100) OR
           (people>=100 and next_id_1>=100 and next_id_2>=100 ) 
order by visit_date asc
-- select * from temp

# Write your MySQL query statement below
    select id,
    CASE when p_id IS NULL THEN 'Root'
    when id in (select distinct p_id from tree ) then 'Inner'
    ELSE 'Leaf'
    END AS 'Type'
    from tree 


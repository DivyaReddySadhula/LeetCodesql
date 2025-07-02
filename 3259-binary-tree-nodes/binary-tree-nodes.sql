/* Write your PL/SQL query statement below */
with root_level as
(
    select N, 'Root' as type
    from tree 
    where P is null
),leaf_level as 
(
SELECT
  N,
  'Leaf' AS type
FROM tree
WHERE N IS NOT NULL 
  AND N NOT IN (SELECT DISTINCT P FROM tree where P is not null)
  AND N NOT IN (SELECT N FROM root_level) 
),inner_level as
(
    select N,'Inner' as type from tree 
    where N in (select distinct P from tree where P is not null)
     AND N NOT IN (SELECT N FROM root_level)  
)
select N,type from root_level
union 
select N,type from inner_level
union
select N,type from leaf_level
order by N,type 
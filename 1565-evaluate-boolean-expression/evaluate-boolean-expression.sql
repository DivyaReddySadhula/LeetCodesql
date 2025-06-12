/* Write your PL/SQL query statement below */
select
e.left_operand
,e.operator
,e.right_operand
,case 
    when operator = '>' then (case when (a.value >b.value) then 'true' else 'false' end)
    when operator = '<' then (case when (a.value <b.value) then 'true' else 'false' end)
    when operator = '=' then (case when (a.value = b.value) then 'true' else 'false' end)
end value
from expressions e
join variables a on e.left_operand = a.name
join variables b on e.right_operand = b.name   
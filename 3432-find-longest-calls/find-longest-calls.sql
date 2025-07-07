/* Write your PL/SQL query statement below */
select
con.first_name
,ranked_calls.type
,to_char(to_date(ranked_calls.duration,'sssss'),'hh24:mi:ss') as duration_formatted
from
(
    select
    ca.contact_id
    ,ca.type
    ,ca.duration
    ,row_number() over(partition by ca.type order by to_char(to_date(ca.duration,'sssss'),'hh24:mi:ss') desc) as rnk
    from calls ca
    where ca.type IN ('incoming','outgoing')
)ranked_calls
join contacts con
on con.id = ranked_calls.contact_id
where ranked_calls.rnk<=3
order by ranked_calls.type desc ,duration_formatted desc,first_name desc
/* Write your PL/SQL query statement below */
with reqSubs as 
(
    select
    account_id
    ,start_date
    ,end_date
    from subscriptions where extract(year from start_date) = 2021 or  extract(year from end_date) = 2021 
)
select
count(*) as accounts_count
from reqSubs s
join streams st
on s.account_id = st.account_id
where st.stream_date<=s.end_date and extract(year from st.stream_date) != 2021

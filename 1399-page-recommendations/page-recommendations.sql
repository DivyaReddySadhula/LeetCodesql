/* Write your PL/SQL query statement below */
with cte as 
(select
case when user1_id = 1 then user2_id
else user1_id
end as friend_id
from Friendship
where 1 IN(user1_id,user2_id)
),cte1 as
(select distinct page_id ,user_id
from Likes
where page_id not in(select page_id from likes where user_id = 1) )
select distinct page_id as recommended_page
from cte1
join cte
on cte.friend_id = cte1.user_id

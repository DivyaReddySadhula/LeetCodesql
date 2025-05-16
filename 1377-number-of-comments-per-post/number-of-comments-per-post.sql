/* Write your PL/SQL query statement below */
select  post.sub_id as post_id
,count(distinct s.sub_id) as number_of_comments
 from  (select 
distinct sub_id
from Submissions 
where parent_id IS NULL) post
left join Submissions s on s.parent_id = post.sub_id
group by post.sub_id
order by post.sub_id 

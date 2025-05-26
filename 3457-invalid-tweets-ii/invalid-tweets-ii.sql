/* Write your PL/SQL query statement below */
select tweet_id
from Tweets
where 
length(content)>140 OR
(length(content) - length(replace(content,'@','')))>3 OR
(length(content) - length(replace(content,'#','')))>3
order by tweet_id


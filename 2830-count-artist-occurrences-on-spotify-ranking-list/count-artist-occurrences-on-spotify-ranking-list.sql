/* Write your PL/SQL query statement below */
select
artist
, count(artist) as occurrences
from Spotify
group by artist
order by count(artist) desc,artist asc
/* Write your PL/SQL query statement below */
with totalClicks as (
select ad_id
,count(*)  as clicks
from Ads
where action= 'Clicked'
group by ad_id
), totalViews as (
select ad_id
,count(*)  as views
from Ads
where action= 'Viewed'
group by ad_id
), AllAds as (
select
distinct ad_id
from Ads 
)select
a.ad_id
,ROUND(
    CASE WHEN coalesce(tc.clicks,0)+coalesce(tv.views,0) =0 then 0
    ELSE (COALESCE(tc.clicks,0)*1.0/ (COALESCE(tc.clicks,0)+Coalesce(tv.views,0))*100)
    end ,2
)ctr 
from AllAds a
left join totalClicks tc 
on a.ad_id = tc.ad_id
left join totalViews tv
on a.ad_id = tv.ad_id
order by 
ctr desc,a.ad_id asc




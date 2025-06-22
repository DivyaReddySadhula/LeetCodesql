/* Write your PL/SQL query statement below */
with allExperiments as 
(
    select 'Reading' as experiment_name from dual
    union all
    select 'Programming' from dual
    union all
    select 'Sports' from dual
), allPlatforms as 
(
    select 'Android' as platform from dual
    union all
    select 'IOS' from dual
    union all
    select 'Web' from dual
),allCombinations as 
(
    select 
    ae.experiment_name,ap.platform
    from allExperiments ae
    cross join allPlatforms ap
)
select
ac.platform
,ac.experiment_name
,NVL(count(e.experiment_id),0) as num_experiments
from allCombinations ac
left join  experiments  e
on e.platform = ac.platform and e.experiment_name = ac.experiment_name 
group by ac.platform,ac.experiment_name

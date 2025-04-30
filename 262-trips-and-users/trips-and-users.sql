# Write your MySQL query statement below

WITH  
TotalCancelledRequestsByUnbannedUsers AS(
    select t.request_at as Day, count(*) as TotalRequestsByBannedUsers
    from trips t
    join users u1 on (t.client_id = u1.users_id and u1.banned = 'No')
    join users u2 on (t.driver_id = u2.users_id and u2.banned = 'No')
    where t.status!= 'Completed'
    and t.request_at between '2013-10-01' and '2013-10-03'
    group by t.request_at
),
TotalNumberOfRequestsByUnbannedUsers AS(
    select t.request_at as Day,count(*) as TotalRequestsByUnbanned
    from trips t
    join users u1 on (t.client_id = u1.users_id and u1.banned = 'No')
    join users u2 on (t.driver_id = u2.users_id and u2.banned = 'No')
    where t.request_at between '2013-10-01' and '2013-10-03'
    group by t.request_at
)
SELECT totalUBR.Day, IFNULL(ROUND((totalCUBR.TotalRequestsByBannedUsers/totalUBR.TotalRequestsByUnbanned),2),0) as 'Cancellation Rate'
FROM TotalNumberOfRequestsByUnbannedUsers totalUBR
left JOIN  TotalCancelledRequestsByUnbannedUsers totalCUBR
ON totalUBR.Day = totalCUBR.Day
-- select * from TotalNumberOfRequestsByUnbannedUsers

-- with Tmp_TotalCancelUnbanned as (
--     select t.request_at Day, count(t.status) cnt from trips t join users u1  on t.client_id = u1.users_id
--     join users u2 on t.driver_id = u2.users_id
--     where u1.banned = 'No' and t.status != 'completed'
--     and t.request_at between '2013-10-01' and '2013-10-03'
--     group by t.request_at
-- ),Tmp_TotalRequestsUnbanned as (
--     select t.request_at Day, count(t.status) cnt from trips t join users u1  on t.client_id = u1.users_id
--     join users u2 on t.driver_id = u2.users_id and u2.banned = 'No'
--     where u1.banned = 'No' --and t.status != 'completed'
--     and t.request_at between '2013-10-01' and '2013-10-03'
--     group by t.request_at
-- )
-- select Tmp_TotalRequestsUnbanned.Day as Day, NVL(Round(Tmp_TotalCancelUnbanned.cnt/Tmp_TotalRequestsUnbanned.cnt,2),0) as "Cancellation Rate"
-- from Tmp_TotalRequestsUnbanned left join Tmp_TotalCancelUnbanned on Tmp_TotalRequestsUnbanned.Day = Tmp_TotalCancelUnbanned.Day



 
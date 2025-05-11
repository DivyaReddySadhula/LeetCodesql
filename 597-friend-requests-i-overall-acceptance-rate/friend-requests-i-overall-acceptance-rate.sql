/* Write your PL/SQL query statement below */
WITH acptRequests AS (
    SELECT COUNT(*) AS acptCount
    FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted)
),
totalRequests AS (
    SELECT COUNT(*) AS totalCount
    FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest)
)
SELECT 
    CASE 
        WHEN totalRequests.totalCount = 0 THEN 0
        ELSE ROUND(acptRequests.acptCount / totalRequests.totalCount, 2)
    END AS accept_rate
FROM acptRequests, totalRequests;

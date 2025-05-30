CREATE FUNCTION getUserIDs(startDate IN DATE, endDate IN DATE, minAmount IN NUMBER)
RETURN SYS_REFCURSOR IS result SYS_REFCURSOR;
BEGIN
    /* Write your PL/SQL query statement below */
    open result for 
    select
    distinct user_id 
    from Purchases
    where time_stamp between startDate and endDate
    and amount>=minAmount
    order by user_id;
    RETURN result;
END;
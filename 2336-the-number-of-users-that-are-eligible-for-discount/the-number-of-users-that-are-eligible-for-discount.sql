CREATE FUNCTION getUserIDs(startDate IN DATE, endDate IN DATE, minAmount IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    SELECT COUNT(DISTINCT user_id)
    INTO result
    FROM Purchases
    WHERE 
        time_stamp BETWEEN startDate AND endDate
        AND amount >= minAmount;
    RETURN result;
END;
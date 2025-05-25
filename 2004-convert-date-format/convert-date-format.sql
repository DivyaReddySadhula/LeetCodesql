/* Write your PL/SQL query statement below */
SELECT 
TRIM(TO_CHAR(day,'Day'))||', '||TRIM(TO_CHAR(day,'FMMonth'))||' '||(TO_CHAR(day,'FMDD, YYYY')) as day
FROM Days;

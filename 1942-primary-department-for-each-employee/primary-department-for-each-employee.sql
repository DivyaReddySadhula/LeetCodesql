SELECT
  employee_id,
  department_id
FROM (
  SELECT
    employee_id,
    department_id,
    primary_flag,
    COUNT(employee_id) OVER(PARTITION BY employee_id) AS empcnt
  FROM Employee
) Emp
WHERE empcnt = 1
   OR primary_flag = 'Y';

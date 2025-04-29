# Write your MySQL query statement below
WITH TopThreeSalariedEmployees AS(
    SELECT 
    d.name as Department,
    e.name as Employee,
    e.salary as Salary,
    DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary desc) as rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT Department,Employee,Salary
FROM TopThreeSalariedEmployees
WHERE rnk IN (1,2,3)
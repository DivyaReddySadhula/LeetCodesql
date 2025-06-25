/* Write your PL/SQL query statement below */
with studentRank as 
(
    select student_id
    ,department_id
    ,mark
    ,count(student_id) over(partition by department_id) as stuCntDeptWise
    ,rank() over(partition by department_id order by mark desc) as stu_rnk_deptWise
    from students
)
select 
student_id
,department_id
,NVL(round((stu_rnk_deptWise-1)*100/NULLIF((stuCntDeptWise-1),0),2) ,0) as percentage from studentRank


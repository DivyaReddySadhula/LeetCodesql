/* Write your PL/SQL query statement below */
select
patient_id
,patient_name
,conditions
from Patients
where regexp_like(conditions,'(^|\s)DIAB1')
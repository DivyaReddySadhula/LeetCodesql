/* Write your PL/SQL query statement below */
 WITH numbered_users AS (
    SELECT user_id, permissions,
           ROW_NUMBER() OVER (ORDER BY user_id) AS rn
    FROM user_permissions
), perm_analysis(rn,user_id,permissions,common_perms,any_perms) as 
(
    select 
    rn
    ,user_id
    ,permissions
    ,permissions as common_perms
    ,permissions as any_perms
    from numbered_users
    where rn =1 
    
    UNION ALL
    select
    nu.rn,
    nu.user_id
    ,nu.permissions
    ,BITAND(pa.common_perms,nu.permissions) as common_perms
    ,(pa.any_perms + (nu.permissions - BITAND(pa.any_perms, nu.permissions))) as any_perms
    from numbered_users nu
    join perm_analysis pa on nu.rn = pa.rn +1
)SELECT common_perms, any_perms
FROM perm_analysis
WHERE rn = (SELECT MAX(ROWNUM) FROM user_permissions);
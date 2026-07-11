SELECT 
    roles.name AS RoleName,
    members.name AS MemberName,
    members.type_desc AS MemberType
FROM sys.database_role_members AS rm
INNER JOIN sys.database_principals AS roles 
    ON rm.role_principal_id = roles.principal_id
INNER JOIN sys.database_principals AS members 
    ON rm.member_principal_id = members.principal_id
ORDER BY RoleName, MemberName;

-- Execute this on the specific target database
CREATE USER [DevOpsnet-ServicePrincipal] FROM EXTERNAL PROVIDER;
ALTER ROLE db_owner ADD MEMBER [DevOpsnet-ServicePrincipal];

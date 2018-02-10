SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[ExtractValidatedCandidates]
	@TableName SYSNAME -- The name of the Validate.T<Object_id> table
AS
SET NOCOUNT ON

--Must be a table matching the desired pattern in the Validate schema.
IF @TableName NOT LIKE 'T[0-9][0-9][0-9]%' OR NOT EXISTS (SELECT 1 FROM sys.objects WHERE name = @TableName AND schema_id=SCHEMA_ID('Validate'))
	BEGIN
		RAISERROR('Table %s is not a validation table',16,1,@TableName) with nowait
		RETURN 1
	END


DECLARE 
	@TableID VARCHAR(10),
	@ValidationTableID INT ,
	@ColumnList VARCHAR(MAX),
	@SQL VARCHAR(MAX)

SET @TableID = RIGHT(@TableName,LEN(@TableName)-1) --The numeric part of the Validate.T<Object_id> table name
SET @ValidationTableID = OBJECT_ID('Validate.'+@TableName) -- The object_id of the actual Validate.T<Object_id> table name


SELECT @ColumnList=COALESCE(@ColumnList+',','')
+	name
FROM sys.columns AS C
WHERE object_id=@ValidationTableID
AND name<>'TotalRows'
ORDER BY C.column_id

SET @SQL='INSERT INTO Validate.CandidateUniqueConstraints(TableId, ColumnName, IsValidated)
SELECT TableId, ColumnName, IsValidated
FROM (
	SELECT '
+	@TableID 
+	' AS TableId, '
+	@ColumnList
+	' FROM Validate.'+@TableName+') p
	UNPIVOT (
		IsValidated FOR ColumnName IN ('
+	@ColumnList
+	')	)AS unpvt'

print @TableName
EXEC(@SQL)
GO

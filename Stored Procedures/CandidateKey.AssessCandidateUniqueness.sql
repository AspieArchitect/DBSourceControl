SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[AssessCandidateUniqueness]
	@TableID INT
AS
SET NOCOUNT ON

DECLARE @SQL VARCHAR(MAX)
SELECT @SQL=COALESCE(@SQL+',','')
+	'CAST(CASE WHEN COUNT(*)>0 AND COUNT(*)-COUNT(DISTINCT '
+	ColumnName
+	') =0 THEN 1 ELSE 0 END AS BIT) AS '
+	ColumnName
FROM CandidateKey.CandidateUniqueConstraints
WHERE TableID=@TableID
ORDER BY KeyPriority

SET @SQL='SELECT COUNT(*) AS TotalRows,' + @SQL
+	' INTO Validate.T'
+	CAST(@TableID AS SYSNAME)
+	' FROM '
+	OBJECT_SCHEMA_NAME(@TableID)+'.'+OBJECT_NAME(@TableID)

EXEC(@SQL)
GO

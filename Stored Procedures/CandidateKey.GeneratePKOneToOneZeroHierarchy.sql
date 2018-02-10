SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [CandidateKey].[GeneratePKOneToOneZeroHierarchy]
AS
SET NOCOUNT ON

DECLARE @SQL VARCHAR(MAX)
DECLARE @CRLF CHAR(2)=CHAR(13)+CHAR(10)
SELECT @SQL = COALESCE(@SQL+';'+@CRLF,'')
+	'ALTER TABLE '
+	QUOTENAME(c.SchemaName)+'.'+QUOTENAME(C.TableName)
+	' ADD CONSTRAINT '
+	QUOTENAME('FKCandidate_'+c.SchemaName+'_'+C.TableName+'_'+P.schemaName+'_'+P.tablename)
+	' FOREIGN KEY ('
+	C.originalColumnName
+	') REFERENCES '
+	QUOTENAME(P.SchemaName)+'.'+QUOTENAME(P.TableName)
+	'('
+	p.OriginalColumnName
+	')'

FROM CandidateKey.PKOneToOneZero AS P
	INNER JOIN CandidateKey.PKOneToOneZero AS C
	ON p.StandardisedColumnName = c.StandardisedColumnName
	AND P.Object_id<>c.Object_id
	AND P.SchemaName = C.SchemaName
	AND P.TablePriority=c.TablePriority-1 
	AND NOT EXISTS(SELECT 1 FROM sysreferences WHERE P.Object_id=rkeyid AND C.Object_id = fkeyid)
ORDER BY P.TablePriority


PRINT @SQL
EXEC(@SQL)
GO

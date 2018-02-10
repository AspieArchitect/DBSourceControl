SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------------------------
CREATE VIEW [CandidateKey].[CandidatePrimaryKeys]
AS
WITH CleanTables AS (
	SELECT 
		TableId=O.object_id,
		TableName=O.name,
		CleanTableName=CASE WHEN LEFT(O.name,3)='tbl' THEN REPLACE(SUBSTRING(O.name,4,LEN(O.name)),'_','')
		ELSE O.name
		END
	FROM sys.objects AS O
		INNER JOIN sys.schemas AS S
		ON O.schema_id = S.schema_id
	WHERE O.type='U'
	AND S.name NOT IN ('CandidateKey','dba','Validate')
),
PriorityFields AS (
	SELECT 
		O.TableId,
		ColumnName=C.name,
		KeyPriority=CASE
			WHEN C.name='ID' THEN 3
			WHEN C.name='Code' THEN 4
			WHEN CleanTableName+'ID'=REPLACE(C.name,'_','') THEN 5
			WHEN CleanTableName+'Code'=REPLACE(C.name,'_','') THEN 6
			WHEN C.column_id=1 THEN 7
			WHEN C.system_type_id=36 THEN 8
			END,
			C.is_nullable
	FROM sys.columns AS C
		INNER JOIN CleanTables AS O
		ON C.object_id = O.TableId
	WHERE C.column_id=1 or C.name like '%id' OR C.name like '%code' or C.system_type_id=36
)
	SELECT TableID,
		ColumnName,
		KeyPriority,
		is_nullable
	FROM PriorityFields
	WHERE KeyPriority IS NOT NULL
GO

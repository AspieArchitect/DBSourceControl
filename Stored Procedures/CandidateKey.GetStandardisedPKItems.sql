SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[GetStandardisedPKItems]
AS
SET NOCOUNT ON
TRUNCATE TABLE CandidateKey.StandardisedPKItems

INSERT INTO CandidateKey.StandardisedPKItems
SELECT 
	O.Object_Id,
	OBJECT_SCHEMA_NAME(c.object_id),
	O.name,
	StandardisedObjectName= REPLACE(CASE WHEN LEFT(O.name,3)='tbl' THEN SUBSTRING(O.name,4,len(O.name)) ELSE O.name END,'_',''),
	OriginalColumnName=C.name,
	StandardisedColumnName=REPLACE( -- Deal with primary key fields like Id & code and the tibblers.
		CASE	WHEN C.name IN('Id','Code') AND LEFT(O.name,3)='tbl' THEN SUBSTRING(O.name,4,len(O.name))+C.name
				WHEN C.name IN('Id','Code') AND LEFT(O.name,3)!='tbl' THEN O.name + c.name
				ELSE C.name END,
		'_','')
FROM sys.index_columns AS IC
	INNER JOIN sys.indexes AS I
	ON IC.object_id = I.object_id
	AND IC.index_id = I.index_id
	INNER JOIN sys.columns AS C
	ON IC.object_id = C.object_id
	AND IC.index_column_id = C.column_id
	INNER JOIN sys.objects AS O
	ON O.object_id=C.object_id
WHERE  I.is_primary_key=1
AND IC.is_included_column=0
AND OBJECT_SCHEMA_NAME(c.object_id) NOT IN ('Validate','CandidateKey','dba','sys') -- Exclude mechanical schemas
GO

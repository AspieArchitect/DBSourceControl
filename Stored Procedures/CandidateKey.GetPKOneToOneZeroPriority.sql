SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[GetPKOneToOneZeroPriority]
AS
SET NOCOUNT ON

TRUNCATE TABLE CandidateKey.PKOneToOneZero


;WITH MultiField AS ( -- Single field primary keys that occur more than once i.e. 1 to 0..1 relationships.
	SELECT pk.StandardisedColumnName
	FROM CandidateKey.StandardisedPKItems AS PK -- Table to contain standardised names of primary key artefacts
		INNER JOIN CandidateKey.PKFieldCount AS PKC -- View to determine number of fields in a primary key.
		ON pk.Object_id = PKC.Object_id
	WHERE PKC.PKFieldCount=1
	GROUP BY PK.StandardisedColumnName
	HAVING COUNT(*)>1
)
INSERT INTO   CandidateKey.PKOneToOneZero(
	Object_Id, 
	TablePriority, 
	SchemaName, 
	TableName, 
	StandardisedTableName, 
	OriginalColumnName, 
	StandardisedColumnName
)
SELECT 
	PK.Object_id,
	TablePriority=CASE 
		WHEN PK.OriginalColumnName = 'ID' THEN 1
		WHEN PK.OriginalColumnName='Code' THEN 2
		WHEN PATINDEX(StandardisedObjectName+'%',PK.StandardisedColumnName)=1 THEN 3
		WHEN OBJECT_SCHEMA_NAME(PK.object_id) = object_name(PK.object_id) THEN 4
		ELSE 99
	END,
	SchemaName=OBJECT_SCHEMA_NAME(PK.object_id),
	TableName=object_name(PK.object_id),
	StandardisedObjectName,
	OriginalColumnName,
	StandardisedColumnName
FROM CandidateKey.StandardisedPKItems AS PK
	INNER JOIN CandidateKey.PKFieldCount AS PKC 
	ON PK.Object_id = PKC.Object_id
WHERE PK.StandardisedColumnName IN (select StandardisedColumnName from MultiField)
AND PKC.PKFieldCount=1
ORDER BY StandardisedColumnName
GO

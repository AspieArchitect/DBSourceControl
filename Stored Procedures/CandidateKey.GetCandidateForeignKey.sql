SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [CandidateKey].[GetCandidateForeignKey]
	@TableID INT
AS
SET NOCOUNT ON
DECLARE 
	@PKFieldCount int,
	@SQLReferences VARCHAR(MAX)


DECLARE @FKTable AS FieldListType;



SELECT @PKFieldCount = PKFieldCount
FROM CandidateKey.PKFieldCount
WHERE Object_ID = @TableID

SELECT @SQLReferences = COALESCE(@SQLReferences+',','')+ OriginalColumnName
FROM 	CandidateKey.StandardisedPKItems
WHERE Object_Id=@TableID
ORDER BY StandardisedColumnName

SET @SQLReferences = ' REFERENCES '+OBJECT_SCHEMA_NAME(@TableId)+'.'+OBJECT_NAME(@TableId)+'('+@SQLReferences+')'


;WITH FKCandidate
AS (
	SELECT 
		C.object_id, 
		C.name,
		StandardisedObjectName= REPLACE(CASE WHEN LEFT(O.name,3)='tbl' THEN SUBSTRING(O.name,4,len(O.name)) ELSE O.name END,'_',''),
		StandardisedColumnName=REPLACE(C.name,'_','')
	FROM sys.columns AS C
		INNER JOIN sys.objects AS O
		ON C.object_id = O.object_id
	WHERE REPLACE(C.name,'_','') in (SELECT StandardisedColumnName FROM CandidateKey.StandardisedPKItems WHERE object_id=@TableID) -- Primary key fields
	AND C.object_id<>@TableId
	AND O.type='U'
	AND OBJECT_SCHEMA_NAME(O.object_id) NOT IN ('dba','validate','CandidateKey','sys')
),
FKQualifier AS 
(SELECT object_id
FROM FKCandidate
GROUP BY object_id
HAVING COUNT(*)=@PKFieldCount -- Identify the table objects that have all the fields in the primary key.
)
INSERT INTO @FKTable(Object_Id,StandardisedObjectName,OriginalColumnName,StandardisedColumnName)
SELECT 
	FKCandidate.object_id,
	FKCandidate.StandardisedObjectName,
	FKCandidate.name,
	FKCandidate.StandardisedColumnName
FROM FKQualifier INNER JOIN FKCandidate
 ON FKQualifier.object_id = FKCandidate.object_id
ORDER BY FKCandidate.StandardisedColumnName


DECLARE @NextObject INT=0 -- Child table object_id
DECLARE @ForeignKeyText VARCHAR(MAX) -- Full blown ALTER TABLE ... FOREIGN KEY... REFERENCES statement.
DECLARE @ForeignKeyFields VARCHAR(MAX) -- delimited list of foreign key fields

WHILE @NextObject IS NOT NULL
	BEGIN
		SELECT @NextObject = MIN(Object_Id)
		FROM @FKTable
		WHERE Object_Id>@NextObject

		IF @NextObject IS NOT NULL
			BEGIN
				IF CandidateKey.HasExistingParent( @NextObject, @FKTable)=0
					BEGIN
						SET @ForeignKeyText='ALTER TABLE ' 
							+ OBJECT_SCHEMA_NAME(@NextObject)+'.'+OBJECT_NAME(@NextObject)
							+ ' ADD CONSTRAINT FK_'+OBJECT_SCHEMA_NAME(@NextObject)+'_'+OBJECT_NAME(@NextObject) + ' FOREIGN KEY ('

						-- Build concatenated list of foreign key names
						SELECT @ForeignKeyFields = COALESCE(@ForeignKeyFields+',','')+OriginalColumnName
						FROM @FKTable
						WHERE Object_Id=@NextObject
						ORDER BY StandardisedColumnName

						SET @ForeignKeyText=@ForeignKeyText 
							+ @ForeignKeyFields + ') '
							+ @SQLReferences

						PRINT @ForeignKeyText
						SET @ForeignKeyFields = NULL
					END
				END
	END
GO

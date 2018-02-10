SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[FlushValidateSchema]
AS
SET NOCOUNT ON

DECLARE @ValidateSchemaObjects TABLE (TableID INT NOT NULL)
INSERT INTO @ValidateSchemaObjects (TableID)
SELECT object_id
FROM sys.objects AS O
WHERE O.schema_id=SCHEMA_ID('Validate')
AND O.name LIKE 'T[0-9][0-9][0-9][0-9]%'
ORDER BY object_id


DECLARE @TableID INT
DECLARE @SQL  VARCHAR(MAX)
SET @TableID = 0
WHILE @TableID IS NOT NULL
	BEGIN
		SELECT @TableID=MIN(TableID)
		FROM @ValidateSchemaObjects
		WHERE TableID>@TableID

		IF @TableID IS NOT NULL
			BEGIN
				SET @SQL = 'DROP TABLE '
					+	QUOTENAME(OBJECT_SCHEMA_NAME(@TableID))
					+	'.'
					+	QUOTENAME(OBJECT_NAME(@TableID))	
				PRINT @SQL
				EXEC (@SQL)
			END
	END
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[SetCandidateValidity]
AS
SET NOCOUNT ON

DECLARE @TableName SYSNAME='',
	@SchemaID int

SET @SchemaID=SCHEMA_ID('Validate')

TRUNCATE TABLE Validate.CandidateUniqueConstraints

WHILE @TableName IS NOT NULL
	BEGIN
		SELECT @TableName = MIN(name)
		FROM sys.objects
		WHERE name>@TableName
		AND schema_id=@SchemaID
		AND type='U'
		AND name LIKE 'T[0-9][0-9][0-9][0-9]%'

		IF @TableName IS NOT NULL
			BEGIN
				EXEC CandidateKey.ExtractValidatedCandidates @TableName
			END
	END

UPDATE DEST
SET DEST.IsValidated=SRC.IsValidated
FROM	Validate.CandidateUniqueConstraints AS SRC
	INNER JOIN CandidateKey.CandidateUniqueConstraints AS DEST
	ON	SRC.TableID = DEST.TableID
	AND SRC.ColumnName = DEST.ColumnName
WHERE SRC.IsValidated<>DEST.IsValidated

RAISERROR ('%d Candidate Keys Updated',10,1,@@ROWCOUNT) WITH NOWAIT

-- Discard any candidates that didn't resolve as PK Candidates
DELETE FROM CandidateKey.CandidateUniqueConstraints WHERE IsValidated=0
RAISERROR ('%d Invalid candidate Keys removed',10,1,@@ROWCOUNT) WITH NOWAIT

GO

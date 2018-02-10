SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[GetCandidateKeys]
AS
SET NOCOUNT ON

TRUNCATE TABLE CandidateKey.CandidateUniqueConstraints

-- IDENTITY COLUMNS
INSERT INTO CandidateKey.CandidateUniqueConstraints(TableID, KeyPriority, Is_Nullable,ColumnName)
SELECT 
	TableId=object_id,
	KeyPriority=1 ,
	Is_Nullable,
	ColumnName=name
FROM sys.columns
WHERE is_identity=1
AND OBJECTPROPERTY(object_id,'IsUserTable')=1

RAISERROR('Candidate Keys with an identity property %d',10,1,@@ROWCOUNT) WITH NOWAIT

-- SEQUENCE COLUMNS
INSERT INTO CandidateKey.CandidateUniqueConstraints(TableID, KeyPriority, Is_Nullable,ColumnName)
SELECT 
	TableId=c.object_id,
	KeyPriority=2 ,
	C.Is_Nullable,
	ColumnName=c.name
FROM sys.sequences AS SQ
	INNER JOIN sysdepends DP
	ON SQ.object_id=DP.depid
	INNER JOIN sys.columns AS C
	ON C.default_object_id = DP.id
WHERE OBJECTPROPERTY(C.object_id,'IsUserTable')=1
RAISERROR('Candidate Keys using a SEQUENCE %d',10,1,@@ROWCOUNT) WITH NOWAIT


-- Other Candidates
INSERT INTO CandidateKey.CandidateUniqueConstraints(TableID, KeyPriority, Is_Nullable,ColumnName)
SELECT 
	SRC.TableId,
	SRC.KeyPriority,
	SRC.Is_Nullable,
	SRC.ColumnName
FROM CandidateKey.CandidatePrimaryKeys AS SRC
	LEFT JOIN CandidateKey.CandidateUniqueConstraints AS TARG
	ON SRC.TableID = TARG.TableID
	AND SRC.ColumnName = TARG.ColumnName
WHERE TARG.TableID IS NULL

RAISERROR('Candidate Keys with column properties  %d',10,1,@@ROWCOUNT) WITH NOWAIT

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE FUNCTION [CandidateKey].[GetFieldsUsedInExistingFK](
	@ChildObjectId INT
)
RETURNS @ChildFieldList TABLE (
	StandardisedColumnName SYSNAME NOT NULL
)
AS
	BEGIN
		--Unpivot the table.
		;WITH CurrentFK (PARENT_object_id,CHILD_object_id,column_id)AS (
			SELECT DISTINCT rkeyId,fkeyid,  column_id
			FROM 
			   (SELECT rkeyid,fkeyid, 
				fkey1,
				fkey2,
				fkey3,
				fkey4,
				fkey5,
				fkey6,
				fkey7,
				fkey8,
				fkey9,
				fkey10,
				fkey11,
				fkey12,
				fkey13,
				fkey14,
				fkey15,
				fkey16
			FROM sysreferences
			WHERE fkeyid=@ChildObjectId) p
			UNPIVOT
			   (column_id  FOR KeyID IN 
				  (fkey1,
				fkey2,
				fkey3,
				fkey4,
				fkey5,
				fkey6,
				fkey7,
				fkey8,
				fkey9,
				fkey10,
				fkey11,
				fkey12,
				fkey13,
				fkey14,
				fkey15,
				fkey16)
			)AS unpvt
		)

		INSERT INTO	 @ChildFieldList(StandardisedColumnName)
		SELECT REPLACE(C.name,'_','')
		FROM CurrentFK
			INNER JOIN sys.columns AS C
			ON CurrentFK.CHILD_object_id = C.object_id
			AND CurrentFK.column_id = C.column_id
		WHERE CurrentFK.column_id>0

		RETURN
	END
GO

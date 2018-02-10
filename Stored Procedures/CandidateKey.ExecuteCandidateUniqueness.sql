SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------
CREATE PROC [CandidateKey].[ExecuteCandidateUniqueness]
	@ThresholdFloorRowCount BIGINT=0, --##PARAM @ThresholdFloorRowCount The minimum number of records for which a uniqueness assessment will take place.
	@ThresholdCeilingRowCount BIGINT=10000 --##PARAM @@ThresholdCeilingRowCount The maximum number of records for which a uniqueness assessment will take place.
AS
SET NOCOUNT ON

DECLARE 
	@TableID INT,
	@RowCount BIGINT,
	@FQTableName SYSNAME
SET @TableID=0
WHILE @TableID IS NOT NULL
	BEGIN
		SELECT @TableID=MIN(TableID)
		FROM CandidateKey.CandidateUniqueConstraints
		WHERE TableID>@TableID

		IF @TableID IS NOT NULL
			BEGIN
				SET @FQTableName=QUOTENAME(OBJECT_SCHEMA_NAME(@TableID))+'.'+QUOTENAME(OBJECT_NAME(@TableID))
				SELECT @RowCount=SUM(rows)
				FROM sys.partitions
				WHERE object_id = @TableID
				AND index_id IN(0,1)
				
				IF @RowCount > @ThresholdCeilingRowCount
					BEGIN
						RAISERROR('THRESHOLD %I64d EXCEEDED: %s = %I64d ',10,1,@ThresholdCeilingRowCount,@FQTableName,@RowCount) WITH NOWAIT
					END
				ELSE
					BEGIN
						IF @RowCount >= @ThresholdFloorRowCount
							exec CandidateKey.AssessCandidateUniqueness @TableID
					END
			END
	END
GO

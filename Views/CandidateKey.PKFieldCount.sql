SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------------------------
CREATE VIEW [CandidateKey].[PKFieldCount]
AS
SELECT Object_id, PKFieldCount=COUNT(*)
FROM CandidateKey.StandardisedPKItems
GROUP BY Object_id
GO

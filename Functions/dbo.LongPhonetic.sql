SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE FUNCTION [dbo].[LongPhonetic] (@PhoneticType [smallint], @InputString [nvarchar] (max))
RETURNS [nvarchar] (max)
WITH EXECUTE AS CALLER
EXTERNAL NAME [Phonetics].[Phonetics].[LongPhonetic]
GO

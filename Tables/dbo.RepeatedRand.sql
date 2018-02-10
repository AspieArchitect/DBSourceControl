CREATE TABLE [dbo].[RepeatedRand]
(
[RepeatedRandID] [int] NOT NULL IDENTITY(1, 1),
[RandValue] [tinyint] NOT NULL CONSTRAINT [DF_RepeatedRand_RandValue] DEFAULT (CONVERT([int],(10)*rand(),(0)))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RepeatedRand] ADD CONSTRAINT [PK_RepeatedRand] PRIMARY KEY CLUSTERED  ([RepeatedRandID]) ON [PRIMARY]
GO

CREATE TABLE [CandidateKey].[PKOneToOneZero]
(
[Object_Id] [int] NOT NULL,
[TablePriority] [tinyint] NOT NULL,
[SchemaName] [sys].[sysname] NOT NULL,
[TableName] [sys].[sysname] NOT NULL,
[StandardisedTableName] [sys].[sysname] NOT NULL,
[OriginalColumnName] [sys].[sysname] NOT NULL,
[StandardisedColumnName] [sys].[sysname] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [CandidateKey].[PKOneToOneZero] ADD CONSTRAINT [PK_PKOneToOneZero] PRIMARY KEY CLUSTERED  ([Object_Id]) ON [PRIMARY]
GO

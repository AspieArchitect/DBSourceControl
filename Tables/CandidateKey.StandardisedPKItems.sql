CREATE TABLE [CandidateKey].[StandardisedPKItems]
(
[Object_id] [int] NOT NULL,
[SchemaName] [sys].[sysname] NOT NULL,
[OriginalObjectName] [sys].[sysname] NOT NULL,
[StandardisedObjectName] [sys].[sysname] NOT NULL,
[OriginalColumnName] [sys].[sysname] NOT NULL,
[StandardisedColumnName] [sys].[sysname] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [CandidateKey].[StandardisedPKItems] ADD CONSTRAINT [PK_StandardisedPKItems] PRIMARY KEY CLUSTERED  ([Object_id], [OriginalColumnName]) ON [PRIMARY]
GO

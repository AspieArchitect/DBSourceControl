CREATE TYPE [dbo].[FieldListType] AS TABLE
(
[Object_id] [int] NOT NULL,
[StandardisedObjectName] [sys].[sysname] NOT NULL,
[OriginalColumnName] [sys].[sysname] NOT NULL,
[StandardisedColumnName] [sys].[sysname] NOT NULL
)
GO

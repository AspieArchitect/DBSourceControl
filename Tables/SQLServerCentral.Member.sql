CREATE TABLE [SQLServerCentral].[Member]
(
[Id] [int] NOT NULL,
[OtherFields] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[Member] ADD CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO

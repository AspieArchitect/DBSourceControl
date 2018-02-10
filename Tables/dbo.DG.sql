CREATE TABLE [dbo].[DG]
(
[PersonID] [int] NOT NULL,
[FirstName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MaritalStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DG] ADD CONSTRAINT [PK_DG] PRIMARY KEY CLUSTERED  ([PersonID]) ON [PRIMARY]
GO

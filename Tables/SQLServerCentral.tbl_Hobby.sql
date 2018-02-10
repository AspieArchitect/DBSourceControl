CREATE TABLE [SQLServerCentral].[tbl_Hobby]
(
[Code] [int] NOT NULL,
[OtherFields] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[tbl_Hobby] ADD CONSTRAINT [PK_Hobbies] PRIMARY KEY CLUSTERED  ([Code]) ON [PRIMARY]
GO

CREATE TABLE [SQLServerCentral].[MemberHobby]
(
[MemberId] [int] NOT NULL,
[HobbyCode] [int] NOT NULL,
[OtherFields] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[MemberHobby] ADD CONSTRAINT [PK_MemberHobbies] PRIMARY KEY CLUSTERED  ([MemberId], [HobbyCode]) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[MemberHobby] ADD CONSTRAINT [FK_MemberHobby_Hobby] FOREIGN KEY ([HobbyCode]) REFERENCES [SQLServerCentral].[tbl_Hobby] ([Code])
GO
ALTER TABLE [SQLServerCentral].[MemberHobby] ADD CONSTRAINT [FK_MemberHobby_Member] FOREIGN KEY ([MemberId]) REFERENCES [SQLServerCentral].[Member] ([Id])
GO

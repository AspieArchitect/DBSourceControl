CREATE TABLE [SQLServerCentral].[MemberHobbyAttendance]
(
[MemberId] [int] NOT NULL,
[HobbyCode] [int] NOT NULL,
[AttendanceDate] [date] NOT NULL,
[OtherFields] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[MemberHobbyAttendance] ADD CONSTRAINT [PK_MemberHobbyAttendance] PRIMARY KEY CLUSTERED  ([MemberId], [HobbyCode], [AttendanceDate]) ON [PRIMARY]
GO
ALTER TABLE [SQLServerCentral].[MemberHobbyAttendance] ADD CONSTRAINT [FK_MemberHobbyAttendance] FOREIGN KEY ([MemberId], [HobbyCode]) REFERENCES [SQLServerCentral].[MemberHobby] ([MemberId], [HobbyCode])
GO

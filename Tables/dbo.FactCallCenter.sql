CREATE TABLE [dbo].[FactCallCenter]
(
[FactCallCenterID] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [int] NOT NULL,
[WageType] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Shift] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LevelOneOperators] [smallint] NOT NULL,
[LevelTwoOperators] [smallint] NOT NULL,
[TotalOperators] [smallint] NOT NULL,
[Calls] [int] NOT NULL,
[AutomaticResponses] [int] NOT NULL,
[Orders] [int] NOT NULL,
[IssuesRaised] [smallint] NOT NULL,
[AverageTimePerIssue] [smallint] NOT NULL,
[ServiceGrade] [float] NOT NULL,
[Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCallCenter] ADD CONSTRAINT [PK_FactCallCenter_FactCallCenterID] PRIMARY KEY CLUSTERED  ([FactCallCenterID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCallCenter] ADD CONSTRAINT [AK_FactCallCenter_DateKey_Shift] UNIQUE NONCLUSTERED  ([DateKey], [Shift]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCallCenter] ADD CONSTRAINT [FK_FactCallCenter_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO

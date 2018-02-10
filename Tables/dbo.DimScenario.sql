CREATE TABLE [dbo].[DimScenario]
(
[ScenarioKey] [int] NOT NULL IDENTITY(1, 1),
[ScenarioName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimScenario] ADD CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED  ([ScenarioKey]) ON [PRIMARY]
GO

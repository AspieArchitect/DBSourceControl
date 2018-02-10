CREATE TABLE [Validate].[CandidateUniqueConstraints]
(
[TableID] [int] NOT NULL,
[ColumnName] [sys].[sysname] NOT NULL,
[IsValidated] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Validate].[CandidateUniqueConstraints] ADD CONSTRAINT [PK_Validate_CandidateUniqueConstraints] PRIMARY KEY CLUSTERED  ([TableID], [ColumnName]) ON [PRIMARY]
GO

CREATE TABLE [CandidateKey].[CandidateUniqueConstraints]
(
[TableID] [int] NOT NULL,
[KeyPriority] [tinyint] NOT NULL,
[IsValidated] [bit] NOT NULL CONSTRAINT [DF_CandidateUniqueConstraints_IsValidated] DEFAULT ((0)),
[Is_Nullable] [bit] NOT NULL,
[ValidationTable] AS ('T'+CONVERT([sysname],[TableId],(0))),
[ColumnName] [sys].[sysname] NOT NULL,
[Col_1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [CandidateKey].[CandidateUniqueConstraints] ADD CONSTRAINT [PK_CandidateUniqueConstraints] PRIMARY KEY CLUSTERED  ([TableID], [ColumnName]) ON [PRIMARY]
GO

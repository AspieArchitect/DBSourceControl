CREATE TABLE [dbo].[DimAccount]
(
[AccountKey] [int] NOT NULL IDENTITY(1, 1),
[ParentAccountKey] [int] NULL,
[AccountCodeAlternateKey] [int] NULL,
[ParentAccountCodeAlternateKey] [int] NULL,
[AccountDescription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operator] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomMembers] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ValueType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomMemberOptions] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimAccount] ADD CONSTRAINT [PK_DimAccount] PRIMARY KEY CLUSTERED  ([AccountKey]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_DimAccount_AccountCodeAlternateKey] ON [dbo].[DimAccount] ([AccountCodeAlternateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimAccount] ADD CONSTRAINT [FK_DimAccount_DimAccount] FOREIGN KEY ([ParentAccountKey]) REFERENCES [dbo].[DimAccount] ([AccountKey])
GO

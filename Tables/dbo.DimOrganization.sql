CREATE TABLE [dbo].[DimOrganization]
(
[OrganizationKey] [int] NOT NULL IDENTITY(1, 1),
[ParentOrganizationKey] [int] NULL,
[PercentageOfOwnership] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrganizationName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrencyKey] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimOrganization] ADD CONSTRAINT [PK_DimOrganization] PRIMARY KEY CLUSTERED  ([OrganizationKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimOrganization] ADD CONSTRAINT [FK_DimOrganization_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[DimOrganization] ADD CONSTRAINT [FK_DimOrganization_DimOrganization] FOREIGN KEY ([ParentOrganizationKey]) REFERENCES [dbo].[DimOrganization] ([OrganizationKey])
GO

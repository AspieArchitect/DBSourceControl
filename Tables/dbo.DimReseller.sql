CREATE TABLE [dbo].[DimReseller]
(
[ResellerKey] [int] NOT NULL IDENTITY(1, 1),
[GeographyKey] [int] NULL,
[ResellerAlternateKey] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ResellerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NumberEmployees] [int] NULL,
[OrderFrequency] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderMonth] [tinyint] NULL,
[FirstOrderYear] [int] NULL,
[LastOrderYear] [int] NULL,
[ProductLine] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine1] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualSales] [money] NULL,
[BankName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinPaymentType] [tinyint] NULL,
[MinPaymentAmount] [money] NULL,
[AnnualRevenue] [money] NULL,
[YearOpened] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimReseller] ADD CONSTRAINT [PK_DimReseller_ResellerKey] PRIMARY KEY CLUSTERED  ([ResellerKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DimReseller_GeographyKey] ON [dbo].[DimReseller] ([GeographyKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimReseller] ADD CONSTRAINT [AK_DimReseller_ResellerAlternateKey] UNIQUE NONCLUSTERED  ([ResellerAlternateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimReseller] ADD CONSTRAINT [FK_DimReseller_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

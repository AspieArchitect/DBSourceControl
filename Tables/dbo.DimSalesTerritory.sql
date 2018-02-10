CREATE TABLE [dbo].[DimSalesTerritory]
(
[SalesTerritoryKey] [int] NOT NULL IDENTITY(1, 1),
[SalesTerritoryAlternateKey] [int] NULL,
[SalesTerritoryRegion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalesTerritoryCountry] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalesTerritoryGroup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesTerritoryImage] [varbinary] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED  ([SalesTerritoryKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimSalesTerritory] ADD CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryAlternateKey] UNIQUE NONCLUSTERED  ([SalesTerritoryAlternateKey]) ON [PRIMARY]
GO

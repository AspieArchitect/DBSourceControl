CREATE TABLE [dbo].[FactResellerSales]
(
[ProductKey] [int] NOT NULL,
[OrderDateKey] [int] NOT NULL,
[DueDateKey] [int] NOT NULL,
[ShipDateKey] [int] NOT NULL,
[ResellerKey] [int] NOT NULL,
[EmployeeKey] [int] NOT NULL,
[PromotionKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[SalesTerritoryKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalesOrderLineNumber] [tinyint] NOT NULL,
[RevisionNumber] [tinyint] NULL,
[OrderQuantity] [smallint] NULL,
[UnitPrice] [money] NULL,
[ExtendedAmount] [money] NULL,
[UnitPriceDiscountPct] [float] NULL,
[DiscountAmount] [float] NULL,
[ProductStandardCost] [money] NULL,
[TotalProductCost] [money] NULL,
[SalesAmount] [money] NULL,
[TaxAmt] [money] NULL,
[Freight] [money] NULL,
[CarrierTrackingNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerPONumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderDate] [datetime] NULL,
[DueDate] [datetime] NULL,
[ShipDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED  ([SalesOrderNumber], [SalesOrderLineNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_CurrencyKey] ON [dbo].[FactResellerSales] ([CurrencyKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_DueDateKey] ON [dbo].[FactResellerSales] ([DueDateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_EmployeeKey] ON [dbo].[FactResellerSales] ([EmployeeKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_OrderDateKey] ON [dbo].[FactResellerSales] ([OrderDateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_ProductKey] ON [dbo].[FactResellerSales] ([ProductKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_PromotionKey] ON [dbo].[FactResellerSales] ([PromotionKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_ResellerKey] ON [dbo].[FactResellerSales] ([ResellerKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactResellerSales_ShipDateKey] ON [dbo].[FactResellerSales] ([ShipDateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimDate1] FOREIGN KEY ([DueDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimDate2] FOREIGN KEY ([ShipDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimEmployee] FOREIGN KEY ([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimReseller] FOREIGN KEY ([ResellerKey]) REFERENCES [dbo].[DimReseller] ([ResellerKey])
GO
ALTER TABLE [dbo].[FactResellerSales] ADD CONSTRAINT [FK_FactResellerSales_DimSalesTerritory] FOREIGN KEY ([SalesTerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey])
GO

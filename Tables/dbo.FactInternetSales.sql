CREATE TABLE [dbo].[FactInternetSales]
(
[ProductKey] [int] NOT NULL,
[OrderDateKey] [int] NOT NULL,
[DueDateKey] [int] NOT NULL,
[ShipDateKey] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[PromotionKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[SalesTerritoryKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalesOrderLineNumber] [tinyint] NOT NULL,
[RevisionNumber] [tinyint] NOT NULL,
[OrderQuantity] [smallint] NOT NULL,
[UnitPrice] [money] NOT NULL,
[ExtendedAmount] [money] NOT NULL,
[UnitPriceDiscountPct] [float] NOT NULL,
[DiscountAmount] [float] NOT NULL,
[ProductStandardCost] [money] NOT NULL,
[TotalProductCost] [money] NOT NULL,
[SalesAmount] [money] NOT NULL,
[TaxAmt] [money] NOT NULL,
[Freight] [money] NOT NULL,
[CarrierTrackingNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerPONumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderDate] [datetime] NULL,
[DueDate] [datetime] NULL,
[ShipDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED  ([SalesOrderNumber], [SalesOrderLineNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_CurrencyKey] ON [dbo].[FactInternetSales] ([CurrencyKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_CustomerKey] ON [dbo].[FactInternetSales] ([CustomerKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_DueDateKey] ON [dbo].[FactInternetSales] ([DueDateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_OrderDateKey] ON [dbo].[FactInternetSales] ([OrderDateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_ProductKey] ON [dbo].[FactInternetSales] ([ProductKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactInternetSales_PromotionKey] ON [dbo].[FactInternetSales] ([PromotionKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactIneternetSales_ShipDateKey] ON [dbo].[FactInternetSales] ([ShipDateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimDate1] FOREIGN KEY ([DueDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimDate2] FOREIGN KEY ([ShipDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactInternetSales] ADD CONSTRAINT [FK_FactInternetSales_DimSalesTerritory] FOREIGN KEY ([SalesTerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey])
GO

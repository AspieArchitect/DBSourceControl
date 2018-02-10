CREATE TABLE [dbo].[FactProductInventory]
(
[ProductKey] [int] NOT NULL,
[DateKey] [int] NOT NULL,
[MovementDate] [date] NOT NULL,
[UnitCost] [money] NOT NULL,
[UnitsIn] [int] NOT NULL,
[UnitsOut] [int] NOT NULL,
[UnitsBalance] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactProductInventory] ADD CONSTRAINT [PK_FactProductInventory] PRIMARY KEY CLUSTERED  ([ProductKey], [DateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactProductInventory] ADD CONSTRAINT [FK_FactProductInventory_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactProductInventory] ADD CONSTRAINT [FK_FactProductInventory_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO

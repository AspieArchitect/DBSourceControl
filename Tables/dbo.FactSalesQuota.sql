CREATE TABLE [dbo].[FactSalesQuota]
(
[SalesQuotaKey] [int] NOT NULL IDENTITY(1, 1),
[EmployeeKey] [int] NOT NULL,
[DateKey] [int] NOT NULL,
[CalendarYear] [smallint] NOT NULL,
[CalendarQuarter] [tinyint] NOT NULL,
[SalesAmountQuota] [money] NOT NULL,
[Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED  ([SalesQuotaKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactSalesQuota_DateKey] ON [dbo].[FactSalesQuota] ([DateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactSalesQuota_EmployeeKey] ON [dbo].[FactSalesQuota] ([EmployeeKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] ADD CONSTRAINT [FK_FactSalesQuota_DimEmployee] FOREIGN KEY ([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO

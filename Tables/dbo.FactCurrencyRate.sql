CREATE TABLE [dbo].[FactCurrencyRate]
(
[CurrencyKey] [int] NOT NULL,
[DateKey] [int] NOT NULL,
[AverageRate] [float] NOT NULL,
[EndOfDayRate] [float] NOT NULL,
[Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCurrencyRate] ADD CONSTRAINT [PK_FactCurrencyRate_CurrencyKey_DateKey] PRIMARY KEY CLUSTERED  ([CurrencyKey], [DateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCurrencyRate] ADD CONSTRAINT [FK_FactCurrencyRate_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactCurrencyRate] ADD CONSTRAINT [FK_FactCurrencyRate_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO

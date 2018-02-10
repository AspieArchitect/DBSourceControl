CREATE TABLE [dbo].[FactSurveyResponse]
(
[SurveyResponseKey] [int] NOT NULL IDENTITY(1, 1),
[DateKey] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[ProductCategoryKey] [int] NOT NULL,
[EnglishProductCategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProductSubcategoryKey] [int] NOT NULL,
[EnglishProductSubcategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSurveyResponse] ADD CONSTRAINT [PK_FactSurveyResponse_SurveyResponseKey] PRIMARY KEY CLUSTERED  ([SurveyResponseKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactSurveyResponse_CustomerKey] ON [dbo].[FactSurveyResponse] ([CustomerKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactSurveyResponse_DateKey] ON [dbo].[FactSurveyResponse] ([DateKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FactSurveyResponse_ProductSubcategoryKey] ON [dbo].[FactSurveyResponse] ([ProductSubcategoryKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSurveyResponse] ADD CONSTRAINT [FK_FactSurveyResponse_CustomerKey] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactSurveyResponse] ADD CONSTRAINT [FK_FactSurveyResponse_DateKey] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO

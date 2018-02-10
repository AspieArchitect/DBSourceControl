CREATE TABLE [dbo].[DimProductCategory]
(
[ProductCategoryKey] [int] NOT NULL IDENTITY(1, 1),
[ProductCategoryAlternateKey] [int] NULL,
[EnglishProductCategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SpanishProductCategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FrenchProductCategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED  ([ProductCategoryKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductCategory] ADD CONSTRAINT [AK_DimProductCategory_ProductCategoryAlternateKey] UNIQUE NONCLUSTERED  ([ProductCategoryAlternateKey]) ON [PRIMARY]
GO

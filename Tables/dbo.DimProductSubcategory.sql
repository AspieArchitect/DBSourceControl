CREATE TABLE [dbo].[DimProductSubcategory]
(
[ProductSubcategoryKey] [int] NOT NULL IDENTITY(1, 1),
[ProductSubcategoryAlternateKey] [int] NULL,
[EnglishProductSubcategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SpanishProductSubcategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FrenchProductSubcategoryName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProductCategoryKey] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED  ([ProductSubcategoryKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryAlternateKey] UNIQUE NONCLUSTERED  ([ProductSubcategoryAlternateKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProductSubcategory] ADD CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO

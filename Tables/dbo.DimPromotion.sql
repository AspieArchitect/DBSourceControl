CREATE TABLE [dbo].[DimPromotion]
(
[PromotionKey] [int] NOT NULL IDENTITY(1, 1),
[PromotionAlternateKey] [int] NULL,
[EnglishPromotionName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpanishPromotionName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FrenchPromotionName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DiscountPct] [float] NULL,
[EnglishPromotionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpanishPromotionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FrenchPromotionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnglishPromotionCategory] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpanishPromotionCategory] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FrenchPromotionCategory] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NULL,
[MinQty] [int] NULL,
[MaxQty] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED  ([PromotionKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimPromotion] ADD CONSTRAINT [AK_DimPromotion_PromotionAlternateKey] UNIQUE NONCLUSTERED  ([PromotionAlternateKey]) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProspectiveBuyer]
(
[ProspectiveBuyerKey] [int] NOT NULL IDENTITY(1, 1),
[ProspectAlternateKey] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BirthDate] [datetime] NULL,
[MaritalStatus] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YearlyIncome] [money] NULL,
[TotalChildren] [tinyint] NULL,
[NumberChildrenAtHome] [tinyint] NULL,
[Education] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Occupation] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HouseOwnerFlag] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumberCarsOwned] [tinyint] NULL,
[AddressLine1] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateProvinceCode] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostalCode] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unknown] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProspectiveBuyer] ADD CONSTRAINT [PK_ProspectiveBuyer_ProspectiveBuyerKey] PRIMARY KEY CLUSTERED  ([ProspectiveBuyerKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ProspectiveBuyer_ProspectAlternateKey] ON [dbo].[ProspectiveBuyer] ([ProspectAlternateKey]) ON [PRIMARY]
GO

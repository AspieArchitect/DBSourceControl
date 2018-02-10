CREATE TABLE [dbo].[DimEmployee]
(
[EmployeeKey] [int] NOT NULL IDENTITY(1, 1),
[ParentEmployeeKey] [int] NULL,
[EmployeeNationalIDAlternateKey] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentEmployeeNationalIDAlternateKey] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesTerritoryKey] [int] NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MiddleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NameStyle] [bit] NOT NULL,
[Title] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HireDate] [date] NULL,
[BirthDate] [date] NULL,
[LoginID] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaritalStatus] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmergencyContactName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmergencyContactPhone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalariedFlag] [bit] NULL,
[Gender] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PayFrequency] [tinyint] NULL,
[BaseRate] [money] NULL,
[VacationHours] [smallint] NULL,
[SickLeaveHours] [smallint] NULL,
[CurrentFlag] [bit] NOT NULL,
[SalesPersonFlag] [bit] NOT NULL,
[DepartmentName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [date] NULL,
[EndDate] [date] NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeePhoto] [varbinary] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [PK_DimEmployee_EmployeeKey] PRIMARY KEY CLUSTERED  ([EmployeeKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DimEmployee_ParentEmployeeKey] ON [dbo].[DimEmployee] ([ParentEmployeeKey]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DimEmployee_SalesTerritoryKey] ON [dbo].[DimEmployee] ([SalesTerritoryKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [FK_DimEmployee_DimEmployee] FOREIGN KEY ([ParentEmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[DimEmployee] ADD CONSTRAINT [FK_DimEmployee_DimSalesTerritory] FOREIGN KEY ([SalesTerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey])
GO

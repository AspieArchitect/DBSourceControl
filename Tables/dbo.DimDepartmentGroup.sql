CREATE TABLE [dbo].[DimDepartmentGroup]
(
[DepartmentGroupKey] [int] NOT NULL IDENTITY(1, 1),
[ParentDepartmentGroupKey] [int] NULL,
[DepartmentGroupName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimDepartmentGroup] ADD CONSTRAINT [PK_DimDepartmentGroup] PRIMARY KEY CLUSTERED  ([DepartmentGroupKey]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimDepartmentGroup] ADD CONSTRAINT [FK_DimDepartmentGroup_DimDepartmentGroup] FOREIGN KEY ([ParentDepartmentGroupKey]) REFERENCES [dbo].[DimDepartmentGroup] ([DepartmentGroupKey])
GO

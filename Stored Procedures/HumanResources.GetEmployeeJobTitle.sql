SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [HumanResources].[GetEmployeeJobTitle](@EmployeeID INT, @Jobtitle VARCHAR(50) OUTPUT)
AS
SET NOCOUNT ON

SELECT @Jobtitle=JobTitle
FROM 	HumanResources.Employee
WHERE BusinessEntityID=@EmployeeID

GO

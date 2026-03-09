USE AdventureWorks2019

-------------------------
--DIMENSION FECHA
-------------------------

--Dimension para FactCustomerMonthly
CREATE VIEW Analytics.VW_DimDateRFM AS
SELECT 
	CAST(
		(CAST(YEAR(OrderDate) AS NVARCHAR(4)) + CAST(FORMAT(MONTH(OrderDate),'00') AS NVARCHAR(2)))
		AS INT) AS PeriodID,
	YEAR(OrderDate) AS YearOrder,
	MONTH(OrderDate) AS MonthOrder,
	DATENAME(MONTH,OrderDate) AS MonthName
FROM Sales.SalesOrderHeader 
WHERE DATEDIFF(MONTH, OrderDate, (SELECT TOP(1) MAX(OrderDate) FROM Sales.SalesOrderHeader)) < 12
GROUP BY YEAR(OrderDate), MONTH(OrderDate), DATENAME(MONTH,OrderDate)

--CONSUTAR
SELECT * FROM Analytics.VW_DimDateRFM

USE AdventureWorks2019

-------------------------
--FACT CUSTOMER MONTHLY
-------------------------

--CONSIDERA RESUMENES POR CLIENTES DE LOS ÚLTIMOS 12 MESES
CREATE VIEW Analytics.VW_FactCustomerMonthly AS
SELECT 
	CAST(
		(CAST(YEAR(OrderDate) AS NVARCHAR(4)) + CAST(FORMAT(MONTH(OrderDate),'00') AS NVARCHAR(2)))
		AS INT) AS PeriodID,
	CustomerID,
	COUNT(DISTINCT SalesOrderID) AS SalesNumber,
	SUM(TotalDue) AS SalesTotal,
	MIN(OrderDate) AS FirstSaleDate,
	MAX(OrderDate) AS LastSaleDate
FROM Sales.SalesOrderHeader 
WHERE DATEDIFF(MONTH, OrderDate, (SELECT TOP(1) MAX(OrderDate) FROM Sales.SalesOrderHeader)) < 12
GROUP BY YEAR(OrderDate), MONTH(OrderDate), CustomerID

--CONSULTAR
SELECT * FROM Analytics.VW_FactCustomerMonthly

--VERIFICAR UNICIDAD (1 FILA POR CLIENTE-PERIODO)
SELECT * FROM
	(SELECT 
		CustomerID,
		PeriodID,
		COUNT(*) AS CANT
	FROM Analytics.VW_FactCustomerMonthly
	GROUP BY CustomerID, PeriodID) AS CM
WHERE CANT <> 1 

--CASO 1 VENTA
SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013 
AND MONTH(OrderDate) = 7
AND CustomerID = 11002

--CASO 2 VENTAS
SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013 
AND MONTH(OrderDate) = 7
AND CustomerID = 11113

--CASO 4 VENTAS
SELECT
	CustomerID,
	OrderDate,
	SalesOrderID,
	TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013 
AND MONTH(OrderDate) = 10
AND CustomerID = 11287
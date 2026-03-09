
USE AdventureWorks2019

-----------------------------------
--VISTA DE HECHOS
-----------------------------------
--Considera todo los datos disponibles

CREATE VIEW Analytics.VW_FactCustomerBase AS
SELECT 
	CustomerId,
	MIN(OrderDate) AS FirstOrderDate,
	MAX(OrderDate) AS LastOrderDate,
	COUNT(DISTINCT SalesOrderID) AS TotalOrders,
	SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID


--PARA CORROBORAR VALORES, BUSCAR POR CLIENTE DETERMINADO
SELECT 
	CustomerId,
	OrderDate,
	TotalDue
FROM Sales.SalesOrderHeader
WHERE CustomerId = 22814

--CORROBORAR UNICIDAD (1 FILA POR CLIENTE)
SELECT * FROM
	(SELECT	
		CustomerId,
		COUNT(*) AS CANT
	FROM Analytics.VW_FactCustomerBase
	GROUP BY CustomerId) AS C
WHERE CANT <> 1


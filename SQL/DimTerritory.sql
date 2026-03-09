
USE AdventureWorks2019

-----------------------
--DIMENSION TERRITORY 
-----------------------

CREATE VIEW Analytics.VW_DimTerritoryRFM AS
SELECT	
	T.TerritoryID,
	T.Name AS TerritoryName,
	T.[Group],
	T.CountryRegionCode,
	C.Name AS CountryName
FROM Sales.SalesTerritory AS T
LEFT JOIN Person.CountryRegion AS C
ON T.CountryRegionCode = C.CountryRegionCode 
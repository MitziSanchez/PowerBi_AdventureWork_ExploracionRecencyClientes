
USE AdventureWorks2019

--TIPOS DE CLIENTES
--PARA LA DIMENSIÓN CLIENTE ES NECESARIO RECONOCER EL TIPO DE CLIENTE
/*AdventureWorks mantiene la tipificación en las propiedades de la columna [Person].[Person].[PersonType]
	Primary type of person: 
	SC = Store Contact
	IN = Individual (retail) customer
	SP = Sales person
	EM = Employee (non-sales)
	VC = Vendor contact
	GC = General contact
*/

--Se crea tabla tipo
CREATE TABLE Person.PersonType(
	PersonTypeID NCHAR(2) NOT NULL PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)


--VALORES
INSERT INTO Person.PersonType VALUES ('SC','Store Contact')
INSERT INTO Person.PersonType VALUES ('IN','Individual (retail) Customer')
INSERT INTO Person.PersonType VALUES ('SP','Sales Person')
INSERT INTO Person.PersonType VALUES ('EM','Employee (non-sales)')
INSERT INTO Person.PersonType VALUES ('VC','Vendor Contact')
INSERT INTO Person.PersonType VALUES ('GC','General Contact')

--CONSULTAR
SELECT * FROM Person.PersonType

--INCORPORAR FOREIGN KEY EN [Person].[Person]
ALTER TABLE Person.Person
ADD CONSTRAINT FK_Person_PersonType 
FOREIGN KEY (PersonType)
REFERENCES Person.PersonType (PersonTypeID)


-------------------------------
--DIMENSION CLIENTE
-------------------------------
CREATE VIEW Analytics.VW_DimCustomerRFM AS
SELECT 
	F.CustomerId,
	P.PersonType AS PersonTypeCode,
	PT.Name AS PersonTypeDescription,
	CASE PersonType 
		WHEN 'SC' THEN S.Name
		ELSE (P.FirstName + ' ' + ISNULL(P.MiddleName + ' ','') +  P.LastName)
		END AS Name,	
	C.TerritoryID
FROM Analytics.VW_FactCustomerBase AS F
LEFT JOIN Sales.Customer AS C
ON F.CustomerId = C.CustomerID
LEFT JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
LEFT JOIN Sales.Store AS S
ON C.StoreID = S.BusinessEntityID
LEFT JOIN Person.PersonType AS PT
ON P.PersonType = PT.PersonTypeID



--CONSULTAR DIMENSION
SELECT * FROM Analytics.VW_DimCustomerRFM
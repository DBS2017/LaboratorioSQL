--Mostrar la cantidad de nomnbres y apellidos departamento y estado Civil


--Mostar listado de Clientes que hicieron su orden de comprar en los meses de noviembre y diciembre del año 2012

SELECT Person.FirstName,
    CONCAT(MONTH(Sales.SalesOrderHeader.OrderDate), '/',YEAR(Sales.SalesOrderHeader.OrderDate))
FROM Sales.SalesOrderHeader
    INNER JOIN Sales.Customer
    on Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
    INNER JOIN Person.Person
    on Sales.Customer.PersonID = Person.BusinessEntityID
WHERE YEAR(Sales.SalesOrderHeader.OrderDate) = 2012 AND (MONTH(Sales.SalesOrderHeader.OrderDate) BETWEEN 11 AND 12)
SELECT Sales.SalesOrderHeader.CustomerID
FROM Sales.SalesOrderHeader
SELECT *
FROM Person.Person

--Mostrar la cantidad de ordenes de pedido atendidos por cada medio de envio 


Select Purchasing.ShipMethod.Name 'Medio de ENvio' ,
    COUNT(Purchasing.ShipMethod.Name ) AS 'Cantidad'
from Sales.SalesOrderHeader
INNER JOIN Purchasing.ShipMethod
on Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

--Mostrar la Cantidad de Ventas Realizadas de acuerdo al Pais

select Pais = 
CASE 
when  Sales.SalesTerritory.CountryRegionCode = 'AU' THEN 'AUSTRALIA'
when  Sales.SalesTerritory.CountryRegionCode = 'US' THEN 'Estados Unidos'
when  Sales.SalesTerritory.CountryRegionCode = 'DE' THEN 'ALEMANIA'
when  Sales.SalesTerritory.CountryRegionCode = 'FR' THEN 'FRANCIA'
when  Sales.SalesTerritory.CountryRegionCode = 'GB' THEN 'INGLATERRA'
when  Sales.SalesTerritory.CountryRegionCode = 'CA' THEN 'CANADA'
END,
Sales.SalesTerritory.Name AS ''




Sales.SalesTerritory.CountryRegionCode
from Sales.SalesOrderHeader
Inner JOIN Sales.SalesTerritory 
on  Sales.SalesTerritory.TerritoryID = Sales.SalesTerritory.CountryRegionCode

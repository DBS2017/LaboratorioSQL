USE AdventureWorks2016CTP3

SELECT ModifiedDate, City from Person.Address
WHERE YEAR(ModifiedDate)= '2014' and
MONTH(ModifiedDate)='01' AND 
 City = 'Beaverton'

 SELECT AddressLine2  from Person.Address
 where   AddressLine2  like  'B%'

 
 SELECT LastName,  PersonType from  Person.Person
 where LastName = 'Miller' and  PersonType = 'in'
 

 /*AND*/
SELECT * FROM HumanResources.Employee WHERE BusinessEntityID >= '10' AND BusinessEntityID <= '40'
go

/*NOT*/
SELECT * FROM HumanResources.Employee WHERE NOT Gender = 'M'; 

/*LIKE*/
SELECT FirstName FROM Person.Person
WHERE FirstName LIKE'P%'
go

/*IN*/
SELECT BusinessEntityID,FirstName, LastName  
FROM Person.Person  
WHERE FirstName IN ('Michael')
go

 /*AND- OR - LIKE */
SELECT BusinessEntityID,  JobTitle FROM HumanResources.Employee WHERE BusinessEntityID >= '10' 
AND BusinessEntityID <= '40'
OR JobTitle like 'S%'
go

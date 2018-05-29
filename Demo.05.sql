--  AND

select * from HumanResources.Employee 
where BusinessEntityID >='10' and BusinessEntityID <='20'


--like
select * from Person.Person
where FirstName like 'P%'

--NOT 

SELECT * FROM HumanResources.Employee 
where not gender = 'M'

--In
select * FROM Person.Person 
where FirstName in ('Michael')


--Or

select * from Sales.Customer
where StoreID > 100 
or (StoreID < 500 and StoreID > 600)












use AdventureWorks2016

SELECT * FROM Person.Person
Create view vw_Persona2
as 

SELECT FirstName, LastName  FROM Person.Person
where FirstName LIKE 'Adam'

select * from vw_Persona






Create view vw_Persona4
 as 
 Select 
 concat(FirstName, LastName) as Datos 
from Person.Person
where  LastName like 'Adams'


SELECT * from vw_Persona4





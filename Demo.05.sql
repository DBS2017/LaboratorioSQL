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
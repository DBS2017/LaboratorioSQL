USE AdventureWorks2016CTP3

SELECT * from Person.Address

Bothell

select ModifiedDate, City from Person.Address
WHERE YEAR(ModifiedDate)= '2014' and
MONTH(ModifiedDate)='01' AND 
 City = 'Beaverton'
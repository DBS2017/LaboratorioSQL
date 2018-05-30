
--Ejercicios con consultas y joins

-- Poner en uso la base de datos 
Use AdventureWorks2016

--Listado de esquemas pertenecientes a esta bd 

--Ver  de tabla  de bd en uso
select name from sys.tables;

--Ver estructura de una tabla especifica 
EXEC sp_help 'DimEmployee'

--Ver listad de departamento de la empresa

select * from  DimEmployee

--Visualizar los departamentos que pertenecen al grupo de MARKETIN Y VENTAS

select * FROM HumanResources.Department
where HumanResources.Department.GroupName like 'Sales and Marketing'


--Ver listado de todos los empleados
select * FROM HumanResources.Employee

--Ver listado de todos los empleados cuyo estado civil es casado
select HumanResources.Employee.BusinessEntityID as 'Codigo de Empleado',
 HumanResources.Employee.MaritalStatus AS 'Estado Civil'
FROM HumanResources.Employee 
where    HumanResources.Employee.MaritalStatus like  'M%'


--Ver listado de las ordenes de ventas
select * from Sales.SalesOrderHeader

--ver el codigo de las ordenes de ventas y su respectivo mes y año 
select Sales.SalesOrderHeader.SalesOrderID as 'Codigo de Orden',
DATENAME(MONTH,Sales.SalesOrderHeader.OrderDate) as 'mes',
YEAR(Sales.SalesOrderHeader.OrderDate) as 'Año'
FROM Sales.SalesOrderHeader
where year(Sales.SalesOrderHeader.OrderDate) = '2013'

---

select year (Sales.SalesOrderHeader.OrderDate) as 'año',
count(Sales.SalesOrderHeader.SalesOrderID) as 'Cantidad' 
from Sales.SalesOrderHeader
where  year(Sales.SalesOrderHeader.OrderDate)= 2011
GROUP by YEAR(Sales.SalesOrderHeader.OrderDate)


--visualizar la cantidad de ventas por mes del año 2011

select year(Sales.SalesOrderHeader.OrderDate) as 'año',
DATENAME(MONTH,Sales.SalesOrderHeader.OrderDate) as 'mes',
COUNT(Sales.SalesOrderHeader.OrderDate) as 'cantidad'
FROM Sales.SalesOrderHeader
where year(Sales.SalesOrderHeader.OrderDate) = 2011
GROUP by year(Sales.SalesOrderHeader.OrderDate),
datename(MONTH,sales.SalesOrderHeader.OrderDate)



--cantidad de empleados por cargo
SELECT COUNT (HumanResources.Employee.BusinessEntityID) as 'total',
HumanResources.Employee.JobTitle as 'Cargo'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC 


--Listado de empleados Nombre, Apellido y Departamento
SELECT Person.FirstName as Nombre, Person.LastName as Apellido,
HumanResources.Department.Name AS departamento 
from HumanResources.EmployeeDepartmentHistory        
INNER join Person.Person
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID

--Muestrame la cantidad de empleados por departamento

SELECT COUNT (HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS 'TOTAL',
HumanResources.Department.name AS departamento
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.Name
GO

/*Muestrame la cantidad de empleados por estado civil en cada departamento*/

SELECT HumanResources.Department.Name as 'Departament',
HumanResources.Employee.MaritalStatus AS 'Estado Civil',
COUNT (HumanResources.Employee.BusinessEntityID) AS 'TOTAL'
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory
on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID,
HumanResources.Department.Name
GO


--Muestrame el listado de clientes que hicieron sus orden de compra en los meses de noviembre y diciembre del año 2012 




--Listado de empleados Nombre, Apellido y Departamento
SELECT Person.FirstName as Nombre, Person.LastName as Apellido,
HumanResources.Department.Name AS departamento 
from HumanResources.EmployeeDepartmentHistory        
INNER join Person.Person
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID

--cantidad de empleados por cargo
SELECT COUNT (HumanResources.Employee.BusinessEntityID) as 'total',
HumanResources.Employee.JobTitle as 'Cargo'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC 
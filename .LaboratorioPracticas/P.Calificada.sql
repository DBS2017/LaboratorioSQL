--Se nesecita listar los empleados y sus respectivos departamento en el que laboran




Create VIEW  vw_EmpDepart 
as
select FirstName, DepartmentName from DimEmployee;

SELECT * From VIEW vw_EmpDepart;


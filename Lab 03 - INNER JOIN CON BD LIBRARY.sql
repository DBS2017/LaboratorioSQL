USE dbLibrary


--Titulo de Libro, Fecha de SALIDA, Nombre Bibliotecaria
CREATE VIEW vw_VistasLibreria as 

SELECT Prestamos.fecsalPrestamo, Bibliotecario.nomBibliotecario, Libro.tituloLibro
FROM Prestamos
INNER join Bibliotecario 
on Prestamos.Bibliotecario_idBibliotecario = Bibliotecario_idBibliotecario
INNER join Detalle_Prestamo
on Detalle_Prestamo.Libro_idLibro = Libro_idLibro
Inner join Libro
on Detalle_Prestamo.idDetPrest = idDetPrest 


SELECT * from vw_VistasLibreria


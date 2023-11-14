USE BDZapatoApp;

-- Obtener la cantidad disponible de productos en la categoría 'Running' con precio superior a $100
SELECT Nombre, Precio, Cantidad_Inventario
FROM PRODUCTO
WHERE CATEGORIA_idCategoria = (SELECT idCategoria FROM CATEGORIA WHERE Nombre = 'Running') AND Precio > 100;

-- Obtener la cantidad total de ventas realizadas por cada empleado
SELECT E.Nombre AS Empleado, (SELECT COUNT(*) FROM VENTA WHERE EMPLEADO_idEmpleado = E.idEmpleado) AS TotalVentas
FROM EMPLEADO E;

-- Obtener el nombre del producto y la diferencia entre su precio y el precio promedio de la categoría
SELECT 
  Nombre,
  Precio,
  Precio - (SELECT AVG(Precio) FROM PRODUCTO WHERE CATEGORIA_idCategoria = P.CATEGORIA_idCategoria) AS DiferenciaPrecioPromedio
FROM 
  PRODUCTO P;



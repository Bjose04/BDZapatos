USE BDZapatoApp;

DELIMITER //

CREATE PROCEDURE InsertarEmpleado(IN p_Nombre VARCHAR(90), IN p_Cargo VARCHAR(35), IN p_Info_Contacto VARCHAR(100))
BEGIN
  INSERT INTO EMPLEADO (Nombre, Cargo, Informacion_Contacto) VALUES (p_Nombre, p_Cargo, p_Info_Contacto);
END //

DELIMITER ;
-- Llamada al procedimiento InsertarEmpleado
CALL InsertarEmpleado('Juan Jattin', 'Vendedor', 'juan.Jattin@gmail.com');
SELECT * FROM bdzapatoapp.empleado;

DELIMITER //

CREATE PROCEDURE ActualizarPrecioCategoria(IN p_Categoria VARCHAR(50), IN p_NuevoPrecio DECIMAL(10, 2))
BEGIN
  UPDATE PRODUCTO
  SET Precio = p_NuevoPrecio
  WHERE CATEGORIA_idCategoria = (SELECT idCategoria FROM CATEGORIA WHERE Nombre = p_Categoria);
END //

DELIMITER ;
CALL ActualizarPrecioCategoria('Running', 129.99);
SELECT * FROM bdzapatoapp.producto;

DELIMITER //

CREATE PROCEDURE RealizarVenta(IN p_EmpleadoID INT, IN p_Fecha DATE, IN p_MetodoPago VARCHAR(50), IN p_Total DECIMAL(10, 2))
BEGIN
  INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Total) VALUES (p_EmpleadoID, p_Fecha, p_MetodoPago, p_Total);
END //

DELIMITER ;
CALL RealizarVenta(1, '2023-11-15', 'Tarjeta de crédito', 150.50);
SELECT * FROM bdzapatoapp.venta;
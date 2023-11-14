USE BDZapatoApp;

DELIMITER //

CREATE TRIGGER AfterUpdatePrecioProducto
AFTER UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
  IF NEW.Precio != OLD.Precio THEN
    INSERT INTO HistorialCambiosPrecio (ProductoID, PrecioAntiguo, PrecioNuevo, FechaCambio)
    VALUES (NEW.idProducto, OLD.Precio, NEW.Precio, NOW());
  END IF;
END //

DELIMITER ;
-- Realizar una actualización en el precio del producto con ID 1
UPDATE PRODUCTO
SET Precio = 75.99
WHERE idProducto = 1;
-- Consultar el historial de cambios de precios
SELECT * FROM HistorialCambiosPrecio;

ALTER TABLE EMPLEADO
ADD COLUMN TotalVentas DECIMAL(10, 2) DEFAULT 0;
DELIMITER //

CREATE TRIGGER ActualizarTotalVentas
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
  UPDATE EMPLEADO
  SET TotalVentas = TotalVentas + NEW.Total
  WHERE idEmpleado = NEW.EMPLEADO_idEmpleado;
END //

DELIMITER ;
-- Insertar una nueva venta asociada al empleado con idEmpleado
INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Total)
VALUES (1, '2023-11-15', 'Tarjeta', 120.50);
-- Consultar el empleado para ver su total de ventas
SELECT * FROM EMPLEADO WHERE idEmpleado = 1;


ALTER TABLE PRODUCTO
ADD COLUMN FechaModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DELIMITER //

CREATE TRIGGER ActualizarFechaModificacion
BEFORE UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
  SET NEW.FechaModificacion = NOW();
END //

DELIMITER ;
-- Realizar una actualización en un producto (ajusta el ID según tus datos)
UPDATE PRODUCTO
SET Descripcion = 'Perfectos para actividades fisicas'
WHERE idProducto = 2;
SELECT * FROM bdzapatoapp.producto;


 





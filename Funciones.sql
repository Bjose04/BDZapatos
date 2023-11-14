USE BDZapatoApp;

DELIMITER //

CREATE FUNCTION CalcularTotalVenta(p_Precio DECIMAL(10, 2), p_Cantidad INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10, 2);
  SET total = p_Precio * p_Cantidad;
  RETURN total;
END //

DELIMITER ;
SELECT CalcularTotalVenta(50.25, 3) AS TotalVenta;

DELIMITER //

DELIMITER //

CREATE FUNCTION CalcularDescuento(p_TotalVenta DECIMAL(10, 2), p_PorcentajeDescuento DECIMAL(5, 2)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
  DECLARE descuento DECIMAL(10, 2);

  -- Calcular el descuento
  SET descuento = p_TotalVenta * (p_PorcentajeDescuento / 100);

  RETURN descuento;
END //

DELIMITER ;
SELECT CalcularDescuento(150.00, 10.0) AS DescuentoAplicado;


DELIMITER //

CREATE FUNCTION ObtenerCantidadEnInventario(p_ProductoID INT) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE cantidadDisponible INT;

  -- Obtener la cantidad disponible en el inventario para el producto dado
  SELECT Cantidad_Inventario INTO cantidadDisponible
  FROM PRODUCTO
  WHERE idProducto = p_ProductoID;

  -- Retornar la cantidad disponible
  RETURN cantidadDisponible;
END //

DELIMITER ;
SELECT ObtenerCantidadEnInventario(1) AS CantidadEnInventario;




















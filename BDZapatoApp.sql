CREATE DATABASE BDZapatoApp;
USE BDZapatoApp;

CREATE TABLE INVENTARIO (
  idInventario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Ubicacion VARCHAR(100)  NULL  ,
  Cantidad_Disponible INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idInventario));



CREATE TABLE PROVEEDOR (
  idProveedor INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre VARCHAR(50)  NULL  ,
  Informacion_Contacto VARCHAR(100)  NULL  ,
  Direccion VARCHAR(100)  NULL    ,
PRIMARY KEY(idProveedor));



CREATE TABLE CATEGORIA (
  idCategoria INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre VARCHAR(50)  NULL  ,
  Descripcion TEXT  NULL    ,
PRIMARY KEY(idCategoria));



CREATE TABLE EMPLEADO (
  idEmpleado INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre VARCHAR(90)  NULL  ,
  Cargo VARCHAR(35)  NULL  ,
  Informacion_Contacto VARCHAR(100)  NULL    ,
PRIMARY KEY(idEmpleado));



CREATE TABLE VENTA (
  idVenta INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  EMPLEADO_idEmpleado INTEGER UNSIGNED  NOT NULL  ,
  Fecha DATE  NULL  ,
  Metodo_Pago VARCHAR(50)  NULL  ,
  Total DECIMAL(10, 2)  NULL    ,
PRIMARY KEY(idVenta, EMPLEADO_idEmpleado)  ,
INDEX VENTA_FKIndex1(EMPLEADO_idEmpleado),
  FOREIGN KEY(EMPLEADO_idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE PRODUCTO (
  idProducto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  Nombre VARCHAR(40)  NULL  ,
  Descripcion TEXT  NULL  ,
  Precio INTEGER UNSIGNED  NULL  ,
  Marca VARCHAR(20)  NULL  ,
  Proveedor VARCHAR(40)  NULL  ,
  Categoria VARCHAR(50)  NULL  ,
  Cantidad_Inventario INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)  ,
INDEX PRODUCTO_FKIndex1(PROVEEDOR_idProveedor)  ,
INDEX PRODUCTO_FKIndex2(CATEGORIA_idCategoria),
  FOREIGN KEY(PROVEEDOR_idProveedor)
    REFERENCES PROVEEDOR(idProveedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(CATEGORIA_idCategoria)
    REFERENCES CATEGORIA(idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE VENTA_has_PRODUCTO (
  VENTA_idVenta INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_idProducto INTEGER UNSIGNED  NOT NULL  ,
  VENTA_EMPLEADO_idEmpleado INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(VENTA_idVenta, PRODUCTO_CATEGORIA_idCategoria, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_idProducto, VENTA_EMPLEADO_idEmpleado)  ,
INDEX VENTA_has_PRODUCTO_FKIndex1(VENTA_idVenta, VENTA_EMPLEADO_idEmpleado)  ,
INDEX VENTA_has_PRODUCTO_FKIndex2(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria),
  FOREIGN KEY(VENTA_idVenta, VENTA_EMPLEADO_idEmpleado)
    REFERENCES VENTA(idVenta, EMPLEADO_idEmpleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria)
    REFERENCES PRODUCTO(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE INVENTARIO_has_PRODUCTO (
  INVENTARIO_idInventario INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_idProducto INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(INVENTARIO_idInventario, PRODUCTO_CATEGORIA_idCategoria, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_idProducto)  ,
INDEX INVENTARIO_has_PRODUCTO_FKIndex1(INVENTARIO_idInventario)  ,
INDEX INVENTARIO_has_PRODUCTO_FKIndex2(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria),
  FOREIGN KEY(INVENTARIO_idInventario)
    REFERENCES INVENTARIO(idInventario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria)
    REFERENCES PRODUCTO(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);
      
      CREATE TABLE HistorialCambiosPrecio (
  idCambio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ProductoID INT UNSIGNED,
  PrecioAntiguo DECIMAL(10, 2),
  PrecioNuevo DECIMAL(10, 2),
  FechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ProductoID) REFERENCES PRODUCTO(idProducto) ON DELETE CASCADE
);

      
      INSERT INTO INVENTARIO (Ubicacion, Cantidad_Disponible) VALUES
('Almacén A', 50),
('Almacén B', 30),
('Tienda Principal', 25),
('Tienda Secundaria', 15),
('Depósito Central', 40),
('Tienda Outlet', 10),
('Almacén C', 20),
('Tienda Online', 5),
('Tienda de Barrio', 12),
('Almacén D', 18),
('Almacén E', 22),
('Tienda Especializada', 8),
('Almacén F', 35),
('Almacén G', 28),
('Almacén H', 45),
('Tienda de Lujo', 3),
('Almacén I', 14),
('Almacén J', 32),
('Tienda de Descuentos', 7),
('Almacén K', 19);

INSERT INTO PROVEEDOR (Nombre, Informacion_Contacto, Direccion) VALUES
('Zapatos Express', 'info@zapatosexpress.com', 'Calle de la Moda 123, Ciudad Estilosa'),
('Calzados Rápidos', 'info@calzadosrapidos.com', 'Avenida de la Elegancia 456, Ciudad Chic'),
('Distribuidora ModaVIP', 'info@modavip.com', 'Bulevar de la Tendencia 789, Ciudad Fashion'),
('FashionFeet', 'info@fashionfeet.com', 'Carrera de la Elegancia 321, Ciudad Trendy'),
('Estilo Urbano', 'info@estilourbano.com', 'Pasaje de la Modernidad 654, Ciudad Urbana'),
('Pies a la Moda', 'info@piesalamoda.com', 'Plaza de la Tendencia 987, Ciudad Fashionista'),
('Calzados Elegantes', 'info@calzadoselegantes.com', 'Avenida de la Sofisticación 234, Ciudad Chic'),
('Zapatería de Vanguardia', 'info@vanguardiazapatos.com', 'Calle de la Innovación 567, Ciudad Moderna'),
('Moda para los Pies', 'info@modapies.com', 'Bulevar de la Estilización 890, Ciudad Estilosa'),
('Trendy Shoes Co.', 'info@trendyshoes.com', 'Carrera de la Modernidad 432, Ciudad Trendy'),
('Elegance Footwear', 'info@elegancefootwear.com', 'Pasaje de la Elegancia 765, Ciudad Elegante'),
('Zapatos a la Moda', 'info@zapatosalamoda.com', 'Plaza de la Tendencia 109, Ciudad Fashionista'),
('Fashion Forward Shoes', 'info@fashionforwardshoes.com', 'Avenida de la Vanguardia 876, Ciudad Moderna'),
('Chic Styles Footwear', 'info@chicstylesfootwear.com', 'Calle de la Sofisticación 543, Ciudad Chic'),
('Moda y Estilo Zapatería', 'info@modayestilozapatos.com', 'Bulevar de la Moda 210, Ciudad Estilosa'),
('Trendsetter Shoes', 'info@trendsettershoes.com', 'Carrera de la Tendencia 789, Ciudad Trendy'),
('Innovative Footwear Co.', 'info@innovativefootwear.com', 'Pasaje de la Innovación 876, Ciudad Moderna'),
('Urban Chic Shoes', 'info@urbanchicshoes.com', 'Plaza de la Elegancia 543, Ciudad Elegante'),
('Moda Urbana Zapatería', 'info@modaurbanazapatos.com', 'Avenida de la Modernidad 210, Ciudad Urbana'),
('Sofisticados Pies', 'info@sofisticadospies.com', 'Calle de la Sofisticación 987, Ciudad Chic');


INSERT INTO EMPLEADO (Nombre, Cargo, Informacion_Contacto) VALUES
('Juan Pérez', 'Vendedor', 'juan.perez@email.com'),
('María González', 'Gerente de Tienda', 'maria.gonzalez@email.com'),
('Carlos Rodríguez', 'Cajero', 'carlos.rodriguez@email.com'),
('Ana Martínez', 'Asistente de Almacén', 'ana.martinez@email.com'),
('Luis Sánchez', 'Supervisor de Ventas', 'luis.sanchez@email.com'),
('Laura Díaz', 'Vendedor', 'laura.diaz@email.com'),
('José Ramírez', 'Gerente de Almacén', 'jose.ramirez@email.com'),
('Sofía López', 'Cajera', 'sofia.lopez@email.com'),
('Pedro Torres', 'Vendedor', 'pedro.torres@email.com'),
('Elena García', 'Asistente de Tienda', 'elena.garcia@email.com'),
('Miguel Gómez', 'Supervisor de Almacén', 'miguel.gomez@email.com'),
('Paola Vargas', 'Gerente de Ventas', 'paola.vargas@email.com'),
('Héctor Mendoza', 'Cajero', 'hector.mendoza@email.com'),
('Rosa Flores', 'Vendedora', 'rosa.flores@email.com'),
('Andrés Cordero', 'Asistente de Almacén', 'andres.cordero@email.com'),
('Carmen Ruiz', 'Supervisora de Ventas', 'carmen.ruiz@email.com'),
('Javier Núñez', 'Gerente de Tienda', 'javier.nunez@email.com'),
('Isabel Castro', 'Cajera', 'isabel.castro@email.com'),
('Gabriel Silva', 'Vendedor', 'gabriel.silva@email.com'),
('Martha Ortega', 'Asistente de Tienda', 'martha.ortega@email.com');


INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Total) VALUES
(1, '2023-11-01', 'Tarjeta de Crédito', 150.75),
(3, '2023-11-02', 'Efectivo', 75.40),
(5, '2023-11-03', 'Transferencia Bancaria', 120.00),
(7, '2023-11-04', 'Tarjeta de Débito', 200.25),
(9, '2023-11-05', 'Efectivo', 50.80),
(11, '2023-11-06', 'Tarjeta de Crédito', 180.50),
(13, '2023-11-07', 'Efectivo', 90.30),
(15, '2023-11-08', 'Transferencia Bancaria', 160.20),
(17, '2023-11-09', 'Tarjeta de Débito', 110.90),
(19, '2023-11-10', 'Efectivo', 130.75),
(2, '2023-11-11', 'Tarjeta de Crédito', 95.60),
(4, '2023-11-12', 'Efectivo', 70.25),
(6, '2023-11-13', 'Transferencia Bancaria', 185.30),
(8, '2023-11-14', 'Tarjeta de Débito', 140.45),
(10, '2023-11-15', 'Efectivo', 75.90),
(12, '2023-11-16', 'Tarjeta de Crédito', 200.00),
(14, '2023-11-17', 'Efectivo', 110.25),
(16, '2023-11-18', 'Transferencia Bancaria', 95.80),
(18, '2023-11-19', 'Tarjeta de Débito', 120.50),
(20, '2023-11-20', 'Efectivo', 180.75);

INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Running', 'Zapatos diseñados específicamente para correr y actividades deportivas'),
('Casuales Deportivos', 'Zapatos casuales con un toque deportivo para un estilo relajado'),
('Botas', 'Calzado que cubre el tobillo o parte de la pierna, ideal para diversas condiciones'),
('Formales de Lujo', 'Zapatos de alta calidad y diseño elegante para eventos formales'),
('Sandalias', 'Calzado abierto y ligero, perfecto para climas cálidos y uso informal'),
('Botines', 'Zapatos que cubren el tobillo pero son más bajos que las botas, versátiles para diferentes ocasiones');

INSERT INTO PRODUCTO (PROVEEDOR_idProveedor, CATEGORIA_idCategoria, Nombre, Descripcion, Precio, Marca, Proveedor, Categoria, Cantidad_Inventario) VALUES
(1, 1, 'Zapatillas de Running Avanzadas', 'Diseñadas para corredores exigentes', 119.99, 'RunMax', 'Zapatos Express', 'Running', 25),
(2, 1, 'Zapatos para Trail Running Resistentes', 'Perfectos para terrenos accidentados', 129.99, 'TrailBlazer', 'Calzados Rápidos', 'Running', 30),
(3, 2, 'Sneakers de Estilo Deportivo', 'Combinan moda y comodidad', 79.99, 'SportyChic', 'Distribuidora ModaVIP', 'Casuales Deportivos', 35),
(4, 2, 'Zapatos Casuales Urbanos', 'Estilo moderno para el día a día', 69.99, 'UrbanCasual', 'FashionFeet', 'Casuales Deportivos', 40),
(5, 3, 'Botas de Montaña Resistentes al Agua', 'Protección total para aventuras al aire libre', 149.99, 'WaterproofHiker', 'Estilo Urbano', 'Botas', 18),
(6, 3, 'Botas de Cuero con Estilo Casual', 'Elegancia y comodidad en un solo diseño', 129.99, 'CasualLeatherBoots', 'Calzados Elegantes', 'Botas', 22),
(7, 4, 'Zapatos Oxford de Lujo', 'Elegancia atemporal para eventos formales', 189.99, 'LuxuryOxford', 'Zapatería de Vanguardia', 'Formales de Lujo', 12),
(8, 4, 'Zapatos de Vestir de Piel de Cocodrilo', 'Exclusividad y estilo para ocasiones especiales', 229.99, 'CrocodileElegance', 'Pies a la Moda', 'Formales de Lujo', 8),
(9, 5, 'Sandalias Planas con Diseño Bohemio', 'Estilo relajado para días soleados', 49.99, 'BohoFlats', 'Moda para los Pies', 'Sandalias', 20),
(10, 5, 'Sandalias de Tacón Alto para Fiesta', 'Elegancia y sofisticación en cada paso', 69.99, 'HighHeelParty', 'Trendsetter Shoes', 'Sandalias', 25),
(11, 6, 'Botines de Ante con Hebillas', 'Diseño moderno para un look atrevido', 89.99, 'SuedeBuckleBooties', 'Innovative Footwear Co.', 'Botines', 15),
(12, 6, 'Botines de Cuero con Tacones Gruesos', 'Estilo versátil y cómodo', 79.99, 'LeatherChunkyHeel', 'Urban Chic Shoes', 'Botines', 18),
(13, 1, 'Zapatos para Correr Minimalistas', 'Diseño ligero y flexible para una experiencia natural', 99.99, 'MinimalRun', 'Fashion Forward Shoes', 'Running', 30),
(14, 1, 'Zapatillas de Running con Amortiguación', 'Confort y soporte para largas distancias', 119.99, 'CushionRun', 'Chic Styles Footwear', 'Running', 25),
(15, 2, 'Sneakers con Detalles Reflectantes', 'Estilo deportivo con toques modernos', 84.99, 'ReflectiveSport', 'Moda Urbana Zapatería', 'Casuales Deportivos', 35),
(16, 2, 'Zapatos Deportivos de Malla Transpirable', 'Comodidad y frescura para actividades diarias', 74.99, 'BreathableMesh', 'Sofisticados Pies', 'Casuales Deportivos', 30),
(17, 3, 'Botas de Combate de Cuero', 'Estilo militar con durabilidad excepcional', 119.99, 'CombatLeather', 'Zapatos a la Moda', 'Botas', 25),
(18, 3, 'Botas de Moda con Detalles Metálicos', 'Diseño moderno para un look vanguardista', 129.99, 'MetallicFashionBoots', 'FashionFeet', 'Botas', 22),
(19, 4, 'Zapatos de Vestir con Bordados', 'Elegancia con detalles sofisticados', 169.99, 'EmbroideredElegance', 'Trendy Shoes Co.', 'Formales de Lujo', 10),
(20, 4, 'Mocasines de Lujo con Hebilla', 'Estilo atemporal con un toque moderno', 149.99, 'LuxuryLoafers', 'Elegance Footwear', 'Formales de Lujo', 15);



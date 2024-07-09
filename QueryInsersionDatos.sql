USE TPCuatrimestral;
GO

-- Inserción de datos en la tabla Categorias
INSERT INTO Categorias (Nombre) VALUES 
('Panadería'),
('Repostería');

-- Inserción de datos en la tabla Marcas
INSERT INTO Marcas (Nombre) VALUES 
('Hache'),
('Rochino'),
('El galpon'),
('Boutique'),
('Las Quinas');

-- Inserción de datos en la tabla Articulos
INSERT INTO Articulos (Stock, Nombre, Precio_Unitario, ID_Categoria, ID_Marca) VALUES 
(100, 'Brownie', 3990.00, 2, 1),
(80, 'Lemonie', 2850.00, 2, 2),
(60, 'Frola', 2750, 2, 3),
(90, 'Cookies Choco', 3100.00, 2, 4),
(50, 'Cookies Miel', 2900.00, 2, 5),
(120, 'Cookies Almendras', 3200.00, 2, 1),
(200, 'Alfajores Choco', 4600.00, 1, 2),
(180, 'Alfajores Sablee', 4600.00, 1, 3),
(150, 'Alfajores Maicena', 4600.00, 1, 4);

-- Inserción de datos en la tabla Imagenes
INSERT INTO Imagenes (ID_Articulo, URL_Imagen) VALUES 
(1, 'https://i.imgur.com/PSti4qH.jpeg'),
(2, 'https://i.imgur.com/6WZ0WPP.jpeg'),
(3, 'https://i.imgur.com/qj9nnDq.jpeg'),
(4, 'https://i.imgur.com/u6lDS3X.jpeg'),
(5, 'https://i.imgur.com/biGdoiR.jpeg'),
(6, 'https://i.imgur.com/l5DFzyB.jpeg'),
(7, 'https://i.imgur.com/qJvDcSC.jpeg'),
(8, 'https://i.imgur.com/C89u87L.jpeg'),
(9, 'https://i.imgur.com/jZPfGls.jpeg');

-- Inserción de datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Legajo, Contrasenia) VALUES 
('Juan', 'Pérez', 1234, 'password123'),
('María', 'Gómez', 5678, 'password456'),
('Carlos', 'Fernández', 9101, 'password789'),
('Laura', 'Martínez', 1121, 'password321'),
('Pedro', 'Rodríguez', 3141, 'password654'),
('Ana', 'López', 5161, 'password987'),
('Luis', 'González', 7181, 'password432'),
('Carmen', 'Hernández', 9201, 'password111'),
('Jorge', 'Díaz', 1222, 'password222'),
('Sofía', 'Romero', 3242, 'password333');

-- Inserción de datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Direccion, Mail, Telefono, DNI) VALUES 
('Daniela', 'Bentancor', '123 Calle Falsa', 'Daniela.Bent@example.com', '123456789', '12345678'),
('Bruno', 'Bassini', '456 Avenida Siempreviva', 'Bruno.Bas@example.com', '987654321', '87654321'),
('Sergio', 'Sánchez', '789 Camino Real', 'Sergio.San@example.com', '564738291', '11223344'),
('Ana', 'Pérez', '1010 Plaza Mayor', 'ana.perez@example.com', '374829102', '55667788'),
('Jose', 'Fernández', '1111 Gran Vía', 'jose.fernandez@example.com', '938475610', '99887766');

-- Inserción de datos en la tabla Proveedores
INSERT INTO Proveedores(Direccion, Provincia, Mail, Telefono) VALUES 
('456 Calle Arroyo', 'Cordoba', 'benito.fernandez@example.com', '2215894512'),
('123 Avenida Rivadavia','Buenos Aires', 'pedro.moscuzza@example.com', '2246789521'),
('567 Camino Principal','Mendoza', 'mateo.dicarlo@example.com', '2248451256'),
('765 General Mayor', 'Santa Fe', 'jose.leon.suarez@example.com', '2272564512'),
('657 Antonio Vespucio', 'Buenos Aires', 'jose.sito@example.com', '2234562356');

-- Inserción de datos en la tabla Ventas
INSERT INTO Ventas (ID_Empleado, ID_Cliente, Fecha, Subtotal, Total, EsPedidosYa) VALUES 
(1, 1, GETDATE(), 4990.00, 4990.00, 0),
(2, 2, GETDATE(), 4990.00, 4990.00, 0),
(3, 3, GETDATE(), 4990.00, 4990.00, 0),
(4, 4, GETDATE(), 4990.00, 4990.00, 1),
(5, 5, GETDATE(), 6350.00, 6350.00, 0),
(6, 1, GETDATE(), 3990.00, 3990.00, 0),
(7, 2, GETDATE(), 4600.00, 4600.00, 1),
(8, 3, GETDATE(), 4600.00, 4600.00, 0),
(9, 4, GETDATE(), 4600.00, 4600.00, 1),
(10, 5, GETDATE(), 4600.00, 4600.00, 0);

-- Inserción de datos en la tabla DetallesVentas
INSERT INTO DetallesVentas (ID_Venta, ID_Articulo, Cantidad, Precio_Unitario, Porcentaje_Descuento) VALUES 
(1, 1, 1, 4990.00, NULL),
(2, 2, 1, 4990.00, NULL),
(3, 3, 1, 4990.00, NULL),
(4, 4, 1, 4990.00, NULL),
(5, 5, 1, 6350.00, NULL),
(6, 6, 1, 3990.00, NULL),
(7, 7, 1, 4600.00, NULL),
(8, 8, 1, 4600.00, NULL),
(9, 9, 1, 4600.00, NULL),
(10, 3, 1, 4990.00, NULL);

-- Inserción de datos en la tabla HistorialPrecios
INSERT INTO HistorialPrecios (ID_Articulo, Precio_Anterior, Precio_Nuevo) VALUES 
(1, 4500.00, 4990.00),
(2, 4500.00, 4990.00),
(3, 4500.00, 4990.00),
(4, 4500.00, 4990.00),
(5, 6000.00, 6350.00),
(6, 3500.00, 3990.00),
(7, 4200.00, 4600.00),
(8, 4200.00, 4600.00),
(9, 4200.00, 4600.00);

-- Inserción de datos en la tabla Usuarios
INSERT INTO Usuarios (Usuario, NombreCompleto, Contrasenia, TipoUsuario, CorreoElectronico) VALUES 
('Daniela', 'Daniela Bentancor', 'admin1', 1, 'Daniela.Bent@example.com'),
('admin2', 'Administrador Dos', 'adminpass2', 1, 'admin2@example.com'),
('ventas1', 'Vendedor Uno', 'ventaspas1', 2, 'ventas1@example.com'),
('ventas2', 'Vendedor Dos', 'ventaspas2', 2, 'ventas2@example.com'),
('ventas3', 'Vendedor Tres', 'ventaspas3', 2, 'ventas3@example.com');
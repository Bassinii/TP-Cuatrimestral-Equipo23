USE TPCuatrimestral;
GO

-- Inserción de datos en la tabla Categorias
INSERT INTO Categorias (Nombre) VALUES 
('Panadería'),
('Repostería');

-- Inserción de datos en la tabla Marcas
INSERT INTO Marcas (Nombre) VALUES 
('Marca1'),
('Marca2'),
('Marca3'),
('Marca4'),
('Marca5');

-- Inserción de datos en la tabla Articulos
INSERT INTO Articulos (Stock, Nombre, Precio_Unitario, ID_Categoria, ID_Marca) VALUES 
(100, 'Budin Grande Chocolate & Chips', 4990.00, 2, 1),
(80, 'Budin Grande Limon & Amapola', 4990.00, 2, 2),
(60, 'Budin Grande Carrot & Nueces', 4990.00, 2, 3),
(90, 'Budin Grande Naranja & Chia', 4990.00, 2, 4),
(50, 'Bandeja de Surtidas', 6350.00, 2, 5),
(120, 'Cuadrado de Brownie', 3990.00, 2, 1),
(200, 'Pan Blanco', 4600.00, 1, 2),
(180, 'Pan Negro', 4600.00, 1, 3),
(150, 'Pan de Semillas', 4600.00, 1, 4);

-- Inserción de datos en la tabla Imagenes
INSERT INTO Imagenes (ID_Articulo, URL_Imagen) VALUES 
(1, 'https://example.com/image1.jpg'),
(2, 'https://example.com/image2.jpg'),
(3, 'https://example.com/image3.jpg'),
(4, 'https://example.com/image4.jpg'),
(5, 'https://example.com/image5.jpg'),
(6, 'https://example.com/image6.jpg'),
(7, 'https://example.com/image7.jpg'),
(8, 'https://example.com/image8.jpg'),
(9, 'https://example.com/image9.jpg');

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
INSERT INTO Clientes (Nombre, Apellido, Direccion, Mail, Telefono) VALUES 
('Daniela', 'Bentancor', '123 Calle Falsa', 'Daniela.Bent@example.com', '123456789'),
('Bruno', 'Bassini', '456 Avenida Siempreviva', 'Bruno.Bas@example.com', '987654321'),
('Sergio', 'Sánchez', '789 Camino Real', 'Sergio.San@example.com', '564738291'),
('Ana', 'Pérez', '1010 Plaza Mayor', 'ana.perez@example.com', '374829102'),
('Jose', 'Fernández', '1111 Gran Vía', 'jose.fernandez@example.com', '938475610');

-- Inserción de datos en la tabla Ventas
INSERT INTO Ventas (ID_Empleado, ID_Cliente, Fecha, Hora, Subtotal, Total, EsPedidosYa) VALUES 
(1, 1, GETDATE(), '10:00:00', 4990.00, 4990.00, 0),
(2, 2, GETDATE(), '11:00:00', 4990.00, 4990.00, 0),
(3, 3, GETDATE(), '12:00:00', 4990.00, 4990.00, 0),
(4, 4, GETDATE(), '13:00:00', 4990.00, 4990.00, 1),
(5, 5, GETDATE(), '14:00:00', 6350.00, 6350.00, 0),
(6, 1, GETDATE(), '15:00:00', 3990.00, 3990.00, 0),
(7, 2, GETDATE(), '16:00:00', 4600.00, 4600.00, 1),
(8, 3, GETDATE(), '17:00:00', 4600.00, 4600.00, 0),
(9, 4, GETDATE(), '18:00:00', 4600.00, 4600.00, 1),
(10, 5, GETDATE(), '19:00:00', 4600.00, 4600.00, 0);

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
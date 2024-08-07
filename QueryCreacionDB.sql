-- Esta Query crea una basde de datos que tiene todas las tablas, stored procedures y vistas
-- para el despliegue de la aplicacion del TPCuatrimestral.
-- Hay otra Query en el proyecto para la insersión de datos de test.

CREATE DATABASE TPCuatrimestral;
GO
USE TPCuatrimestral;
GO

CREATE TABLE Categorias (
    ID_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Marcas (
    ID_Marca INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Articulos (
    ID_Articulo INT IDENTITY(1,1) PRIMARY KEY,
    Stock INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Precio_Unitario DECIMAL(8, 2) NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Marca INT NOT NULL,
    CONSTRAINT FK_Articulos_Categorias FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    CONSTRAINT FK_Articulos_Marcas FOREIGN KEY (ID_Marca) REFERENCES Marcas(ID_Marca)
);

CREATE TABLE Imagenes (
    ID_Imagen INT IDENTITY(1,1) PRIMARY KEY,
    ID_Articulo INT NOT NULL,
    URL_Imagen VARCHAR(300) NOT NULL,
);

CREATE TABLE Empleados(
    ID_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Legajo INT NULL,
    Contrasenia VARCHAR(200) NOT NULL
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Mail VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
	DNI VARCHAR(20) NOT NULL
);

CREATE TABLE Proveedores (
    ID_Proveedor INT IDENTITY(1,1) PRIMARY KEY,
    Direccion VARCHAR(50) NOT NULL,
    Provincia VARCHAR(50) NOT NULL,
    Mail VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);


CREATE TABLE Ventas (
    ID_Venta INT IDENTITY(1,1) PRIMARY KEY,
    ID_Empleado INT NOT NULL,
	ID_Cliente INT NOT NULL,  -- Nueva columna para clientes
    Fecha DATETIME DEFAULT GETDATE() NOT NULL,
    Hora TIME NULL,
    Subtotal DECIMAL(8,2) NOT NULL,
    Total DECIMAL(8, 2) NOT NULL,
    EsPedidosYa BIT NULL,
    CONSTRAINT FK_Ventas_Empleados FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
	CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) 
);

CREATE TABLE DetallesVentas (
    ID_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    ID_Venta INT NOT NULL,
    ID_Articulo INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    Porcentaje_Descuento DECIMAL(3,2) NULL,
    CONSTRAINT FK_DetallesVentas_Ventas FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    CONSTRAINT FK_DetallesVentas_Articulos FOREIGN KEY (ID_Articulo) REFERENCES Articulos(ID_Articulo)
);

CREATE TABLE HistorialPrecios(
    ID_HistorialPrecios INT IDENTITY(1,1) PRIMARY KEY,
    ID_Articulo INT NOT NULL,
    Precio_Anterior DECIMAL(8,2),
    Precio_Nuevo DECIMAL(8,2),
    Fecha_Cambio DATE DEFAULT GETDATE(),
    CONSTRAINT FK_HistorialPrecios_Articulos FOREIGN KEY (ID_Articulo) REFERENCES Articulos(ID_Articulo)
);

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT IDENTITY(1,1) PRIMARY KEY,
    Usuario VARCHAR(50) NOT NULL,
    NombreCompleto VARCHAR(100) NOT NULL,
    Contrasenia VARCHAR(50) NOT NULL,
    TipoUsuario INT NOT NULL, -- 1 para administrador, 2 para ventas
    CorreoElectronico VARCHAR(100) NOT NULL
);
GO

-- Crear un índice único en la columna DNI de la tabla Clientes para evitar duplicados
CREATE UNIQUE INDEX IX_Clientes_DNI
ON Clientes (DNI);
GO

CREATE PROCEDURE CambiarPrecioArticulo
    @ID_Articulo INT,
    @Precio_Nuevo DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Precio_Anterior DECIMAL(10, 2);

    -- Obtiene el precio actual del artículo
    SELECT @Precio_Anterior = Precio_Unitario FROM Articulos WHERE ID_Articulo = @ID_Articulo;

    -- Actualiza el precio del artículo
    UPDATE Articulos
    SET Precio_Unitario = @Precio_Nuevo
    WHERE ID_Articulo = @ID_Articulo;

    -- Insert del cambio de precio en el historial de precios
    INSERT INTO HistorialPrecios (ID_Articulo, Precio_Anterior, Precio_Nuevo)
    VALUES (@ID_Articulo, @Precio_Anterior, @Precio_Nuevo);
END;
GO

CREATE TRIGGER trg_SetHoraDefault
ON Ventas
AFTER INSERT
AS
BEGIN
    UPDATE Ventas
    SET Hora = CAST(GETDATE() AS TIME)
    WHERE ID_Venta IN (SELECT ID_Venta FROM inserted);
END;
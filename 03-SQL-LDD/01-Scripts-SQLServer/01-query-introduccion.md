```SQL

--Lenguaje SQL-LDD (CREATE, ALTER, DROP)

--Crear la base de datos empresa
CREATE DATABASE empresa;
GO
--Utilizar la base de datos creada
USE empresa;
GO
--Crear la tabla empleados
CREATE TABLE Empleados(
	IdEmpleado INT not null,
	Nombre VARCHAR(100) not null,
	Puesto VARCHAR(50) not null,
	FechaIngreso DATE,
	Salario MONEY not null,
	CONSTRAINT pk_empleados
	PRIMARY KEY (IdEmpleado)
);
GO
CREATE TABLE Productos(
	ProductoId INT PRIMARY KEY,
	NombreProducto NVARCHAR(50) not null,
	Existencia INT not null,
	PrecioUnitario MONEY not null,
);
GO
CREATE TABLE Productos2(
	ProductoId INT not null IDENTITY(1,1),
	NombreProducto NVARCHAR(50) not null,
	Existencia INT not null,
	Precio MONEY not null,
	CONSTRAINT pk_productos2
	PRIMARY KEY(ProductoId),
	CONSTRAINT unique_nombreproducto
	UNIQUE(NombreProducto),
	CONSTRAINT chk_existencia
	CHECK (Existencia>0 AND Existencia<=1000),
	CONSTRAINT chk_precio
	CHECK (Precio>0.0)
);
GO

--Insertar un producto en Productos sin identity
INSERT INTO Productos (ProductoId,NombreProducto,Existencia,PrecioUnitario)
VALUES(1,'Burritos de Frijoles', 65, 20.99);
GO

INSERT INTO Productos (ProductoId,NombreProducto,Existencia,PrecioUnitario)
VALUES(2,'Burritos de Frijoles', 65, 20.99);
GO

SELECT * FROM Productos;
GO

--Insertar en la tabla Productos2 con identity
INSERT INTO Productos2 (NombreProducto,Existencia,Precio)
VALUES('Burritos de Chorizo Verde', 100, 21.0);
GO

INSERT INTO Productos2 (NombreProducto,Existencia,Precio)
VALUES('Burritos de Chorizo Grueso2', 450, 459.12);
GO

INSERT INTO Productos2 (NombreProducto,Existencia,Precio)
VALUES('Burritos de Frijol', 999, 60);
GO

SELECT * FROM Productos2;
GO

```
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

--Crear dos tablas con raz�n de cardinalidad de 1 a N con participaci�n total, esto quiere decir que la foreign key es not null
CREATE TABLE categoria(
	CategoriaId INT not null IDENTITY(1,1),
	NombreCategoria NVARCHAR(20) not null,
	CONSTRAINT pk_categoria
	PRIMARY KEY(CategoriaId),
	CONSTRAINT unique_nombrecategoria
	UNIQUE (NombreCategoria)
);
GO

CREATE TABLE producto3(
	ProductoId INT not null IDENTITY (1,1),
	NombreProducto NVARCHAR(20) not null,
	Existencia INT not null,
	PrecioUnitario MONEY not null,
	CategoriaId INT not null,
	CONSTRAINT pk_producto3
	PRIMARY KEY (ProductoId),
	CONSTRAINT unique_nombreproducto3
	UNIQUE (NombreProducto),
	CONSTRAINT chk_existencia3
	CHECK (Existencia>0 AND Existencia <=1000),
	CONSTRAINT chk_preciounitario
	CHECK (PrecioUnitario>0.0),
	CONSTRAINT fk_producto3_categoria
	FOREIGN KEY (CategoriaId)
	REFERENCES categoria(CategoriaId)
);
GO

CREATE TABLE categoria2(
	Id INT not null IDENTITY(1,1),
	NombreCategoria NVARCHAR(20) not null,
	CONSTRAINT pk_categoria2
	PRIMARY KEY(Id),
	CONSTRAINT unique_nombrecategoria2
	UNIQUE (NombreCategoria)
);
GO

CREATE TABLE producto4(
	ProductoId INT not null IDENTITY (1,1),
	NombreProducto NVARCHAR(20) not null,
	Existencia INT not null,
	PrecioUnitario MONEY not null,
	CategoriaId INT not null,
	CONSTRAINT pk_producto4
	PRIMARY KEY (ProductoId),
	CONSTRAINT unique_nombreproducto4
	UNIQUE (NombreProducto),
	CONSTRAINT chk_existencia4
	CHECK (Existencia>0 AND Existencia <=1000),
	CONSTRAINT chk_preciounitario4
	CHECK (PrecioUnitario>0.0),
	CONSTRAINT fk_producto4_categoria
	FOREIGN KEY (CategoriaId)
	REFERENCES categoria2(Id)
);
GO


CREATE TABLE tabla1(
	Tabla1Id INT not null IDENTITY(1,2),
	Tabla1Id2 INT not null,
	Nombre NVARCHAR(20) not null,
	CONSTRAINT pk_tabla1
	PRIMARY KEY(Tabla1Id,Tabla1Id2),
	CONSTRAINT unique_nombretabla
	UNIQUE (Nombre)
);
GO

CREATE TABLE tabla2(
	IdTabla2 INT not null IDENTITY(1,1),
	Nombre NVARCHAR(20) not null,
	Tabla1Id INT,
	Tabla1Id2 INT,
	CONSTRAINT pk_tabla2
	PRIMARY KEY(IdTabla2),
	CONSTRAINT fk_tabla2_tabla1
	FOREIGN KEY (Tabla1Id, Tabla1Id2)
	REFERENCES tabla1(Tabla1Id,Tabla1Id2)
);
GO

--Crear tablas con una raz�n de cardinalidad de 1 a 1
CREATE TABLE employee(
	Id INT not null IDENTITY (1,1),
	Nombre NVARCHAR(20) not null,
	Ap1 NVARCHAR(20) not null,
	Ap2 NVARCHAR(20) not null,
	Sexo CHAR(1) not null,
	Salario MONEY not null,
	CONSTRAINT pk_employee
	PRIMARY KEY (Id)
);
GO

CREATE TABLE departament(
	Id INT not null IDENTITY (1,1),
	Nombre NVARCHAR(20) not null,
	Ubicacion NVARCHAR(30) not null,
	IdEmployee INT not null,
	CONSTRAINT pk_departament
	PRIMARY KEY (Id), 
	CONSTRAINT fk_dep_emp
	FOREIGN KEY (IdEmployee)
	REFERENCES employee(id),
	CONSTRAINT unique_employeeid
	UNIQUE (IdEmployee)
);
GO

```
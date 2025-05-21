-- SQL-LDD
-- Crea una base de datos
CREATE TABLE BDPRUEBAG1;

--Cambiar de base de datos
Use BDPRUEBAG1;
-- Crear una tabla
CREATE TABLE categoria(
	idcategoria int not null identity(1,1),
	categorianombre nvarchar(20) not null,
	constraint pk_categoria
	primary key (idcategoria)
);

CREATE TABLE producto(
	idproducto int not null,
	nombreproducto varchar(20) not null,
	descripcion varchar(100) null,
	existencia INT not null,
	precio MONEY not null,
	idcategoria INT not null,
	CONSTRAINT pk_producto
	PRIMARY KEY(idproducto),
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY(idcategoria)
	REFERENCES categoria(idcategoria)
);

--SQL LMD
--Insertar en la tabla categoria
INSERT INTO categoria (categorianombre)
VALUES('Vinos y Licores')

--Insertar valores a una tabla
INSERT INTO categoria (categorianombre)
VALUES('Carnes Frias'),
	('Linea Blanca'),
	('Lacteos');

--Ver de la tabla
SELECT *FROM categoria;
SELECT categorianombre from categoria;

--Actualizar el nombre a un id especifico
UPDATE categoria
SET categorianombre = 'Carnes Re-Frias'
WHERE idcategoria = 2;
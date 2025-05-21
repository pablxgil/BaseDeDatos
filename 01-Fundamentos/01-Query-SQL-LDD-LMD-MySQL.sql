# SQL-LDD
# Crea una base de datos
CREATE DATABASE BDPRUEBAG1;
#Cambiar de base de datos
Use BDPRUEBAG1;
#Crear una tabla
CREATE TABLE categoria(
	idcategoria int not null auto_increment,
	categorianombre nvarchar(20) not null,
	constraint pk_categoria
	primary key (idcategoria)
);
CREATE TABLE producto(
	idproducto int not null,
	nombreproducto varchar(20) not null,
	descripcion varchar(100) null,
	existencia INT not null,
	precio NUMERIC(10,2) not null,
	idcategoria INT not null,
	CONSTRAINT pk_producto
	PRIMARY KEY(idproducto),
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY(idcategoria)
	REFERENCES categoria(idcategoria)
);
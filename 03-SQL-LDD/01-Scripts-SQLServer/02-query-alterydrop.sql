--Crear base de datos empresapatito
CREATE DATABASE empresapatito;
GO
--Usar la base de datos
USE empresapatito;
GO
--Crear una tabla empleados
CREATE TABLE empleados(
	IdEmpleado INT not null,
	Nombre VARCHAR(100) not null,
	Puesto VARCHAR(50),
	FechaIngreso DATE,
	Salario DECIMAL(10,2),
	CONSTRAINT pk_empleados
	PRIMARY KEY(IdEmpleado)
)
GO
DROP TABLE empleados;
--Agregar una columna en la tabla empleados
ALTER TABLE empleados ADD CorreoElectronico VARCHAR(100);
GO
--Modificar el tipo de dato de un campo
ALTER TABLE empleados ALTER COLUMN Salario MONEY not null;
GO
--Renombrar un campo ('NOMBRE DE LA TABLA.CAMPO DE COLUMNA A MODIFICAR','NUEVO NOMBRE', 'COLUMNA')
EXEC sp_rename 'empleados.CorreoElectronico','Email','COLUMN';
GO
--Crear tabla departamentos
CREATE TABLE departamentos(
	IdDepartamento INT not null IDENTITY (1,1) PRIMARY KEY,
	NombreDepto VARCHAR(100)
);
GO
--Agregar un campo a la tabla empleados
--Para que sea una foreign key
ALTER TABLE empleados ADD IdDepartamento INT not null;
GO
--Agregar llave foranea
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos (IdDepartamento);
GO
--Eliminar la primary key de empleados
ALTER TABLE empleados DROP CONSTRAINT pk_empleados;
GO
--Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados DROP CONSTRAINT fk_empleados_departamentos;
GO
ALTER TABLE departamentos DROP CONSTRAINT PK__departam__787A433D1CA1E93D;
GO
--Crear un constrint de verificacion en salario
ALTER TABLE empleados ADD CONSTRAINT chk_salario CHECK(Salario>0.0);
GO

CREATE TABLE categoria(
	Id INT not null,
	Nombre VARCHAR(20),
	Estatus CHAR(1) DEFAULT 'A'
);
GO
INSERT INTO categoria VALUES (1, 'Carnes', 'D');
GO
INSERT INTO categoria VALUES (DEFAULT, 'Carnes', DEFAULT);
GO
SELECT * FROM categoria
DROP TABLE categoria;

CREATE TABLE categoria(
	Id INT not null PRIMARY KEY DEFAULT -1,
	Nombre VARCHAR(20),
	Estatus CHAR(1) DEFAULT 'A'
);
GO
--Eliminar la columna email
ALTER TABLE empleados DROP COLUMN Email;
ALTER TABLE empleados ADD CONSTRAINT pk_empleados PRIMARY KEY (IdEmpleado);
GO
ALTER TABLE departamentos ADD CONSTRAINT pk_departamentos PRIMARY KEY (IdDepartamento);
GO
--Eliminar las tablas
DROP TABLE empleados;
GO
DROP TABLE departamentos;
GO
DROP TABLE categoria;
GO
--Eliminar la base de datos
USE master;
GO
DROP DATABASE empresapatito;
GO
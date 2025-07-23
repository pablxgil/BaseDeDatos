#Crear base de datos empresapatito
CREATE DATABASE empresapatito;
#Usar la base de datos
USE empresapatito;
#Crear una tabla empleados
CREATE TABLE empleados(
	IdEmpleado INT not null,
	Nombre VARCHAR(100) not null,
	Puesto VARCHAR(50),
	FechaIngreso DATE,
	Salario DECIMAL(10,2),
	CONSTRAINT pk_empleados
	PRIMARY KEY(IdEmpleado)
);
#Agregar una columna en la tabla empleados
ALTER TABLE empleados ADD COLUMN CorreoElectronico VARCHAR(100);
#Modificar el tipo de dato de un campo
ALTER TABLE empleados MODIFY COLUMN Salario DECIMAL(12,2) not null;
#Renombrar un campo ('NOMBRE DE LA TABLA.CAMPO DE COLUMNA A MODIFICAR','NUEVO NOMBRE', 'COLUMNA')
ALTER TABLE empleados RENAME COLUMN CorreoElectronico TO Email;
#Crear tabla departamentos
CREATE TABLE departamentos(
	IdDepartamento INT not null auto_increment PRIMARY KEY,
	NombreDepto VARCHAR(100)
);
#Agregar un campo a la tabla empleados
#Para que sea una foreign key
ALTER TABLE empleados ADD IdDepartamento INT not null;
#Agregar llave foranea
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY(IdDepartamento)
REFERENCES departamentos (IdDepartamento);
#Eliminar la primary key de empleados
ALTER TABLE empleados DROP PRIMARY KEY;
#Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados DROP FOREIGN KEY fk_empleados_departamentos;
#Eliminar el auto increment
ALTER TABLE departamentos MODIFY COLUMN IdDepartamento INT not null;
ALTER TABLE departamentos DROP PRIMARY KEY;
#Crear un constrint de verificacion en salario
ALTER TABLE empleados ADD CONSTRAINT chk_salario CHECK(Salario>0.0);
CREATE TABLE categoria(
	Id INT not null PRIMARY KEY DEFAULT -1,
	Nombre VARCHAR(20),
	Estatus CHAR(1) DEFAULT 'A'
);
INSERT INTO categoria VALUES (1, 'Carnes', 'D');
INSERT INTO categoria VALUES (DEFAULT, 'Carnes', DEFAULT);
SELECT * FROM categoria
DROP TABLE categoria;
#Eliminar la columna email
ALTER TABLE empleados DROP COLUMN Email;
ALTER TABLE empleados ADD CONSTRAINT pk_empleados PRIMARY KEY (IdEmpleado);
ALTER TABLE departamentos ADD CONSTRAINT pk_departamentos PRIMARY KEY (IdDepartamento);
#Eliminar las tablas
DROP TABLE empleados;
DROP TABLE departamentos;
DROP TABLE categoria;
#Eliminar la base de datos
DROP DATABASE empresapatito;
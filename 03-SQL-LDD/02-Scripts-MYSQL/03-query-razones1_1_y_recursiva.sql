CREATE DATABASE tilin;
USE tilin;

CREATE TABLE Empleado(
	EmpleadoId INT not null auto_increment,
	Nombre NVARCHAR(15) not null,
	Apellido1 NVARCHAR(15) not null,
	Apellido2 NVARCHAR(15),
	Direccion NVARCHAR(50) not null,
	Salario decimal not null,
	Jef INT,
	Departamento INT not null,
	CONSTRAINT pk_empleado
	PRIMARY KEY (EmpleadoId),
	CONSTRAINT chk_salario
	CHECK(Salario BETWEEN 200 AND 50000),
	CONSTRAINT fk_empleado_jefe
	FOREIGN KEY(Jef)
	REFERENCES Empleado(EmpleadoId)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
CREATE TABLE Departamento(
	DepartamentoId INT not null auto_increment,
	NombreDpto NVARCHAR(20) not null,
	Estatus CHAR(2) not null,
	Administrador INT not null,
	CONSTRAINT pk_departamento
	PRIMARY KEY (DepartamentoId),
	CONSTRAINT unique_nombredpto
	UNIQUE(NombreDpto),
	CONSTRAINT chk_estatus
	CHECK(Estatus IN ('SI','NO')),
	CONSTRAINT fk_empleado_dpto
	FOREIGN KEY (Administrador)
	REFERENCES Empleado(EmpleadoId)
);
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado_dpto1 FOREIGN KEY (Departamento) REFERENCES Departamento (DepartamentoId);
CREATE TABLE Ubicacion(
	UbicacionId INT not null auto_increment,
	Ubicacion NVARCHAR(20) not null,
	DptoId INT not null,
	CONSTRAINT pk_ubicacion
	PRIMARY KEY (UbicacionId),
	CONSTRAINT unique_dpto
	UNIQUE (DptoId),
	CONSTRAINT fk_ubicacion_departamento
	FOREIGN KEY (DptoId)
	REFERENCES Departamento(DepartamentoId)
);
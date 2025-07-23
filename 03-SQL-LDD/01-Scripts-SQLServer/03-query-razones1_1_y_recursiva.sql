CREATE DATABASE tilin;
GO
USE tilin;
GO
CREATE TABLE Empleado(
	EmpleadoId INT not null IDENTITY (1,1),
	Nombre NVARCHAR(15) not null,
	Apellido1 NVARCHAR(15) not null,
	Apellido2 NVARCHAR(15),
	Direccion NVARCHAR(50) not null,
	Salario MONEY not null,
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
GO
CREATE TABLE Departamento(
	DepartamentoId INT not null IDENTITY(1,1),
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
GO
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado_dpto1 FOREIGN KEY (Departamento) REFERENCES Departamento (DepartamentoId);
GO
CREATE TABLE Ubicacion(
	UbicacionId INT not null IDENTITY(1,1),
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
GO
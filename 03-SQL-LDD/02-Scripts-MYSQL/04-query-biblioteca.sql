CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Libro(
numLibro INT NOT NULL auto_increment,
numIsbn INT NOT NULL,
Titulo VARCHAR(50) NOT NULL,
Autor VARCHAR(20) NOT NULL,
Cantidad INT NOT NULL,
CONSTRAINT pk_Libro
PRIMARY KEY (numLibro)
);


CREATE TABLE Lector(
numLector INT NOT NULL auto_increment,
NumMem INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
ApellidoPaterno VARCHAR(20),
ApellidoMaterno VARCHAR(20),
CONSTRAINT pk_Lector
PRIMARY KEY (numLector)
);


CREATE TABLE Presta(
NumLector INT NOT NULL,
NumLibro INT NOT NULL,
CONSTRAINT fk_Lector_Presta
FOREIGN KEY (NumLector)
REFERENCES Lector(numLector),
CONSTRAINT fk_Libro_Presta
FOREIGN KEY (NumLibro)
REFERENCES Libro(numLibro)
);
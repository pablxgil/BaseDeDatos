--Lenguaje SQL-LMD
--Consultas simples 

USE NORTHWND;
GO;

--Seleccionar todos los clientes 
SELECT * FROM Customers;

--Seleccionar todos los clientes pero solamente mostrando 
--la clave, nombre del ciente, ciudad y el Pais (Proyeccion)

SELECT CustomerID, CompanyName, City, Country
FROM Customers;

-- Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City Ciudad, Country
 AS [Ciudad Chida]
 FROM Customers;

--Campos Calculados!
--Seleccinar las ordenes de compra mostrando productos, la cantidad vendida
--precio de venta, descuento y el total

SELECT ProductID AS [Nombre Producto], UnitPrice AS [Precio],
	Quantity AS [Cantidad], Discount AS [Descuento],
	(UnitPrice * Quantity ) AS [Importe Sin Descuento],
	(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];

--Seleccionar las ordenes de compra,mostrando  el ciente al que se le vendio, 
--el empleado que la realizo, la fecha de la orden, el trasportista
--y la fecha de la orden hay que dividirla en año,mes,dia,trimestre.

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente],
EmployeeID AS [Empleado], 
ShipVia AS [Transportista],
YEAR(OrderDate) AS [Año de la compra],
MONTH (OrderDate) AS [Mes de la compra],
DAY (OrderDate) AS [Dia de la compra]
FROM Orders;
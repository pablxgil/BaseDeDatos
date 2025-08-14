--Lenguaje SQL-LMD
--Consultas simples 

USE NORTHWND;
GO

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

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente],
EmployeeID AS [Empleado], 
ShipVia AS [Transportista],
DATEPART(YEAR, OrderDate) AS [Año de la compra],
DATEPART(MM, OrderDate) AS [Mes de la compra],
DATEPART(D, OrderDate) AS [Dia de la compra],
DATEPART(qq, OrderDate) AS [Trimestre],
DATEPART(WEEK, OrderDate) AS [Semana],
DATEPART(WEEKDAY, OrderDate) AS [Día de la Semana],
DATENAME(WEEKDAY, OrderDate) AS [Nombre del Día]
FROM Orders
ORDER BY 9;

--Seleccionar todos los productos que su precio sea mayor a 40.3
--(Mostrar el número del producto, nombre del producto y precio unitario)
SELECT 
ProductID AS [Nombre del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;

SELECT 
ProductID AS [Nombre del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';

SELECT 
ProductID AS [Nombre del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers';

SELECT 
ProductID AS [Nombre del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers';

--Seleccionar todas las ordenes que sean de brasil - rio de janeiro,
--mostrando solo el numero de orden, la fecha de orden, pais de envio,
--ciudad y su transportista
SELECT 
OrderID AS [Numero de Orden],
OrderDate AS [Fecha],
ShipCountry AS [País del Viaje],
ShipCity AS [Ciudad de Envío],
ShipVia AS [Trasportista]
FROM Orders
WHERE ShipCity = 'Rio de Janeiro';

SELECT *
FROM or;

--INNER JOIN
SELECT 
o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha],
o.ShipCountry AS [País del Viaje],
o.ShipCity AS [Ciudad de Envío],
s.ShipperID AS [Número de Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o 
INNER JOIN Shippers AS s 
ON S.ShipperID = o.ShipVia
WHERE ShipCity = 'Rio de Janeiro';

--Seleccionar todas las ordenes mostrando lo mismo que la consulta anterior
--pero todas aquellas que no tengan region de envio
SELECT 
o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha],
o.ShipCountry AS [País del Viaje],
o.ShipCity AS [Ciudad de Envío],
s.ShipperID AS [Número de Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o 
INNER JOIN Shippers AS s 
ON S.ShipperID = o.ShipVia
WHERE ShipCountry = 'Brazil';

--Seleccionar todas las ordenes enviadas a Brasil, Alemania y que tengan región
--y ordenar forma descendiente por el ship country
SELECT 
o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha],
o.ShipCountry AS [País del Viaje],
o.ShipCity AS [Ciudad de Envío],
s.ShipperID AS [Número de Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o 
INNER JOIN Shippers AS s 
ON S.ShipperID = o.ShipVia
WHERE (ShipCountry = 'Brazil' OR
ShipCountry = 'Germany' OR
ShipCountry = 'Mexico') AND
ShipRegion IS NOT NULL
ORDER BY ShipRegion DESC;
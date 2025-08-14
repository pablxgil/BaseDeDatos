--Consultas Avanzadas 

--Hallar todos los representantes que o bien:
--a) trabajan en daimiel, Navarra, o Castellon; o bien
--b) No tienen Jefe y estan contratados desde junio de 1988; o 
--c) superan su cuota pero tienen ventas de 600000 o menos 


Select r.Num_Empl AS [Numero Empleado], 
	r.Nombre AS [Nombre Empleado],
	r.Fecha_Contrato AS [Fecha de Contrato],
	r.Cuota AS [Cuota de Ventas],
	r.Ventas AS [Ventas Totales],
	o.Ciudad AS [Ciudad de la Oficina],
	r.Jefe AS [Numero de Jefe]
From Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina =r.Oficina_Rep
Where (o.Ciudad in ('Daimiel','Navarra','Castellón')) or
		(Jefe IS NULL and Fecha_Contrato >='1988-06-01') or 
		(r.Ventas> Cuota and r.Ventas<=600000)	
;

--Listar todos los pedidos mostrando el numero de pedido,
--su importe y el nombre y limite de credito del cliente 

SELECT p.Importe, p.Importe,c.Empresa,c.Limite_Credito
FROM Pedidos AS p
INNER JOIN Clientes AS C
ON c.Num_Cli = p.Cliente;

--Listar la oficinas con un objetivo superior a 60000, mostrando el nombre
--de la cuidad, nombre del representante y su puesto
SELECT o.Ciudad AS [Oficina] , 
		r.Nombre AS [Representante], 
		r.Puesto AS [Puesto],
		o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;


--Listar todos los pedidos mostrando el numero de pedido,
--el importe, el nombre y limite de credito del cliente

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   c.Empresa AS [Cliente],
	   c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 


SELECT *
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 

--Listar cada representante mostrando su nombre, la cuidad, 
--region, en que trabajan

SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina;

--Listar las oficinas (ciudad), nombres y puestos de sus jefes
SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl = o.Jef;


--lsitar los pedidos mostrando el numero de pedido, el importe 
--y la cantidad de cada producto

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   pr.Stock AS [Cantidad],
	   pr.Descripcion AS [Descripcion]
	  
FROM Pedidos AS pe
INNER JOIN Productos AS pr
ON pr.Id_producto = pe.Producto
	AND pe.Fab = pr.Id_fab

--Listar los nombres de los empleados y los nombres de sus jefes 

SELECT empl.Nombre AS [Empleado],
	   jefs.Nombre AS [Jefe]
FROM Representantes AS jefs
INNER JOIN Representantes AS empl
ON jefs.Num_Empl = empl.Jefe;

--Listar los pedidos con un importe superior a 25000, incluyendo el nombre del representante, numero de pedido,
--importe, nombre del representante que tomo nota del pedido y el nombre del cliente

SELECT p.Num_Pedido,p.Importe,r.Nombre,
	   c.Empresa
FROM Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl=p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25,000 mostrando el numero de pedido,
--el nombre del cliente que lo encargó y el nombre del representante
--asignado al cliente y el importe

SELECT
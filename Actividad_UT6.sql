/*ejercicio 1*/
select oficinas.CodigoOficina, oficinas.Ciudad from jardineria.oficinas;

/*ejercicio 2*/
select ciudad, telefono from oficinas where pais='España';

/*ejercicio 3*/
select nombre, apellido1, apellido2, email from empleados where codigojefe = 7;

/*ejercicio 4*/
select nombre, apellido1, apellido2, email, puesto from empleados where CodigoJefe is null;

/*ejercicio 5*/
select nombre, apellido1, apellido2, puesto from empleados where puesto != 'Representante Ventas';

/*ejercicio 6*/
select NombreCliente, pais from clientes where pais in ('España', 'Spain');

/*ejercicio 7*/
select distinct estado from pedidos;

/*ejercicio 8*/
select codigopedido, CodigoCliente, FechaEsperada, FechaEntrega from pedidos where fechaentrega > FechaEsperada and estado = 'Entregado';

/*ejercicio 9*/
select * from pedidos where Estado = 'Rechazado' between '2009-01-01' and '2009-12-31';
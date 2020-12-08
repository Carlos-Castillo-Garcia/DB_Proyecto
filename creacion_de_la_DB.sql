create database tienda_game;
use tienda_game;

CREATE TABLE IF NOT EXISTS Proveedores (
  idProveedores INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre_empresa VARCHAR(45) NOT NULL,
  nombre_representante VARCHAR(45) NULL,
  CIF VARCHAR(45) NOT NULL,
  telefono INT(11) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  codigo_postal INT(7) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  pais VARCHAR(45) NOT NULL
 );

CREATE TABLE Compras(
  idCompras INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  proveedorid INT NOT NULL,
  productoid INT NOT NULL,
  precio DECIMAL(7) NOT NULL,
  cantidad INT(3) NOT NULL,
  fecha_compra DATE,
  fecha_llegada DATE
  );

CREATE TABLE Productos(
  idProductos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  tipoid INT NOT NULL,
  proveedorid INT NOT NULL,
  Stock INT(3) NOT NULL
  );
  
CREATE TABLE Pedidos (
  idPedidos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  clientesid INT NOT NULL,
  productoid INT NOT NULL,
  precio DECIMAL(5,2) NOT NULL,
  cantidad INT(3) NOT NULL,
  fecha_venta DATE,
  fecha_salida DATE,
  fecha_entrega DATE,
  fecha_llegada DATE
  );

CREATE TABLE Clientes(
  idClientes INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  Apellido1 VARCHAR(45) NULL,
  Apellido2 VARCHAR(45) NULL,
  Empresa VARCHAR(45) NOT NULL DEFAULT 'NO',
  DNI_CIF VARCHAR(45) NOT NULL,
  telefono INT(11) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  codigo_postal INT(7) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  pais VARCHAR(45) NULL
  );

CREATE TABLE Tipo_Producto(
  idTipo_Producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Tipo VARCHAR(45) NOT NULL,
  detallesid INT NOT NULL
);

CREATE TABLE Detalles(
  idDetalles INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Detalles VARCHAR(255) NOT NULL
  );

ALTER TABLE compras ADD CONSTRAINT FK_COMPRAS_PROVEEDORES FOREIGN KEY (proveedorid) REFERENCES Proveedores (idProveedores) on delete cascade;
ALTER TABLE compras ADD CONSTRAINT FK_COMPRAS_PRODUCTOS FOREIGN KEY (productoid) REFERENCES Productos (idProductos);
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY (clientesid) REFERENCES Clientes (idClientes);
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_PRODUCTOS FOREIGN KEY (productoid) REFERENCES Productos (idProductos);
ALTER TABLE tipo_Producto ADD CONSTRAINT FK_TIPOS_DETALLES FOREIGN KEY (detallesid) REFERENCES Detalles (idDetalles);
ALTER TABLE productos ADD CONSTRAINT FK_PRODUCTO_TIPOS FOREIGN KEY (tipoid) REFERENCES Tipo_Producto (idTipo_Producto);

insert into proveedores (nombre_empresa, nombre_representante, CIF,telefono, domicilio, codigo_postal, ciudad, provincia, pais) values 
	('Ink Services', 'Sarah Drew', 'C76230291', 698346655, '68124 Kunze Road', 78043, 'Lewisville', 'Idaho', 'Tajikistan'),
	('Toords', 'Jon Crisp', 'G99731440', 610741718, '62828 Fadel Skyway', 11147, 'North Little Rock', 'Utah', 'Bermuda'),
	('Rawarble', 'Simon Bolivar Buckner', 'V14686471', 648895346, '957 Kurtis Orchard', 76090, 'Nashua', 'North Dakota', 'Bulgaria'),
	('LennySoft', 'Sebastian Stan', 'B82616137', 241328015, '362 Bauch Port', 13187, 'West Valley City', 'Tennessee', 'Timor/Leste'),
	('Platinum Infinity', 'William the Conqueror', 'J7199911', 311962520, '8391 Bogisich Summit', 16328, 'Pawtucket', 'Maryland', 'Zambia');
            
insert into clientes (nombre, Apellido1, Apellido2, Empresa, DNI_CIF, telefono, domicilio, codigo_postal, ciudad, provincia) values 
    ('gustabo', 'fernandez', 'madrid', 'no', '00000000A', '600000000', 'C/gustabo con b,2', '28047', 'Madrid', 'Madrid'),
    ('horacio', 'furter', 'palacin', 'no', '00000001A', '600000001', 'C/horacio con h,3', '28028', 'Madrid', 'Madrid'),
    ('compras S.A.', '', '', 'si', 'A00000000', '600000002', 'C/gustabo con b', '28047', 'Madrid', 'Madrid'),
    ('eva', 'mónico', 'castillo', 'no', '00000002A', '600000003', 'C/elbautisterio,2', '28043', 'Madrid', 'Madrid'),
    ('alfonso', 'garcia', 'de todos los santos', 'no', '00000003A', '600000004', 'C/elbautisterio,2', '28043', 'Madrid', 'Madrid');

insert into detalles (Detalles) values
    ('Aqui esta todos los tipos de consolas'),
    ('Aqui esta todo los tipos de videojuegos compatibles con las consolas'),
    ('Aqui esta todos los moviles y cosas relacionadas'),
    ('Aqui va el merchandising mas popular');
    
insert into tipo_producto (Tipo, detallesid) values 
	('Consolas', 1),
	('Videojuegos', 2),
	('Moviles', 3),
	('merchandising', 4);

insert into productos (nombre, tipoid, proveedorid, Stock) values 
    ('nintendo switch colores originales', '1', '5', '50'),
    ('pokemon edicion escudo', '2', '4', '100'),
    ('mi 10T pro 5G 8/128GB', '3', '3', '100'),
    ('funko pop capitan america vengadores endgame', '4', '2', '200'),
    ('super Mario odyssey', '2', '1', '100');

insert into compras (proveedorid, productoid, precio, cantidad, fecha_compra, fecha_llegada) values 
	(5, 1, '65', '100', '2019/03/25', '2019/04/29'),
    (2, 4, '5', '250', '2016/04/08', '2016/07/02'),
    (1, 5, '45', '135', '2019/04/01', '2019/05/21'),
    (3, 3, '60', '199', '2018/07/14', '2018/10/18'),
    (4, 2, '40', '163', '2017/10/05', '2017/11/10');
    
insert into pedidos (clientesid, productoid, precio, cantidad, fecha_venta, fecha_salida, fecha_entrega, fecha_llegada) values 
    ('5', '1', '200.01', '1', '2020/12/03', '2020/12/04', '2020/12/05', '2020/12/04'),
    ('1', '5', '60.07', '3', '2020/12/03', '2020/12/04', '2020/12/04', '2020/12/05'),
    ('4', '2', '70.09', '2', '2020/12/03', '2020/12/04', '2020/12/05', '2020/12/04'),
    ('2', '4', '15.90', '5', '2020/12/03', '2020/12/10', '2020/12/15', '2020/12/11'),
    ('3', '3', '120.50', '2', '2020/12/03', '2020/12/04', '2020/12/05', '2020/12/04');    

select * from pedidos;
select * from compras where month(fecha_compra) = '04';
select nombre, Stock from productos where stock < 51;
select clientesid, precio, cantidad, fecha_venta, fecha_llegada from pedidos where clientesid = 2;
select * from clientes where Empresa = 'no' and codigo_postal = 28043;

delete from pedidos where productoid = 1;
delete from proveedores where idProveedores = 5;

update pedidos set precio=20.00 where productoid=4;
update productos set stock=150 where stock=100;
update pedidos set fecha_llegada='2021/01/02' where idPedidos=3;





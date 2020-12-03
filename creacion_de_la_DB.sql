create database tienda_game;
use tienda_game;

CREATE TABLE Proveedores(
  idProveedores INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre_empresa VARCHAR(45) NULL,
  nombre_representante VARCHAR(45) NULL,
  CIF VARCHAR(45) NULL,
  telefono INT(11) NULL,
  domicilio VARCHAR(100) NULL,
  codigo_postal INT(7) NULL,
  ciudad VARCHAR(45) NULL,
  provincia VARCHAR(45) NULL,
  pais VARCHAR(45) NULL
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
  precio DECIMAL(7) NULL,
  Stock INT(3) NOT NULL
  );
  
  CREATE TABLE Pedidos (
  idPedidos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  clientesid INT NOT NULL,
  productoid INT NOT NULL,
  precio DECIMAL(7) NOT NULL,
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

ALTER TABLE compras ADD CONSTRAINT FK_COMPRAS_PROVEEDORES FOREIGN KEY (proveedorid) REFERENCES Proveedores (idProveedores);
ALTER TABLE compras ADD CONSTRAINT FK_COMPRAS_PRODUCTOS FOREIGN KEY (productoid) REFERENCES Productos (idProductos);
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY (clientesid) REFERENCES Clientes (idClientes);
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_PRODUCTOS FOREIGN KEY (productoid) REFERENCES Productos (idProductos);
ALTER TABLE tipo_Producto ADD CONSTRAINT FK_TIPOS_DETALLES FOREIGN KEY (detallesid) REFERENCES Detalles (idDetalles);
ALTER TABLE productos ADD CONSTRAINT FK_PRODUCTO_TIPOS FOREIGN KEY (tipoid) REFERENCES Tipo_Producto (idTipo_Producto);





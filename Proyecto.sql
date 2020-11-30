/*create database Tienda_Game;*/
use tienda_game;

create table Empleados (
	Id_Empleados int not null auto_increment primary key,
    Nombre varchar (45) not null,
    Apellido1 varchar (45) not null,
    Apellido2 varchar (45),
    DNI varchar (10) not null,
    Cargo varchar (45) not null,
    Domicilio varchar(255) not null,
	Codigo_postal int not null,
	Ciudad varchar(45) not null,
	Provincia varchar(45)
);

create table Dispositivos(
	ID_Dispositivos int not null auto_increment primary key,
    Nombre varchar (45) not null,
    Stock int (3) not null,
    Precio decimal (7),
    Tipo_Dispositivo varchar (60) not null,
    Decripcion varchar (255),
    Mano_id int not null
);

create table Juegos (
	ID_Juego int not null auto_increment primary key,
    Nombre varchar (45) not null,
    Stock int (3) not null,
    Precio decimal (5),
    Generacion varchar (45) not null,
    Decripcion varchar (255),
    Mano_id int not null
);

create table Merchan(
	ID_Merchan int not null auto_increment primary key,
    Nombre varchar (45) not null,
    Tipo varchar (45) not null,
    Stock int (3) not null,
    Precio decimal (7),
    Mano_id int not null
);

create table Estado (
	ID_Estado int not null auto_increment primary key,
    Mano varchar (45) not null
);

create table Clientes (
	ID_Cliente int not null auto_increment primary key,
	Nombre varchar (45) not null,
    Apellido1 varchar (45) not null,
    Apellido2 varchar (45),
    DNI varchar (10) not null,
    Domicilio varchar(255) not null
);

create table Pedidos (
	ID_Pedido int not null auto_increment primary key,
	Cliente_id int not null,
    Producto varchar (45) not null,
    Precio decimal (10) not null,
    Fecha_Salida date,
    Fecha_Entrega date,
    Fecha_Llegada date
);

alter table Dispositivos add constraint FK_DISP_MANO foreign key (Mano_id) references Estado (ID_Estado) on update cascade;
alter table Juegos add constraint FK_JUEGOS_MANO foreign key (Mano_id) references Estado (ID_Estado) on update cascade;
alter table Merchan add constraint FK_MERCHAN_MANO foreign key (Mano_id) references Estado (ID_Estado) on update cascade;
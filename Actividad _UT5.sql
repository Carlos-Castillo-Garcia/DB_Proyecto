create database ONG;
use ONG;

create table tipo_donacion(
	id_donacion int (10) primary key auto_increment,
    Tipo_donacion varchar (50)
);

create table Socios(
	id_socios int (10) primary key auto_increment,
	DNI varchar (10),
    Nombre_y_apellidos varchar (255),
    Cuota int (10),
    Fecha_de_alta date,
	Donacion char(30),
    Direccion varchar(200),
    Ciudad char(100),
    Codigo_Postal int(20),
    Sexo char(1),
    Fecha_de_nacimiento date
);

create table Campos_Operacion(
	id_campos int (10) primary key auto_increment,
	Descripcion varchar(255),
    Prioridad int (10)
);

create table Tipo_Accion(
	id_accion int (10) primary key auto_increment,
    Tipo char (255)
);

create table Acciones(
	id_accion int (10) primary key auto_increment,
	Titulo char (100),
    Tipo_Accion char (100),
    Campo_operacion char (100),
    Ubicaion char (100),
    Presupuesto_minimo int (3),
    Presupuesto_maximo int (6),
    Fecha_inicio date,
    Fecha_fin date
);

/*alter table ong.socios add constraint FK_SOCIOS_IDs foreign key (id_socio) references  (codprovincia);*/

/*insert into ong.tipo_donacion (Tipo_donacion) values ('Puntual');*/

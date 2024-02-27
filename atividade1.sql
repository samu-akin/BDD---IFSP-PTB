create database Consultorio;

use Consultorio;

create table pessoas(
	id int not null primary key identity,
	data_nascimento date,
	genero varchar(10),
	estado_civil varchar (20),
	rg varchar(10) 
);


create table enderecos(
	id int not null identity,
	id_pessoa int not null,
	logradouro varchar(50),
	numero varchar(10) not null,
	cep varchar(9) not null,
	bairro varchar(50),
	cidade varchar(50),
	estado varchar(50),
	primary key (id, id_pessoa),
	foreign key(id_pessoa) references pessoas (id)
	);

create table telefones(
	id_pessoa int not null,
	ddd varchar(2) not null,
	telefone varchar(9) not null,
	primary key (id_pessoa, ddd, telefone),
	foreign key (id_pessoa) references pessoas (id)
	);

create table pacientes(
	id_pessoa int not null primary key,
	convenio varchar(100),
	foreign key (id_pessoa) references pessoas(id)
	);

create table medicos(
	id_pessoa int not null primary key,
	crm varchar(10),
	foreign key (id_pessoa) references pessoas(id)
	);

create table consultas(
	id int not null primary key identity,
	data datetime,
	diagnostico varchar(200),
	id_medico int not null,
	id_paciente int not null,
	foreign key (id_medico) references medicos(id_pessoa),
	foreign key (id_paciente) references pacientes(id_pessoa)
	);

create table exames(
	id int not null primary key identity,
	id_consulta int not null,
	data datetime not null,
	exame varchar(100),
	foreign key (id_consulta) references consultas(id)
	);

insert into pessoas values (getDate(), 'Masculino', 'Solteiro', 543243428);
insert into pessoas values (getDate(), 'Masculino', 'Casado', 544353217);
insert into pessoas values (getDate(), 'Feminino', 'Casada', 543243427);
insert into pessoas values (getDate(), 'Feminino', 'Solteira', 527844038);
insert into pessoas values (getDate(), 'Masculino', 'Solteiro', 593420954);

insert into enderecos values (1,'rua a',1,26456000,'bairro a','Sao Paulo','Sao Paulo');
insert into enderecos values (2,'rua b',2,25466000,'bairro b','Sao Paulo','Sao Paulo');
insert into enderecos values (3,'rua c',3,24476000,'bairro c','Sao Paulo','Sao Paulo');
insert into enderecos values (4,'rua d',4,23486000,'bairro d','Sao Paulo','Sao Paulo');
insert into enderecos values (5,'rua e',5,22496000,'bairro e','Sao Paulo','Sao Paulo');

insert into telefones values (1,11,986572345);
insert into telefones values (2,22,985562355);
insert into telefones values (3,33,984552155);
insert into telefones values (4,44,983554234);
insert into telefones values (5,55,982512245);

insert into pacientes values (1,'convenio a');
insert into pacientes values (2,'convenio b');
insert into pacientes values (3,'convenio c');
insert into pacientes values (4,'convenio d');
insert into pacientes values (5,'convenio e');

insert into medicos values (1,'crm 1');
insert into medicos values (2,'crm 2');
insert into medicos values (3,'crm 3');
insert into medicos values (4,'crm 4');
insert into medicos values (5,'crm 5');

insert into consultas values (getDate(),'Esquizofrenia',1,1);
insert into consultas values (getDate(),'Ansiedade',2,2);
insert into consultas values (getDate(),'Depressao',3,3);
insert into consultas values (getDate(),'Boderline',4,4);
insert into consultas values (getDate(),'TDAH',5,5);

insert into exames values (1,getDate(),'Este exame foi de sangue');
insert into exames values (2,getDate(),'Este exame envolveu o cerebro do paciente');
insert into exames values (3,getDate(),'Este exame foi rotineiro');
insert into exames values (4,getDate(),'Este exame envolveu a visao do paciente');
insert into exames values (5,getDate(),'Este exame foi de sangue');

select * from pessoas
select * from enderecos
select * from telefones
select * from pacientes
select * from medicos
select * from consultas
select * from exames

ALTER TABLE pessoas ADD nome varchar(20)

UPDATE pessoas
SET nome = 'Pedro'
Where id = 1;

UPDATE pessoas
SET nome = 'Caique'
Where id = 2;

UPDATE pessoas
SET nome = 'Carol'
Where id = 3;

UPDATE pessoas
SET nome = 'Ana'
Where id = 4;

UPDATE pessoas
SET nome = 'Murillo'
Where id = 5;

SELECT * from consultas WHERE id_medico = 1

SELECT * from exames WHERE id_consulta = 1

SELECT * from telefones where id_pessoa = 1

SELECT pessoas.*, pacientes.*
FROM pessoas
JOIN pacientes ON pessoas.id = pacientes.id_pessoa;

SELECT pessoas.*, medicos.*
FROM pessoas
JOIN medicos ON pessoas.id = medicos.id_pessoa;
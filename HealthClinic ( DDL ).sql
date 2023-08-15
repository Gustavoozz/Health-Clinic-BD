-- DDL

CREATE DATABASE ClinicHealth;

USE ClinicHealth;

CREATE TABLE TiposDeUsuario 
(
IdTipoDeUsuario INT PRIMARY KEY IDENTITY,
TituloTipoDeUsuario VARCHAR(100) NOT NULL
);

CREATE TABLE Especialidade 
(
IdEspecialidade INT PRIMARY KEY IDENTITY,
TituloEspecialidade VARCHAR(100) NOT NULL
)

CREATE TABLE Clinica 
(
IdClinica INT PRIMARY KEY IDENTITY,
NomeFantasia VARCHAR(100) NOT NULL,
CNPJ VARCHAR(14) NOT NULL UNIQUE,
Endereco VARCHAR(100) NOT NULL UNIQUE,
HorarioFuncionamento TIME NOT NULL,
RazaoSocial VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Usuario 
(
IdUsuario INT PRIMARY KEY IDENTITY,
IdTipoDeUsuario INT FOREIGN KEY REFERENCES TiposDeUsuario(IdTipoDeUsuario),
Email VARCHAR(100) NOT NULL UNIQUE,
Senha VARCHAR(100) NOT NULL
);

CREATE TABLE Medico 
(
IdMedico INT PRIMARY KEY IDENTITY,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
Nome VARCHAR(100) NOT NULL,
CRM VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Paciente
(
IdPaciente INT PRIMARY KEY IDENTITY,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
Nome VARCHAR(100) NOT NULL,
CPF VARCHAR(11) NOT NULL UNIQUE 
);

CREATE TABLE PresencaConsulta 
(
IdPresencaConsulta INT PRIMARY KEY IDENTITY,
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
Situacao BIT DEFAULT(0) NOT NULL
);

CREATE TABLE Consulta 
(
IdConsulta INT PRIMARY KEY IDENTITY,
IdPresencaConsulta INT FOREIGN KEY REFERENCES PresencaConsulta(IdPresencaConsulta),
IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
Prontuario VARCHAR(500) NOT NULL UNIQUE
);

CREATE TABLE FeedBacks
(
IdFeedBacks INT PRIMARY KEY IDENTITY,
IdConsulta INT FOREIGN KEY REFERENCES Consulta(IdConsulta),
Descricao VARCHAR(500) NOT NULL,
Exibe BIT DEFAULT(0)
);

select * from Consulta
select * from TiposDeUsuario
select * from Usuario
select * from Paciente
select * from Clinica
select * from Medico
select * from PresencaConsulta

select * from FeedBacks
select * from Especialidade
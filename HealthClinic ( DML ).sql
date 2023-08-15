-- DML

USE ClinicHealth;

INSERT INTO TiposDeUsuario(TituloTipoDeUsuario)
VALUES('Médico'),('Administrador'),('Paciente');

INSERT INTO Especialidade(TituloEspecialidade)
VALUES('Cardiologista'),('Oftalmologista'),('Pediatra');

INSERT INTO Clinica(NomeFantasia,CNPJ,Endereco,HorarioFuncionamento,RazaoSocial)
VALUES('HC','64251192000191','Rua Niterói,180','09:30:00','Health Clinic');

INSERT INTO Usuario(IdTipoDeUsuario,Email,Senha)
VALUES(3,'rebeca@linda.com','gustavomeudono');

INSERT INTO Medico(IdUsuario,IdClinica,IdEspecialidade,Nome,CRM)
VALUES(1,1,2,'Gustavo Magalhães','987654321');

INSERT INTO Paciente(IdUsuario,Nome,CPF)
VALUES(1,'Rebeca Carolina','99765327477');

INSERT INTO PresencaConsulta(IdPaciente,Situacao)
VALUES(2,0)

INSERT INTO Consulta(IdPresencaConsulta,IdMedico,Prontuario)
VALUES(2,1,'A paciente Rebeca Carolina, atendida pelo médico Gustavo Magalhães no dia 15-08-2023, desenvolveu Conjutivite e iniciou tratamento ocular.')

INSERT INTO FeedBacks(IdConsulta,Descricao,Exibe)
VALUES(1,'Excelente consulta, espero melhorar breve!',1)

SELECT * FROM Clinica
USE ClinicHealth

CREATE FUNCTION QtdMedico(@IdEspecialidade INT)
RETURNS TABLE
AS 
RETURN
(SELECT 
Medico.Nome,Clinica.NomeFantasia AS [Clínica], Especialidade.TituloEspecialidade AS [Especialidade]
FROM 
Medico
left  join Clinica ON Clinica.IdClinica = Medico.IdClinica
left join Especialidade ON Especialidade.IdEspecialidade =  Medico.IdEspecialidade
WHERE Medico.IdEspecialidade = @IdEspecialidade
)

SELECT * FROM QtdMedico(2)

SELECT 
NomeFantasia AS Clinica, 
CONCAT(Medico.Nome,' - ',TituloEspecialidade) AS [Médico / Especialidade], 
Paciente.Nome AS Paciente, 
DataConsulta AS [Data da Consulta], 
Horario AS Horário, 
Prontuario AS [Descrição da Consulta] 


FROM 
Consulta

INNER JOIN Clinica ON Consulta.IdClinica = Clinica.IdClinica
INNER JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
INNER JOIN Paciente ON Consulta.IdPaciente = Paciente.IdPaciente



SELECT 
CONCAT(Medico.Nome,' - ',TituloEspecialidade) AS [Médico / Especialidade], 
Paciente.Nome AS Paciente,
Consulta.Prontuario AS Prontuário

FROM 
Consulta

LEFT JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
LEFT JOIN Paciente ON Consulta.IdPaciente = Paciente.IdPaciente



SELECT  
Paciente.Nome AS Paciente,	
FeedBacks.Descricao AS FeedBack

FROM 
FeedBacks
INNER JOIN Paciente ON FeedBacks.IdPaciente = Paciente.IdPaciente



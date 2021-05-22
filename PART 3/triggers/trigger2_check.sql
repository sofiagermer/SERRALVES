.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Vamos utilizar o Curador como teste.'
.print 'Atualmente o horario e salario dele são os seguintes:'
.print ''


SELECT Salario,HoraEntrada,HoraSaida
FROM Staff JOIN (SELECT NIF,HoraEntrada,HoraSaida 
FROM HorarioStaff JOIN Horario USING(IDHorario)) USING(NIF)
WHERE (NIF=245684123);

.print ''
.print 'Como se pode observar atualmente o Curador trabalha 6 horas.'
.print 'Vamos mudar o seu horario de forma a que passe a trabalhar 9 horas'
.print ''

UPDATE HorarioStaff 
SET IDHorario = 2
WHERE (NIF=245684123);

SELECT Salario,HoraEntrada,HoraSaida
FROM Staff JOIN (SELECT NIF,HoraEntrada,HoraSaida 
FROM HorarioStaff JOIN Horario USING(IDHorario)) USING(NIF)
WHERE (NIF=245684123);


.print ''
.print 'A mudança refletiu-se proporcionalmente no salário que aumentou para 12000'
.print 'Para concluir voltamos a mudar o horário para o original o que deve resultar numa redução do salário.'
.print ''

UPDATE HorarioStaff 
SET IDHorario = 1
WHERE (NIF=245684123);

SELECT Salario,HoraEntrada,HoraSaida
FROM Staff JOIN (SELECT NIF,HoraEntrada,HoraSaida 
FROM HorarioStaff JOIN Horario USING(IDHorario)) USING(NIF)
WHERE (NIF=245684123);

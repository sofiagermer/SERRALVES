/*
Interrogação à base de dados que mostra todos os turnos, com a hora de entrade e a hora de saída, e quantos trablhadores estão alocados a cada turno.
*/

SELECT Horario.HoraEntrada, Horario.HoraSaida, count(*) "Numero de trabalhadores neste horario"
FROM HorarioStaff
INNER JOIN Horario ON Horario.IDHorario = HorarioStaff.IDHorario
GROUP BY HorarioStaff.IDHorario;

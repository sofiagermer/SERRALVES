/* ================================================================================================
 * Quantos trabalhadores fazem cada turno em Serralves?
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 

SELECT Horario.HoraEntrada, Horario.HoraSaida, count(*) "Numero de trabalhadores neste horario"
FROM HorarioStaff
INNER JOIN Horario ON Horario.IDHorario = HorarioStaff.IDHorario
GROUP BY HorarioStaff.IDHorario;

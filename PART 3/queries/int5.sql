/* ================================================================================================
 * Quais são os horários de trabalho? E quantos trabalhadores estão associados a cada um desses horários?
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 
.width 15 15 15 

SELECT Horario.HoraEntrada AS Entrada, Horario.HoraSaida AS Saida, count(*) AS Trabalhadores
FROM HorarioStaff
INNER JOIN Horario ON Horario.IDHorario = HorarioStaff.IDHorario
GROUP BY HorarioStaff.IDHorario;

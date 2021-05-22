/* ================================================================================================
 * Número de horas que cada funcionário trabalha por semana.
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 


SELECT NIF, IDHorario, (sum(abs(strftime('%s', HoraSaida) - strftime('%s', HoraEntrada)))) / 3600 as HorasSemanais
FROM HorarioStaff 
JOIN Horario USING(IDHorario)
ORDER BY HorasSemanais DESC;

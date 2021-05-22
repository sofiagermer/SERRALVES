/* ================================================================================================
 * Número de horas que cada funcionário trabalha por semana.
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT NIF, Nome, (HoraSaida- HoraEntrada)* 5 as HorasSemanais
FROM HorarioStaff 
JOIN Horario 
    ON HorarioStaff.IDHorario = Horario.IDHorario
JOIN Staff USING (NIF)
    JOIN Pessoa USING (NIF) 

/*ORDER BY HorasSemanais DESC;*/
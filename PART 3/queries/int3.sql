/* ================================================================================================
 * Qual o salário dos trabalhadores de Serralves? E quantas horas semanais é que trabalham?
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 

SELECT Pessoa.Nome, Pessoa.NIF, Staff.Salario "Salario (euros/mes)", (HoraSaida- HoraEntrada)* 5 AS HorasSemanais
FROM Pessoa
JOIN HorarioStaff 
    USING (NIF)
JOIN Horario 
    ON HorarioStaff.IDHorario = Horario.IDHorario
JOIN Staff 
    USING(NIF)
ORDER BY Staff.Salario DESC;
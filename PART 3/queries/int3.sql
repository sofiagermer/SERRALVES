/* ================================================================================================
 * Qual o salário dos trabalhadores de Serralves?
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 

SELECT Pessoa.Nome, Pessoa.NIF, Staff.Salario "Salario (euros/mes)"
FROM Pessoa
INNER JOIN Staff USING(NIF)
ORDER BY Staff.Salario DESC;

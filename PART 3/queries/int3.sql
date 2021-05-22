/* ================================================================================================
 * Qual o salário dos trabalhadores de Serralves?
 * ================================================================================================
 */

.mode columns
.headers on

SELECT Pessoa.Nome, Pessoa.NIF, Staff.Salario "Salario (euros/mes)"
FROM Pessoa
INNER JOIN Staff ON Staff.NIF = Pessoa.NIF
ORDER BY Staff.Salario DESC;

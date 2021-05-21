/*
Interrogação à base de dados que mostra o nome, o NIF respetivo e o salário em euros/mes dos trabalhadores de Serralves por ordem decrescente.
*/

.mode columns
.headers on

SELECT Pessoa.Nome, Pessoa.NIF, Staff.Salario "Salario (euros/mes)"
FROM Pessoa
INNER JOIN Staff ON Staff.NIF = Pessoa.NIF
ORDER BY Staff.Salario DESC;

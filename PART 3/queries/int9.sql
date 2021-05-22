.mode columns
.headers on
/* ==================================================================================================================
 * Listagem de todos os trabalhadores de serralves incluindo o valor idade (calculado a partir da data de nascimento)
 * ==================================================================================================================
 */
CREATE VIEW IF NOT EXISTS TrabalhadorIdade AS
	SELECT Nome,(DATE('now')-DataNascimento) as Idade
	FROM Staff JOIN Pessoa USING(NIF);

SELECT * FROM TrabalhadorIdade;


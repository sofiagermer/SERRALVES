/* ==================================================================================================================
 * Listagem de todos os trabalhadores de serralves incluindo o valor idade (calculado a partir da data de nascimento)
 * ==================================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 
.width 25 10
CREATE VIEW IF NOT EXISTS TrabalhadorIdade AS
    SELECT Nome, (DATE('now')-DataNascimento) as Idade,
    CASE 
        WHEN (DATE('now')-DataNascimento) >= 18 THEN
            'Sim'
        ELSE
            'Não'
        END MaiorIdade
    FROM Staff JOIN Pessoa USING(NIF);

SELECT * FROM TrabalhadorIdade;
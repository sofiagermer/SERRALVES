/* ================================================================================================
 * Quais as exposições que estão a decorrer atualmente bem como o nome do Curador dessa exposição
 * ================================================================================================
 */
.mode columns
.headers on

SELECT Exposicao.Nome,Pessoa.Nome AS Curador FROM
Exposicao JOIN Pessoa
ON Exposicao.NIF=Pessoa.NIF
GROUP BY Exposicao.Nome
HAVING (Fim>date('now') OR Fim IS NULL)

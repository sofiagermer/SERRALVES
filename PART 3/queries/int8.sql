/* ================================================================================================
 * Quais as exposições que estão a decorrer atualmente bem como o nome do Curador dessa exposição
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT Exposicao.Nome,Pessoa.Nome AS Curador FROM
Exposicao JOIN Pessoa USING(NIF)
GROUP BY Exposicao.Nome
HAVING (Fim>date('now') OR Fim IS NULL)

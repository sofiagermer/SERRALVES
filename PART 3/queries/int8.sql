/* ================================================================================================
 * Quais as exposições que estão a decorrer atualmente bem como o espaço onde estão a decorrer
    e o nome do Curador dessa exposição
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 
.width 35 30 20


SELECT Exposicao.Nome,Espaco.Nome AS Localização, Pessoa.Nome AS Curador 
FROM ExposicaoEspaco
JOIN Exposicao 
    USING (IDExposicao)
    JOIN Pessoa 
        USING(NIF)
JOIN Espaco 
    USING (IDEspaco)
GROUP BY Exposicao.Nome
HAVING (Exposicao.Fim> date('now') OR Exposicao.Fim IS NULL)
/* ================================================================================================
 * Quais os espaços mais visitados (com mais bilhetes vendidos)?
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT IDEspaco,Espaco.Nome, count(*) AS NumBilhetes
FROM Espaco JOIN TipoBilhete USING(IDEspaco)
GROUP BY IDEspaco
ORDER BY NumBilhetes DESC;

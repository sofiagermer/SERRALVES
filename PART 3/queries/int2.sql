.mode columns
.headers on

SELECT IDEspaco,Espaco.Nome, count(*) AS NumBilhetes
FROM Espaco JOIN TipoBilhete USING(IDEspaco)
GROUP BY IDEspaco
ORDER BY NumBilhetes DESC;

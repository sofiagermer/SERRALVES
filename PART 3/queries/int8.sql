.mode columns
.headers on

SELECT Exposicao.Nome,Pessoa.Nome AS Curador FROM
Exposicao JOIN Pessoa USING(NIF)
GROUP BY Exposicao.Nome
HAVING (Fim>date('now') OR Fim IS NULL)

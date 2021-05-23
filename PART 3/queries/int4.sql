/* ================================================================================================
 * Top 5 Artistas com mais obras expostas em Serralves
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT Artista.Nome ,count(*) As NumObras
From Artista
JOIN ObraArtista ON Artista.IDArtista = ObraArtista.IDArtista
JOIN Obra ON Obra.IDObra = ObraArtista.IDObra
GROUP BY Artista.Nome
ORDER BY count(*) DESC
LIMIT 5;

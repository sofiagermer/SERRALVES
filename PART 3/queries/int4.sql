/* ================================================================================================
 * Nome do artista e titulo das obras
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT count(*) "Numero de Obras em Exposicao", Artista.Nome
From Artista
JOIN ObraArtista ON Artista.IDArtista = ObraArtista.IDArtista
JOIN Obra ON Obra.IDObra = ObraArtista.IDObra
GROUP BY Artista.Nome
ORDER BY count(*) DESC;

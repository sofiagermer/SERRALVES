/* ================================================================================================
 * Nome do artista e titulo das obras
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 

SELECT count(*) "Numero de Obras em Exposicao", Artista.Nome
From Artista
INNER JOIN ObraArtista ON Artista.IDArtista = ObraArtista.IDArtista
INNER JOIN Obra ON Obra.IDObra = ObraArtista.IDObra
GROUP BY Artista.Nome
ORDER BR count(*) DESC;

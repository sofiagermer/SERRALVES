/* ================================================================================================
 * Que obras estão expostas na coleção permanente (Nome do artista, nome da obra, nome da exposição?
 * ================================================================================================
 */
.mode columns
.headers on

SELECT count(*) "Numero de Obras em Exposicao", Artista.Nome
From Artista
INNER JOIN ObraArtista ON Artista.IDArtista = ObraArtista.IDArtista
INNER JOIN Obra ON Obra.IDObra = ObraArtista.IDObra
GROUP BY Artista.Nome
ORDER BR count(*) DESC;

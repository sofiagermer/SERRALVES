/*
Interrogação à base de dados que mostra o nome do artista e o título das obras que estão expostas na exposição premanente de Serralves.
*/

.mode columns
.headers on

SELECT count(*) "Numero de Obras em Exposicao", Artista.Nome
From Artista
INNER JOIN ObraArtista ON Artista.IDArtista = ObraArtista.IDArtista
INNER JOIN Obra ON Obra.IDObra = ObraArtista.IDObra
GROUP BY Artista.Nome
ORDER BR count(*) DESC;

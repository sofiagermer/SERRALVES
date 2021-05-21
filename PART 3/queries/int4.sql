/*
Interrogação à base de dados que mostra o nome do artista e o título das obras que estão expostas na exposição premanente de Serralves.
*/

.mode columns
.headers on

SELECT Artista.Nome, Obra.Nome, Exposicao.Nome
From Obra
INNER JOIN ObraArtista ON Obra.IDObra = ObraArtista.IDObra
INNER JOIN Artista ON ObraArtista.IDArtista = Artista.IDArtista
INNER JOIN Exposicao ON Exposicao.IDExposicao = 1
Where Obra.IDExposicao = 1;

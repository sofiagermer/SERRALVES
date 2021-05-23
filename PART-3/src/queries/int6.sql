/* ================================================================================================
 * Número de obras de cada tipo
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL  
.width 10 10 10
SELECT (
        SELECT COUNT(*)
        FROM   Fotografia
        ) AS Fotografias,
        (
        SELECT COUNT(*)
        FROM   Pintura
        ) AS Pinturas,
        (
        SELECT COUNT(*)
        FROM   Escultura
        ) AS Esculturas,
        (
        SELECT COUNT(*)
        FROM   Filme
        ) AS Filmes


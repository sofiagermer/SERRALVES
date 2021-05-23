/* ================================================================================================
 * Percentagem de obras vigiadas
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 
.width 15

SELECT ROUND(vigiadas * 100.0 / todas, 1) AS Percentagem
FROM(
    SELECT COUNT(*) AS todas, COUNT(DISTINCT IDObra) AS vigiadas
    FROM Obra, Vigilante 
        USING(IDObra)
); 
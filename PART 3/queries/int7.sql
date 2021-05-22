/* ================================================================================================
 * Percentagem de obras vigiadas
 * ================================================================================================
 */

SELECT ROUND(vigiadas * 100.0 / todas, 1) AS Percentagem
FROM(
    SELECT COUNT(*) AS todas, COUNT(DISTINCT IDObra) AS vigiadas
    FROM Obra, Vigilante USING(IDObra)
); 
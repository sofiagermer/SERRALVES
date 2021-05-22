/* ================================================================================================
 * Número de clientes normais e número clientes "Amigo", discriminados por "tipo de Amigo"
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL

SELECT (SELECT COUNT(*) 
FROM (SELECT NIF FROM Pessoa
EXCEPT
SELECT NIF FROM Staff
EXCEPT
SELECT NIF FROM Amigo)) AS ClientesNormais,

(SELECT COUNT(*)
FROM Amigo WHERE IDTipoAmigo=4) AS AmigosNormal,

(SELECT COUNT(*)
FROM Amigo WHERE IDTipoAmigo=1) AS AmigosSenior,

(SELECT COUNT(*)
FROM Amigo WHERE IDTipoAmigo=2) AS AmigosEstudante,

(SELECT COUNT(*)
FROM Amigo WHERE IDTipoAmigo=3) AS AmigosFamilia,

(SELECT COUNT(*)
FROM Amigo WHERE IDTipoAmigo=5) AS AmigosProfessor

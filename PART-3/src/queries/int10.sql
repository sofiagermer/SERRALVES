/* ================================================================================================
 * Quantos Bilhetes é que cada Funcionário vendeu
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 
.width 20 20 20
 SELECT IDStaff, Nome , COUNT (*) AS BilhetesVendidos
 FROM Fatura 
 JOIN Pessoa ON Fatura.IDStaff = NIF
 GROUP BY IDStaff
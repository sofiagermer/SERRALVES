/* ================================================================================================
 * Quantos Bilhetes é que cada Funcionário vendeu
 * ================================================================================================
 */

.mode columns
.headers on
.nullvalue NULL 

 SELECT IDStaff, Nome , COUNT (*) AS bilhetesVendidos
 FROM Fatura 
 JOIN Pessoa ON Fatura.IDStaff = NIF
 GROUP BY IDStaff
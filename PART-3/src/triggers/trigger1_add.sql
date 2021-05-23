/* ================================================================================================
 * Ao adicionar um bilhete a uma compra, alterar o valor final da Fatura usando o valor do desconto
 * ================================================================================================
 */
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS atualizarPreco
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Fatura
    SET Valor = Valor + (SELECT Preco FROM TipoBilhete WHERE IDBilhete=NEW.IDBilhete)*(SELECT IFNULL(Desconto, 1) FROM Bilhete WHERE IDBilhete=NEW.IDBilhete)
    WHERE (IDFatura = NEW.IDFatura);
END;

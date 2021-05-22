.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS updateFinalPrice
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Fatura
    SET Valor = Valor + (SELECT Preco FROM TipoBilhete WHERE IDBilhete=NEW.IDBilhete)
    WHERE (IDFatura = NEW.IDFatura);
END;

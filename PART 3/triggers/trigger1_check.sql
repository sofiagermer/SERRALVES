.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

INSERT INTO Bilhete VALUES( 204 ,NULL);
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,1, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,2, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,3, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,4, 204 );
INSERT INTO Fatura VALUES( 202 ,0,123687642);
INSERT INTO Compra VALUES( 202 ,NULL, 204 );
INSERT INTO Bilhete VALUES( 205 ,NULL);
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,1, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,2, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,3, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,4, 205 );
INSERT INTO Compra VALUES( 202 ,NULL, 205 );

SELECT Valor FROM Fatura WHERE IDFatura=202;

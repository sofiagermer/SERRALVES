.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;



INSERT INTO Bilhete VALUES( 204 ,NULL);
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,1, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,2, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,3, 204 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,4, 204 );

.print ''
.print 'Foi introduzido um bilhete com o seguinte preço e desconto:'
.print ''

SELECT DISTINCT Preco,Desconto FROM
TipoBilhete JOIN Bilhete USING(IDBilhete)
WHERE IDBilhete=204;

INSERT INTO Fatura VALUES( 202 ,0,123687642);
INSERT INTO Compra VALUES( 202 ,NULL, 204 );

.print ''
.print 'O valor da fatura é agora:'
.print ''

SELECT IDFatura, Valor FROM Fatura WHERE IDFatura=202;

.print ''
.print 'Foi adicionada à mesma compra um bilhete com o seguinte preço e desconto:'
.print ''

INSERT INTO Bilhete VALUES( 205 ,0.5);
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,1, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,2, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,3, 205 );
INSERT INTO TipoBilhete VALUES('Bilhete Geral',20,4, 205 );

SELECT DISTINCT Preco,Desconto FROM
TipoBilhete JOIN Bilhete USING(IDBilhete)
WHERE IDBilhete=205;

INSERT INTO Compra VALUES( 202 ,NULL, 205 );

.print ''
.print 'O valor da fatura é agora:'
.print ''

SELECT IDFatura, Valor FROM Fatura WHERE IDFatura=202;

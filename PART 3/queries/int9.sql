.mode columns
.headers on

CREATE VIEW IF NOT EXISTS TrabalhadorIdade AS
	SELECT Nome,(DATE('now')-DataNascimento) as Idade
	FROM Staff JOIN Pessoa USING(NIF);

SELECT * FROM TrabalhadorIdade;

.mode columns
.header on

PRAGMA foreign_keys = ON;

DELETE FROM Vigilante WHERE IDObra = 12158641;

.print 'Fazemos DELETE a um valor da tabela Vigilante para termos uma obra onde fazer o teste'

SELECT *
FROM Vigilante
WHERE IDObra = 12158641;

.print 'Verifica-se que já não está na tabela Vigilante e então a obra não está a ser vigiada'

SELECT * 
FROM Seguranca
WHERE NIF = 121542324;

.print 'O membro do staff com o NIF: 121542324 já é um Segurança de Serralves'

INSERT INTO Vigilante VALUES (121542324, 12158641);

.print 'Ao tentar inserir na tabela Vigilante um NIF que pertence a um Segurança, aparece um erro que um membro do staff que já é Segurança não pode ser um Vigilante em simultaneo.'

INSERT INTO Vigilante VALUES (879367829, 12158641);

.print 'Inserimos a linha que retiramos para fazer o teste para manter intacta a base de dados.'


SELECT *
FROM Vigilante
WHERE NIF = 101029353;

.print 'Verifica-se que o membro do staff com NIF: 101029353 é Vigilante.'

INSERT INTO Seguranca VALUES (101029353,1);

.print 'Ao inserir na tabela Seguranca um NIF que já está presente na tabela Vigilante, aparece um erro que um membro do staff que já é Vigilante não pode ser um Segurança em simultaneo.'



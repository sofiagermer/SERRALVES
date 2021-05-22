.mode columns
.header on

PRAGMA foreign_keys = ON;

DELETE FROM Vigilante WHERE IDObra = 12158641;

.print ''
.print 'Fazemos DELETE a um valor da tabela Vigilante para termos uma obra onde fazer o teste'
.print ''

SELECT *
FROM Vigilante
WHERE IDObra = 12158641;

.print ''
.print 'Verifica-se que já não está na tabela Vigilante e então a obra não está a ser vigiada'
.print ''

SELECT * 
FROM Seguranca
WHERE NIF = 121542324;

.print ''
.print 'O membro do staff com o NIF: 121542324 já é um Segurança de Serralves'
.print ''

INSERT INTO Vigilante VALUES (121542324, 12158641);

.print ''
.print 'Ao tentar inserir na tabela Vigilante um NIF que pertence a um Segurança, aparece um erro que um membro do staff que já é Segurança não pode ser um Vigilante em simultaneo.'
.print ''

INSERT INTO Vigilante VALUES (879367829, 12158641);

.print ''
.print 'Inserimos a linha que retiramos para fazer o teste para manter intacta a base de dados.'
.print ''

SELECT *
FROM Vigilante
WHERE NIF = 101029353;

.print ''
.print 'Verifica-se que o membro do staff com NIF: 101029353 é Vigilante.'
.print ''

INSERT INTO Seguranca VALUES (101029353,1);

.print ''
.print 'Ao inserir na tabela Seguranca um NIF que já está presente na tabela Vigilante, aparece um erro que um membro do staff que já é Vigilante não pode ser um Segurança em simultaneo.'
.print ''

SELECT *
FROM Seguranca;



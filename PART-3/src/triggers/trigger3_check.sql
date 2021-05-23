.mode columns
.header on

PRAGMA foreign_keys = ON;

DELETE FROM Vigilante WHERE IDObra = 12158641;

.print ''
.print 'Considere-se um segurança de serralves.'
.print 'O membro do staff com o NIF: 121542324 é um Segurança de Serralves e vigia o espaço 2, como se pode confirmar:'
.print ''

SELECT * 
FROM Seguranca
WHERE NIF = 121542324;

.print ''
.print 'Ao tentar inserir na tabela Vigilante o NIF que pertence a esse Segurança, o trigger impede a operação e gera o seguinte erro:'
.print ''

INSERT INTO Vigilante VALUES (121542324, 12158641);

.print ''
.print 'Agora vamos verificar a operação contraria.'
.print 'Verifica-se que o membro do staff com NIF: 101029353 é Vigilante, dado que vigia multiplas obras:'
.print ''

SELECT *
FROM Vigilante
WHERE NIF = 101029353;

.print ''
.print 'Ao inserir na tabela Seguranca um NIF que já está presente na tabela Vigilante, o trigger impede a operação e gera o seguinte erro:'
.print ''

INSERT INTO Seguranca VALUES (101029353,1);




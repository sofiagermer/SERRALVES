/* ================================================================================================
 * Assegura que nenhum funcionário pode ser em simultâneo Segurança e Vigilante.
 * ================================================================================================
 */
.mode columns
.header on

PRAGMA foreign_keys = ON;

/* 
Verifica se não estamos a pôr como Vigilante, um membro do staff que já é Segurança.
*/

CREATE TRIGGER IF NOT EXISTS insertVigilanteNaoSeguranca
BEFORE INSERT ON Vigilante
BEGIN

SELECT CASE
WHEN EXISTS (SELECT * FROM Seguranca WHERE NIF = NEW.NIF)
THEN RAISE(ABORT, 'Um vigilante não pode ser um Segurança')
END;

END;



/* 
Verifica se não estamos a pôr como Segurança, um membro do staff que já é Vigilante.
*/

CREATE TRIGGER IF NOT EXISTS insertSegurancaNaoVigilante
BEFORE INSERT ON Seguranca
BEGIN

SELECT CASE
WHEN EXISTS (SELECT * FROM Vigilante WHERE NIF = NEW.NIF)
THEN RAISE(ABORT, 'Um segurança não pode ser um vigilante')
END;

END;



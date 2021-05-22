.mode columns
.header on

PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS insertVigilanteNaoSeguranca;
DROP TRIGGER IF EXISTS insertSegurancaNaoVigilante;

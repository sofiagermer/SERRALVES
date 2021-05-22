.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


UPDATE HorarioStaff 
SET IDHorario = 2
WHERE (NIF=245684123);

SELECT Salario FROM Staff WHERE NIF=245684123;


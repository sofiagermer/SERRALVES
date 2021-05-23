/* ================================================================================================
 * Se o horário de um trabalhador for aumentado, o seu salário também é aumentado proporcionalmente.
 * ================================================================================================
 */
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER atualizarSalario
AFTER UPDATE on HorarioStaff
WHEN(
(SELECT (HoraSaida-HoraEntrada) FROM Horario
WHERE IDHorario=OLD.IDHorario)!=(SELECT (HoraSaida-HoraEntrada) FROM Horario
WHERE IDHorario=NEW.IDHorario)
)
BEGIN
	UPDATE Staff
    SET Salario = Salario*(SELECT (HoraSaida-HoraEntrada) FROM Horario
WHERE IDHorario=NEW.IDHorario)/(SELECT (HoraSaida-HoraEntrada) FROM Horario
WHERE IDHorario=OLD.IDHorario)
    WHERE NIF = NEW.NIF;
END;

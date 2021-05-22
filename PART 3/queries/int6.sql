/* ================================================================================================
 * Número de horas que cada funcionário trabalha por semana.
 * ================================================================================================
 */
.mode columns
.headers on
.nullvalue NULL 


select NIF, Salario, (sum(abs(strftime('%s', HoraSaida) - strftime('%s', HoraEntrada)))) / 3600 as HorasSemanais
from   (Staff join Horario) natural join Horario natural join Staff
group by NIF
order by HorasSemanais DESC;

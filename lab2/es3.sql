# • Indicare l’età media dei pazienti mai visitati da ortopedici.

select AVG(distinct YEAR(current_date) - YEAR(P.DataNascita)) AS EtaMedia
from (
		Select V.Paziente
		from Paziente P
			INNER JOIN 
            Visita V ON P.CodFiscale = V.Paziente
            INNER JOIN
            Medico M ON M.Matricola = V.Medico
		where M.Specializzazione = 'Ortopedia'
        ) AS D
        RIGHT OUTER JOIN
        Paziente P ON D.Paziente = P.CodFiscale
where D.Paziente IS  NULL

# OUTPUT ATTESO
# EtaMedia
# NULL
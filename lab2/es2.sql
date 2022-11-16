#Indicare il numero di pazienti di sesso femminile che, nel quarantesimo anno
#d’età, sono stati visitati, una o più volte, sempre dallo stesso gastroenterologo.

select COUNT(distinct D1.Paziente)
from (  select V.Paziente, V.Medico, V.Data
		from Visita V
			INNER JOIN 
			Medico M ON V.Medico = M.Matricola
			INNER JOIN 
			Paziente P ON V.Paziente = P.CodFiscale
		where (V.Data BETWEEN P.DataNascita  + INTERVAL 39 YEAR
				AND P.DataNascita + INTERVAL 40 YEAR)
                AND M.Specializzazione = 'Gastroenterologia'
                AND P.Sesso = 'F'
		) AS D1
	LEFT OUTER JOIN
    (
		select V.Paziente, V.Medico, V.Data
		from Visita V
			INNER JOIN 
			Medico M ON V.Medico = M.Matricola
			INNER JOIN 
			Paziente P ON V.Paziente = P.CodFiscale
		where (V.Data BETWEEN P.DataNascita  + INTERVAL 39 YEAR
				AND P.DataNascita + INTERVAL 40 YEAR)
                AND M.Specializzazione = 'Gastroenterologia'
                AND P.Sesso = 'F'
		) AS D2 ON (D1.Paziente = D2.Paziente) 
			AND (D2.Medico <> D1.Medico)
where D2.Medico IS NULL;

# OUTPUT ATTESO
# COUNT(DISTINCT D1.Paziente)
# 0
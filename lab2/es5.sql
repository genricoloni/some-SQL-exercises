#Indicare il reddito medio dei pazienti che sono stati visitati solo da medici con
#parcella superiore a 100 euro, negli ultimi sei mesi.
select avg(P.Reddito)
from	Paziente P
		INNER JOIN
        
        (Select Distinct D.Paziente
        from
        
			(select V.Paziente
			from Visita V
				INNER JOIN
				Medico M ON M.Matricola = V.Medico
			where V.Data > CURRENT_DATE - INTERVAL 20 YEAR) AS D
            
			NATURAL left OUTER JOIN
            
			(select*
			from Medico M
				INNER JOIN
				visita V ON M.Matricola = V.Medico
			where M.Parcella <= 100 AND V.Data > CURRENT_DATE - INTERVAL 20 YEAR) AS M
            
		where M.Paziente IS NULL)AS E
        
        ON P.CodFiscale = E.Paziente
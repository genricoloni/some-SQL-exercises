#Indicare l’incasso totale degli ultimi 18 anni, realizzato grazie alle visite dei
#medici cardiologi della clinica

select SUM(M.Parcella)
from medico M
	INNER JOIN
    visita V ON M.Matricola = V.Medico
where M.Specializzazione = 'Cardiologia' AND YEAR(V.Data) > YEAR(current_date) - 17


# OUTPUT ATTESO
# SUM(M.Matricola)
# 13370
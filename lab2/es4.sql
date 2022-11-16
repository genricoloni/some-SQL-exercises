#Indicare nome e cognome dei pazienti che sono stati visitati non meno di due
#volte dalla dottoressa Gialli Rita.
#La strategia usata è quella di joinare la tabella visite su se stessa:
#impongo il medico e il paziente uguale, ma la data diversa.
#ciò implica che le visite effettuate siano differenti
#a questo punto specifico il nome del medico per eliminare tutti i risultati
#non pertinenti, ovvero quelli di altri medici

select P.Nome, P.Cognome
from Paziente P 
	INNER JOIN
    Visita V1 ON P.CodFiscale = V1.Paziente
    INNER JOIN
    Visita V2 ON ( V1.Medico = V2.Medico 
					AND V1.Paziente = V2.Paziente
                    AND V1.Data <> V2.Data)
	INNER JOIN 
    Medico M ON M.MAtricola = V1.Medico
where M.Nome = 'Rita' 
		AND M.Cognome = 'Gialli'
        
#OUTPUT ATTESO
#NOME	COGNOME
# 				
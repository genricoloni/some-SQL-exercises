#Indicare nome, cognome ed età degli studenti laureati quest’anno in Lettere (durata standard 5 anni a ciclo
#unico), non fuori corso e come minimo con un anticipo di sei mesi rispetto alla durata standard.

select S.Nome, S.Cognome, YEAR(CURRENT_DATE)- YEAR(S.DataNascita)
from Studente S
where S.Facolta = 'Lettere' 
AND (YEAR(S.DataLaurea) = Year(CURRENT_DATE)) 
AND ( Year(S.DataLaurea) - Year(S.DataIscrizione) < 5
	OR (YEAR(S.DataLaurea) - Year(S.DataIscrizione) = 5
		AND MONTH(S.DataLaurea) < 6));
        
# OUTPUT ATTESO
# EMPTY EMPTY EMPTY
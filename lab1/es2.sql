#Indicare matricola e cognome degli studenti il cui percorso di studi è durato (o dura da) oltre sei anni.

Select S.Matricola, S.Cognome
from Studente S
where (S.DataLaurea IS NULL AND YEAR(CURRENT_DATE) - YEAR(S.DataIscrizione) > 6)
	OR (S.DataLaurea IS NOT NULL AND YEAR(S.DataLaurea) - YEAR(S.DataIscrizione) >6);
    
    
# OUTPUT ATTESO
#Matr. Cognome
#1194	Rossi
#1282	Verdi
##2255	Grigi
#3893	Neri
#4823	Rossi
#6288	Verdi
#7846	Turchesi
#8502	Bianchi
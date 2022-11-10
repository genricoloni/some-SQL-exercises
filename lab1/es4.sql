# Indicare matricola e durata in mesi del percorso di studi degli studenti laureati fuori corso, cioè oltre il mese di
# Aprile del 6° anno, nell’anno accademico 2009-2010.

select S.Matricola, DATEDIFF(S.DataLaurea, S.DataIscrizione)/30 AS DurataMesi,
 period_diff(DATE_FORMAT(S.DataLaurea, '%Y%m'),DATE_FORMAT(S.DataIscrizione, '%Y%m')) AS DifferenzaTraMesi
from Studente S
where ((Year(S.DataLaurea) = '2010')
		OR Year(S.DataLaurea) = '2009')
	AND ((Year(S.DataLaurea) - Year(S.DataIscrizione) > 6)
		OR (Year(S.DataLaurea) - Year(S.DataIscrizione) = 6
			AND Month(S.DataLaurea) > 4));
            
#OUTPUT ATTESO
# Matr. DurataMesi 	DifferenzaTraMesi
#1282	105.1333	103
#2255	82.5000		81

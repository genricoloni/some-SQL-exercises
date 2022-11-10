# Indicare matricola e da quanti giorni risultavano iscritti gli studenti,
#ad oggi laureati, che non si erano ancora laureati il 15 Luglio 2005

select S.Matricola, datediff('2005-07-15', S.DataIscrizione)
from Studente S
where (S.DataLaurea > '2005-07-15' OR S.DataLaurea IS NULL) AND S.DataIscrizione < '2005-07-15';


#OUTPUT ATTESO: 
#Matr.	datediff
#1194	2510
#1282	1404
#2255	674
#6566	298
#7644	1383
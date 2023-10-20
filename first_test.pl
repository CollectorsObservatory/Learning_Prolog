% on s'en fiche de la valeur de "homme" , n'importe quoi sera vrai 
homme(_).
% Si un homme est toujours vrai alors qq soit un homme , il est mortel
mortel(X):-homme(X).  
% un autre programme ou l'homme est socrate
homme(socrate).
% si socrate est un homme(toujours vrai) alors il est mort aujourd'hui
mort(socrate):-homme(socrate).
% si socrate est mort , alors il n'est pas vivant
vivant(socrate) :- not( mort(socrate)).

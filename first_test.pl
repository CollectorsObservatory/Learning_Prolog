% On se fiche de la valeur de "homme", n'importe quoi sera vrai
homme(_).

% Si une personne est un homme, alors elle est mortelle
mortel(X) :- homme(X).  

% Définir un homme spécifique, Socrate
homme(socrate).

% Si Socrate est un homme (toujours vrai), alors il est mort
mort(socrate) :- homme(socrate).

% Si Socrate est mort, alors il n'est pas vivant
vivant(socrate) :- \+ mort(socrate).

% Relations d'amitié entre personnes
amis(pers0, pers1).
amis(pers0, pers2).

% Si deux personnes ont un ami commun, alors elles sont amies entre elles
amis(Z, Y) :- amis(X, Z), amis(X, Y).

%Programme qui fait une recherche dans un grapphe pré-défini
lien(1,2).
lien(2,3).
lien(3,4).
lien(4,5).
lien(4,2).
lien(2,5).
recherche(D,D).
recherche(D,A) :- lien(D,L), recherche(L,A).


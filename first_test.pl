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
% Code lien de parenté

parent(pamela, robert).
parent(thomas, robert).
parent(pierre, elizabeth).
parent(marie, elizabeth).
parent(robert, anne).
parent(robert, patricia).
parent(elizabeth, anne).
parent(elizabeth, patricia).
parent(anne, julie).
parent(anne, nathalie).
parent(anne, luc).
parent(jimmy, julie).
parent(jimmy, nathalie).
parent(jimmy, luc).
parent(patricia, marc).
parent(patricia, kevin).
parent(martin, marc).
parent(martin, kevin).
parent(kevin, tom).
parent(sonia, tom).
parent(julie, jean).
parent(sylvain, jean).
parent(luc, sylvie).
parent(rachel, sylvie).

% Exemple de requete:
% ?-parent(X, patricia),parent(Y, patricia), X \= Y.
% ?-parent(robert, X), parent(X, Y), parent(Y, Z), parent(Z, sylvie).

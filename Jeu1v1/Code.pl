:- dynamic joueur/2.
:- dynamic case/3.
:- dynamic tour/1.

% Initialisation des joueurs
initialiserJoueurs :- 
    retractall(joueur(_,_)),
    assert(joueur('Joueur1', blanc)),
    assert(joueur('Joueur2', noir)).

% Initialisation du plateau de jeu
initialiserPlateau :- 
    retractall(case(_,_,_)),
    assert(case(4,1,noir)),
    assert(case(4,7,blanc)),
    forall(between(1,7,X),
           forall(between(1,7,Y),
                  (   (X =:= 4, Y =:= 4 ; X =:= 4, Y =:= 5) 
                  ->  true 
                  ;   assert(case(X,Y,libre))
                  )
           )
    ),
    assert(tour(blanc)).

% Cases adjacentes
adjacent(X1,Y1,X2,Y2) :-
    DX is abs(X1-X2),
    DY is abs(Y1-Y2),
    (DX =:= 1, DY =:= 0 ; DX =:= 0, DY =:= 1).

% Saut possible
saut(X1,Y1,X2,Y2) :-
    DX is X2 - X1,
    DY is Y2 - Y1,
    AdjX is X1 + DX//2,
    AdjY is Y1 + DY//2,
    adjacent(X1,Y1,AdjX,AdjY),
    adjacent(AdjX,AdjY,X2,Y2),
    case(AdjX,AdjY,libre).

% Gestion des tours
changerTour :- 
    tour(blanc), !, 
    retract(tour(blanc)), 
    assert(tour(noir)).
changerTour :- 
    retract(tour(noir)), 
    assert(tour(blanc)).

% Vérifier si le jeu est terminé
jeuTermine :- 
    not(case(_,_,libre)).

% Moteur de jeu
moteur :- 
    jeuTermine, !,
    write('Jeu terminé!'), nl.
moteur :-
    tour(Couleur),
    write('C\'est au tour du joueur '), write(Couleur), write(' de jouer.'), nl,
    choisir_operation(Operation),
    effectuer_operation(Operation),
    changerTour,
    moteur.

% Effectuer une opération
effectuer_operation(n) :-
    initialiserJoueurs,
    initialiserPlateau.

effectuer_operation(c(X, Y, DX, DY)) :-
    tour(Couleur),
    adjacent(X, Y, DX, DY),
    case(X, Y, Couleur),
    case(DX, DY, libre),
    retract(case(DX,DY,_)),
    assert(case(DX,DY,Couleur)).

effectuer_operation(j(X, Y, DX, DY)) :-
    tour(Couleur),
    saut(X, Y, DX, DY),
    case(X, Y, Couleur),
    case(DX, DY, libre),
    retract(case(X,Y,_)),
    retract(case(DX,DY,_)),
    assert(case(X,Y,libre)),
    assert(case(DX,DY,Couleur)).

effectuer_operation(q) :- 
    write('Fin du jeu.'), nl.

% Choisir une opération
choisir_operation(Op) :-
    tour(Couleur),
    joueur(Nom, Couleur),
    write(Nom), write(', c\'est à vous de jouer.'), nl,
    write('Veuillez choisir une opération: '), nl,
    write('1. Copier une pièce (c(X,Y,DX,DY)).'), nl,
    write('2. Faire sauter une pièce (j(X,Y,DX,DY)).'), nl,
    write('3. Quitter le jeu (q).'), nl,
    read(Op),
    valide_operation(Op, Couleur).

valide_operation(c(X,Y,DX,DY), Couleur) :-
    case(X,Y,Couleur), 
    case(DX,DY,libre), 
    adjacent(X, Y, DX, DY), !.
valide_operation(j(X,Y,DX,DY), Couleur) :-
    case(X,Y,Couleur), 
    case(DX,DY,libre),
    saut(X, Y, DX, DY), !.
valide_operation(q, _).
valide_operation(_, Couleur) :-
    write('Opération invalide. Veuillez réessayer.'), nl,
    choisir_operation(_).

% Initialiser le jeu
:- initialiserJoueurs.
:- initialiserPlateau.
:- moteur.

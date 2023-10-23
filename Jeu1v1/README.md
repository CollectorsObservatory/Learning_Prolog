Ce programme Prolog est destiné à simuler un jeu de plateau simple entre deux joueurs, "Joueur1" et "Joueur2". Le code gère l'initialisation des joueurs et du plateau de jeu, le changement de tour entre les joueurs, la vérification des mouvements valides, et détermine lorsque le jeu est terminé. Le jeu se joue sur un plateau 7x7 et commence avec deux pions pour chaque joueur, placés dans des positions spécifiques.

### Description du jeu
Le jeu est constitué d'un plateau de 7x7 cases où chaque joueur déplace ses pions pour occuper le plus de cases possible. Un joueur gagne lorsque l'autre ne peut plus effectuer de mouvements ou lorsque toutes les cases sont occupées. Les pions peuvent soit se déplacer d'une case adjacente (horizontalement ou verticalement) pour copier leur position, soit sauter par-dessus une case adjacente pour se déplacer à une nouvelle position.

### Détails du code

- `joueur/2`: Un prédicat dynamique pour stocker les joueurs et leurs couleurs.
- `case/3`: Un prédicat dynamique pour stocker l'état actuel des cases sur le plateau.
- `tour/1`: Un prédicat dynamique pour stocker le tour actuel.

#### Initialisation
- `initialiserJoueurs`: Réinitialise et assigne les joueurs et leurs couleurs.
- `initialiserPlateau`: Réinitialise le plateau de jeu avec les positions initiales des pions.

#### Mouvements
- `adjacent`: Détermine si deux cases sont adjacentes.
- `saut`: Vérifie si un saut est possible d'une case à une autre.
- `changerTour`: Change le tour du joueur actuel.

#### État du jeu
- `jeuTermine`: Vérifie si le jeu est terminé, c'est-à-dire s'il n'y a plus de cases libres sur le plateau.

#### Moteur du jeu
- `moteur`: Le cœur du jeu, gérant les tours, les opérations des joueurs et vérifiant l'état du jeu à chaque tour.
- `effectuer_operation`: Effectue l'opération choisie par le joueur.
- `choisir_operation`: Permet au joueur de choisir une opération parmi copier un pion, faire sauter un pion ou quitter le jeu.
- `valide_operation`: Vérifie si l'opération choisie est valide.

#### Lancer le jeu
Le jeu est initialisé et lancé automatiquement lorsque le code est chargé.

### Comment jouer
L'utilisateur est invité à choisir une opération parmi les options fournies. Il doit spécifier l'opération et les coordonnées des cases concernées (pour copier ou sauter un pion). Le jeu se poursuit jusqu'à ce qu'un joueur gagne ou que l'utilisateur choisisse de quitter le jeu.

### Exemples d'opérations
- Copier un pion : `c(4,1,4,2)`.
- Faire sauter un pion : `j(4,1,4,3)`.
- Quitter le jeu : `q`.

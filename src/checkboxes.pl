
%
% defines all checkboxes' titles
%
checkboxTitle(c01, 'En stationnement / à l\'arrêt').
checkboxTitle(c02, 'Quittait un stationnement / ouvrait une portière').
checkboxTitle(c03, 'Prenait un stationnement').
checkboxTitle(c04, 'Sortait d\'un parking, d\'un lieu privé, d\'un chemin de terre').
checkboxTitle(c05, 'S\'engageait dans un parking, dans un lieu privé, dans un chemin de terre').
checkboxTitle(c06, 'S\'engageait sur une place à sens giratoire').
checkboxTitle(c07, 'Roulait dans une place à sens giratoire').
checkboxTitle(c08, 'Heurtant à l\'arrière, en roulant dans le même sens et sur une même file').
checkboxTitle(c09, 'Roulait dans le même sens et sur une file différente').
checkboxTitle(c10, 'Changeait de file').
checkboxTitle(c11, 'Doublait').
checkboxTitle(c12, 'Virait à droite').
checkboxTitle(c13, 'Virait à gauche').
checkboxTitle(c14, 'Reculait').
checkboxTitle(c15, 'Empiétait sur une voie réservée à la circulation en sens inverse').
checkboxTitle(c16, 'Venait de droite (dans un carrefour').
checkboxTitle(c17, 'N\'avait pas observé un signal de priorité ou un feu rouge').
checkboxTitle(c20, 'Était en stationnement irrégulier en agglomération, pas le long d\'un trottoir').
checkboxTitle(c21, 'Était en stationnement irrégulier hors agglomération').
checkboxTitle(c22, 'Avait franchi la ligne continue').
checkboxTitle(c23, 'Flèche orange clignotante').
checkboxTitle(c24, 'Avait franchi l\'axe médian').
checkboxTitle(c25, 'Roulait en sens inverse').

%
% lists all checkboxes's names
%
checkboxesList(AllNames) :-
    findall(X,checkboxTitle(X,_),AllNames).


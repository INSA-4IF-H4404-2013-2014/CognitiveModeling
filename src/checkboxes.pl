
%
% defines all checkboxes' titles
%
checkboxTitle(c01, 'en stationnement / a l\'arret').
checkboxTitle(c02, 'quittait un stationnement / ouvrait une portiere').
checkboxTitle(c03, 'prenait un stationnement').
checkboxTitle(c04, 'sortait d\'un parking, d\'un lieu prive, d\'un chemin de terre').
checkboxTitle(c05, 's\'engageait dans un parking, dans un lieu prive, dans un chemin de terre').
checkboxTitle(c06, 's\'engageait sur une place à sens giratoire').
checkboxTitle(c07, 'roulait dans une place à sens giratoire').
checkboxTitle(c08, 'heurtant à l\'arriere, en roulant dans le même sens et sur une meme file').
checkboxTitle(c09, 'roulait dans la meme sens et sur un file differente').
checkboxTitle(c10, 'changeait de file').
checkboxTitle(c11, 'doublait').
checkboxTitle(c12, 'virait à droite').
checkboxTitle(c13, 'virait à gauche').
checkboxTitle(c14, 'reculait').
checkboxTitle(c15, 'empietait sur une voie reservee a la circulation en sens inverse').
checkboxTitle(c16, 'venait de droite (dans un carrefour').
checkboxTitle(c17, 'n\'avait pas observe un signal de priorite ou un feu rouge').
checkboxTitle(c20, 'était en stationnement irregulier en agglomeration, pas le long d\'un trottoir').
checkboxTitle(c21, 'était en stationnement irregulier hors agglomeration').
checkboxTitle(c22, 'avait franchi la ligne continue').
checkboxTitle(c23, 'virait a droite malgre une fleche orange clignotante').
checkboxTitle(c24, 'avait franchi l\'axe median').
checkboxTitle(c23, 'roulait en sens inverse, le franchissement de l\'axe median n\'est pas determine').

%
% lists all checkboxes's names
%
checkboxesList(AllNames) :-
    findall(X,checkboxTitle(X,_),AllNames).


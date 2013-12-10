

:- [checkboxes].

checkboxesLinePrint([]).
checkboxesLinePrint([H|List]):- 
    checkboxTitle(H, Title), 
    write(H),
    write(' '),
    write(Title),
    nl,
    checkboxesLinePrint(List).

checkboxesPrint:- 
    nl,
    checkboxesList(AllNames),
    checkboxesLinePrint(AllNames),
    nl.


%
% get/1 get a line of text
% read/1 idem
%

textPrint(X) :- 
    atom_codes(C,X),
    write(C).

testRead :- 
    checkboxesPrint,
    read(X),
    nl,
    textPrint(X).



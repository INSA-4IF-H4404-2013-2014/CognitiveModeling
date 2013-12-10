

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
% sub_string(+String, ?Before, ?Length, ?After, ?SubString)
% split_string(+String, +SepChars, +PadChars, -SubStrings)

writeList([]).
writeList([T|Q]) :- 
    write(T),
    nl,
    writeList(Q).


splitText(X,L) :- 
    atomic_list_concat(L,' ', X).


testRead :- 
    checkboxesPrint,
    read(X),
    nl,
    atom_codes(C,X),
    splitText(C,L),
    writeList(L).



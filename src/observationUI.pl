

:-[checkboxes].
:-[reportRules].

checkboxesLinePrint([]).
checkboxesLinePrint([H|List]):- 
    checkboxTitle(H, Title), 
    write(H),
    write(' '),
    write(Title), nl,
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
    writeList(Q).


checkList(New, [], New).
checkList(Col, [T|Q], New) :- 
    reportCheck(Col, T, Inter),
    checkList(Inter, Q, New).

splitText(X,L) :- 
    atomic_list_concat(L,' ', X).

userRead(Col, Letter, Cond) :- 
    checkboxesPrint,
    write('conducteur '),
    write(Letter),
    write(' cases ? (pensez a mettre les\"\" dans votre reponse):'), nl,
    read(X), nl,
    atom_codes(C,X),
    splitText(C,L),
    checkList(Col, L, Cond).

testCheckList:-
    L = ['c01', 'c15'],
    reportCreate(G0),
    checkList(G0, L, R),
    write(R).
    

makeReport :-
    reportCreate(G0),
    userRead(G0, 'A', A),
    userRead(G0, 'B', B),
    reportEvaluate(A,B,WrongsAC,TriggeredRule),
        write('cases A: '),
        writeList(A),
        nl,
        write('cases B: '),
        writeList(B),
        nl,
        write('# rule that has been triggered: '),
        write(TriggeredRule),
        write('\n'),
        write('# wrongs A = '),
        write(WrongsAC),
        write('\n').


    




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FETCH AN ELEMENT
% listFetch(list,index,element) <=> element = list[index]

listFetch([X|_], 1, X).
listFetch([_|List], Pos, Result) :-
    Pos1 is Pos - 1,
    listFetch(List, Pos1, Result).

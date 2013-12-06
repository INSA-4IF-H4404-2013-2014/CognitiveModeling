
:-[repport].
:-[testUtils].

testRepportIsChecked :-
    repportCreate(G0),
    repportCheck(G0,hello,G1),
    repportIsChecked(G1,hello).

testRepport :-
    test(testRepportIsChecked).


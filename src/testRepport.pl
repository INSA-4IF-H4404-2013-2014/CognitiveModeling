
:-[repport].

testRepportObservation :-
    repportCreate(G0),
    repportCheckObservation(G0,hello,G1),
    repportObservation(G1,hello).

testRepportCirconstance :-
    repportCreate(G0),
    repportCheckCirconstance(G0,hello,G1),
    repportCirconstance(G1,hello).

testRepport :-
    testRepportObservation,
    testRepportCirconstance.


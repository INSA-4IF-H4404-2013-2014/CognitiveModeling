
:-[report].
:-[testUtils].

testReportIsChecked :-
    reportCreate(G0),
    reportCheck(G0,hello,G1),
    reportIsChecked(G1,hello).

testReport :-
    test(testReportIsChecked).


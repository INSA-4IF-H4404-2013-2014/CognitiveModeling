
:-[report].
:-[testUtils].

testReportIsChecked :-
    reportCreate(G0),
    reportCheck(G0,hello,G1),
    reportIsChecked(G1,hello).

testReportUncheck :-
    reportCreate(G0),
    reportCheck(G0,hello,G1),
    reportIsChecked(G1,hello),
    reportUncheck(G1,hello,G2),
    not(reportIsChecked(G2,hello)).

testReport :-
    test(testReportIsChecked),
    test(testReportUncheck).


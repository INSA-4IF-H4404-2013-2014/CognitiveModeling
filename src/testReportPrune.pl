
:-[reportPrune].
:-[testUtils].

testReportPruneStandAlone :-
    reportCreate(G0),
    reportCheck(G0,c01,G1),
    reportCheck(G1,c03,G2),
    reportPruneStandAlone(G2,G3),
    reportPruneStandAlone(G1,G1),
    not(reportIsChecked(G3,c01)),
    reportIsChecked(G3,c03).

testReportPrune :-
    test(testReportPruneStandAlone).


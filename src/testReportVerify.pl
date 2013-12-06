
:-[reportVerify].
:-[testUtils].

testReportVerifyA9B9 :-
    reportCreate(G0),
    reportCheck(G0,c09,G1),
    not(reportVerify(G1,G1)).

testReportVerifyA4A5 :-
    reportCreate(G0),
    reportCheck(G0,c04,G1),
    reportCheck(G1,c05,G2),
    not(reportVerify(G2,G1)),
    not(reportVerify(G1,G2)).

testReportVerifyA1B1nA2nA2 :-
    reportCreate(G0),
    reportCheck(G0,c01,G1),
    reportVerify(G0,G1),
    reportVerify(G1,G0),
    not(reportVerify(G1,G1)).


testReportVerify :-
    test(testReportVerifyA9B9),
    test(testReportVerifyA4A5),
    test(testReportVerifyA1B1nA2nA2).


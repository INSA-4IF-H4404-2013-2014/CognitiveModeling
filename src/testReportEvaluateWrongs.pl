
:-[reportEvaluateWrongs].
:-[reportRules].
:-[testUtils].


testReportSymetricWrongs :-
    reportSymetricWrongs(100,0),
    reportSymetricWrongs(0,100),
    reportSymetricWrongs(25,75),
    reportSymetricWrongs(75,25),
    reportSymetricWrongs(50,50).

testReportEvaluateWrongsMechanism :-
    reportCreate(G0),
    reportCheck(G0,c04,G1),
    reportCheck(G0,c01,G2),
    reportCheck(G2,c02,G3),
    reportEvaluateWrongs(G0,G1,0,_),
    reportEvaluateWrongs(G1,G0,100,_),
    reportEvaluateWrongs(G1,G1,50,_),
    reportEvaluateWrongs(G0,G3,0,_),
    reportEvaluateWrongs(G3,G0,100,_),
    reportEvaluateWrongs(G3,G3,50,_),
    reportEvaluateWrongs(G1,G3,100,_),
    reportEvaluateWrongs(G3,G1,0,_).

testReportEvaluateWrongs :-
    test(testReportSymetricWrongs),
    test(testReportEvaluateWrongsMechanism).


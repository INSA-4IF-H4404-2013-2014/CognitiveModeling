
:-[reportEvaluateWrongs].
:-[testUtils].

testReportEvaluateFatalMistake :-
    reportCreate(G0),
    reportCheck(G0,c04,G1),
    reportEvaluateFatalMistake(G1,G0,100),
    reportEvaluateFatalMistake(G0,G1,0),
    reportEvaluateFatalMistake(G1,G1,50).

testReportEvaluateWrongs :-
    test(testReportEvaluateFatalMistake).


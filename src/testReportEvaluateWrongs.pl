
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

testReportEvaluateWrongsPrior :-
	% Create report for A
	reportCreate(G0),
	reportCheck(G0, c07, G1),
	reportCheck(G1, c08, G2),

	% Create report for B
	reportCreate(H0),
	reportCheck(H0, c02, H1),
	reportCheck(H1, c01, H2),

	% Various checks
	assert(reportEvaluateWrongsPriorDB(G2, H2, 75)),
	reportEvaluateWrongsPrior(G2, H2, 75, exception),
	reportEvaluate(G2, H2, 75, exception),
	retract(reportEvaluateWrongsPriorDB(G2, H2, 75)),
	not(reportEvaluate(G2, H2, 75, _)),
	assert(reportEvaluateWrongsPriorDB(G2, H2, 54)),
	reportEvaluate(H2, G2, 46, exception),
	retract(reportEvaluateWrongsPriorDB(G2, H2, 54)),
	assert(reportEvaluateWrongsPriorDB(G2, H2, -1)),
	reportEvaluate(G2, H2, -1, exception),
	reportEvaluate(H2, G2, -1, exception),
	retractall(reportEvaluateWrongsPriorDB(_, _, _)).

testReportEvaluateWrongs :-
    test(testReportSymetricWrongs),
    test(testReportEvaluateWrongsMechanism),
    test(testReportEvaluateWrongsPrior).


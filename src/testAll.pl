
:- [main].
:- [testReport].
:- [testReportPrune].
:- [testReportVerify].
:- [testReportEvaluateWrongs].
:- [testCases].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAUNCH ALL UNIT TESTS

testAll :-
    testReport,
    testReportPrune,
    testReportVerify,
    testReportEvaluateWrongs,
    testCases.


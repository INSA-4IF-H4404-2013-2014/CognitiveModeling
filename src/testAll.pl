
:- [main].
:- [testReport].
:- [testReportPrune].
:- [testReportEvaluateWrongs].
:- [testCases].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAUNCH ALL UNIT TESTS

testAll :-
    testReport,
    testReportPrune,
    testReportEvaluateWrongs,
    testCases.


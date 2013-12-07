
:- [main].
:- [testReport].
:- [testReportPrune].
:- [testReportVerify].
:- [testReportEvaluateWrongs].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAUNCH ALL UNIT TESTS

testAll :-
    testReport,
    testReportPrune,
    testReportVerify,
    testReportEvaluateWrongs.


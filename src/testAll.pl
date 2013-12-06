
:- [main].
:- [testReport].
:- [testReportPrune].
:- [testReportVerify].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAUNCH ALL UNIT TESTS

testAll :-
    testReport,
    testReportPrune,
    testReportVerify.



:-[reportRules].
:-[testUtils].


%
% testCase(Name,A,B,WrongsA,Active)
%
% list all test cases with expected wrongs for A
%
testCase('testCase 1',A,B,100,0) :-
    reportCreate(G0),
    reportCheck(G0,c11,A),
    reportCheck(A,c08,B).

testCase([]).
testCase([CaseName|CaseNames]) :-
    testCase(CaseName,A,B,WrongsA,1),
    (
        reportEvaluateWrongs(A,B,WrongsA,_) -> (
            testOk(CaseName)
        ); (
            testFail(CaseName)
        )
    ),
    testCase(CaseNames).

testCases :-
    findall(X,testCase(X,_,_,_,1),CaseNames),
    testCase(CaseNames),
    testOk(testCases).



:-[reportRules].
:-[testUtils].


%
% testCase(Name,A,B,WrongsA,Active)
%
% list all test cases with expected wrongs for A
%
testCase('testCase 1',G,G,50,1,undefined) :-
    reportCreate(G).

testCase('testCase 2',A,B,0,1,reportRule123) :-
    reportCreate(G0),
    reportCheck(G0,c11,A),
    reportCheck(A,c08,B).

testCase('testCase 3',A,B,50,1,reportRule113) :-
    reportCreate(G0),
    reportCheck(G0,c09,A),
    B = A.

testCase('testCase 4',A,B,0,1,reportRule131) :-
    reportCreate(G0),
    reportCheck(G0,c02,A),
    reportCheck(G0,c15,B).

testCase('testCase 5',A,B,100,1,reportRule112) :-
    reportCreate(G0),
    reportCheck(G0,c09,A),
    reportCheck(G0,c01,B).

testCase('testCase 6',A,B,25,1,reportRule122) :-
    reportCreate(G0),
    reportCheck(G0,c03,A),
    reportCheck(G0,c08,B).

testCase('testCase 7',A,B,0,1,reportRule123) :-
    reportCreate(A),
    reportCheck(A,c08,B).

testCase('testCase 8',A,B,0,1,reportRule24) :-
    reportCreate(A),
    reportCheck(A,c01,G0),
    reportCheck(G0,c02,B).

testCase('testCase 9',A,B,100,1,reportRule21) :-
    reportCreate(A),
    reportCheck(A,c01,B).
%
% Exec a specific test case
%
testExecCase(CaseName) :-
    testCase(CaseName,A,B,WrongsA,1,TheoricRule) ->
    (
        reportEvaluateWrongs(A,B,WrongsAC,TriggeredRule) ->
        (
            (WrongsAC == WrongsA, TheoricRule == TriggeredRule) -> (
                testOk(CaseName)
            ); (
                write('# rule that has been triggered: '),
                write(TriggeredRule),
                write('\n'),
                testFail(CaseName)
            )
        )
    ).

%
% Proceed all test cases
%
testCase([]).
testCase([CaseName|CaseNames]) :-
    testExecCase(CaseName),
    testCase(CaseNames).

testCases :-
    findall(X,testCase(X,_,_,_,1,_),CaseNames),
    testCase(CaseNames),
    testOk(testCases).


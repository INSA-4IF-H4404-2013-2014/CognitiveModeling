
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

%
% Proceed all test cases
%
testCase([]).
testCase([CaseName|CaseNames]) :-
    testCase(CaseName,A,B,WrongsA,1,TheoricRule) ->
    (
        reportEvaluateWrongs(A,B,WrongsAC,TriggeredRule) ->
        (
            (
                (WrongsAC == WrongsA, TheoricRule == TriggeredRule) -> (
                    testOk(CaseName)
                ); (
                    write('# rule that has been targeted: '),
                    write(TriggeredRule),
                    write('\n'),
                    testFail(CaseName)
                )
            ),
            testCase(CaseNames)
        )
    ).

testCases :-
    findall(X,testCase(X,_,_,_,1,_),CaseNames),
    testCase(CaseNames),
    testOk(testCases).



:-[reportRules].
:-[testUtils].


%
% testCase(Name,A,B,WrongsA,Active)
%
% list all test cases with expected wrongs for A
%
testCase('testCase 1',G,G,50,1) :-
    reportCreate(G).

testCase('testCase 2',A,B,0,1) :-
    reportCreate(G0),
    reportCheck(G0,c11,A),
    reportCheck(A,c08,B).

testCase([]).
testCase([CaseName|CaseNames]) :-
    testCase(CaseName,A,B,WrongsA,1) ->
    (
        reportEvaluateWrongs(A,B,WrongsAC,TriggeredRule) ->
        (
            (
                (WrongsAC == WrongsA) -> (
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
    findall(X,testCase(X,_,_,_,1),CaseNames),
    testCase(CaseNames),
    testOk(testCases).


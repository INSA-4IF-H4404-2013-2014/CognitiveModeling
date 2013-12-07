
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

testCase('testCase 10',A,B,100,1,reportRule24) :-
    reportCreate(G0),
    reportCheck(G0,c01,G1),
    reportCheck(G1,c21,B),
    reportCheck(G1,c02,A).

testCase('testCase 11',A,B,100,1,reportEvaluateFatalMistake) :-
    reportCreate(G0),
    reportCheck(G0,c07,B),
    reportCheck(G0,c06,G1),
    reportCheck(G1,c17,A).

testCase('testCase 12',A,B,50,1,reportEvaluateFatalMistake) :-
    reportCreate(G0),
    reportCheck(G0,c14,B),
    reportCheck(G0,c17,A).

testCase('testCase 13',A,B,100,1,reportEvaluateFatalMistake) :-
    reportCreate(B),
    reportCheck(B,c01,G0),
    reportCheck(G0,c14,A).

% TODO: Explication ??
testCase('testCase 14',A,B,50,0,undefined) :-
    reportCreate(G0),
    reportCheck(G0,c03,B),
    reportCheck(B,c02,A).

testCase('testCase 15',A,B,0,1,reportRule111) :-
    reportCreate(G0),
    reportCheck(G0,c08,A),
    reportCheck(G0,c10,B).

testCase('testCase 16',A,B,100,1,reportRule3) :-
    reportCreate(B),
    reportCheck(B,c02,A).

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
                write('# wrongs A = '),
                write(WrongsAC),
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


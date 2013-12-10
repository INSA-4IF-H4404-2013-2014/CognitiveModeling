
:-[reportRules].
:-[testUtils].


%
% testCase(Name,A,B,WrongsA,Active,TriggeredRule)
%   <Name> the test case's name
%   <A> the car A's report
%   <B> the car B's report
%   <WrongsA> the car A's expected wrongs
%   <Active> enable (Active=1) or disable (Active=2) the test case
%   <TriggeredRule>> the rule name that is suposed to be triggered
%
% list all test cases with expected wrongs for A
%
testCase('teacher\'s test case 1',G,G,50,1,undefined) :-
    reportCreate(G).

testCase('teacher\'s test case 2',A,B,0,1,reportRule123) :-
    reportCreate(G0),
    reportCheck(G0,c11,A),
    reportCheck(A,c08,B).

testCase('teacher\'s test case 3',A,B,50,1,reportRule113) :-
    reportCreate(G0),
    reportCheck(G0,c09,A),
    B = A.

testCase('teacher\'s test case 4',A,B,0,1,reportRule131) :-
    reportCreate(G0),
    reportCheck(G0,c25,G1),
	reportCheck(G1,c02,A),
    reportCheck(G1,c15,B).

testCase('teacher\'s test case 5',A,B,100,1,reportRule112) :-
    reportCreate(G0),
    reportCheck(G0,c09,A),
    reportCheck(G0,c01,B).

testCase('teacher\'s test case 6',A,B,25,1,reportRule122) :-
    reportCreate(G0),
    reportCheck(G0,c03,A),
    reportCheck(G0,c08,B).

testCase('teacher\'s test case 7',A,B,0,1,reportRule123) :-
    reportCreate(A),
    reportCheck(A,c08,B).

testCase('teacher\'s test case 8',A,B,0,1,reportRule24) :-
    reportCreate(A),
    reportCheck(A,c01,G0),
    reportCheck(G0,c02,B).

testCase('teacher\'s test case 9',A,B,100,1,reportRule21) :-
    reportCreate(A),
    reportCheck(A,c01,B).

testCase('teacher\'s test case 10',A,B,100,1,reportRule24) :-
    reportCreate(G0),
    reportCheck(G0,c01,G1),
    reportCheck(G1,c21,B),
    reportCheck(G1,c02,A).

testCase('teacher\'s test case 11',A,B,100,1,reportEvaluateFatalMistake) :-
    reportCreate(G0),
    reportCheck(G0,c07,B),
    reportCheck(G0,c06,G1),
    reportCheck(G1,c17,A).

testCase('teacher\'s test case 12',A,B,50,1,reportEvaluateFatalMistake) :-
    reportCreate(G0),
    reportCheck(G0,c14,B),
    reportCheck(G0,c17,A).

testCase('teacher\'s test case 13',A,B,100,1,reportEvaluateFatalMistake) :-
    reportCreate(B),
    reportCheck(B,c01,G0),
    reportCheck(G0,c14,A).

% TODO: Explication ??
testCase('teacher\'s test case 14',A,B,50,0,undefined) :-
    reportCreate(G0),
    reportCheck(G0,c03,B),
    reportCheck(B,c02,A).

testCase('teacher\'s test case 15',A,B,0,1,reportRule111) :-
    reportCreate(G0),
    reportCheck(G0,c08,A),
    reportCheck(G0,c10,B).

testCase('teacher\'s test case 16',A,B,100,1,reportRule31) :-
    reportCreate(B),
    reportCheck(B,c02,A).

testCase('teacher\'s test case 17',A,B,0,1,reportRule111) :-
    reportCreate(G0),
    reportCheck(G0,c07,G1),
    reportCheck(G1,c06,A),
    reportCheck(G1,c10,B).

testCase('teacher\'s test case 18',A,B,0,1,reportEvaluateFatalMistake) :-
    reportCreate(G0),
    reportCheck(G0,c08,A),
    reportCheck(G0,c14,B).

testCase('teacher\'s test case 19',A,B,0,1,reportRule24) :-
    reportCreate(G0),
    reportCheck(G0,c01,G1),
    reportCheck(G1,c02,B),
    reportCheck(G0,c09,A).

testCase('teacher\'s test case 20',A,B,100,1,reportRule21) :-
    reportCreate(G0),
    reportCheck(G0,c01,B),
    reportCheck(G0,c12,G1),
    reportCheck(G1,c13,A).

testCase('teacher\'s test case 21',A,B,25,1,reportRule22) :-
    reportCreate(B),
    reportCheck(B,c01,G0),
    reportCheck(G0,c20,A).

testCase('teacher\'s test case 22',A,B,-1,1,reportAreCorruptedBoth8) :-
    reportCreate(G0),
    reportCheck(G0,c08,A),
    A = B.
	
testCase('test rule 23', A, B, 50, 1, reportRule23) :-
	reportCreate(G0),
	reportCheck(G0, c01, G1),
	reportCheck(G1, c21, A),
	reportCreate(B).
	
testCase('test report corrupted - both 16', A, B, -1, 1, reportAreCorruptedBoth16) :-
	reportCreate(G0),
	reportCheck(G0, c16, A),
	reportCheck(A, c02, B).

testCase('test report corrupted - 4 and 5', A, B, -1, 1, reportAreCorrupted4and5) :-
	reportCreate(G0),
	reportCheck(G0, c04, G1),
	reportCheck(G1, c05, A),
	reportCreate(G2),
	reportCheck(G2, c14, B).
	
testCase('test report corrupted - 8 and 9', A, B, -1, 1, reportAreCorrupted8and9) :-
	reportCreate(G0),
	reportCheck(G0, c08, G1),
	reportCheck(G1, c09, A),
	reportCreate(G2),
	reportCheck(G2, c14, B).
	
testCase('test report corrupted - 16 and 7', A, B, -1, 1, reportAreCorrupted7and16) :-
	reportCreate(G0),
	reportCheck(G0, c16, G1),
	reportCheck(G1, c07, A),
	reportCreate(G2),
	reportCheck(G2, c14, B).
	
testCase('test rule 121 door', A, B, 0, 1, reportRule121) :-
	reportCreate(G0),
	reportCheck(G0, c08, A),
	reportCheck(G0, c02, B).

	
testCase('test rule 32',A,B,50,1,reportRule32) :-
    reportCreate(G0),
    reportCheck(G0,c02,A),
	reportCheck(G0,c02,B).
	
testCase('test rule 110',A,B,50,1,reportRule110) :-
	reportCreate(G0),
    reportCheck(G0,c10,A),
	reportCheck(G0,c10,B).
	
testCase('test rule 132',A,B,50,1,reportRule132) :-
	reportCreate(G0),
	reportCheck(G0,c25,G1),
	reportCheck(G1,c15,A),
	A = B.
	
testCase('test rule 131 : sketch 1',A,B,0,1,reportRule131) :-
    reportCreate(G0),
    reportCheck(G0,c25,G1),
	reportCheck(G1,c02,A),
    reportCheck(G1,c24,B).
	
testCase('test rule 131 : sketch 2',A,B,0,1,reportRule131) :-
    reportCreate(G0),
    reportCheck(G0,c25,G1),
	reportCheck(G1,c02,A),
    reportCheck(G1,c22,B).
	
%
% Exec a specific test case
%
testExecCase(CaseName) :-
    testCase(CaseName,A,B,WrongsA,1,TheoricRule) ->
    (
        reportEvaluate(A,B,WrongsAC,TriggeredRule) ->
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


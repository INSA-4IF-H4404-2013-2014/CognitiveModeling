
:- [report].


%
% Compute the other car wrongs
%
reportSymetricWrongs(WrongsA,WrongsB) :-
    WrongsB is 100 - WrongsA.

%
% Lists all rules in a predicate
%
:- dynamic reportEvaluateRules/1.
:- retractall(reportEvaluateRules(_)).

%
% Defines a new rule
%
reportDefineRule(RulePredicate) :-
    reportEvaluateRules(RulePredicate) -> (
        true
    ); (
        assert(reportEvaluateRules(RulePredicate))
    ).

%
% Fetches all new rules
%
reportListRules(Rules) :-
    findall(X,reportEvaluateRules(X),Rules).

%
% Evaluate wrongs between tow car' reports, and return the evaluator
%
reportEvaluateWrongs(ReportA,ReportB,WrongsA,Evaluator) :-
    reportListRules(Rules),
    reportEvaluateWrongs(ReportA,ReportB,WrongsA,Evaluator,Rules).

reportEvaluateWrongs(_,_,_,_,[]) :- fail.
reportEvaluateWrongs(ReportA,ReportB,WrongsAReturned,Evaluator,[Rule|Rules]) :-
    call(Rule,ReportA,ReportB,WrongsA) -> (
        Evaluator = Rule,
        call(Rule,ReportB,ReportA,WrongsA) -> (
            WrongsAReturned = 50
        ); (
            WrongsAReturned = WrongsA
        )
    );
    call(Rule,ReportB,ReportA,WrongsB) -> (
        reportSymetricWrongs(WrongsAReturned,WrongsB),
        Evaluator = Rule
    );
    reportEvaluateWrongs(ReportA,ReportB,WrongsAReturned,Evaluator,Rules).

%
% Evaluates fata mistake between tow car' reports
%
reportEvaluateFatalMistake(A,_,100) :-
    reportIsChecked(A,c04);
    reportIsChecked(A,c07);
    reportIsChecked(A,c14).

:- reportDefineRule(reportEvaluateFatalMistake).

%
% Rules 1
%
reportEvaluate1(A,_,100) :-
    reportIsChecked(A,c01),
    reportIsChecked(A,c02).

:- reportDefineRule(reportEvaluate1).


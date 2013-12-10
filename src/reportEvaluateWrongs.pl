
:- [report].
:- [reportPrune].


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
% Evaluate wrongs between two car reports, and return the evaluator
%
reportEvaluateWrongs(ReportA,ReportB,WrongsA,Evaluator) :-
    reportListRules(Rules),
    reportEvaluateWrongs(ReportA,ReportB,WrongsA,Evaluator,Rules).

%
% By default, A and B are 50/50
%
reportEvaluateWrongs(_,_,50,undefined,[]).

reportEvaluateWrongs(ReportA,ReportB,WrongsAReturned,Evaluator,[Rule|Rules]) :-
    call(Rule,ReportA,ReportB,WrongsA) -> (
        (WrongsA == -1) -> (
            Evaluator = Rule,
            WrongsAReturned = -1
        );
        call(Rule,ReportB,ReportA,WrongsA) -> (
            Evaluator = Rule,
            WrongsAReturned = 50
        ); (
            Evaluator = Rule,
            WrongsAReturned = WrongsA
        )
    );
    call(Rule,ReportB,ReportA,WrongsB) -> (
        (WrongsB == -1) -> (
            Evaluator = Rule,
            WrongsAReturned = -1
        ); (
            reportSymetricWrongs(WrongsB,WrongsAReturned),
            Evaluator = Rule
        )
    );
    reportEvaluateWrongs(ReportA,ReportB,WrongsAReturned,Evaluator,Rules).

%
% Prunes and evaluate wrongs
%
reportEvaluate(ReportA,ReportB,WrongsA,Evaluator) :-
    reportPrune(ReportA,ReportB,NewReportA,NewReportB) ->
    reportEvaluateWrongs(NewReportA,NewReportB,WrongsA,Evaluator).


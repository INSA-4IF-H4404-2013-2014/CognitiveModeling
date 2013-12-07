
:- [report].

%
% Evaluates wrong between to cars' repport
%
reportEvaluateFatalMistake(ReportA,ReportB,100) :-
    reportHasFatalMistake(ReportA),
    not(reportHasFatalMistake(ReportB)).

reportEvaluateFatalMistake(ReportA,ReportB,0) :-
    not(reportHasFatalMistake(ReportA)),
    reportHasFatalMistake(ReportB).

reportEvaluateFatalMistake(ReportA,ReportB,50) :-
    reportHasFatalMistake(ReportA),
    reportHasFatalMistake(ReportB).

%
% Evaluates if report has done a fatal mistake
%
reportHasFatalMistake(Report) :-
    (
        reportIsChecked(Report,c04);
        reportIsChecked(Report,c07);
        reportIsChecked(Report,c14)
    ).


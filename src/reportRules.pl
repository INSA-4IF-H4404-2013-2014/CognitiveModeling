
:-[reportEvaluateWrongs].


%
% Fautes grave%
%
reportEvaluateFatalMistake(A,_,100) :-
    reportIsChecked(A,c04);
    reportIsChecked(A,c07);
    reportIsChecked(A,c14).

:- reportDefineRule(reportEvaluateFatalMistake).

%
% 100% des torts de A si il a ouvert une portiere en stationnent
%
reportEvaluate1(A,_,100) :-
    reportIsChecked(A,c01),
    reportIsChecked(A,c02).

:- reportDefineRule(reportEvaluate1).


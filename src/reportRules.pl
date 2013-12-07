
:-[reportEvaluateWrongs].


%
% Rules 1
%
reportEvaluate1(A,_,100) :-
    reportIsChecked(A,c01),
    reportIsChecked(A,c02).

:- reportDefineRule(reportEvaluate1).


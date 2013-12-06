
%
% Creates a new empty repport
%
repportCreate([]).

%
% Checks an observation
%
repportCheck(Repport,CheckboxName,[CheckboxName|Repport]).

%
% Does an observation is checked
%
repportIsChecked(Repport,CheckboxName) :-
    member(CheckboxName,Repport).



%
% Creates a new empty report
%
reportCreate([]).

%
% Checks an observation
%
reportCheck(Report,CheckboxName,[CheckboxName|Report]).

%
% Does an observation is checked
%
reportIsChecked(Report,CheckboxName) :-
    member(CheckboxName,Report).


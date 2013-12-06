
:- [checkboxes].

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

%
% Print a given <Report>
%
reportPrint(Report) :-
    findall(X,checkboxTitle(X,_),AllNames),
    reportPrint(Report,AllNames).

reportPrint(_,[]).
reportPrint(Report,[Name|L]) :-
    checkboxTitle(Name,Title),
    write(Name),
    write(': '),
    write(Title),
    write(' -> '),
    (
        reportIsChecked(Report,Name) -> (
            write('OUI')
        ); (
            write('NON')
        )
    ),
    write('\n'),
    reportPrint(Report,L).


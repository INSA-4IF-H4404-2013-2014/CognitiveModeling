
:- [checkboxes].

convert_str_char([C|_],C).

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

%
% Generates a repport asking question to the users
%
reportAskUser(Report,UserName) :-
    findall(X,checkboxTitle(X,_),AllNames),
    reportAskUser(Report,UserName,AllNames).

reportAskUser(Report,_,[]) :-
    reportCreate(Report).

reportAskUser(Report,UserName,[Name|NamesRemaining]) :-
    checkboxTitle(Name,Title),
    write(Title),
    write(': Oui (o) ou Non (n) ?\n'),
    write(UserName),
    write(' > '),
    get_single_char(C),
    write('\n'),
    reportAskUser(ReturnedReport,UserName,NamesRemaining),
    ( convert_str_char("o",C) ->
        reportCheck(ReturnedReport,Name,Report)
    ); (
        Report = ReturnedReport
    ).


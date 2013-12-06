
%
% Creates a new empty repport
%
repportCreate([]).

%
% Checks an observation
%
repportCheckObservation(Repport,Name,[Element|Repport]) :-
    atom_concat(observation_,Name,Element).

%
% Does an observation is checked
%
repportObservation(Repport,Name) :-
    atom_concat(observation_,Name,Element),
    member(Element,Repport).

%
% Checks an circonstance
%
repportCheckCirconstance(Repport,Name,[Element|Repport]) :-
    atom_concat(circonstance_,Name,Element).

%
% Does an circonstance is checked
%
repportCirconstance(Repport,Name) :-
    atom_concat(circonstance_,Name,Element),
    member(Element,Repport).


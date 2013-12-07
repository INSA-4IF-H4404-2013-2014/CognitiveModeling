
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

%
% 1) Véhicules circulant sur la même chaussée
%

%
%   1) même sens, files différentes (A9 or A10 or B9 or B10)
%
% Si un des conducteurs, ou même les deux, a coché une des cases 9 "roulait dans le même sens et sur une file différente"
% ou 10 "changeait de file", c'est un accident "même sens, files différentes".
%
reportDifferentPath(A,B) :-
    reportIsChecked(A,c09);
    reportIsChecked(A,c10);
    reportIsChecked(B,c09);
    reportIsChecked(B,c10).

%
% un des 2 conducteurs a coché 10 : il a 100% de tort
%
% les 2 conducteurs ont coché la case 10 (Changeait de file) : ils ont 50% de tort chacun
%
reportRule111(A,B,100) :-
    reportDifferentPath(A,B),
    reportIsChecked(A,c10).

:- reportDefineRule(reportRule111).

%
% aucun n'a coché la case 10 : soit ils se sont accrochés en roulant parallèlement et dans ce cas ils ont 50% chacun, soit
% l'un des deux était arrêté, et alors il a 0% et l'autre 100%
%
reportRule112(A,B,0) :-
    reportDifferentPath(A,B),
    not(reportIsChecked(A,c10)),
    not(reportIsChecked(B,c10)),
    reportIsChecked(A,c01).

:- reportDefineRule(reportRule112).

reportRule113(A,B,50) :-
    reportDifferentPath(A,B),
    not(reportIsChecked(A,c10)),
    not(reportIsChecked(B,c10)),
    not(reportIsChecked(A,c01)),
    not(reportIsChecked(A,c01)).

:- reportDefineRule(reportRule113).

%
%   2) même sens, même file (A8 ^ !B1 ^ !B10)
%
% Si un des conducteurs a coché la case 8 "heurtait l'arrière de l'autre véhicule qui roulait dans le même sens et sur
% la même file"  et que l'autre n'a coché  ni 1, ni 10, c'est évidemment un cas de la sous-catégorie "même sens, même file".
%
reportSamePath(A,B) :-
    reportIsChecked(A,c08),
    not(reportIsChecked(B,c01)),
    not(reportIsChecked(B,c10)).

%
% Pour les accidents, "même file, même sens", l'un des conducteurs a coché la case 8. Il a toutes les chances, si j'ose
% dire, d'avoir 100% des torts. Le seul moyen d'y échapper et d'avoir 0%, c'est que l'autre ait coché la case 14 -
% "reculait" comme on l'a vu au tout début - ou encore une des croix 2 "quittait un stationnement"  ou 4 : "sortait
% d'un parking, un lieu privé, un chemin de terre".
%
reportRule121(A,B,0) :-
    reportSamePath(A,B),
    (
        reportIsChecked(B,c02);
        reportIsChecked(B,c04);
        reportIsChecked(B,c14)
    ).

:- reportDefineRule(reportRule121).

%
% J'allais oublier, si un conducteur, appelons le A, a coché la case 8, mais que l'autre, B, a coché soit la case 3
% "prenait un stationnement" soit la case 5 "s'engageait dans un parking, un lieu privé, un chemin de terre", le tout
% en marche avant évidemment, dans ce cas, A n'a que 75% des torts et B en récupère 25%.
%
reportRule122(A,B,75) :-
    reportSamePath(A,B),
    (
        reportIsChecked(B,c03);
        reportIsChecked(B,c05);
        reportIsChecked(B,c14)
    ).

:- reportDefineRule(reportRule122).

reportRule123(A,B,100) :-
    reportSamePath(A,B),
    not(reportRule121(A,B,_)),
    not(reportRule121(A,B,_)).

:- reportDefineRule(reportRule123).


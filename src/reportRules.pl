
:-[reportEvaluateWrongs].


%
% Fautes grave%
%
reportEvaluateFatalMistake(A,_,100) :-
    reportIsChecked(A,c04);
    reportIsChecked(A,c14);
    reportIsChecked(A,c17).

:- reportDefineRule(reportEvaluateFatalMistake).

%
% 2) Véhicule en stationnement
%
reportParking(A,B) :-
    reportIsChecked(A,c01);
    reportIsChecked(B,c01).

%
% Si le véhicule en stationnement était en stationnement (ou arrêt) régulier, il n'a aucun tort (0%). Il en est de même si
% il était en stationnement irrégulier en agglomération le long d'un trottoir.
%
reportRule21(A,B,0) :-
    reportParking(A,B),
    reportIsChecked(A,c01),
    not(reportRule24(A,B,_)),
    not(reportIsChecked(A,c20)),
    not(reportIsChecked(A,c21)),
    not(reportRule112(A,B,_)),
    not(reportRule24(B,A,_)).

:- reportDefineRule(reportRule21).

%
% En revanche, si le véhicule était en stationnement (ou arrêt) irrégulier en agglomération, mais pas le long d'un trottoir,
% alors il a 25% des torts.
%
reportRule22(A,B,25) :-
    reportParking(A,B),
    not(reportRule24(A,B,_)),
    reportIsChecked(A,c20),
    not(reportIsChecked(A,c21)).

%
% Dans les autres cas - stationnement (ou arrêt) irrégulier hors agglomération- les torts sont partagés 50 %, 50%.
%
reportRule23(A,B,50) :-
    reportParking(A,B),
    not(reportRule24(A,B,_)),
    reportIsChecked(A,c21).

%
% Il faut aussi prendre en compte le cas de la portière. Dans ce cas, il a tous les torts.
%
reportRule24(A,B,100) :-
    reportParking(A,B),
    reportIsChecked(A,c02).

:- reportDefineRule(reportRule24).


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
        reportIsChecked(B,c05)
    ).

:- reportDefineRule(reportRule122).

reportRule123(A,B,100) :-
    reportSamePath(A,B),
    not(reportRule121(A,B,_)),
    not(reportRule122(A,B,_)).

:- reportDefineRule(reportRule123).

%
%   3) véhicules circulant en sens inverse
%
% Sinon, et le croquis est là pour confirmer, c'est un accident provoqué par des véhicules circulant en sens inverse.
%
reportReversedWays(A,B) :-
    not(reportDifferentPath(A,B)),
    not(reportSamePath(A,B)).

%
% Commençons par cette dernière sous-catégorie, qui est la plus simple à traiter : Si l'un des conducteurs a coché la
% case 15 : "empiétait sur la partie de chaussée réservée à la circulation en sens inverse" ou s’il existe des preuves
% évidentes (sur le croquis) qu'il a franchi l'axe médian de la chaussée, il a 100% de torts. Si les deux l'ont coché,
% ils se partagent les torts 50%, 50%. Si les véhicules roulaient en sens inverse et que la position des véhicules par
% rapport à l'axe médian ne peut pas être déterminée explicitement, c'est théoriquement du 50%, 50%.
%
reportRule131(A,B,100) :-
    reportReversedWays(A,B),
    reportIsChecked(A,c15).

:- reportDefineRule(reportRule131).

reportRule132(A,B,50) :-
    reportReversedWays(A,B),
    not(reportRule131(A,B,_)).

% don't active it yet !%
%:- reportDefineRule(reportRule132).

%
% 3) quitte un stat
%
reportRule3(A,_,100) :-
    reportIsChecked(A,c02).

:- reportDefineRule(reportRule3).


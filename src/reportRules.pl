
:-[reportEvaluateWrongs].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Corrupted forms
%
reportAreCorruptedBoth8(A,B,-1) :-
    reportIsChecked(A,c08),
    reportIsChecked(B,c08).

:- reportDefineRule(reportAreCorruptedBoth8).

reportAreCorruptedBoth9(A,B,-1) :-
    reportIsChecked(A,c09),
    reportIsChecked(B,c09).

% testCase 3 is not supposed to be corrupted
%:- reportDefineRule(reportAreCorruptedBoth9).

reportAreCorruptedBoth16(A,B,-1) :-
    reportIsChecked(A,c16),
    reportIsChecked(B,c16).

:- reportDefineRule(reportAreCorruptedBoth16).

reportAreCorrupted4and5(A,_,-1) :-
    reportIsChecked(A,c04),
    reportIsChecked(A,c05).

:- reportDefineRule(reportAreCorrupted4and5).

reportAreCorrupted6and7(A,_,-1) :-
    reportIsChecked(A,c06),
    reportIsChecked(A,c07).

% testCase 17 is not supposed to be corrupted
%:- reportDefineRule(reportAreCorrupted6and7).

%
% Si un conducteur a coché les cases 12 et 13, le constat est incohérent. De même s’il a coché les cases 8 et 9.
%
reportAreCorrupted8and9(A,_,-1) :-
    reportIsChecked(A,c08),
    reportIsChecked(A,c09).

:- reportDefineRule(reportAreCorrupted8and9).

reportAreCorrupted12and13(A,_,-1) :-
    reportIsChecked(A,c12),
    reportIsChecked(A,c13).

% testCase 20 is not supposed to be corrupted
%:- reportDefineRule(reportAreCorrupted12and13).

reportAreCorrupted7and16(A,_,-1) :-
    reportIsChecked(A,c07),
    reportIsChecked(A,c16).

:- reportDefineRule(reportAreCorrupted7and16).

reportAreCorruptedParking(A,B,-1) :-
    reportIsChecked(A,c01),
    reportIsChecked(B,c01),
    not(reportIsChecked(A,c02)),
    not(reportIsChecked(B,c02)).

:- reportDefineRule(reportAreCorruptedParking).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%% 1: Fautes graves%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
reportEvaluateFatalMistake(A,_,100) :-
    reportIsChecked(A,c04);
    reportIsChecked(A,c14);
    reportIsChecked(A,c17).

:- reportDefineRule(reportEvaluateFatalMistake).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%% 2: Véhicule en stationnement %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
reportParking(A,B) :-
    reportIsChecked(A,c01);
    reportIsChecked(B,c01).

%
% Si le véhicule était en stationnement (ou arrêt) régulier, il n a aucun tort (0%). Il en est de même si
% il était en stationnement irrégulier en agglomération le long d un trottoir.
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
% En revanche, si le véhicule était en stationnement (ou arrêt) irrégulier en agglomération, mais pas le long dun trottoir,
% alors il a 25% des torts.
%
reportRule22(A,B,25) :-
    reportParking(A,B),
    not(reportRule24(A,B,_)),
    reportIsChecked(A,c20),
    not(reportIsChecked(A,c21)).

:- reportDefineRule(reportRule22).

%
% Dans les autres cas - stationnement (ou arrêt) irrégulier hors agglomération- les torts sont partagés 50 %, 50%.
%
reportRule23(A,B,50) :-
    reportParking(A,B),
    not(reportRule24(A,B,_)),
    not(reportRule24(B,A,_)),
    reportIsChecked(A,c21).

:- reportDefineRule(reportRule23).

%
% Il faut aussi prendre en compte le cas de la portière. Dans ce cas, celui qui l a ouverte a tous les torts.
%
reportRule24(A,B,100) :-
    reportParking(A,B),
    reportIsChecked(A,c02).

:- reportDefineRule(reportRule24).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%% Véhicules circulant sur la même chaussée %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%%%%%% 5:  même sens, files différentes (A9 or A10 or B9 or B10) %%%%%%%%%%
%
% Si un des conducteurs, ou même les deux, a coché une des cases 9 "roulait dans le même sens et sur une file différente"
% ou 10 "changeait de file", c est un accident "même sens, files différentes".
%
reportDifferentPath(A,B) :-
    reportIsChecked(A,c09);
    reportIsChecked(A,c10);
    reportIsChecked(B,c09);
    reportIsChecked(B,c10).

%
% un des 2 conducteurs a coché 10 : il a 100% des torts
%
reportRule111(A,B,100) :-
    reportDifferentPath(A,B),
    reportIsChecked(A,c10),
	not(reportIsChecked(B,c10)).

:- reportDefineRule(reportRule111).

%
% les 2 conducteurs ont coché la case 10 (Changeait de file) : ils ont 50% de tort chacun
%
reportRule110(A,B,50) :-
	reportDifferentPath(A,B),
	reportIsChecked(A,c10),
	reportIsChecked(B,c10).

:- reportDefineRule(reportRule110).

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


%%%%%% 7: même sens, même file (A8 ^ !B1 ^ !B10)  %%%%%%%%%%%%%%%%%%%%%%%%%
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
	reportIsChecked(B,c02).


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


%%%%%% 6: véhicules circulant en sens inverse %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Sinon, et le croquis est là pour confirmer, c'est un accident provoqué par des véhicules circulant en sens inverse.
%
reportReversedWays(A,B) :-
   reportIsChecked(A,c25);
   reportIsChecked(B,c25).

%
% Commençons par cette dernière sous-catégorie, qui est la plus simple à traiter : Si l'un des conducteurs a coché la
% case 15 : "empiétait sur la partie de chaussée réservée à la circulation en sens inverse" ou s’il existe des preuves
% évidentes (sur le croquis) qu'il a franchi l'axe médian de la chaussée, il a 100% de torts. Si les deux l'ont coché,
% ils se partagent les torts 50%, 50%. Si les véhicules roulaient en sens inverse et que la position des véhicules par
% rapport à l'axe médian ne peut pas être déterminée explicitement, c'est théoriquement du 50%, 50%.
%
reportRule131(A,B,100) :-
    reportReversedWays(A,B),
    (
		reportIsChecked(A,c15);
		reportIsChecked(A,c24);
		reportIsChecked(A,c22)
	),
	not(reportIsChecked(B,c15)).

:- reportDefineRule(reportRule131).

reportRule132(A,B,50) :-
    reportReversedWays(A,B),
    not(reportRule131(A,B,_)).

% don't active it yet !%
:- reportDefineRule(reportRule132).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%% 3:  quitte un stat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Seul A quitte un stationnement
%
reportRule31(A,B,100) :-
    reportIsChecked(A,c02),
	not(reportIsChecked(B,c02)).

:- reportDefineRule(reportRule31).
%
% A et B quittent un stationnement
%
reportRule32(A,B,50) :-
    reportIsChecked(A,c02),
	reportIsChecked(B,c02).

:- reportDefineRule(reportRule32).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%% 4:  provenant de chaussées différentes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Case 6 : "S'engageait sur une place à sens giratoire," Le conducteur qui a coché cette case
%(il ne doit cocher cette case que si les roues arrières de son véhicule ne sont pas encore dans le rond-point)
% a tous les torts car l'autre, qui roulait à l'intérieur du sens giratoire a la priorité.

reportRule41(A,B,100) :-
	reportIsChecked(A,c06),
	reportIsChecked(B,c07).

:- reportDefineRule(reportRule41).

% Sans compter le cas du conducteur qui venait de droite et virait à droite avec une flèche orange clignotante.
% Il n'avait pas la priorité sur B qui passait au vert et il prend 100% de tort.

reportRule42(A,_,100) :-
	reportIsChecked(A,c12),
	reportIsChecked(A,c16),
	reportIsChecked(A,c23).

:- reportDefineRule(reportRule42).


% Mais si par exemple, il roulait sur une voie à double sens et qu'il empiétait sur l'axe médian,
% ou à plus forte raison si il l'avait franchi alors il a droit à 25% des torts. 

reportRule43(A,_,25) :-
	reportIsChecked(A,c15),
	reportIsChecked(A,c16),
	reportIsChecked(A,c24),
	not(reportIsChecked(A,c22)).

:- reportDefineRule(reportRule43).

%
% Il coche la case 16 : "Venait de droite dans un carrefour" et il n'a aucun tort.
%
reportRule44(A,_,50) :-
    reportIsChecked(A,c15),
    reportIsChecked(A,c16),
    reportIsChecked(A,c22),
    reportIsChecked(A,c24).

:- reportDefineRule(reportRule44).

%
% Il coche la case 16 : "Venait de droite dans un carrefour" et il n'a aucun tort.
%
reportRule45(A,_,0) :-
    reportIsChecked(A,c16).

:- reportDefineRule(reportRule45).

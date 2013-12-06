
:- [report].

%
% Verifies the two given report
%
reportVerify(ReportA,ReportB) :-
    not(reportAreCorrupted(ReportA,ReportB)),
    not(reportAreCorrupted(ReportB,ReportA)).


%
% Statics predicates that determine if 2 given reports are corrupted
%
reportAreCorrupted(A,B) :-
    reportIsChecked(A,c09),
    reportIsChecked(B,c09).

reportAreCorrupted(A,B) :-
    reportIsChecked(A,c16),
    reportIsChecked(B,c16).


reportAreCorrupted(A,_) :-
    reportIsChecked(A,c04),
    reportIsChecked(A,c05).

reportAreCorrupted(A,_) :-
    reportIsChecked(A,c06),
    reportIsChecked(A,c07).

reportAreCorrupted(A,_) :-
    reportIsChecked(A,c08),
    reportIsChecked(A,c09).

reportAreCorrupted(A,_) :-
    reportIsChecked(A,c12),
    reportIsChecked(A,c13).

reportAreCorrupted(A,_) :-
    reportIsChecked(A,c07),
    reportIsChecked(A,c16).


reportAreCorrupted(A,B) :-
    reportIsChecked(A,c01),
    reportIsChecked(B,c01),
    not(reportIsChecked(A,c02)),
    not(reportIsChecked(B,c02)).



:- [reportEvaluateWrongs].

%
% report user interface
%
reportUI :-
    (
        reportAskUser(A,'voiture A'),
        reportAskUser(B,'voiture B')
    ) -> (
        reportEvaluate(A,B,WrongsA,Evaluator)
    ) -> (
        write('\nRESULTATS :\n'),
        (WrongsA == -1) -> (
            write('  formulaires incoherent !\n')
        ); (
            reportSymetricWrongs(WrongsA,WrongsB),
            write('  torts de A = '),
            write(WrongsA),
            write('\n'),
            write('  torts de B = '),
            write(WrongsB),
            write('\n')
        )
    ) -> (
        write('\nSatisfait ? (o/n) > '),
        get_single_char(C),
        (
            (convert_str_char("o",C)) -> (
                write('OUI\n')
            ); (
                write('NON\n')
            )
        )
    ).



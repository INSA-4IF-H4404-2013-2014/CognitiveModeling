
:- [report].

%
% Prunes the two given reports
% TODO: Implementation
%
reportPrune(ReportA,ReportB,NewReportA,NewReportB) :-
    reportPruneStandAlone(ReportA,NewReportA),
    reportPruneStandAlone(ReportB,NewReportB).

%
% Prunes a standalone report
%
reportPruneStandAlone(Report,NewReport) :-
    (
        reportIsChecked(Report,c01),
        (
            reportIsChecked(Report,c03);
            reportIsChecked(Report,c04);
            reportIsChecked(Report,c05);
            reportIsChecked(Report,c06);
            reportIsChecked(Report,c07);
            reportIsChecked(Report,c08);
            reportIsChecked(Report,c09);
            reportIsChecked(Report,c10);
            reportIsChecked(Report,c11);
            reportIsChecked(Report,c12);
            reportIsChecked(Report,c13);
            reportIsChecked(Report,c14);
            reportIsChecked(Report,c15);
            reportIsChecked(Report,c16);
            reportIsChecked(Report,c17)
        )
    ) -> (
        reportUncheck(Report,c01,NewReport)
    ); (
        NewReport = Report
    ).


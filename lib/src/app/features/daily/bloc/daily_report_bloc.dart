import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uts_rep_ui/src/app/config/app_routes.dart';
import 'package:uts_rep_ui/src/app/features/daily/daily_report_detail_page.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/acds_m9psgn.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/report_name_model.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_request.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_response.dart';
import 'package:go_router/go_router.dart';

part 'daily_report_event.dart';
part 'daily_report_state.dart';

class DailyReportBloc extends Bloc<DailyReportEvent, DailyReportState> {
  final List<ReportName> reportsList = [
    ReportName(reportName: "Cancelled Tickets", reportId: "acds_can"),
    ReportName(reportName: "Special Cancelled Tickets", reportId: "acds_can"),
    ReportName(reportName: "Non-Issue Tickets", reportId: "acds_can"),
    ReportName(reportName: "TTE Money Receipts", reportId: "acds_can"),
    ReportName(reportName: "TC Money Receipts", reportId: "acds_can"),
    ReportName(reportName: "Misc Receipt Tickets", reportId: "acds_can"),
    ReportName(reportName: "M9 Classification Tickets", reportId: "dpmM9Psgn"),
    ReportName(
        reportName: "Sum of Trans(Cash Information)", reportId: "acds_can"),
    ReportName(
        reportName: "M17 Continuity and Ticket Information",
        reportId: "acds_can"),
    ReportName(
        reportName: "Journey and Season Station Pair", reportId: "dpmStnPair"),
    ReportName(reportName: "All Vouchers", reportId: "dpmAllVch"),
    ReportName(reportName: "Blank Papaer Tickets(BPT)", reportId: "acds_can"),
    ReportName(reportName: "Supervisor Intervention", reportId: "acds_can"),
    ReportName(reportName: "Bank Card Transaction", reportId: "acds_can"),
    ReportName(reportName: "UPI Transaction", reportId: "acds_can"),
    ReportName(reportName: "Surcharge", reportId: "acds_can"),
    ReportName(
        reportName: "All Concessions(Journey plus Season)",
        reportId: "dpmAllConc"),
    ReportName(
        reportName: "PCDO/MCDO Daily(UTS,ATVM,Mobile)", reportId: "acds_can"),
    ReportName(
        reportName: "Suburban/Nonsuburban Bifurcation(UTS,ATVM,Mobile)",
        reportId: "acds_can"),
    ReportName(reportName: "Cab Road", reportId: "acds_can"),
    ReportName(reportName: "Tourist Ticket", reportId: "dpmTourist")
  ];

  DailyReportBloc() : super(DailyReportInitial()) {
    on<DailyReportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void sendReportRequest(BuildContext context, String reportId) async {
    debugPrint("Sending Report Request");
    DailyReportRequest req = DailyReportRequest(
        requestId: "1216",
        report: reportId,
        zoneCode: "CR",
        locationCode: "CSMT",
        reportDate: "2024-02-20");

    GoRouter.of(context)
        .push("/${AppRoutes.daily}/${AppRoutes.dailyReportDetail}", extra: req);
  }
}

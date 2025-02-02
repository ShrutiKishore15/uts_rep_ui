import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/acds_report.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/acds_report_data.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_request.dart';
import 'package:uts_rep_ui/src/app/model/daily_report_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

part 'daily_report_detail_event.dart';
part 'daily_report_detail_state.dart';

class DailyReportDetailBloc
    extends Bloc<DailyReportDetailEvent, DailyReportDetailState> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080/daily'),
  );

  late AcdsReport report;
  //late AcdsCancelReport report;
  String currentReportSectionName = "";
  AcdsReportData? currentReportSection;

  DailyReportDetailBloc() : super(DailyReportDetailInitial()) {
    // on<DailyReportDetailEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<DailyReportDetailInitialiseEvent>((event, emit) {
      debugPrint("DailyReportDetailInitialiseEvent");
      DailyReportRequest req = event.request;
      fetchReport(emit, req);
    });

    on<DailyReportDetailLoadedEvent>((event, emit) {
      debugPrint("DailyReportDetailLoadedEvent");
      emit(DailyReportDetailLoaded());
    });

    on<DailyReportDetailSectionChangeEvent>((event, emit) {
      emit(DailyReportDetailSectionLoading());
      debugPrint("DailyReportDetailSectionChangeEvent");
      debugPrint(currentReportSectionName);
      currentReportSection = report.reportData
          ?.firstWhere((element) => element.section == currentReportSectionName);
      emit(DailyReportDetailSectionLoaded());
    });
  }

  fetchReport(
      Emitter<DailyReportDetailState> emit, DailyReportRequest req) async {
    emit(DailyReportDetailFetching());
    _channel.sink.add(req.toJson());

    StreamSubscription<dynamic> subscription = await _channel.stream.listen(
      (value) {},
      onError: (error) {
        debugPrint('*** Error occurred ***');
        debugPrint('$error');
      },
      onDone: () {
        debugPrint('*** Stream is closed ***');
      },
    );

    subscription.onData((event) {
      debugPrint("*** Message Received ***");
      //debugPrint(event.toString());
      DailyReportResponse res = DailyReportResponse.fromJson(event);
      if (res.requestId == req.requestId) {
        try {
          AcdsReport report = AcdsReport.fromJson(res.report);
          debugPrint("####");
          debugPrint(report.locationCode);
          this.report = report;
          add(DailyReportDetailLoadedEvent()); 
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    });
  }

  void dispose() {
    _channel.sink.close(status.goingAway);
  }
}

import 'dart:convert';

import 'package:uts_rep_ui/src/app/features/daily/models/acds_column_info.dart';

class AcdsReportData {
  String? section;
  int? order;
  List<Map<String,dynamic>>? columnInfo;
  List<Map<String,dynamic>>? figures;
  List<Map<String,dynamic>>? totals;

  AcdsReportData(
      {this.section, this.order, this.columnInfo, this.figures, this.totals});

  AcdsReportData.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    order = json['order'];
    if (json['columnInfo'] != null) {
      columnInfo = <Map<String,dynamic>>[];
      json['columnInfo'].forEach((v) {
        columnInfo!.add(jsonDecode(v));
      });
    }
    if (json['figures'] != null) {
      figures = <Map<String,dynamic>>[];
      json['figures'].forEach((v) {
        figures!.add(jsonDecode(v));
      });
    }
    if (json['totals'] != null) {
      totals = <Map<String,dynamic>>[];
      json['totals'].forEach((v) {
        totals!.add(jsonDecode(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section'] = section;
    data['order'] = order;
    if (columnInfo != null) {
      data['columnInfo'] = columnInfo!.map((v) => v).toList();
    }
    if (figures != null) {
      data['figures'] = figures!.map((v) => v).toList();
    }
    if (totals != null) {
      data['totals'] = totals!.map((v) => v).toList();
    }
    return data;
  }
}
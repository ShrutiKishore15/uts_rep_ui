import 'package:uts_rep_ui/src/app/features/daily/models/acds_report_data.dart';

class AcdsReport {
  String? system;
  String? reportName;
  String? reportType;
  String? zone;
  String? locationCode;
  String? date;
  String? dateOfRun;
  List<AcdsReportData>? reportData;

  AcdsReport(
      {this.system,
      this.reportName,
      this.reportType,
      this.zone,
      this.locationCode,
      this.date,
      this.dateOfRun,
      this.reportData});

  AcdsReport.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    reportName = json['reportName'];
    reportType = json['reportType'];
    zone = json['zone'];
    locationCode = json['locationCode'];
    date = json['date'];
    dateOfRun = json['dateOfRun'];
    if (json['reportData'] != null) {
      reportData = <AcdsReportData>[];
      json['reportData'].forEach((v) {
        reportData!.add(AcdsReportData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system'] = this.system;
    data['reportName'] = this.reportName;
    data['reportType'] = this.reportType;
    data['zone'] = this.zone;
    data['locationCode'] = this.locationCode;
    data['date'] = this.date;
    data['dateOfRun'] = this.dateOfRun;
    if (this.reportData != null) {
      data['reportData'] = this.reportData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

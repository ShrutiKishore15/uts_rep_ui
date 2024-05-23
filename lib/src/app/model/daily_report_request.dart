import 'dart:convert';

class DailyReportRequest {
  String requestId;
  String report;
  String zoneCode;
  String locationCode;
  String reportDate;
  DailyReportRequest({
    required this.requestId,
    required this.report,
    required this.zoneCode,
    required this.locationCode,
    required this.reportDate,
  });

  DailyReportRequest copyWith({
    String? requestId,
    String? report,
    String? zoneCode,
    String? locationCode,
    String? reportDate,
  }) {
    return DailyReportRequest(
      requestId: requestId ?? this.requestId,
      report: report ?? this.report,
      zoneCode: zoneCode ?? this.zoneCode,
      locationCode: locationCode ?? this.locationCode,
      reportDate: reportDate ?? this.reportDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'requestId': requestId});
    result.addAll({'report': report});
    result.addAll({'zoneCode': zoneCode});
    result.addAll({'locationCode': locationCode});
    result.addAll({'reportDate': reportDate});
  
    return result;
  }

  factory DailyReportRequest.fromMap(Map<String, dynamic> map) {
    return DailyReportRequest(
      requestId: map['requestId'] ?? '',
      report: map['report'] ?? '',
      zoneCode: map['zoneCode'] ?? '',
      locationCode: map['locationCode'] ?? '',
      reportDate: map['reportDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyReportRequest.fromJson(String source) => DailyReportRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyreportRequest(requestId: $requestId, report: $report, zoneCode: $zoneCode, locationCode: $locationCode, reportDate: $reportDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DailyReportRequest &&
      other.requestId == requestId &&
      other.report == report &&
      other.zoneCode == zoneCode &&
      other.locationCode == locationCode &&
      other.reportDate == reportDate;
  }

  @override
  int get hashCode {
    return requestId.hashCode ^
      report.hashCode ^
      zoneCode.hashCode ^
      locationCode.hashCode ^
      reportDate.hashCode;
  }
}

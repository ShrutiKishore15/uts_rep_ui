import 'dart:convert';

class ReportName {
  String reportName;
  String reportId;
  ReportName({
    required this.reportName,
    required this.reportId,
  });

  ReportName copyWith({
    String? reportName,
    String? reportId,
  }) {
    return ReportName(
      reportName: reportName ?? this.reportName,
      reportId: reportId ?? this.reportId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'reportName': reportName});
    result.addAll({'reportId': reportId});
  
    return result;
  }

  factory ReportName.fromMap(Map<String, dynamic> map) {
    return ReportName(
      reportName: map['reportName'] ?? '',
      reportId: map['reportId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportName.fromJson(String source) => ReportName.fromMap(json.decode(source));

  @override
  String toString() => 'ReportName(reportName: $reportName, reportId: $reportId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ReportName &&
      other.reportName == reportName &&
      other.reportId == reportId;
  }

  @override
  int get hashCode => reportName.hashCode ^ reportId.hashCode;
}

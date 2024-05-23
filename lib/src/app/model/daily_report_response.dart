import 'dart:convert';

class DailyReportResponse {
  String requestId;
  String status;
  String message;
  int timestamp;
  dynamic report;
  DailyReportResponse({
    required this.requestId,
    required this.status,
    required this.message,
    required this.timestamp,
    required this.report,
  });

  DailyReportResponse copyWith({
    String? requestId,
    String? status,
    String? message,
    int? timestamp,
    dynamic? report,
  }) {
    return DailyReportResponse(
      requestId: requestId ?? this.requestId,
      status: status ?? this.status,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      report: report ?? this.report,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'requestId': requestId});
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'timestamp': timestamp});
    result.addAll({'report': report});
  
    return result;
  }

  factory DailyReportResponse.fromMap(Map<String, dynamic> map) {
    return DailyReportResponse(
      requestId: map['requestId'] ?? '',
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
      report: map['report'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyReportResponse.fromJson(String source) => DailyReportResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyReportResponse(requestId: $requestId, status: $status, message: $message, timestamp: $timestamp, report: $report)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DailyReportResponse &&
      other.requestId == requestId &&
      other.status == status &&
      other.message == message &&
      other.timestamp == timestamp &&
      other.report == report;
  }

  @override
  int get hashCode {
    return requestId.hashCode ^
      status.hashCode ^
      message.hashCode ^
      timestamp.hashCode ^
      report.hashCode;
  }
}

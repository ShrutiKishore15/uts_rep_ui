// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AcdsReportData {
    final String section;
    final int order;
    final List<Map<String,dynamic>> columnInfo;
    final List<Map<String,dynamic>> figures;
    final List<Map<String,dynamic>> totals;
  AcdsReportData({
    required this.section,
    required this.order,
    required this.columnInfo,
    required this.figures,
    required this.totals,
  });

  AcdsReportData copyWith({
    String? section,
    int? order,
    List<Map<String,dynamic>>? columnInfo,
    List<Map<String,dynamic>>? figures,
    List<Map<String,dynamic>>? totals,
  }) {
    return AcdsReportData(
      section: section ?? this.section,
      order: order ?? this.order,
      columnInfo: columnInfo ?? this.columnInfo,
      figures: figures ?? this.figures,
      totals: totals ?? this.totals,
    );
  }

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};
  
  //   result.addAll({'section': section});
  //   result.addAll({'order': order});
  //   result.addAll({'columnInfo': columnInfo.map((x) => x.toMap()).toList()});
  //   result.addAll({'figures': figures.map((x) => x.toMap()).toList()});
  //   result.addAll({'totals': totals.map((x) => x.toMap()).toList()});
  
  //   return result;
  // }

  factory AcdsReportData.fromMap(Map<String, dynamic> map) {
    return AcdsReportData(
      section: map['section'] ?? '',
      order: map['order']?.toInt() ?? 0,
      columnInfo: List<Map<String,dynamic>>.from(map['columnInfo']),
      figures: List<Map<String,dynamic>>.from(map['figures']),
      totals: List<Map<String,dynamic>>.from(map['totals']),
    );
  }

  // String toJson() => json.encode(toMap());

  factory AcdsReportData.fromJson(String source) => AcdsReportData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReportDatum(section: $section, order: $order, columnInfo: $columnInfo, figures: $figures, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AcdsReportData &&
      other.section == section &&
      other.order == order &&
      listEquals(other.columnInfo, columnInfo) &&
      listEquals(other.figures, figures) &&
      listEquals(other.totals, totals);
  }

  @override
  int get hashCode {
    return section.hashCode ^
      order.hashCode ^
      columnInfo.hashCode ^
      figures.hashCode ^
      totals.hashCode;
  }
}
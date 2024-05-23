import 'dart:convert';

class ReportSectionName {
  String sectionName;
  String order;
  ReportSectionName({
    required this.sectionName,
    required this.order,
  });

  ReportSectionName copyWith({
    String? sectionName,
    String? order,
  }) {
    return ReportSectionName(
      sectionName: sectionName ?? this.sectionName,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'sectionName': sectionName});
    result.addAll({'order': order});
  
    return result;
  }

  factory ReportSectionName.fromMap(Map<String, dynamic> map) {
    return ReportSectionName(
      sectionName: map['sectionName'] ?? '',
      order: map['order'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportSectionName.fromJson(String source) => ReportSectionName.fromMap(json.decode(source));

  @override
  String toString() => 'ReportSectionName(sectionName: $sectionName, order: $order)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ReportSectionName &&
      other.sectionName == sectionName &&
      other.order == order;
  }

  @override
  int get hashCode => sectionName.hashCode ^ order.hashCode;
}

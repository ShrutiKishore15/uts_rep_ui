// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AcdsColumnInfo {
  String? columnName;
  int? columnOrder;
  bool? isOptional;
  
  AcdsColumnInfo({
    this.columnName,
    this.columnOrder,
    this.isOptional,
  });

  AcdsColumnInfo copyWith({
    String? columnName,
    int? columnOrder,
    bool? isOptional,
  }) {
    return AcdsColumnInfo(
      columnName: columnName ?? this.columnName,
      columnOrder: columnOrder ?? this.columnOrder,
      isOptional: isOptional ?? this.isOptional,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'columnName': columnName,
      'columnOrder': columnOrder,
      'isOptional': isOptional,
    };
  }

  factory AcdsColumnInfo.fromMap(Map<String, dynamic> map) {
    return AcdsColumnInfo(
      columnName: map['columnName'] != null ? map['columnName'] as String : null,
      columnOrder: map['columnOrder'] != null ? map['columnOrder'] as int : null,
      isOptional: map['isOptional'] != null ? map['isOptional'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcdsColumnInfo.fromJson(String source) => AcdsColumnInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AcdsColumnInfo(columnName: $columnName, columnOrder: $columnOrder, isOptional: $isOptional)';

  @override
  bool operator ==(covariant AcdsColumnInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.columnName == columnName &&
      other.columnOrder == columnOrder &&
      other.isOptional == isOptional;
  }

  @override
  int get hashCode => columnName.hashCode ^ columnOrder.hashCode ^ isOptional.hashCode;
}

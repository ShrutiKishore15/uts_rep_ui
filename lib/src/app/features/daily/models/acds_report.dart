// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uts_rep_ui/src/app/features/daily/models/acds_report_data.dart';

class AcdsReport {
    final String system;
    final String reportName;
    final String reportType;
    final String zone;
    final String locationCode;
    final String date;
    final String dateOfRun;
    final List<AcdsReportData> reportData;
  AcdsReport({
    required this.system,
    required this.reportName,
    required this.reportType,
    required this.zone,
    required this.locationCode,
    required this.date,
    required this.dateOfRun,
    required this.reportData,
  });

  AcdsReport copyWith({
    String? system,
    String? reportName,
    String? reportType,
    String? zone,
    String? locationCode,
    String? date,
    String? dateOfRun,
    List<AcdsReportData>? reportData,
  }) {
    return AcdsReport(
      system: system ?? this.system,
      reportName: reportName ?? this.reportName,
      reportType: reportType ?? this.reportType,
      zone: zone ?? this.zone,
      locationCode: locationCode ?? this.locationCode,
      date: date ?? this.date,
      dateOfRun: dateOfRun ?? this.dateOfRun,
      reportData: reportData ?? this.reportData,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'system': system});
    result.addAll({'reportName': reportName});
    result.addAll({'reportType': reportType});
    result.addAll({'zone': zone});
    result.addAll({'locationCode': locationCode});
    result.addAll({'date': date});
    result.addAll({'dateOfRun': dateOfRun});
    result.addAll({'reportData': List<Map<String,dynamic>>.from(result['reportData'])});
  
    return result;
  }

  factory AcdsReport.fromMap(Map<String, dynamic> map) {
    debugPrint("AcdsReport.fromMap");
    return AcdsReport(
      system: map['system'] ?? '',
      reportName: map['reportName'] ?? '',
      reportType: map['reportType'] ?? '',
      zone: map['zone'] ?? '',
      locationCode: map['locationCode'] ?? '',
      date: map['date'] ?? '',
      dateOfRun: map['dateOfRun'] ?? '',
      reportData: List<AcdsReportData>.from(map['reportData']?.map((x) => AcdsReportData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AcdsReport.fromJson(String source) => AcdsReport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AcdsM9psgnReport(system: $system, reportName: $reportName, reportType: $reportType, zone: $zone, locationCode: $locationCode, date: $date, dateOfRun: $dateOfRun, reportData: $reportData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AcdsReport &&
      other.system == system &&
      other.reportName == reportName &&
      other.reportType == reportType &&
      other.zone == zone &&
      other.locationCode == locationCode &&
      other.date == date &&
      other.dateOfRun == dateOfRun &&
      listEquals(other.reportData, reportData);
  }

  @override
  int get hashCode {
    return system.hashCode ^
      reportName.hashCode ^
      reportType.hashCode ^
      zone.hashCode ^
      locationCode.hashCode ^
      date.hashCode ^
      dateOfRun.hashCode ^
      reportData.hashCode;
  }
}


class ColumnInfo {
    final String columnName;
    final int columnOrder;
    final bool isOptional;
  ColumnInfo({
    required this.columnName,
    required this.columnOrder,
    required this.isOptional,
  });

  ColumnInfo copyWith({
    String? columnName,
    int? columnOrder,
    bool? isOptional,
  }) {
    return ColumnInfo(
      columnName: columnName ?? this.columnName,
      columnOrder: columnOrder ?? this.columnOrder,
      isOptional: isOptional ?? this.isOptional,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'columnName': columnName});
    result.addAll({'columnOrder': columnOrder});
    result.addAll({'isOptional': isOptional});
  
    return result;
  }

  factory ColumnInfo.fromMap(Map<String, dynamic> map) {
    return ColumnInfo(
      columnName: map['columnName'] ?? '',
      columnOrder: map['columnOrder']?.toInt() ?? 0,
      isOptional: map['isOptional'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColumnInfo.fromJson(String source) => ColumnInfo.fromMap(json.decode(source));

  @override
  String toString() => 'ColumnInfo(columnName: $columnName, columnOrder: $columnOrder, isOptional: $isOptional)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ColumnInfo &&
      other.columnName == columnName &&
      other.columnOrder == columnOrder &&
      other.isOptional == isOptional;
  }

  @override
  int get hashCode => columnName.hashCode ^ columnOrder.hashCode ^ isOptional.hashCode;
}

// class Figure {
//     final String dbType;
//     final String payMode;
//     final String classCode;
//     final String trainType;
//     final String tktType;
//     final int psgnAdult;
//     final int psgnChild;
//     final int psgnEsc;
//     final int cashAmt;
//     final int vouchAmt;
//     final int rtcAmt;
//     final int cstAmt;
//     final int refundAmt;
//     final int baseFare;
//     final int sfastChg;
//     final int mutpChg;
//     final int cidcoChg;
//     final int mrtsChg;
//     final int mmtsChg;
//     final int pvtbAmt;
//     final int clkgAmt;
//     final int otherChg;
//     final int gstChg;
//     final int roundOff;
//     final int netEarn;
//   Figure({
//     required this.dbType,
//     required this.payMode,
//     required this.classCode,
//     required this.trainType,
//     required this.tktType,
//     required this.psgnAdult,
//     required this.psgnChild,
//     required this.psgnEsc,
//     required this.cashAmt,
//     required this.vouchAmt,
//     required this.rtcAmt,
//     required this.cstAmt,
//     required this.refundAmt,
//     required this.baseFare,
//     required this.sfastChg,
//     required this.mutpChg,
//     required this.cidcoChg,
//     required this.mrtsChg,
//     required this.mmtsChg,
//     required this.pvtbAmt,
//     required this.clkgAmt,
//     required this.otherChg,
//     required this.gstChg,
//     required this.roundOff,
//     required this.netEarn,
//   });

//   Figure copyWith({
//     String? dbType,
//     String? payMode,
//     String? classCode,
//     String? trainType,
//     String? tktType,
//     int? psgnAdult,
//     int? psgnChild,
//     int? psgnEsc,
//     int? cashAmt,
//     int? vouchAmt,
//     int? rtcAmt,
//     int? cstAmt,
//     int? refundAmt,
//     int? baseFare,
//     int? sfastChg,
//     int? mutpChg,
//     int? cidcoChg,
//     int? mrtsChg,
//     int? mmtsChg,
//     int? pvtbAmt,
//     int? clkgAmt,
//     int? otherChg,
//     int? gstChg,
//     int? roundOff,
//     int? netEarn,
//   }) {
//     return Figure(
//       dbType: dbType ?? this.dbType,
//       payMode: payMode ?? this.payMode,
//       classCode: classCode ?? this.classCode,
//       trainType: trainType ?? this.trainType,
//       tktType: tktType ?? this.tktType,
//       psgnAdult: psgnAdult ?? this.psgnAdult,
//       psgnChild: psgnChild ?? this.psgnChild,
//       psgnEsc: psgnEsc ?? this.psgnEsc,
//       cashAmt: cashAmt ?? this.cashAmt,
//       vouchAmt: vouchAmt ?? this.vouchAmt,
//       rtcAmt: rtcAmt ?? this.rtcAmt,
//       cstAmt: cstAmt ?? this.cstAmt,
//       refundAmt: refundAmt ?? this.refundAmt,
//       baseFare: baseFare ?? this.baseFare,
//       sfastChg: sfastChg ?? this.sfastChg,
//       mutpChg: mutpChg ?? this.mutpChg,
//       cidcoChg: cidcoChg ?? this.cidcoChg,
//       mrtsChg: mrtsChg ?? this.mrtsChg,
//       mmtsChg: mmtsChg ?? this.mmtsChg,
//       pvtbAmt: pvtbAmt ?? this.pvtbAmt,
//       clkgAmt: clkgAmt ?? this.clkgAmt,
//       otherChg: otherChg ?? this.otherChg,
//       gstChg: gstChg ?? this.gstChg,
//       roundOff: roundOff ?? this.roundOff,
//       netEarn: netEarn ?? this.netEarn,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};
  
//     result.addAll({'dbType': dbType});
//     result.addAll({'payMode': payMode});
//     result.addAll({'classCode': classCode});
//     result.addAll({'trainType': trainType});
//     result.addAll({'tktType': tktType});
//     result.addAll({'psgnAdult': psgnAdult});
//     result.addAll({'psgnChild': psgnChild});
//     result.addAll({'psgnEsc': psgnEsc});
//     result.addAll({'cashAmt': cashAmt});
//     result.addAll({'vouchAmt': vouchAmt});
//     result.addAll({'rtcAmt': rtcAmt});
//     result.addAll({'cstAmt': cstAmt});
//     result.addAll({'refundAmt': refundAmt});
//     result.addAll({'baseFare': baseFare});
//     result.addAll({'sfastChg': sfastChg});
//     result.addAll({'mutpChg': mutpChg});
//     result.addAll({'cidcoChg': cidcoChg});
//     result.addAll({'mrtsChg': mrtsChg});
//     result.addAll({'mmtsChg': mmtsChg});
//     result.addAll({'pvtbAmt': pvtbAmt});
//     result.addAll({'clkgAmt': clkgAmt});
//     result.addAll({'otherChg': otherChg});
//     result.addAll({'gstChg': gstChg});
//     result.addAll({'roundOff': roundOff});
//     result.addAll({'netEarn': netEarn});
  
//     return result;
//   }

//   factory Figure.fromMap(Map<String, dynamic> map) {
//     return Figure(
//       dbType: map['dbType'] ?? '',
//       payMode: map['payMode'] ?? '',
//       classCode: map['classCode'] ?? '',
//       trainType: map['trainType'] ?? '',
//       tktType: map['tktType'] ?? '',
//       psgnAdult: map['psgnAdult']?.toInt() ?? 0,
//       psgnChild: map['psgnChild']?.toInt() ?? 0,
//       psgnEsc: map['psgnEsc']?.toInt() ?? 0,
//       cashAmt: map['cashAmt']?.toInt() ?? 0,
//       vouchAmt: map['vouchAmt']?.toInt() ?? 0,
//       rtcAmt: map['rtcAmt']?.toInt() ?? 0,
//       cstAmt: map['cstAmt']?.toInt() ?? 0,
//       refundAmt: map['refundAmt']?.toInt() ?? 0,
//       baseFare: map['baseFare']?.toInt() ?? 0,
//       sfastChg: map['sfastChg']?.toInt() ?? 0,
//       mutpChg: map['mutpChg']?.toInt() ?? 0,
//       cidcoChg: map['cidcoChg']?.toInt() ?? 0,
//       mrtsChg: map['mrtsChg']?.toInt() ?? 0,
//       mmtsChg: map['mmtsChg']?.toInt() ?? 0,
//       pvtbAmt: map['pvtbAmt']?.toInt() ?? 0,
//       clkgAmt: map['clkgAmt']?.toInt() ?? 0,
//       otherChg: map['otherChg']?.toInt() ?? 0,
//       gstChg: map['gstChg']?.toInt() ?? 0,
//       roundOff: map['roundOff']?.toInt() ?? 0,
//       netEarn: map['netEarn']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Figure.fromJson(String source) => Figure.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Figure(dbType: $dbType, payMode: $payMode, classCode: $classCode, trainType: $trainType, tktType: $tktType, psgnAdult: $psgnAdult, psgnChild: $psgnChild, psgnEsc: $psgnEsc, cashAmt: $cashAmt, vouchAmt: $vouchAmt, rtcAmt: $rtcAmt, cstAmt: $cstAmt, refundAmt: $refundAmt, baseFare: $baseFare, sfastChg: $sfastChg, mutpChg: $mutpChg, cidcoChg: $cidcoChg, mrtsChg: $mrtsChg, mmtsChg: $mmtsChg, pvtbAmt: $pvtbAmt, clkgAmt: $clkgAmt, otherChg: $otherChg, gstChg: $gstChg, roundOff: $roundOff, netEarn: $netEarn)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is Figure &&
//       other.dbType == dbType &&
//       other.payMode == payMode &&
//       other.classCode == classCode &&
//       other.trainType == trainType &&
//       other.tktType == tktType &&
//       other.psgnAdult == psgnAdult &&
//       other.psgnChild == psgnChild &&
//       other.psgnEsc == psgnEsc &&
//       other.cashAmt == cashAmt &&
//       other.vouchAmt == vouchAmt &&
//       other.rtcAmt == rtcAmt &&
//       other.cstAmt == cstAmt &&
//       other.refundAmt == refundAmt &&
//       other.baseFare == baseFare &&
//       other.sfastChg == sfastChg &&
//       other.mutpChg == mutpChg &&
//       other.cidcoChg == cidcoChg &&
//       other.mrtsChg == mrtsChg &&
//       other.mmtsChg == mmtsChg &&
//       other.pvtbAmt == pvtbAmt &&
//       other.clkgAmt == clkgAmt &&
//       other.otherChg == otherChg &&
//       other.gstChg == gstChg &&
//       other.roundOff == roundOff &&
//       other.netEarn == netEarn;
//   }

//   @override
//   int get hashCode {
//     return dbType.hashCode ^
//       payMode.hashCode ^
//       classCode.hashCode ^
//       trainType.hashCode ^
//       tktType.hashCode ^
//       psgnAdult.hashCode ^
//       psgnChild.hashCode ^
//       psgnEsc.hashCode ^
//       cashAmt.hashCode ^
//       vouchAmt.hashCode ^
//       rtcAmt.hashCode ^
//       cstAmt.hashCode ^
//       refundAmt.hashCode ^
//       baseFare.hashCode ^
//       sfastChg.hashCode ^
//       mutpChg.hashCode ^
//       cidcoChg.hashCode ^
//       mrtsChg.hashCode ^
//       mmtsChg.hashCode ^
//       pvtbAmt.hashCode ^
//       clkgAmt.hashCode ^
//       otherChg.hashCode ^
//       gstChg.hashCode ^
//       roundOff.hashCode ^
//       netEarn.hashCode;
//   }
// }

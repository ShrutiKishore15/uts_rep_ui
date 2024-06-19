// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AcdsCancelReport {
  final String system;
  final String reportName;
  final String reportType;
  final String zone;
  final String locationCode;
  final String date;
  final String dateOfRun;
  final List<ReportDatum> reportData;
  AcdsCancelReport({
    required this.system,
    required this.reportName,
    required this.reportType,
    required this.zone,
    required this.locationCode,
    required this.date,
    required this.dateOfRun,
    required this.reportData,
  });

  AcdsCancelReport copyWith({
    String? system,
    String? reportName,
    String? reportType,
    String? zone,
    String? locationCode,
    String? date,
    String? dateOfRun,
    List<ReportDatum>? reportData,
  }) {
    return AcdsCancelReport(
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
    result.addAll({'reportData': reportData.map((x) => x.toMap()).toList()});

    return result;
  }

  factory AcdsCancelReport.fromMap(Map<String, dynamic> map) {
    return AcdsCancelReport(
      system: map['system'] ?? '',
      reportName: map['reportName'] ?? '',
      reportType: map['reportType'] ?? '',
      zone: map['zone'] ?? '',
      locationCode: map['locationCode'] ?? '',
      date: map['date'] ?? '',
      dateOfRun: map['dateOfRun'] ?? '',
      reportData: List<ReportDatum>.from(
          map['reportData']?.map((x) => ReportDatum.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AcdsCancelReport.fromJson(String source) =>
      AcdsCancelReport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AcdsCancelReport(system: $system, reportName: $reportName, reportType: $reportType, zone: $zone, locationCode: $locationCode, date: $date, dateOfRun: $dateOfRun, reportData: $reportData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcdsCancelReport &&
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

class ReportDatum {
  final String section;
  final int order;
  final List<ColumnInfo> columnInfo;
  final List<Figure> figures;
  final List<Totals> totals;
  ReportDatum({
    required this.section,
    required this.order,
    required this.columnInfo,
    required this.figures,
    required this.totals,
  });

  ReportDatum copyWith({
    String? section,
    int? order,
    List<ColumnInfo>? columnInfo,
    List<Figure>? figures,
    List<Totals>? totals,
  }) {
    return ReportDatum(
      section: section ?? this.section,
      order: order ?? this.order,
      columnInfo: columnInfo ?? this.columnInfo,
      figures: figures ?? this.figures,
      totals: totals ?? this.totals,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'section': section});
    result.addAll({'order': order});
    result.addAll({'columnInfo': columnInfo.map((x) => x.toMap()).toList()});
    result.addAll({'figures': figures.map((x) => x.toMap()).toList()});
    result.addAll({'totals': totals.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ReportDatum.fromMap(Map<String, dynamic> map) {
    return ReportDatum(
      section: map['section'] ?? '',
      order: map['order']?.toInt() ?? 0,
      columnInfo: List<ColumnInfo>.from(
          map['columnInfo']?.map((x) => ColumnInfo.fromMap(x))),
      figures: List<Figure>.from(map['figures']?.map((x) => Figure.fromMap(x))),
      totals: List<Totals>.from(map['totals']?.map((x) => Figure.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportDatum.fromJson(String source) =>
      ReportDatum.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReportDatum(section: $section, order: $order, columnInfo: $columnInfo, figures: $figures, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportDatum &&
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

  factory ColumnInfo.fromJson(String source) =>
      ColumnInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'ColumnInfo(columnName: $columnName, columnOrder: $columnOrder, isOptional: $isOptional)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColumnInfo &&
        other.columnName == columnName &&
        other.columnOrder == columnOrder &&
        other.isOptional == isOptional;
  }

  @override
  int get hashCode =>
      columnName.hashCode ^ columnOrder.hashCode ^ isOptional.hashCode;
}

class Figure {
  final String dbType;
  final String payMode;
  final int windowNo;
  final int shiftNo;
  final String operatorCode;
  final String stnFrom1;
  final String stnUpto1;
  final String stnFrom2;
  final String stnUpto2;
  final String stnFrom3;
  final String stnUpto3;
  final String classCode;
  final int bkgPsgn;
  final String bkgStockno;
  final String canStockno;
  final String bkgTime;
  final String canTime;
  final int canPsgn;
  final int amountRcvd;
  final int voucherRcvd;
  final int mrEcashRcvd;
  final String utsNo;
  final int clkgAmt;
  final int clkgGstAmt;
  final int amountRefund;
  final int voucherRefund;
  final int mrEcashRefund;
  final String lF;
  final String nextAlphaCode;
  Figure({
    required this.dbType,
    required this.payMode,
    required this.windowNo,
    required this.shiftNo,
    required this.operatorCode,
    required this.stnFrom1,
    required this.stnUpto1,
    required this.stnFrom2,
    required this.stnUpto2,
    required this.stnFrom3,
    required this.stnUpto3,
    required this.classCode,
    required this.bkgPsgn,
    required this.bkgStockno,
    required this.canStockno,
    required this.bkgTime,
    required this.canTime,
    required this.canPsgn,
    required this.amountRcvd,
    required this.voucherRcvd,
    required this.mrEcashRcvd,
    required this.utsNo,
    required this.clkgAmt,
    required this.clkgGstAmt,
    required this.amountRefund,
    required this.voucherRefund,
    required this.mrEcashRefund,
    required this.lF,
    required this.nextAlphaCode,
  });

  Figure copyWith({
    String? dbType,
    String? payMode,
    int? windowNo,
    int? shiftNo,
    String? operatorCode,
    String? stnFrom1,
    String? stnUpto1,
    String? stnFrom2,
    String? stnUpto2,
    String? stnFrom3,
    String? stnUpto3,
    String? classCode,
    int? bkgPsgn,
    String? bkgStockno,
    String? canStockno,
    String? bkgTime,
    String? canTime,
    int? canPsgn,
    int? amountRcvd,
    int? voucherRcvd,
    int? mrEcashRcvd,
    String? utsNo,
    int? clkgAmt,
    int? clkgGstAmt,
    int? amountRefund,
    int? voucherRefund,
    int? mrEcashRefund,
    String? lF,
    String? nextAlphaCode,
  }) {
    return Figure(
      dbType: dbType ?? this.dbType,
      payMode: payMode ?? this.payMode,
      windowNo: windowNo ?? this.windowNo,
      shiftNo: shiftNo ?? this.shiftNo,
      operatorCode: operatorCode ?? this.operatorCode,
      stnFrom1: stnFrom1 ?? this.stnFrom1,
      stnUpto1: stnUpto1 ?? this.stnUpto1,
      stnFrom2: stnFrom2 ?? this.stnFrom2,
      stnUpto2: stnUpto2 ?? this.stnUpto2,
      stnFrom3: stnFrom3 ?? this.stnFrom3,
      stnUpto3: stnUpto3 ?? this.stnUpto3,
      classCode: classCode ?? this.classCode,
      bkgPsgn: bkgPsgn ?? this.bkgPsgn,
      bkgStockno: bkgStockno ?? this.bkgStockno,
      canStockno: canStockno ?? this.canStockno,
      bkgTime: bkgTime ?? this.bkgTime,
      canTime: canTime ?? this.canTime,
      canPsgn: canPsgn ?? this.canPsgn,
      amountRcvd: amountRcvd ?? this.amountRcvd,
      voucherRcvd: voucherRcvd ?? this.voucherRcvd,
      mrEcashRcvd: mrEcashRcvd ?? this.mrEcashRcvd,
      utsNo: utsNo ?? this.utsNo,
      clkgAmt: clkgAmt ?? this.clkgAmt,
      clkgGstAmt: clkgGstAmt ?? this.clkgGstAmt,
      amountRefund: amountRefund ?? this.amountRefund,
      voucherRefund: voucherRefund ?? this.voucherRefund,
      mrEcashRefund: mrEcashRefund ?? this.mrEcashRefund,
      lF: lF ?? this.lF,
      nextAlphaCode: nextAlphaCode ?? this.nextAlphaCode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dbType': dbType});
    result.addAll({'payMode': payMode});
    result.addAll({'windowNo': windowNo});
    result.addAll({'shiftNo': shiftNo});
    result.addAll({'operatorCode': operatorCode});
    result.addAll({'stnFrom1': stnFrom1});
    result.addAll({'stnUpto1': stnUpto1});
    result.addAll({'stnFrom2': stnFrom2});
    result.addAll({'stnUpto2': stnUpto2});
    result.addAll({'stnFrom3': stnFrom3});
    result.addAll({'stnUpto3': stnUpto3});
    result.addAll({'classCode': classCode});
    result.addAll({'bkgPsgn': bkgPsgn});
    result.addAll({'bkgStockno': bkgStockno});
    result.addAll({'canStockno': canStockno});
    result.addAll({'bkgTime': bkgTime});
    result.addAll({'canTime': canTime});
    result.addAll({'canPsgn': canPsgn});
    result.addAll({'amountRcvd': amountRcvd});
    result.addAll({'voucherRcvd': voucherRcvd});
    result.addAll({'mrEcashRcvd': mrEcashRcvd});
    result.addAll({'utsNo': utsNo});
    result.addAll({'clkgAmt': clkgAmt});
    result.addAll({'clkgGstAmt': clkgGstAmt});
    result.addAll({'amountRefund': amountRefund});
    result.addAll({'voucherRefund': voucherRefund});
    result.addAll({'mrEcashRefund': mrEcashRefund});
    result.addAll({'lF': lF});
    result.addAll({'nextAlphaCode': nextAlphaCode});

    return result;
  }

  factory Figure.fromMap(Map<String, dynamic> map) {
    debugPrint("####");
    debugPrint(map.toString());
    debugPrint(map['operatorCode'].toString());
    debugPrint("####");
    return Figure(
      dbType: map['dbType'] ?? '',
      payMode: map['payMode'] ?? '',
      windowNo: map['windowNo'] ?? 0,
      shiftNo: map['shiftNo'] ?? 0,
      operatorCode: map['operatorCode'].toString() ?? '',
      stnFrom1: map['stnFrom1'] ?? '',
      stnUpto1: map['stnUpto1'] ?? '',
      stnFrom2: map['stnFrom2'] ?? '',
      stnUpto2: map['stnUpto2'] ?? '',
      stnFrom3: map['stnFrom3'] ?? '',
      stnUpto3: map['stnUpto3'] ?? '',
      classCode: map['classCode'] ?? '',
      bkgPsgn: map['bkgPsgn']?.toInt() ?? 0,
      bkgStockno: map['bkgStockno'] ?? '',
      canStockno: map['canStockno'] ?? '',
      bkgTime: map['bkgTime'] ?? '',
      canTime: map['canTime'] ?? '',
      canPsgn: map['canPsgn']?.toInt() ?? 0,
      amountRcvd: map['amountRcvd']?.toInt() ?? 0,
      voucherRcvd: map['voucherRcvd']?.toInt() ?? 0,
      mrEcashRcvd: map['mrEcashRcvd']?.toInt() ?? 0,
      utsNo: map['utsNo'] ?? '',
      clkgAmt: map['clkgAmt']?.toInt() ?? 0,
      clkgGstAmt: map['clkgGstAmt']?.toInt() ?? 0,
      amountRefund: map['amountRefund']?.toInt() ?? 0,
      voucherRefund: map['voucherRefund']?.toInt() ?? 0,
      mrEcashRefund: map['mrEcashRefund']?.toInt() ?? 0,
      lF: map['lF'] ?? '',
      nextAlphaCode: map['nextAlphaCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Figure.fromJson(String source) => Figure.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Figure(dbType: $dbType, payMode: $payMode, windowNo: $windowNo, shiftNo: $shiftNo, operatorCode: $operatorCode, stnFrom1: $stnFrom1, stnUpto1: $stnUpto1, stnFrom2: $stnFrom2, stnUpto2: $stnUpto2, stnFrom3: $stnFrom3, stnUpto3: $stnUpto3, classCode: $classCode, bkgPsgn: $bkgPsgn, bkgStockno: $bkgStockno, canStockno: $canStockno, bkgTime: $bkgTime, canTime: $canTime, canPsgn: $canPsgn, amountRcvd: $amountRcvd, voucherRcvd: $voucherRcvd, mrEcashRcvd: $mrEcashRcvd, utsNo: $utsNo, clkgAmt: $clkgAmt, clkgGstAmt: $clkgGstAmt, amountRefund: $amountRefund, voucherRefund: $voucherRefund, mrEcashRefund: $mrEcashRefund, lF: $lF, nextAlphaCode: $nextAlphaCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Figure &&
        other.dbType == dbType &&
        other.payMode == payMode &&
        other.windowNo == windowNo &&
        other.shiftNo == shiftNo &&
        other.operatorCode == operatorCode &&
        other.stnFrom1 == stnFrom1 &&
        other.stnUpto1 == stnUpto1 &&
        other.stnFrom2 == stnFrom2 &&
        other.stnUpto2 == stnUpto2 &&
        other.stnFrom3 == stnFrom3 &&
        other.stnUpto3 == stnUpto3 &&
        other.classCode == classCode &&
        other.bkgPsgn == bkgPsgn &&
        other.bkgStockno == bkgStockno &&
        other.canStockno == canStockno &&
        other.bkgTime == bkgTime &&
        other.canTime == canTime &&
        other.canPsgn == canPsgn &&
        other.amountRcvd == amountRcvd &&
        other.voucherRcvd == voucherRcvd &&
        other.mrEcashRcvd == mrEcashRcvd &&
        other.utsNo == utsNo &&
        other.clkgAmt == clkgAmt &&
        other.clkgGstAmt == clkgGstAmt &&
        other.amountRefund == amountRefund &&
        other.voucherRefund == voucherRefund &&
        other.mrEcashRefund == mrEcashRefund &&
        other.lF == lF &&
        other.nextAlphaCode == nextAlphaCode;
  }

  @override
  int get hashCode {
    return dbType.hashCode ^
        payMode.hashCode ^
        windowNo.hashCode ^
        shiftNo.hashCode ^
        operatorCode.hashCode ^
        stnFrom1.hashCode ^
        stnUpto1.hashCode ^
        stnFrom2.hashCode ^
        stnUpto2.hashCode ^
        stnFrom3.hashCode ^
        stnUpto3.hashCode ^
        classCode.hashCode ^
        bkgPsgn.hashCode ^
        bkgStockno.hashCode ^
        canStockno.hashCode ^
        bkgTime.hashCode ^
        canTime.hashCode ^
        canPsgn.hashCode ^
        amountRcvd.hashCode ^
        voucherRcvd.hashCode ^
        mrEcashRcvd.hashCode ^
        utsNo.hashCode ^
        clkgAmt.hashCode ^
        clkgGstAmt.hashCode ^
        amountRefund.hashCode ^
        voucherRefund.hashCode ^
        mrEcashRefund.hashCode ^
        lF.hashCode ^
        nextAlphaCode.hashCode;
  }
}

class Totals {
  String? dbType;
  String? lF;
  int? bkgPsgn;
  int? canStockno;
  int? canPsgn;
  int? amountRcvd;
  int? voucherRcvd;
  int? mrEcashRcvd;
  int? clkgAmt;
  int? clkgGstAmt;
  int? amountRefund;
  int? voucherRefund;
  int? mrEcashRefund;
  Totals({
    this.dbType,
    this.lF,
    this.bkgPsgn,
    this.canStockno,
    this.canPsgn,
    this.amountRcvd,
    this.voucherRcvd,
    this.mrEcashRcvd,
    this.clkgAmt,
    this.clkgGstAmt,
    this.amountRefund,
    this.voucherRefund,
    this.mrEcashRefund,
  });


  Totals copyWith({
    String? dbType,
    String? lF,
    int? bkgPsgn,
    int? canStockno,
    int? canPsgn,
    int? amountRcvd,
    int? voucherRcvd,
    int? mrEcashRcvd,
    int? clkgAmt,
    int? clkgGstAmt,
    int? amountRefund,
    int? voucherRefund,
    int? mrEcashRefund,
  }) {
    return Totals(
      dbType: dbType ?? this.dbType,
      lF: lF ?? this.lF,
      bkgPsgn: bkgPsgn ?? this.bkgPsgn,
      canStockno: canStockno ?? this.canStockno,
      canPsgn: canPsgn ?? this.canPsgn,
      amountRcvd: amountRcvd ?? this.amountRcvd,
      voucherRcvd: voucherRcvd ?? this.voucherRcvd,
      mrEcashRcvd: mrEcashRcvd ?? this.mrEcashRcvd,
      clkgAmt: clkgAmt ?? this.clkgAmt,
      clkgGstAmt: clkgGstAmt ?? this.clkgGstAmt,
      amountRefund: amountRefund ?? this.amountRefund,
      voucherRefund: voucherRefund ?? this.voucherRefund,
      mrEcashRefund: mrEcashRefund ?? this.mrEcashRefund,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dbType': dbType,
      'lF': lF,
      'bkgPsgn': bkgPsgn,
      'canStockno': canStockno,
      'canPsgn': canPsgn,
      'amountRcvd': amountRcvd,
      'voucherRcvd': voucherRcvd,
      'mrEcashRcvd': mrEcashRcvd,
      'clkgAmt': clkgAmt,
      'clkgGstAmt': clkgGstAmt,
      'amountRefund': amountRefund,
      'voucherRefund': voucherRefund,
      'mrEcashRefund': mrEcashRefund,
    };
  }

  factory Totals.fromMap(Map<String, dynamic> map) {
    debugPrint("&&&&&&&&&&&&&&&&&&");
    return Totals(
      dbType: map['dbType'] != null ? map['dbType'] as String : null,
      lF: map['lF'] != null ? map['lF'] as String : null,
      bkgPsgn: map['bkgPsgn'] != null ? map['bkgPsgn'] as int : null,
      canStockno: map['canStockno'] != null ? map['canStockno'] as int : null,
      canPsgn: map['canPsgn'] != null ? map['canPsgn'] as int : null,
      amountRcvd: map['amountRcvd'] != null ? map['amountRcvd'] as int : null,
      voucherRcvd: map['voucherRcvd'] != null ? map['voucherRcvd'] as int : null,
      mrEcashRcvd: map['mrEcashRcvd'] != null ? map['mrEcashRcvd'] as int : null,
      clkgAmt: map['clkgAmt'] != null ? map['clkgAmt'] as int : null,
      clkgGstAmt: map['clkgGstAmt'] != null ? map['clkgGstAmt'] as int : null,
      amountRefund: map['amountRefund'] != null ? map['amountRefund'] as int : null,
      voucherRefund: map['voucherRefund'] != null ? map['voucherRefund'] as int : null,
      mrEcashRefund: map['mrEcashRefund'] != null ? map['mrEcashRefund'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Totals.fromJson(String source) => Totals.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Totals(dbType: $dbType, lF: $lF, bkgPsgn: $bkgPsgn, canStockno: $canStockno, canPsgn: $canPsgn, amountRcvd: $amountRcvd, voucherRcvd: $voucherRcvd, mrEcashRcvd: $mrEcashRcvd, clkgAmt: $clkgAmt, clkgGstAmt: $clkgGstAmt, amountRefund: $amountRefund, voucherRefund: $voucherRefund, mrEcashRefund: $mrEcashRefund)';
  }

  @override
  bool operator ==(covariant Totals other) {
    if (identical(this, other)) return true;
  
    return 
      other.dbType == dbType &&
      other.lF == lF &&
      other.bkgPsgn == bkgPsgn &&
      other.canStockno == canStockno &&
      other.canPsgn == canPsgn &&
      other.amountRcvd == amountRcvd &&
      other.voucherRcvd == voucherRcvd &&
      other.mrEcashRcvd == mrEcashRcvd &&
      other.clkgAmt == clkgAmt &&
      other.clkgGstAmt == clkgGstAmt &&
      other.amountRefund == amountRefund &&
      other.voucherRefund == voucherRefund &&
      other.mrEcashRefund == mrEcashRefund;
  }

  @override
  int get hashCode {
    return dbType.hashCode ^
      lF.hashCode ^
      bkgPsgn.hashCode ^
      canStockno.hashCode ^
      canPsgn.hashCode ^
      amountRcvd.hashCode ^
      voucherRcvd.hashCode ^
      mrEcashRcvd.hashCode ^
      clkgAmt.hashCode ^
      clkgGstAmt.hashCode ^
      amountRefund.hashCode ^
      voucherRefund.hashCode ^
      mrEcashRefund.hashCode;
  }
}

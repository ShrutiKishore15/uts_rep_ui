import 'package:uts_rep_ui/src/app/features/daily/models/acds_report.dart';

class AcdsM9Psgn extends AcdsReport{




}



class Figures {
  String? dbType;
  String? payMode;
  String? classCode;
  String? trainType;
  String? tktType;
  int? psgnAdult;
  int? psgnChild;
  int? psgnEsc;
  int? cashAmt;
  int? vouchAmt;
  int? rtcAmt;
  int? cstAmt;
  int? refundAmt;
  int? baseFare;
  int? sfastChg;
  int? mutpChg;
  int? cidcoChg;
  int? mrtsChg;
  int? mmtsChg;
  int? pvtbAmt;
  int? clkgAmt;
  int? otherChg;
  int? gstChg;
  int? roundOff;
  int? netEarn;
  int? advanceAmt;
  int? mrEcash;

  Figures(
      {this.dbType,
      this.payMode,
      this.classCode,
      this.trainType,
      this.tktType,
      this.psgnAdult,
      this.psgnChild,
      this.psgnEsc,
      this.cashAmt,
      this.vouchAmt,
      this.rtcAmt,
      this.cstAmt,
      this.refundAmt,
      this.baseFare,
      this.sfastChg,
      this.mutpChg,
      this.cidcoChg,
      this.mrtsChg,
      this.mmtsChg,
      this.pvtbAmt,
      this.clkgAmt,
      this.otherChg,
      this.gstChg,
      this.roundOff,
      this.netEarn,
      this.advanceAmt,
      this.mrEcash});

  Figures.fromJson(Map<String, dynamic> json) {
    dbType = json['dbType'];
    payMode = json['payMode'];
    classCode = json['classCode'];
    trainType = json['trainType'];
    tktType = json['tktType'];
    psgnAdult = json['psgnAdult'];
    psgnChild = json['psgnChild'];
    psgnEsc = json['psgnEsc'];
    cashAmt = json['cashAmt'];
    vouchAmt = json['vouchAmt'];
    rtcAmt = json['rtcAmt'];
    cstAmt = json['cstAmt'];
    refundAmt = json['refundAmt'];
    baseFare = json['baseFare'];
    sfastChg = json['sfastChg'];
    mutpChg = json['mutpChg'];
    cidcoChg = json['cidcoChg'];
    mrtsChg = json['mrtsChg'];
    mmtsChg = json['mmtsChg'];
    pvtbAmt = json['pvtbAmt'];
    clkgAmt = json['clkgAmt'];
    otherChg = json['otherChg'];
    gstChg = json['gstChg'];
    roundOff = json['roundOff'];
    netEarn = json['netEarn'];
    advanceAmt = json['advanceAmt'];
    mrEcash = json['mrEcash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dbType'] = dbType;
    data['payMode'] = payMode;
    data['classCode'] = classCode;
    data['trainType'] = trainType;
    data['tktType'] = tktType;
    data['psgnAdult'] = psgnAdult;
    data['psgnChild'] = psgnChild;
    data['psgnEsc'] = psgnEsc;
    data['cashAmt'] = cashAmt;
    data['vouchAmt'] = vouchAmt;
    data['rtcAmt'] = rtcAmt;
    data['cstAmt'] = cstAmt;
    data['refundAmt'] = refundAmt;
    data['baseFare'] = baseFare;
    data['sfastChg'] = sfastChg;
    data['mutpChg'] = mutpChg;
    data['cidcoChg'] = cidcoChg;
    data['mrtsChg'] = mrtsChg;
    data['mmtsChg'] = mmtsChg;
    data['pvtbAmt'] = pvtbAmt;
    data['clkgAmt'] = clkgAmt;
    data['otherChg'] = otherChg;
    data['gstChg'] = gstChg;
    data['roundOff'] = roundOff;
    data['netEarn'] = netEarn;
    data['advanceAmt'] = advanceAmt;
    data['mrEcash'] = mrEcash;
    return data;
  }
}

class Totals {
  String? dbType;
  String? payMode;
  int? psgnAdult;
  int? psgnChild;
  int? psgnEsc;
  int? cashAmt;
  int? vouchAmt;
  int? rtcAmt;
  int? cstAmt;
  int? refundAmt;
  int? baseFare;
  int? sfastChg;
  int? mutpChg;
  int? cidcoChg;
  int? mrtsChg;
  int? mmtsChg;
  int? pvtbAmt;
  int? clkgAmt;
  int? otherChg;
  int? gstChg;
  int? roundOff;
  int? netEarn;
  int? advanceAmt;
  int? mrEcash;

  Totals(
      {this.dbType,
      this.payMode,
      this.psgnAdult,
      this.psgnChild,
      this.psgnEsc,
      this.cashAmt,
      this.vouchAmt,
      this.rtcAmt,
      this.cstAmt,
      this.refundAmt,
      this.baseFare,
      this.sfastChg,
      this.mutpChg,
      this.cidcoChg,
      this.mrtsChg,
      this.mmtsChg,
      this.pvtbAmt,
      this.clkgAmt,
      this.otherChg,
      this.gstChg,
      this.roundOff,
      this.netEarn,
      this.advanceAmt,
      this.mrEcash});

  Totals.fromJson(Map<String, dynamic> json) {
    dbType = json['dbType'];
    payMode = json['payMode'];
    psgnAdult = json['psgnAdult'];
    psgnChild = json['psgnChild'];
    psgnEsc = json['psgnEsc'];
    cashAmt = json['cashAmt'];
    vouchAmt = json['vouchAmt'];
    rtcAmt = json['rtcAmt'];
    cstAmt = json['cstAmt'];
    refundAmt = json['refundAmt'];
    baseFare = json['baseFare'];
    sfastChg = json['sfastChg'];
    mutpChg = json['mutpChg'];
    cidcoChg = json['cidcoChg'];
    mrtsChg = json['mrtsChg'];
    mmtsChg = json['mmtsChg'];
    pvtbAmt = json['pvtbAmt'];
    clkgAmt = json['clkgAmt'];
    otherChg = json['otherChg'];
    gstChg = json['gstChg'];
    roundOff = json['roundOff'];
    netEarn = json['netEarn'];
    advanceAmt = json['advanceAmt'];
    mrEcash = json['mrEcash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dbType'] = this.dbType;
    data['payMode'] = this.payMode;
    data['psgnAdult'] = this.psgnAdult;
    data['psgnChild'] = this.psgnChild;
    data['psgnEsc'] = this.psgnEsc;
    data['cashAmt'] = this.cashAmt;
    data['vouchAmt'] = this.vouchAmt;
    data['rtcAmt'] = this.rtcAmt;
    data['cstAmt'] = this.cstAmt;
    data['refundAmt'] = this.refundAmt;
    data['baseFare'] = this.baseFare;
    data['sfastChg'] = this.sfastChg;
    data['mutpChg'] = this.mutpChg;
    data['cidcoChg'] = this.cidcoChg;
    data['mrtsChg'] = this.mrtsChg;
    data['mmtsChg'] = this.mmtsChg;
    data['pvtbAmt'] = this.pvtbAmt;
    data['clkgAmt'] = this.clkgAmt;
    data['otherChg'] = this.otherChg;
    data['gstChg'] = this.gstChg;
    data['roundOff'] = this.roundOff;
    data['netEarn'] = this.netEarn;
    data['advanceAmt'] = this.advanceAmt;
    data['mrEcash'] = this.mrEcash;
    return data;
  }
}

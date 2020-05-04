// To parse this JSON data, do
//
//     final betRecords = betRecordsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

BetRecords betRecordsFromJson(String str) =>
    BetRecords.fromMap(json.decode(str));

String betRecordsToJson(BetRecords data) => json.encode(data.toMap());

class BetRecords extends Equatable {
  bool success;
  dynamic msg;
  List<Datum> data;

  BetRecords({
    this.success,
    this.msg,
    this.data,
  });

  BetRecords copyWith({
    bool success,
    dynamic msg,
    List<Datum> data,
  }) =>
      BetRecords(
        success: success ?? this.success,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory BetRecords.fromMap(Map<String, dynamic> json) => BetRecords(
        success: json["success"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [success, msg, data];

  @override
  bool get stringify => true;
}

class Datum extends Equatable {
  int id;
  String uuid;
  String label;
  bool multiples;
  dynamic lastSettleTime;
  int totalStake;
  int totalAnte;
  int totalEffectiveAnte;
  int totalPayoutAmount;
  int numMatch;
  int numCombination;
  String metadata;
  dynamic tags;
  String platform;
  String createTime;
  List<BetDatum> betData;

  Datum({
    this.id,
    this.uuid,
    this.label,
    this.multiples,
    this.lastSettleTime,
    this.totalStake,
    this.totalAnte,
    this.totalEffectiveAnte,
    this.totalPayoutAmount,
    this.numMatch,
    this.numCombination,
    this.metadata,
    this.tags,
    this.platform,
    this.createTime,
    this.betData,
  });

  Datum copyWith({
    int id,
    String uuid,
    String label,
    bool multiples,
    dynamic lastSettleTime,
    int totalStake,
    int totalAnte,
    int totalEffectiveAnte,
    int totalPayoutAmount,
    int numMatch,
    int numCombination,
    String metadata,
    dynamic tags,
    String platform,
    String createTime,
    List<BetDatum> betData,
  }) =>
      Datum(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        label: label ?? this.label,
        multiples: multiples ?? this.multiples,
        lastSettleTime: lastSettleTime ?? this.lastSettleTime,
        totalStake: totalStake ?? this.totalStake,
        totalAnte: totalAnte ?? this.totalAnte,
        totalEffectiveAnte: totalEffectiveAnte ?? this.totalEffectiveAnte,
        totalPayoutAmount: totalPayoutAmount ?? this.totalPayoutAmount,
        numMatch: numMatch ?? this.numMatch,
        numCombination: numCombination ?? this.numCombination,
        metadata: metadata ?? this.metadata,
        tags: tags ?? this.tags,
        platform: platform ?? this.platform,
        createTime: createTime ?? this.createTime,
        betData: betData ?? this.betData,
      );

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        label: json["label"],
        multiples: json["multiples"],
        lastSettleTime: json["lastSettleTime"],
        totalStake: json["totalStake"],
        totalAnte: json["totalAnte"],
        totalEffectiveAnte: json["totalEffectiveAnte"],
        totalPayoutAmount: json["totalPayoutAmount"],
        numMatch: json["numMatch"],
        numCombination: json["numCombination"],
        metadata: json["metadata"],
        tags: json["tags"],
        platform: json["platform"],
        createTime: json["createTime"],
        betData: List<BetDatum>.from(
            json["betData"].map((x) => BetDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "label": label,
        "multiples": multiples,
        "lastSettleTime": lastSettleTime,
        "totalStake": totalStake,
        "totalAnte": totalAnte,
        "totalEffectiveAnte": totalEffectiveAnte,
        "totalPayoutAmount": totalPayoutAmount,
        "numMatch": numMatch,
        "numCombination": numCombination,
        "metadata": metadata,
        "tags": tags,
        "platform": platform,
        "createTime": createTime,
        "betData": List<dynamic>.from(betData.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [
        id,
        uuid,
        label,
        multiples,
        lastSettleTime,
        totalStake,
        totalAnte,
        totalEffectiveAnte,
        totalPayoutAmount,
        numMatch,
        numCombination,
        metadata,
        tags,
        platform,
        createTime,
        betData,
      ];

  @override
  bool get stringify => true;
}

class BetDatum extends Equatable {
  int id;
  String fixtureId;
  String marketId;
  String outcomeId;
  String sportType;
  dynamic resultOddsNumerator;
  dynamic resultOddsDenominator;
  bool isEnded;
  String source;
  String metadata;
  dynamic voidReason;

  BetDatum({
    this.id,
    this.fixtureId,
    this.marketId,
    this.outcomeId,
    this.sportType,
    this.resultOddsNumerator,
    this.resultOddsDenominator,
    this.isEnded,
    this.source,
    this.metadata,
    this.voidReason,
  });

  BetDatum copyWith({
    int id,
    String fixtureId,
    String marketId,
    String outcomeId,
    String sportType,
    dynamic resultOddsNumerator,
    dynamic resultOddsDenominator,
    bool isEnded,
    String source,
    String metadata,
    dynamic voidReason,
  }) =>
      BetDatum(
        id: id ?? this.id,
        fixtureId: fixtureId ?? this.fixtureId,
        marketId: marketId ?? this.marketId,
        outcomeId: outcomeId ?? this.outcomeId,
        sportType: sportType ?? this.sportType,
        resultOddsNumerator: resultOddsNumerator ?? this.resultOddsNumerator,
        resultOddsDenominator:
            resultOddsDenominator ?? this.resultOddsDenominator,
        isEnded: isEnded ?? this.isEnded,
        source: source ?? this.source,
        metadata: metadata ?? this.metadata,
        voidReason: voidReason ?? this.voidReason,
      );

  factory BetDatum.fromMap(Map<String, dynamic> json) => BetDatum(
        id: json["id"],
        fixtureId: json["fixtureId"],
        marketId: json["marketId"],
        outcomeId: json["outcomeId"],
        sportType: json["sportType"],
        resultOddsNumerator: json["resultOddsNumerator"],
        resultOddsDenominator: json["resultOddsDenominator"],
        isEnded: json["isEnded"],
        source: json["source"],
        metadata: json["metadata"],
        voidReason: json["voidReason"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fixtureId": fixtureId,
        "marketId": marketId,
        "outcomeId": outcomeId,
        "sportType": sportType,
        "resultOddsNumerator": resultOddsNumerator,
        "resultOddsDenominator": resultOddsDenominator,
        "isEnded": isEnded,
        "source": source,
        "metadata": metadata,
        "voidReason": voidReason,
      };

  @override
  List<Object> get props => [
        id,
        fixtureId,
        marketId,
        outcomeId,
        sportType,
        resultOddsNumerator,
        resultOddsDenominator,
        isEnded,
        source,
        metadata,
        voidReason
      ];

  @override
  bool get stringify => true;
}

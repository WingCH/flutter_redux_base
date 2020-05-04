// To parse this JSON data, do
//
//     final bet = betFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Bet betFromJson(String str) => Bet.fromMap(json.decode(str));

String betToJson(Bet data) => json.encode(data.toMap());

class Bet extends Equatable {
  String acceptance;
  String oddsType;
  String platform;
  List<Outcome> outcomes;
  List<dynamic> units;

  Bet({
    this.acceptance,
    this.oddsType,
    this.platform,
    this.outcomes,
    this.units,
  });

  Bet copyWith({
    String acceptance,
    String oddsType,
    String platform,
    List<Outcome> outcomes,
    List<dynamic> units,
  }) =>
      Bet(
        acceptance: acceptance ?? this.acceptance,
        oddsType: oddsType ?? this.oddsType,
        platform: platform ?? this.platform,
        outcomes: outcomes ?? this.outcomes,
        units: units ?? this.units,
      );

  factory Bet.fromMap(Map<String, dynamic> json) => Bet(
        acceptance: json["acceptance"],
        oddsType: json["oddsType"],
        platform: json["platform"],
        outcomes:
            List<Outcome>.from(json["outcomes"].map((x) => Outcome.fromMap(x))),
        units: List<dynamic>.from(json["units"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "acceptance": acceptance,
        "oddsType": oddsType,
        "platform": platform,
        "outcomes": List<dynamic>.from(outcomes.map((x) => x.toMap())),
        "units": List<dynamic>.from(units.map((x) => x)),
      };

  @override
  List<Object> get props => [acceptance, oddsType, platform, outcomes, units];

  @override
  bool get stringify => true;
}

class Outcome extends Equatable {
  String fixtureId;
  String marketId;
  String outcomeId;
  String matchStatus;
  String odds;
  String source;
  String sportType;
  int stake;

  Outcome({
    this.fixtureId,
    this.marketId,
    this.outcomeId,
    this.matchStatus,
    this.odds,
    this.source,
    this.sportType,
    this.stake,
  });

  Outcome copyWith({
    String fixtureId,
    String marketId,
    String outcomeId,
    String matchStatus,
    String odds,
    String source,
    String sportType,
    int stake,
  }) =>
      Outcome(
        fixtureId: fixtureId ?? this.fixtureId,
        marketId: marketId ?? this.marketId,
        outcomeId: outcomeId ?? this.outcomeId,
        matchStatus: matchStatus ?? this.matchStatus,
        odds: odds ?? this.odds,
        source: source ?? this.source,
        sportType: sportType ?? this.sportType,
        stake: stake ?? this.stake,
      );

  factory Outcome.fromMap(Map<String, dynamic> json) => Outcome(
        fixtureId: json["fixtureId"],
        marketId: json["marketId"],
        outcomeId: json["outcomeId"],
        matchStatus: json["matchStatus"],
        odds: json["odds"],
        source: json["source"],
        sportType: json["sportType"],
        stake: json["stake"],
      );

  Map<String, dynamic> toMap() => {
        "fixtureId": fixtureId,
        "marketId": marketId,
        "outcomeId": outcomeId,
        "matchStatus": matchStatus,
        "odds": odds,
        "source": source,
        "sportType": sportType,
        "stake": stake,
      };

  @override
  List<Object> get props => [
        fixtureId,
        marketId,
        outcomeId,
        matchStatus,
        odds,
        source,
        sportType,
        stake
      ];

  @override
  bool get stringify => true;
}

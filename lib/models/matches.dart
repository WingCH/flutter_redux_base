// To parse this JSON data, do
//
//     final matches = matchesFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Matches matchesFromJson(String str) => Matches.fromMap(json.decode(str));

String matchesToJson(Matches data) => json.encode(data.toMap());

class Matches extends Equatable {
  bool success;
  List<List<Datum>> data;
  PageData pageData;

  Matches({
    this.success,
    this.data,
    this.pageData,
  });

  Matches copyWith({
    bool success,
    List<List<Datum>> data,
    PageData pageData,
  }) =>
      Matches(
        success: success ?? this.success,
        data: data ?? this.data,
        pageData: pageData ?? this.pageData,
      );

  factory Matches.fromMap(Map<String, dynamic> json) => Matches(
        success: json["success"],
        data: List<List<Datum>>.from(json["data"]
            .map((x) => List<Datum>.from(x.map((x) => Datum.fromMap(x))))),
        pageData: PageData.fromMap(json["pageData"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(
            data.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
        "pageData": pageData.toMap(),
      };

  @override
  List<Object> get props => [success, data, pageData];

  @override
  bool get stringify => true;
}

class Datum extends Equatable {
  String fixtureId;
  String fixtureType;
  String startTime;
  List<Competitor> competitors;
  String seasonName;
  String status;
  int totalMarkets;
  String seasonId;
  String source;
  String venue;
  bool isNeutral;
  String clock;
  bool haveLiveMatch;
  String liveStatus;
  String matchId;
  bool upComingInplay;
  int startTimestamp;
  String round;
  String scoreBarInfo;
  Score score;
  int ctid;
  String description;
  List<Market> markets;

  Datum({
    this.fixtureId,
    this.fixtureType,
    this.startTime,
    this.competitors,
    this.seasonName,
    this.status,
    this.totalMarkets,
    this.seasonId,
    this.source,
    this.venue,
    this.isNeutral,
    this.clock,
    this.haveLiveMatch,
    this.liveStatus,
    this.matchId,
    this.upComingInplay,
    this.startTimestamp,
    this.round,
    this.scoreBarInfo,
    this.score,
    this.ctid,
    this.description,
    this.markets,
  });

  Datum copyWith({
    String fixtureId,
    String fixtureType,
    String startTime,
    List<Competitor> competitors,
    String seasonName,
    String status,
    int totalMarkets,
    String seasonId,
    String source,
    String venue,
    bool isNeutral,
    String clock,
    bool haveLiveMatch,
    String liveStatus,
    String matchId,
    bool upComingInplay,
    int startTimestamp,
    String round,
    String scoreBarInfo,
    Score score,
    int ctid,
    String description,
    List<Market> markets,
  }) =>
      Datum(
        fixtureId: fixtureId ?? this.fixtureId,
        fixtureType: fixtureType ?? this.fixtureType,
        startTime: startTime ?? this.startTime,
        competitors: competitors ?? this.competitors,
        seasonName: seasonName ?? this.seasonName,
        status: status ?? this.status,
        totalMarkets: totalMarkets ?? this.totalMarkets,
        seasonId: seasonId ?? this.seasonId,
        source: source ?? this.source,
        venue: venue ?? this.venue,
        isNeutral: isNeutral ?? this.isNeutral,
        clock: clock ?? this.clock,
        haveLiveMatch: haveLiveMatch ?? this.haveLiveMatch,
        liveStatus: liveStatus ?? this.liveStatus,
        matchId: matchId ?? this.matchId,
        upComingInplay: upComingInplay ?? this.upComingInplay,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        round: round ?? this.round,
        scoreBarInfo: scoreBarInfo ?? this.scoreBarInfo,
        score: score ?? this.score,
        ctid: ctid ?? this.ctid,
        description: description ?? this.description,
        markets: markets ?? this.markets,
      );

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        fixtureId: json["fixtureId"],
        fixtureType: json["fixtureType"],
        startTime: json["startTime"],
        competitors: List<Competitor>.from(
            json["competitors"].map((x) => Competitor.fromMap(x))),
        seasonName: json["seasonName"],
        status: json["status"],
        totalMarkets: json["totalMarkets"],
        seasonId: json["seasonId"],
        source: json["source"],
        venue: json["venue"],
        isNeutral: json["isNeutral"],
        clock: json["clock"],
        haveLiveMatch: json["haveLiveMatch"],
        liveStatus: json["liveStatus"],
        matchId: json["matchId"],
        upComingInplay: json["upComingInplay"],
        startTimestamp: json["startTimestamp"],
        round: json["round"],
        scoreBarInfo: json["scoreBarInfo"],
        score: Score.fromMap(json["score"]),
        ctid: json["ctid"],
        description: json["description"],
        markets:
            List<Market>.from(json["markets"].map((x) => Market.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "fixtureId": fixtureId,
        "fixtureType": fixtureType,
        "startTime": startTime,
        "competitors": List<dynamic>.from(competitors.map((x) => x.toMap())),
        "seasonName": seasonName,
        "status": status,
        "totalMarkets": totalMarkets,
        "seasonId": seasonId,
        "source": source,
        "venue": venue,
        "isNeutral": isNeutral,
        "clock": clock,
        "haveLiveMatch": haveLiveMatch,
        "liveStatus": liveStatus,
        "matchId": matchId,
        "upComingInplay": upComingInplay,
        "startTimestamp": startTimestamp,
        "round": round,
        "scoreBarInfo": scoreBarInfo,
        "score": score.toMap(),
        "ctid": ctid,
        "description": description,
        "markets": List<dynamic>.from(markets.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [
        fixtureId,
        fixtureType,
        startTime,
        competitors,
        seasonName,
        status,
        totalMarkets,
        seasonId,
        source,
        venue,
        isNeutral,
        clock,
        haveLiveMatch,
        liveStatus,
        matchId,
        upComingInplay,
        startTimestamp,
        round,
        scoreBarInfo,
        score,
        ctid,
        description,
        markets
      ];

  @override
  bool get stringify => true;
}

class Competitor extends Equatable {
  String name;
  String qualifier;

  Competitor({
    this.name,
    this.qualifier,
  });

  Competitor copyWith({
    String name,
    String qualifier,
  }) =>
      Competitor(
        name: name ?? this.name,
        qualifier: qualifier ?? this.qualifier,
      );

  factory Competitor.fromMap(Map<String, dynamic> json) => Competitor(
        name: json["name"],
        qualifier: json["qualifier"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "qualifier": qualifier,
      };

  @override
  List<Object> get props => [name, qualifier];

  @override
  bool get stringify => true;
}

class Market extends Equatable {
  String id;
  String name;
  int status;
  String marketTypeId;
  List<Outcome> outcomes;
  String marketCode;
  String marketId;
  String specifiers;
  bool isOldHcp;

  Market({
    this.id,
    this.name,
    this.status,
    this.marketTypeId,
    this.outcomes,
    this.marketCode,
    this.marketId,
    this.specifiers,
    this.isOldHcp,
  });

  Market copyWith({
    String id,
    String name,
    int status,
    String marketTypeId,
    List<Outcome> outcomes,
    String marketCode,
    String marketId,
    String specifiers,
    bool isOldHcp,
  }) =>
      Market(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        marketTypeId: marketTypeId ?? this.marketTypeId,
        outcomes: outcomes ?? this.outcomes,
        marketCode: marketCode ?? this.marketCode,
        marketId: marketId ?? this.marketId,
        specifiers: specifiers ?? this.specifiers,
        isOldHcp: isOldHcp ?? this.isOldHcp,
      );

  factory Market.fromMap(Map<String, dynamic> json) => Market(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        marketTypeId: json["marketTypeId"],
        outcomes:
            List<Outcome>.from(json["outcomes"].map((x) => Outcome.fromMap(x))),
        marketCode: json["marketCode"],
        marketId: json["market_id"],
        specifiers: json["specifiers"],
        isOldHcp: json["isOldHcp"] == null ? null : json["isOldHcp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "marketTypeId": marketTypeId,
        "outcomes": List<dynamic>.from(outcomes.map((x) => x.toMap())),
        "marketCode": marketCode,
        "market_id": marketId,
        "specifiers": specifiers,
        "isOldHcp": isOldHcp == null ? null : isOldHcp,
      };

  @override
  List<Object> get props => [
        id,
        name,
        status,
        marketTypeId,
        outcomes,
        marketCode,
        marketId,
        specifiers,
        isOldHcp
      ];

  @override
  bool get stringify => true;
}

class Outcome extends Equatable {
  String id;
  String name;
  int active;
  int euroNumerator;
  int euroDenominator;
  String euOdds;
  String odds;
  String numerator;
  String denominator;
  String outcomeCode;
  String specifier;

  Outcome({
    this.id,
    this.name,
    this.active,
    this.euroNumerator,
    this.euroDenominator,
    this.euOdds,
    this.odds,
    this.numerator,
    this.denominator,
    this.outcomeCode,
    this.specifier,
  });

  Outcome copyWith({
    String id,
    String name,
    int active,
    int euroNumerator,
    int euroDenominator,
    String euOdds,
    String odds,
    String numerator,
    String denominator,
    String outcomeCode,
    String specifier,
  }) =>
      Outcome(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        euroNumerator: euroNumerator ?? this.euroNumerator,
        euroDenominator: euroDenominator ?? this.euroDenominator,
        euOdds: euOdds ?? this.euOdds,
        odds: odds ?? this.odds,
        numerator: numerator ?? this.numerator,
        denominator: denominator ?? this.denominator,
        outcomeCode: outcomeCode ?? this.outcomeCode,
        specifier: specifier ?? this.specifier,
      );

  factory Outcome.fromMap(Map<String, dynamic> json) => Outcome(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        euroNumerator: json["euroNumerator"],
        euroDenominator: json["euroDenominator"],
        euOdds: json["euOdds"],
        odds: json["odds"],
        numerator: json["numerator"],
        denominator: json["denominator"],
        outcomeCode: json["outcomeCode"],
        specifier: json["specifier"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "active": active,
        "euroNumerator": euroNumerator,
        "euroDenominator": euroDenominator,
        "euOdds": euOdds,
        "odds": odds,
        "numerator": numerator,
        "denominator": denominator,
        "outcomeCode": outcomeCode,
        "specifier": specifier,
      };

  @override
  List<Object> get props => [
        id,
        name,
        active,
        euroNumerator,
        euroDenominator,
        euOdds,
        odds,
        numerator,
        denominator,
        outcomeCode,
        specifier
      ];

  @override
  bool get stringify => true;
}

class Score extends Equatable {
  int homeScore;
  int awayScore;
  int hRedCard;
  int aRedCard;

  Score({
    this.homeScore,
    this.awayScore,
    this.hRedCard,
    this.aRedCard,
  });

  Score copyWith({
    int homeScore,
    int awayScore,
    int hRedCard,
    int aRedCard,
  }) =>
      Score(
        homeScore: homeScore ?? this.homeScore,
        awayScore: awayScore ?? this.awayScore,
        hRedCard: hRedCard ?? this.hRedCard,
        aRedCard: aRedCard ?? this.aRedCard,
      );

  factory Score.fromMap(Map<String, dynamic> json) => Score(
        homeScore: json["homeScore"],
        awayScore: json["awayScore"],
        hRedCard: json["hRedCard"],
        aRedCard: json["aRedCard"],
      );

  Map<String, dynamic> toMap() => {
        "homeScore": homeScore,
        "awayScore": awayScore,
        "hRedCard": hRedCard,
        "aRedCard": aRedCard,
      };

  @override
  List<Object> get props => [homeScore, awayScore, hRedCard, aRedCard];

  @override
  bool get stringify => true;
}

class PageData extends Equatable {
  int page;
  int pageRecordCount;
  int totalRecords;
  int totalPages;
  String lang;
  int pageSize;
  int timezone;
  int ignoreFixture;
  int ignoreFixtureNoMarkets;

  PageData({
    this.page,
    this.pageRecordCount,
    this.totalRecords,
    this.totalPages,
    this.lang,
    this.pageSize,
    this.timezone,
    this.ignoreFixture,
    this.ignoreFixtureNoMarkets,
  });

  PageData copyWith({
    int page,
    int pageRecordCount,
    int totalRecords,
    int totalPages,
    String lang,
    int pageSize,
    int timezone,
    int ignoreFixture,
    int ignoreFixtureNoMarkets,
  }) =>
      PageData(
        page: page ?? this.page,
        pageRecordCount: pageRecordCount ?? this.pageRecordCount,
        totalRecords: totalRecords ?? this.totalRecords,
        totalPages: totalPages ?? this.totalPages,
        lang: lang ?? this.lang,
        pageSize: pageSize ?? this.pageSize,
        timezone: timezone ?? this.timezone,
        ignoreFixture: ignoreFixture ?? this.ignoreFixture,
        ignoreFixtureNoMarkets:
            ignoreFixtureNoMarkets ?? this.ignoreFixtureNoMarkets,
      );

  factory PageData.fromMap(Map<String, dynamic> json) => PageData(
        page: json["page"],
        pageRecordCount: json["pageRecordCount"],
        totalRecords: json["totalRecords"],
        totalPages: json["totalPages"],
        lang: json["lang"],
        pageSize: json["pageSize"],
        timezone: json["timezone"],
        ignoreFixture: json["ignoreFixture"],
        ignoreFixtureNoMarkets: json["ignoreFixture_noMarkets"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageRecordCount": pageRecordCount,
        "totalRecords": totalRecords,
        "totalPages": totalPages,
        "lang": lang,
        "pageSize": pageSize,
        "timezone": timezone,
        "ignoreFixture": ignoreFixture,
        "ignoreFixture_noMarkets": ignoreFixtureNoMarkets,
      };

  @override
  List<Object> get props => [
        page,
        pageRecordCount,
        totalRecords,
        totalRecords,
        totalPages,
        lang,
        pageSize,
        timezone,
        ignoreFixture,
        ignoreFixtureNoMarkets
      ];

  @override
  bool get stringify => true;
}

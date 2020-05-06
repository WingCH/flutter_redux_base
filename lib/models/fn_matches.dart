// To parse this JSON data, do
//
//     final fnMatches = fnMatchesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FnMatches fnMatchesFromJson(String str) => FnMatches.fromJson(json.decode(str));

String fnMatchesToJson(FnMatches data) => json.encode(data.toJson());

class FnMatches {
  final bool success;
  final Data data;
  final PageData pageData;

  FnMatches({
    @required this.success,
    @required this.data,
    @required this.pageData,
  });

  FnMatches copyWith({
    bool success,
    Data data,
    PageData pageData,
  }) =>
      FnMatches(
        success: success ?? this.success,
        data: data ?? this.data,
        pageData: pageData ?? this.pageData,
      );

  factory FnMatches.fromJson(Map<String, dynamic> json) => FnMatches(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        pageData: json["pageData"] == null
            ? null
            : PageData.fromJson(json["pageData"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
        "pageData": pageData == null ? null : pageData.toJson(),
      };
}

class Data {
  final List<Not> not;

  Data({
    @required this.not,
  });

  Data copyWith({
    List<Not> not,
  }) =>
      Data(
        not: not ?? this.not,
      );

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json["not"]) {
      List<Not> data = [];
      for (String key in json["not"].keys) {
        Not not = Not.fromJson(json["not"][key], key);
        data.add(not);
      }
    }
    //TODO: 好似唔係用e條api 所以唔洗理住

    return Data(
      not: json["not"] == null ? null : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "not":
            not == null ? null : List<dynamic>.from(not.map((x) => x.toJson())),
      };
}

class Not {
  final String id;
  final NotInfo info;
  final List<Match> match;

  Not({
    @required this.id,
    @required this.info,
    @required this.match,
  });

  Not copyWith({
    String id,
    NotInfo info,
    List<Match> match,
  }) =>
      Not(
        id: id ?? this.id,
        info: info ?? this.info,
        match: match ?? this.match,
      );

  factory Not.fromJson(Map<String, dynamic> json, String id) => Not(
        id: id,
        info: json["info"] == null ? null : NotInfo.fromJson(json["info"]),
        match: json["match"] == null
            ? null
            : List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "info": info == null ? null : info.toJson(),
        "match": match == null
            ? null
            : List<dynamic>.from(match.map((x) => x.toJson())),
      };
}

class NotInfo {
  final String zh;
  final String en;
  final String firstStart;
  final String seasonId;

  NotInfo({
    @required this.zh,
    @required this.en,
    @required this.firstStart,
    @required this.seasonId,
  });

  NotInfo copyWith({
    String zh,
    String en,
    String firstStart,
    String seasonId,
  }) =>
      NotInfo(
        zh: zh ?? this.zh,
        en: en ?? this.en,
        firstStart: firstStart ?? this.firstStart,
        seasonId: seasonId ?? this.seasonId,
      );

  factory NotInfo.fromJson(Map<String, dynamic> json) => NotInfo(
        zh: json["zh"] == null ? null : json["zh"],
        en: json["en"] == null ? null : json["en"],
        firstStart: json["firstStart"] == null ? null : json["firstStart"],
        seasonId: json["seasonId"] == null ? null : json["seasonId"],
      );

  Map<String, dynamic> toJson() => {
        "zh": zh == null ? null : zh,
        "en": en == null ? null : en,
        "firstStart": firstStart == null ? null : firstStart,
        "seasonId": seasonId == null ? null : seasonId,
      };
}

class Match {
  final MatchInfo info;
  final List<Event> events;

  Match({
    @required this.info,
    @required this.events,
  });

  Match copyWith({
    MatchInfo info,
    List<Event> events,
  }) =>
      Match(
        info: info ?? this.info,
        events: events ?? this.events,
      );

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        info: json["info"] == null ? null : MatchInfo.fromJson(json["info"]),
        events: json["events"] == null
            ? null
            : List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info == null ? null : info.toJson(),
        "events": events == null
            ? null
            : List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  final String fixtureId;
  final Competitors competitors;
  final Score score;
  final int ctid;
  final String description;
  final List<Market> markets;

  Event({
    @required this.fixtureId,
    @required this.competitors,
    @required this.score,
    @required this.ctid,
    @required this.description,
    @required this.markets,
  });

  Event copyWith({
    String fixtureId,
    Competitors competitors,
    Score score,
    int ctid,
    String description,
    List<Market> markets,
  }) =>
      Event(
        fixtureId: fixtureId ?? this.fixtureId,
        competitors: competitors ?? this.competitors,
        score: score ?? this.score,
        ctid: ctid ?? this.ctid,
        description: description ?? this.description,
        markets: markets ?? this.markets,
      );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        fixtureId: json["fixtureId"] == null ? null : json["fixtureId"],
        competitors: json["competitors"] == null
            ? null
            : Competitors.fromJson(json["competitors"]),
        score: json["score"] == null ? null : Score.fromJson(json["score"]),
        ctid: json["ctid"] == null ? null : json["ctid"],
        description: json["description"] == null ? null : json["description"],
        markets: json["markets"] == null
            ? null
            : List<Market>.from(json["markets"].map((x) => Market.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fixtureId": fixtureId == null ? null : fixtureId,
        "competitors": competitors == null ? null : competitors.toJson(),
        "score": score == null ? null : score.toJson(),
        "ctid": ctid == null ? null : ctid,
        "description": description == null ? null : description,
        "markets": markets == null
            ? null
            : List<dynamic>.from(markets.map((x) => x.toJson())),
      };
}

class Competitors {
  final Away home;
  final Away away;

  Competitors({
    @required this.home,
    @required this.away,
  });

  Competitors copyWith({
    Away home,
    Away away,
  }) =>
      Competitors(
        home: home ?? this.home,
        away: away ?? this.away,
      );

  factory Competitors.fromJson(Map<String, dynamic> json) => Competitors(
        home: json["home"] == null ? null : Away.fromJson(json["home"]),
        away: json["away"] == null ? null : Away.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home == null ? null : home.toJson(),
        "away": away == null ? null : away.toJson(),
      };
}

class Away {
  final String name;

  Away({
    @required this.name,
  });

  Away copyWith({
    String name,
  }) =>
      Away(
        name: name ?? this.name,
      );

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}

class Market {
  final String id;
  final dynamic outcomes;
  final String marketCode;
  final String marketId;
  final bool isOldHcp;
  final String name;

  Market({
    @required this.id,
    @required this.outcomes,
    @required this.marketCode,
    @required this.marketId,
    @required this.isOldHcp,
    @required this.name,
  });

  Market copyWith({
    String id,
    dynamic outcomes,
    String marketCode,
    String marketId,
    bool isOldHcp,
    String name,
  }) =>
      Market(
        id: id ?? this.id,
        outcomes: outcomes ?? this.outcomes,
        marketCode: marketCode ?? this.marketCode,
        marketId: marketId ?? this.marketId,
        isOldHcp: isOldHcp ?? this.isOldHcp,
        name: name ?? this.name,
      );

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        id: json["id"] == null ? null : json["id"],
        outcomes: json["outcomes"],
        marketCode: json["marketCode"] == null ? null : json["marketCode"],
        marketId: json["market_id"] == null ? null : json["market_id"],
        isOldHcp: json["isOldHcp"] == null ? null : json["isOldHcp"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "outcomes": outcomes,
        "marketCode": marketCode == null ? null : marketCode,
        "market_id": marketId == null ? null : marketId,
        "isOldHcp": isOldHcp == null ? null : isOldHcp,
        "name": name == null ? null : name,
      };
}

class Outcome {
  final String id;
  final String name;
  final int active;
  final String euOdds;
  final String odds;
  final String outcomeCode;
  final String specifier;

  Outcome({
    @required this.id,
    @required this.name,
    @required this.active,
    @required this.euOdds,
    @required this.odds,
    @required this.outcomeCode,
    @required this.specifier,
  });

  Outcome copyWith({
    String id,
    String name,
    int active,
    String euOdds,
    String odds,
    String outcomeCode,
    String specifier,
  }) =>
      Outcome(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        euOdds: euOdds ?? this.euOdds,
        odds: odds ?? this.odds,
        outcomeCode: outcomeCode ?? this.outcomeCode,
        specifier: specifier ?? this.specifier,
      );

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        active: json["active"] == null ? null : json["active"],
        euOdds: json["euOdds"] == null ? null : json["euOdds"],
        odds: json["odds"] == null ? null : json["odds"],
        outcomeCode: json["outcomeCode"] == null ? null : json["outcomeCode"],
        specifier: json["specifier"] == null ? null : json["specifier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "active": active == null ? null : active,
        "euOdds": euOdds == null ? null : euOdds,
        "odds": odds == null ? null : odds,
        "outcomeCode": outcomeCode == null ? null : outcomeCode,
        "specifier": specifier == null ? null : specifier,
      };
}

class OutcomesClass {
  final Outcome h;
  final Outcome a;
  final Outcome ov;
  final Outcome un;
  final Outcome od;
  final Outcome ev;
  final Outcome d;
  final Outcome the4;
  final Outcome the5;

  OutcomesClass({
    @required this.h,
    @required this.a,
    @required this.ov,
    @required this.un,
    @required this.od,
    @required this.ev,
    @required this.d,
    @required this.the4,
    @required this.the5,
  });

  OutcomesClass copyWith({
    Outcome h,
    Outcome a,
    Outcome ov,
    Outcome un,
    Outcome od,
    Outcome ev,
    Outcome d,
    Outcome the4,
    Outcome the5,
  }) =>
      OutcomesClass(
        h: h ?? this.h,
        a: a ?? this.a,
        ov: ov ?? this.ov,
        un: un ?? this.un,
        od: od ?? this.od,
        ev: ev ?? this.ev,
        d: d ?? this.d,
        the4: the4 ?? this.the4,
        the5: the5 ?? this.the5,
      );

  factory OutcomesClass.fromJson(Map<String, dynamic> json) => OutcomesClass(
        h: json["h"] == null ? null : Outcome.fromJson(json["h"]),
        a: json["a"] == null ? null : Outcome.fromJson(json["a"]),
        ov: json["ov"] == null ? null : Outcome.fromJson(json["ov"]),
        un: json["un"] == null ? null : Outcome.fromJson(json["un"]),
        od: json["od"] == null ? null : Outcome.fromJson(json["od"]),
        ev: json["ev"] == null ? null : Outcome.fromJson(json["ev"]),
        d: json["d"] == null ? null : Outcome.fromJson(json["d"]),
        the4: json["4"] == null ? null : Outcome.fromJson(json["4"]),
        the5: json["5"] == null ? null : Outcome.fromJson(json["5"]),
      );

  Map<String, dynamic> toJson() => {
        "h": h == null ? null : h.toJson(),
        "a": a == null ? null : a.toJson(),
        "ov": ov == null ? null : ov.toJson(),
        "un": un == null ? null : un.toJson(),
        "od": od == null ? null : od.toJson(),
        "ev": ev == null ? null : ev.toJson(),
        "d": d == null ? null : d.toJson(),
        "4": the4 == null ? null : the4.toJson(),
        "5": the5 == null ? null : the5.toJson(),
      };
}

class Score {
  final int homeScore;
  final int awayScore;
  final int hRedCard;
  final int aRedCard;

  Score({
    @required this.homeScore,
    @required this.awayScore,
    @required this.hRedCard,
    @required this.aRedCard,
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

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        homeScore: json["homeScore"] == null ? null : json["homeScore"],
        awayScore: json["awayScore"] == null ? null : json["awayScore"],
        hRedCard: json["hRedCard"] == null ? null : json["hRedCard"],
        aRedCard: json["aRedCard"] == null ? null : json["aRedCard"],
      );

  Map<String, dynamic> toJson() => {
        "homeScore": homeScore == null ? null : homeScore,
        "awayScore": awayScore == null ? null : awayScore,
        "hRedCard": hRedCard == null ? null : hRedCard,
        "aRedCard": aRedCard == null ? null : aRedCard,
      };
}

class MatchInfo {
  final String matchId;
  final String source;
  final String status;
  final bool isNeutral;
  final String clock;
  final String startTime;
  final bool upComingInplay;
  final int totalMarkets;
  final String round;
  final String liveStatus;
  final bool haveLiveMatch;
  final String scoreBarInfo;

  MatchInfo({
    @required this.matchId,
    @required this.source,
    @required this.status,
    @required this.isNeutral,
    @required this.clock,
    @required this.startTime,
    @required this.upComingInplay,
    @required this.totalMarkets,
    @required this.round,
    @required this.liveStatus,
    @required this.haveLiveMatch,
    @required this.scoreBarInfo,
  });

  MatchInfo copyWith({
    String matchId,
    String source,
    String status,
    bool isNeutral,
    String clock,
    String startTime,
    bool upComingInplay,
    int totalMarkets,
    String round,
    String liveStatus,
    bool haveLiveMatch,
    String scoreBarInfo,
  }) =>
      MatchInfo(
        matchId: matchId ?? this.matchId,
        source: source ?? this.source,
        status: status ?? this.status,
        isNeutral: isNeutral ?? this.isNeutral,
        clock: clock ?? this.clock,
        startTime: startTime ?? this.startTime,
        upComingInplay: upComingInplay ?? this.upComingInplay,
        totalMarkets: totalMarkets ?? this.totalMarkets,
        round: round ?? this.round,
        liveStatus: liveStatus ?? this.liveStatus,
        haveLiveMatch: haveLiveMatch ?? this.haveLiveMatch,
        scoreBarInfo: scoreBarInfo ?? this.scoreBarInfo,
      );

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchId: json["matchId"] == null ? null : json["matchId"],
        source: json["source"] == null ? null : json["source"],
        status: json["status"] == null ? null : json["status"],
        isNeutral: json["isNeutral"] == null ? null : json["isNeutral"],
        clock: json["clock"] == null ? null : json["clock"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        upComingInplay:
            json["upComingInplay"] == null ? null : json["upComingInplay"],
        totalMarkets:
            json["totalMarkets"] == null ? null : json["totalMarkets"],
        round: json["round"] == null ? null : json["round"],
        liveStatus: json["liveStatus"] == null ? null : json["liveStatus"],
        haveLiveMatch:
            json["haveLiveMatch"] == null ? null : json["haveLiveMatch"],
        scoreBarInfo:
            json["scoreBarInfo"] == null ? null : json["scoreBarInfo"],
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId == null ? null : matchId,
        "source": source == null ? null : source,
        "status": status == null ? null : status,
        "isNeutral": isNeutral == null ? null : isNeutral,
        "clock": clock == null ? null : clock,
        "startTime": startTime == null ? null : startTime,
        "upComingInplay": upComingInplay == null ? null : upComingInplay,
        "totalMarkets": totalMarkets == null ? null : totalMarkets,
        "round": round == null ? null : round,
        "liveStatus": liveStatus == null ? null : liveStatus,
        "haveLiveMatch": haveLiveMatch == null ? null : haveLiveMatch,
        "scoreBarInfo": scoreBarInfo == null ? null : scoreBarInfo,
      };
}

class PageData {
  final int page;
  final int pageRecordCount;
  final int totalRecords;
  final int totalPages;
  final String lang;
  final int pageSize;
  final int timezone;
  final int ignoreFixture;
  final int ignoreFixtureNoMarkets;

  PageData({
    @required this.page,
    @required this.pageRecordCount,
    @required this.totalRecords,
    @required this.totalPages,
    @required this.lang,
    @required this.pageSize,
    @required this.timezone,
    @required this.ignoreFixture,
    @required this.ignoreFixtureNoMarkets,
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

  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
        page: json["page"] == null ? null : json["page"],
        pageRecordCount:
            json["pageRecordCount"] == null ? null : json["pageRecordCount"],
        totalRecords:
            json["totalRecords"] == null ? null : json["totalRecords"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        lang: json["lang"] == null ? null : json["lang"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        ignoreFixture:
            json["ignoreFixture"] == null ? null : json["ignoreFixture"],
        ignoreFixtureNoMarkets: json["ignoreFixture_noMarkets"] == null
            ? null
            : json["ignoreFixture_noMarkets"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "pageRecordCount": pageRecordCount == null ? null : pageRecordCount,
        "totalRecords": totalRecords == null ? null : totalRecords,
        "totalPages": totalPages == null ? null : totalPages,
        "lang": lang == null ? null : lang,
        "pageSize": pageSize == null ? null : pageSize,
        "timezone": timezone == null ? null : timezone,
        "ignoreFixture": ignoreFixture == null ? null : ignoreFixture,
        "ignoreFixture_noMarkets":
            ignoreFixtureNoMarkets == null ? null : ignoreFixtureNoMarkets,
      };
}

// To parse this JSON data, do
//
//     final matchCount = matchCountFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

MatchCount matchCountFromJson(String str) =>
    MatchCount.fromMap(json.decode(str));

String matchCountToJson(MatchCount data) => json.encode(data.toMap());

class MatchCount extends Equatable {
  bool success;
  Data data;
  int code;

  MatchCount({
    this.success,
    this.data,
    this.code,
  });

  MatchCount copyWith({
    bool success,
    Data data,
    int code,
  }) =>
      MatchCount(
        success: success ?? this.success,
        data: data ?? this.data,
        code: code ?? this.code,
      );

  factory MatchCount.fromMap(Map<String, dynamic> json) => MatchCount(
        success: json["success"],
        data: Data.fromMap(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
        "code": code,
      };

  @override
  List<Object> get props => [success, data, code];

  @override
  bool get stringify => true;
}

class Data {
  Baseball football;
  Baseball basketball;
  Baseball tennis;
  Baseball baseball;

  Data({
    this.football,
    this.basketball,
    this.tennis,
    this.baseball,
  });

  Data copyWith({
    Baseball football,
    Baseball basketball,
    Baseball tennis,
    Baseball baseball,
  }) =>
      Data(
        football: football ?? this.football,
        basketball: basketball ?? this.basketball,
        tennis: tennis ?? this.tennis,
        baseball: baseball ?? this.baseball,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        football: Baseball.fromMap(json["football"]),
        basketball: Baseball.fromMap(json["basketball"]),
        tennis: Baseball.fromMap(json["tennis"]),
        baseball: Baseball.fromMap(json["baseball"]),
      );

  Map<String, dynamic> toMap() => {
        "football": football.toMap(),
        "basketball": basketball.toMap(),
        "tennis": tennis.toMap(),
        "baseball": baseball.toMap(),
      };

  @override
  List<Object> get props => [football, basketball, tennis, baseball];

  @override
  bool get stringify => true;
}

class Baseball extends Equatable {
  int live;
  int today;
  int pre;
  int parlay;

  Baseball({
    this.live,
    this.today,
    this.pre,
    this.parlay,
  });

  Baseball copyWith({
    int live,
    int today,
    int pre,
    int parlay,
  }) =>
      Baseball(
        live: live ?? this.live,
        today: today ?? this.today,
        pre: pre ?? this.pre,
        parlay: parlay ?? this.parlay,
      );

  factory Baseball.fromMap(Map<String, dynamic> json) => Baseball(
        live: json["Live"],
        today: json["Today"],
        pre: json["Pre"],
        parlay: json["Parlay"],
      );

  Map<String, dynamic> toMap() => {
        "Live": live,
        "Today": today,
        "Pre": pre,
        "Parlay": parlay,
      };

  @override
  List<Object> get props => [live, today, pre, parlay];

  @override
  bool get stringify => true;
}

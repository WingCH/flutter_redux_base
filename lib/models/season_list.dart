// To parse this JSON data, do
//
//     final seasonList = seasonListFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

SeasonList seasonListFromJson(String str) =>
    SeasonList.fromMap(json.decode(str));

String seasonListToJson(SeasonList data) => json.encode(data.toMap());

class SeasonList extends Equatable {
  bool success;
  Data data;

  SeasonList({
    this.success,
    this.data,
  });

  SeasonList copyWith({
    bool success,
    Data data,
  }) =>
      SeasonList(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory SeasonList.fromMap(Map<String, dynamic> json) => SeasonList(
        success: json["success"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
      };

  @override
  List<Object> get props => [success, data];

  @override
  bool get stringify => true;
}

class Data extends Equatable {
  List<Menu> menu;
  List<dynamic> popular;
  List<Country> country;

  Data({
    this.menu,
    this.popular,
    this.country,
  });

  Data copyWith({
    List<Menu> menu,
    List<dynamic> popular,
    List<Country> country,
  }) =>
      Data(
        menu: menu ?? this.menu,
        popular: popular ?? this.popular,
        country: country ?? this.country,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromMap(x))),
        popular: List<dynamic>.from(json["popular"].map((x) => x)),
        country:
            List<Country>.from(json["country"].map((x) => Country.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toMap())),
        "popular": List<dynamic>.from(popular.map((x) => x)),
        "country": List<dynamic>.from(country.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [menu, popular, country];

  @override
  bool get stringify => true;
}

class Country extends Equatable {
  String name;
  List<Competition> competitions;

  Country({
    this.name,
    this.competitions,
  });

  Country copyWith({
    String name,
    List<Competition> competitions,
  }) =>
      Country(
        name: name ?? this.name,
        competitions: competitions ?? this.competitions,
      );

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        competitions: List<Competition>.from(
            json["competitions"].map((x) => Competition.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "competitions": List<dynamic>.from(competitions.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [name, competitions];

  @override
  bool get stringify => true;
}

class Competition extends Equatable {
  String name;
  int count;
  List<String> competitionId;

  Competition({
    this.name,
    this.count,
    this.competitionId,
  });

  Competition copyWith({
    String name,
    int count,
    List<String> competitionId,
  }) =>
      Competition(
        name: name ?? this.name,
        count: count ?? this.count,
        competitionId: competitionId ?? this.competitionId,
      );

  factory Competition.fromMap(Map<String, dynamic> json) => Competition(
        name: json["name"],
        count: json["count"],
        competitionId: List<String>.from(json["competitionId"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "count": count,
        "competitionId": List<dynamic>.from(competitionId.map((x) => x)),
      };

  @override
  List<Object> get props => [name, count, competitionId];

  @override
  bool get stringify => true;
}

class Menu extends Equatable {
  String name;
  int count;
  List<String> competitionIds;

  Menu({
    this.name,
    this.count,
    this.competitionIds,
  });

  Menu copyWith({
    String name,
    int count,
    List<String> competitionIds,
  }) =>
      Menu(
        name: name ?? this.name,
        count: count ?? this.count,
        competitionIds: competitionIds ?? this.competitionIds,
      );

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        name: json["name"] == null ? null : json["name"],
        count: json["count"],
        competitionIds: List<String>.from(json["competitionIds"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "count": count,
        "competitionIds": List<dynamic>.from(competitionIds.map((x) => x)),
      };

  @override
  List<Object> get props => [name, count, competitionIds];

  @override
  bool get stringify => true;
}

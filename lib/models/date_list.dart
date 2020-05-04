// To parse this JSON data, do
//
//     final dateList = dateListFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

DateList dateListFromJson(String str) => DateList.fromMap(json.decode(str));

String dateListToJson(DateList data) => json.encode(data.toMap());

class DateList extends Equatable {
  bool success;
  List<Datum> data;

  DateList({
    this.success,
    this.data,
  });

  DateList copyWith({
    bool success,
    List<Datum> data,
  }) =>
      DateList(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory DateList.fromMap(Map<String, dynamic> json) => DateList(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [success, data];

  @override
  bool get stringify => true;
}

class Datum extends Equatable {
  String name;
  String date;

  Datum({
    this.name,
    this.date,
  });

  Datum copyWith({
    String name,
    String date,
  }) =>
      Datum(
        name: name ?? this.name,
        date: date ?? this.date,
      );

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        name: json["name"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "date": date,
      };

  @override
  List<Object> get props => [name, date];

  @override
  bool get stringify => true;
}

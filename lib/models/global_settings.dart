// To parse this JSON data, do
//
//     final globalSettings = globalSettingsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

GlobalSettings globalSettingsFromJson(String str) =>
    GlobalSettings.fromMap(json.decode(str));

String globalSettingsToJson(GlobalSettings data) => json.encode(data.toMap());

class GlobalSettings extends Equatable {
  final bool success;
  final dynamic msg;
  final List<Datum> data;

  GlobalSettings({
    final this.success,
    this.msg,
    this.data,
  });

  factory GlobalSettings.fromMap(Map<String, dynamic> json) => GlobalSettings(
        success: json["success"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  GlobalSettings copyWith({
    bool success,
    dynamic msg,
    List<Datum> data,
  }) {
    return GlobalSettings(
      success: success ?? this.success,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [success, msg, data];

  @override
  bool get stringify => true;
}

class Datum extends Equatable {
  final String paramName;
  final String value;
  final String defaultValue;

  Datum({
    this.paramName,
    this.value,
    this.defaultValue,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        paramName: json["paramName"],
        value: json["value"],
        defaultValue:
            json["defaultValue"] == null ? null : json["defaultValue"],
      );

  Map<String, dynamic> toMap() => {
        "paramName": paramName,
        "value": value,
        "defaultValue": defaultValue == null ? null : defaultValue,
      };

  Datum copyWith({
    String paramName,
    String value,
    String defaultValue,
  }) {
    return Datum(
      paramName: paramName ?? this.paramName,
      value: value ?? this.value,
      defaultValue: defaultValue ?? this.defaultValue,
    );
  }

  @override
  List<Object> get props => [paramName, value, defaultValue];

  @override
  bool get stringify => true;
}

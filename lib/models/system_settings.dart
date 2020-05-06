// To parse this JSON data, do
//
//     final systemSettings = systemSettingsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

SystemSettings systemSettingsFromJson(String str) =>
    SystemSettings.fromMap(json.decode(str));

String systemSettingsToJson(SystemSettings data) => json.encode(data.toMap());

class SystemSettings extends Equatable {
  final bool success;
  final dynamic msg;
  final List<Datum> data;

  SystemSettings({
    this.success,
    this.msg,
    this.data,
  });

  factory SystemSettings.fromMap(Map<String, dynamic> json) => SystemSettings(
        success: json["success"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  SystemSettings copyWith({
    bool success,
    dynamic msg,
    List<Datum> data,
  }) {
    return SystemSettings(
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

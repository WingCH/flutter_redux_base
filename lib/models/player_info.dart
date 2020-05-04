// To parse this JSON data, do
//
//     final playerInfo = playerInfoFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

PlayerInfo playerInfoFromJson(String str) =>
    PlayerInfo.fromMap(json.decode(str));

String playerInfoToJson(PlayerInfo data) => json.encode(data.toMap());

class PlayerInfo extends Equatable {
  bool success;
  dynamic msg;
  Data data;

  PlayerInfo({
    this.success,
    this.msg,
    this.data,
  });

  factory PlayerInfo.fromMap(Map<String, dynamic> json) => PlayerInfo(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": data.toMap(),
      };

  PlayerInfo copyWith({
    bool success,
    dynamic msg,
    Data data,
  }) {
    return PlayerInfo(
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

class Data extends Equatable {
  String username;
  String brand;
  DateTime createTime;
  DateTime updateTime;

  Data({
    this.username,
    this.brand,
    this.createTime,
    this.updateTime,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        username: json["username"],
        brand: json["brand"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "brand": brand,
        "createTime": createTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
      };

  Data copyWith({
    String username,
    String brand,
    DateTime createTime,
    DateTime updateTime,
  }) {
    return Data(
      username: username ?? this.username,
      brand: brand ?? this.brand,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  List<Object> get props => [username, brand, createTime, updateTime];

  @override
  bool get stringify => true;
}

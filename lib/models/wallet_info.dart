// To parse this JSON data, do
//
//     final walletInfo = walletInfoFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

WalletInfo walletInfoFromJson(String str) =>
    WalletInfo.fromMap(json.decode(str));

String walletInfoToJson(WalletInfo data) => json.encode(data.toMap());

class WalletInfo extends Equatable {
  bool success;
  String msg;
  Data data;

  WalletInfo({
    this.success,
    this.msg,
    this.data,
  });

  factory WalletInfo.fromMap(Map<String, dynamic> json) => WalletInfo(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": data.toMap(),
      };

  WalletInfo copyWith({
    bool success,
    dynamic msg,
    Data data,
  }) {
    return WalletInfo(
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
  int balance;

  Data({
    this.balance,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        balance: json["balance"],
      );

  Map<String, dynamic> toMap() => {
        "balance": balance,
      };

  Data copyWith({
    int balance,
  }) {
    return Data(
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object> get props => [balance];

  @override
  bool get stringify => true;
}

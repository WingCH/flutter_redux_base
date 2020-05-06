// To parse this JSON data, do
//
//     final topPage = topPageFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TopPage topPageFromJson(String str) => TopPage.fromMap(json.decode(str));

String topPageToJson(TopPage data) => json.encode(data.toMap());

class TopPage extends Equatable {
  final bool success;
  final String data;

  TopPage({
    this.success,
    this.data,
  });

  TopPage copyWith({
    bool success,
    String data,
  }) =>
      TopPage(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory TopPage.fromMap(Map<String, dynamic> json) => TopPage(
        success: json["success"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data,
      };

  @override
  List<Object> get props => [success, data];

  @override
  bool get stringify => true;
}

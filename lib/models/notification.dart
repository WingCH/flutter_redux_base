// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Notification notificationFromJson(String str) =>
    Notification.fromMap(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toMap());

class Notification extends Equatable {
  final bool success;
  final dynamic msg;
  final List<Datum> data;

  Notification({
    this.success,
    this.msg,
    this.data,
  });

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
        success: json["success"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  Notification copyWith({
    bool success,
    dynamic msg,
    List<Datum> data,
  }) {
    return Notification(
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
  final int notificationId;
  final String title;
  final String categories;
  final String description;
  final DateTime publishStartDate;
  final DateTime publishEndDate;
  final String content;
  final dynamic desktopHomepageImg;
  final dynamic mobileHomepageImg;
  final String desktopHomepageUrl;
  final dynamic mobileHomepageUrl;
  final dynamic desktopHomepageImgFileName;
  final dynamic mobileHomepageImgFileName;
  final List<dynamic> deleteImages;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool shownInHomePage;
  final bool active;
  final bool deleted;

  Datum({
    this.notificationId,
    this.title,
    this.categories,
    this.description,
    this.publishStartDate,
    this.publishEndDate,
    this.content,
    this.desktopHomepageImg,
    this.mobileHomepageImg,
    this.desktopHomepageUrl,
    this.mobileHomepageUrl,
    this.desktopHomepageImgFileName,
    this.mobileHomepageImgFileName,
    this.deleteImages,
    this.createdDate,
    this.updatedDate,
    this.shownInHomePage,
    this.active,
    this.deleted,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        notificationId: json["notificationId"],
        title: json["title"],
        categories: json["categories"],
        description: json["description"],
        publishStartDate: DateTime.parse(json["publishStartDate"]),
        publishEndDate: DateTime.parse(json["publishEndDate"]),
        content: json["content"],
        desktopHomepageImg: json["desktopHomepageImg"],
        mobileHomepageImg: json["mobileHomepageImg"],
        desktopHomepageUrl: json["desktopHomepageUrl"],
        mobileHomepageUrl: json["mobileHomepageUrl"],
        desktopHomepageImgFileName: json["desktopHomepageImgFileName"],
        mobileHomepageImgFileName: json["mobileHomepageImgFileName"],
        deleteImages: List<dynamic>.from(json["deleteImages"].map((x) => x)),
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        shownInHomePage: json["shownInHomePage"],
        active: json["active"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toMap() => {
        "notificationId": notificationId,
        "title": title,
        "categories": categories,
        "description": description,
        "publishStartDate": publishStartDate.toIso8601String(),
        "publishEndDate": publishEndDate.toIso8601String(),
        "content": content,
        "desktopHomepageImg": desktopHomepageImg,
        "mobileHomepageImg": mobileHomepageImg,
        "desktopHomepageUrl": desktopHomepageUrl,
        "mobileHomepageUrl": mobileHomepageUrl,
        "desktopHomepageImgFileName": desktopHomepageImgFileName,
        "mobileHomepageImgFileName": mobileHomepageImgFileName,
        "deleteImages": List<dynamic>.from(deleteImages.map((x) => x)),
        "createdDate": createdDate.toIso8601String(),
        "updatedDate": updatedDate.toIso8601String(),
        "shownInHomePage": shownInHomePage,
        "active": active,
        "deleted": deleted,
      };

  Datum copyWith({
    int notificationId,
    String title,
    String categories,
    String description,
    DateTime publishStartDate,
    DateTime publishEndDate,
    String content,
    dynamic desktopHomepageImg,
    dynamic mobileHomepageImg,
    String desktopHomepageUrl,
    dynamic mobileHomepageUrl,
    dynamic desktopHomepageImgFileName,
    dynamic mobileHomepageImgFileName,
    List<dynamic> deleteImages,
    DateTime createdDate,
    DateTime updatedDate,
    bool shownInHomePage,
    bool active,
    bool deleted,
  }) {
    return Datum(
      notificationId: notificationId ?? this.notificationId,
      title: title ?? this.title,
      categories: categories ?? this.categories,
      description: description ?? this.description,
      publishStartDate: publishStartDate ?? this.publishStartDate,
      publishEndDate: publishEndDate ?? this.publishEndDate,
      content: content ?? this.content,
      desktopHomepageImg: desktopHomepageImg ?? this.desktopHomepageImg,
      mobileHomepageImg: mobileHomepageImg ?? this.mobileHomepageImg,
      desktopHomepageUrl: desktopHomepageUrl ?? this.desktopHomepageUrl,
      mobileHomepageUrl: mobileHomepageUrl ?? this.mobileHomepageUrl,
      desktopHomepageImgFileName:
          desktopHomepageImgFileName ?? this.desktopHomepageImgFileName,
      mobileHomepageImgFileName:
          mobileHomepageImgFileName ?? this.mobileHomepageImgFileName,
      deleteImages: deleteImages ?? this.deleteImages,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      shownInHomePage: shownInHomePage ?? this.shownInHomePage,
      active: active ?? this.active,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  List<Object> get props => [
        notificationId,
        title,
        categories,
        description,
        publishStartDate,
        publishEndDate,
        content,
        desktopHomepageImg,
        mobileHomepageImg,
        desktopHomepageUrl,
        mobileHomepageUrl,
        desktopHomepageImgFileName,
        mobileHomepageImgFileName,
        deleteImages,
        createdDate,
        updatedDate,
        shownInHomePage,
        active,
        deleted,
      ];

  @override
  bool get stringify => true;
}

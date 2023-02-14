import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';

String labelDetailsToJson(LabelDetails data) => json.encode(data.toJson());

class LabelDetails{
  int colorCode;
  String title;
  int id;

  LabelDetails({
    required this.colorCode,
    required this.title,
    required this.id,
  });

  factory LabelDetails.fromJson(Map<String, dynamic> json) => LabelDetails(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    colorCode: json["colorCode"] ?? CustomColor.colorBlack
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "title": title,
    "colorCode": colorCode
  };
}

List<LabelDetails> catList = [
  LabelDetails(colorCode: CustomColor.colorLPurple.value, title: "Working", id: 1),
  LabelDetails(colorCode: CustomColor.colorBlue.value, title: "Reading", id: 2),
  LabelDetails(colorCode: CustomColor.colorLBlue.value, title: "Friend", id: 3),
  LabelDetails(colorCode: CustomColor.colorDOrange.value, title: "Gaming", id: 5),
  LabelDetails(colorCode: CustomColor.colorDBrow2.value, title: "Sport", id: 6),
  LabelDetails(colorCode: CustomColor.colorDGreen.value, title: "Travel", id: 7),
  LabelDetails(colorCode: CustomColor.colorDYellow.value, title: "Investment", id: 8)
];

List<LabelDetails> statusList = [
  LabelDetails(colorCode: CustomColor.colorGrey.value, title: "Pending", id: 1),
  LabelDetails(colorCode: CustomColor.colorDYellow.value, title: "Processing", id: 2),
  LabelDetails(colorCode: CustomColor.colorSuccess.value, title: "Done", id: 3),
];

List<LabelDetails> prioList = [
  
  LabelDetails(colorCode: CustomColor.colorSuccess.value, title: "No Urgent", id: 1),
  LabelDetails(colorCode: CustomColor.colorDYellow.value, title: "Less Urgent", id: 2),
  LabelDetails(colorCode: CustomColor.colorOrange.value, title: "Urgent", id: 3),
  LabelDetails(colorCode: CustomColor.colorLRed.value, title: "Resuscritation", id: 4),
];
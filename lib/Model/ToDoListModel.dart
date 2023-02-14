

import 'dart:convert';

import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
String toDoListToJson( ToDoList data) => json.encode(data.toJson());
class ToDoList {
  ToDoList({
    required this.date,
    this.quantity = 0,
    this.tdList
  });

  DateTime date;
  int quantity;
  List<ToDoDetails>? tdList; 

  factory ToDoList.fromJson(Map<String, dynamic> json) => ToDoList(
    date: FormatHelper.grabDS2DT(json["date"] ?? DateTime.now()),
    quantity: json["quantity"],
    tdList:  json["tdList"] != null ? List<ToDoDetails>.from(json["tdList"].map((x) => ToDoDetails.fromJson(x))) : null
  );

  Map<String, dynamic> toJson() => {
    "date": FormatHelper.grabDT2DS(date),
    "quantity": quantity,
    "tdList": List<dynamic>.from(tdList!.map((x) => x.toJson())),
  };

}
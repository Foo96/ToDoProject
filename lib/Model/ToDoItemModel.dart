import 'package:flutter/material.dart';
import 'package:todoapp/Helper/FormatHelper.dart';

class ToDoDetails {

  ToDoDetails({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    required this.prioID,
    required this.categoryID,
    required this.statusID

  });

  String id;
  String title;
  String? description;
  DateTime date;
  int prioID;
  int categoryID;
  int statusID;

  factory ToDoDetails.fromJson(Map<String, dynamic> json) => ToDoDetails(
    id: json["id"],
    title: json["title"], 
    description: json["description"], 
    date: json["date"] != null ? FormatHelper.grabDS2DT(json["date"]) : FormatHelper.grabDT2D(DateTime.now()), 
    categoryID: json["categoryID"], 
    prioID: json["prioID"], 
    statusID: json["statusID"]
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "title": title,
    "description": description,
    "date": FormatHelper.grabDT2DS(date),
    "prioID": prioID,
    "categoryID": categoryID,
    "statusID": statusID
  };


}
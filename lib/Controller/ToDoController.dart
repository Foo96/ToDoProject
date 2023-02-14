import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/Controller/StorageController.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/LabelDetailsModel.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
import 'package:todoapp/Model/ToDoListModel.dart';
import 'package:todoapp/View/widget/CustomAlertDialog.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:uuid/uuid.dart';
import '../generated/l10n.dart';

class ToDoController extends ChangeNotifier{
  List<ToDoList> allToDoList = [];
  List<LabelDetails> categoryList = [];
  List<LabelDetails> priorityList = [];
  List<LabelDetails> staList = [];

  ToDoList? todayList;
  int todayCompletedQty = 0;
  int todayTotalQty = 0;
  double todayProgress = 0.0;
  bool homeLoading = true;
  DateTime selectedDay = FormatHelper.grabDT2D(DateTime.now());
  CalendarFormat selectedFormat = CalendarFormat.month;
  DateTime firstDay = DateTime(2010,1,1);
  DateTime lastDay = DateTime(DateTime.now().year+5, DateTime.now().month, DateTime.now().day);

  //Initial Call for home page
  initialHomeCall(BuildContext context, key) async {
    LoadingDialogs().showLoadingDialog(context, key);
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      categoryList = catList;
      priorityList = prioList;
      staList = statusList;
      homeLoading = false;
      decodeToDoList();
      notifyListeners();
      await LoadingDialogs.closeLoadingDialog(context, key);
    });
  }

  //Grab today list and details
  grabTodayList(){
    var processDate = FormatHelper.grabDT2D(DateTime.now());
    var processList = allToDoList.where((element) => element.date == processDate).firstOrNull;
    if(processList != null){
      todayList = processList;
      todayTotalQty = processList.tdList!.length;
      todayCompletedQty = processList.tdList?.where((element) => element.statusID == 3).length ?? 0;
    }
    if(todayTotalQty != 0){
      todayProgress = (todayCompletedQty/todayTotalQty) * 100;
    }
    else{
      todayProgress = 0.0;
    }
    notifyListeners();
  }

  //Initial Call for Todo List page
  initialListCall(){
    selectedDay =  FormatHelper.grabDT2D(DateTime.now());
    notifyListeners();
  }

  //Save Todo List to local storage
  encodeToDoList() async {
    String jsonData = jsonEncode(allToDoList.map((x) => toDoListToJson(x)).toList());
    await StorageController().setToDoList(jsonData);  
  }

  //Garb Todo List from local storage
  decodeToDoList() async {
    String toDoListString = await StorageController().grabToDoList();
    if(toDoListString != ""){
      List<dynamic> jsonData = json.decode(toDoListString);
      List<ToDoList> toDoList = jsonData.map((data) => ToDoList.fromJson(json.decode(data))).toList();
      allToDoList.addAll(toDoList);
      notifyListeners();
    }
    grabTodayList();
  }

  //Grab ToDo details List based on Date
  List<ToDoDetails> grabToDoListByDate(DateTime date){
    var processDate = FormatHelper.grabDT2D(date);
    var item = allToDoList.where((element) => element.date == processDate).toList();
    if(item.isNotEmpty){
      return item[0].tdList ?? [];
    }
    else{
      return [];
    }
  }

  //Select date of calender
  selectDay(DateTime day){
    DateTime processDate = FormatHelper.grabDT2D(day);
    selectedDay = processDate;
    notifyListeners();
  }

  //Show date picker
  showCustomDatePicker(TextEditingController controller, BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: controller.text != "" ? DateTime.parse(controller.text)  : selectedDay,
      firstDate: firstDay,
      lastDate: lastDay,
      builder: (BuildContext context, Widget ?child) {
      return Theme(
        data: ThemeData(
          primarySwatch: Colors.deepOrange,
          colorScheme: const ColorScheme.light(
            secondary: CustomColor.colorOrange,
            primary: CustomColor.colorDOrange
          ),  
          dialogBackgroundColor: Colors.white
        ),
        child: child ??CustomText(text: ""),
      );
    }
    ).then((selectedDate) {
      if (selectedDate != null) {
        controller.text = FormatHelper.grabDT2DS(selectedDate);
      }
    });
  }

  //Grab Category Details
  grabCategory(int id){
    return categoryList.where((element) => element.id == id).firstOrNull ?? LabelDetails(colorCode: 4288585374, title: "Unknown", id: 0);
  }

  //Grab Status Details
  grabStatus(int id){
    return staList.where((element) => element.id == id).firstOrNull ?? LabelDetails(colorCode: 4288585374, title: "Unknown", id: 0);
  }

  //Grab Priority Details
  grabPriority(int id){
    return priorityList.where((element) => element.id == id).firstOrNull ?? LabelDetails(colorCode: 4288585374, title: "Unknown", id: 0);
  }

  //Generate ID for new ToDo Item
  generateNewID(){
    var randomID = DateTime.now().millisecondsSinceEpoch.toString() + Uuid().v4();
    return randomID;
  }

  //Add ToDO Item
  addItem(BuildContext context, {required String title, required String description, required String date, required int prioID, required int catID, required int staID}){
    var genID = generateNewID();
    var processDate = FormatHelper.grabDS2DT(date);
    var item = ToDoDetails(id: genID, title: title, date: processDate, prioID: prioID, categoryID: catID, statusID: staID);
    var selectedTDList = allToDoList.where((element) => element.date == processDate).firstOrNull;
    if(selectedTDList !=null){
      selectedTDList.quantity = selectedTDList.quantity + 1;
      selectedTDList.tdList?.add(item);
      selectedTDList.tdList!.sort(((b, a) => a.prioID.compareTo(b.prioID)));
    }
    else{
      allToDoList.add(
        ToDoList(
          date: processDate,
          quantity: 1,
          tdList: [
            item
          ]
        )
      );
    }
    grabTodayList();
    notifyListeners();
    encodeToDoList();
    showDialog(
      context: context, 
      builder: (context) {
        return ConfirmDialog(
          title: S.of(context).Success,
          content: S.of(context).MsgItemCreateSuccess,
          buttonColor: CustomColor.colorSuccess,
          buttonFunc1: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  //Delete ToDO Item
  deleteItem(context, {required String id}){
    DateTime processDate = FormatHelper.grabDT2D(selectedDay);
    var selectedTDList = allToDoList.where((element) => element.date == processDate).firstOrNull;
    if(selectedTDList !=null){
      selectedTDList.tdList?.removeWhere((element) => element.id == id);
    }
    notifyListeners();
    grabTodayList();
    encodeToDoList();
    showDialog(
      context: context, 
      builder: (context) {
        return ConfirmDialog(
          title: S.of(context).Success,
          content: S.of(context).MsgItemDeleteSuccess,
          buttonColor: CustomColor.colorSuccess,
          buttonFunc1: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      }
    );

  }

  //Modify ToDO Item
  modifyItem(context, {required ToDoDetails oldItem, required ToDoDetails item}){
    //Remove old item from certain date
    var selectedTDListOld = allToDoList.where((element) => element.date == oldItem.date).firstOrNull;
    if(selectedTDListOld !=null){
      selectedTDListOld.tdList?.removeWhere((element) => element.id == oldItem.id);
    }
    //Add new item based on date
    var selectedTDLisNew = allToDoList.where((element) => element.date == item.date).firstOrNull;
    if(selectedTDLisNew !=null){
      selectedTDLisNew.quantity = selectedTDLisNew.quantity + 1;
      selectedTDLisNew.tdList?.add(item);
      selectedTDLisNew.tdList!.sort(((b, a) => a.prioID.compareTo(b.prioID)));
    }
    else{
      allToDoList.add(
        ToDoList(date: item.date, quantity: 1,tdList: [item])
      );
    }
    grabTodayList();
    notifyListeners();
    encodeToDoList();
    showDialog(
      context: context, 
      builder: (context) {
        return ConfirmDialog(
          title: S.of(context).Success,
          content: S.of(context).MsgItemModifySuccess,
          buttonColor: CustomColor.colorSuccess,
          buttonFunc1: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  //Reorder position of ToDO Item and modify priority level
  reorderItem(context, {required int oldIndex, required int newIndex, required DateTime selectedDay}) async {
    var selectedTDList = allToDoList.where((element) => element.date == selectedDay).firstOrNull;
    if(selectedTDList !=null){
      var maxQty = selectedTDList.tdList!.length;
      var item = selectedTDList.tdList![oldIndex];
      var previousItem;
      var newPosition;

      if(newIndex > oldIndex){
        previousItem = selectedTDList.tdList![newIndex-1];
        newPosition = newIndex-1;
      }
      else{
        previousItem = selectedTDList.tdList![newIndex];
        newPosition = newIndex;
      }
      

      var prioTitle = priorityList.where((element) => element.id == item.prioID).firstOrNull!.title;
      var newPrioTitle = priorityList.where((element) => element.id == previousItem.prioID).firstOrNull!.title;

      if(previousItem.prioID != item.prioID){
        bool confirm = await showDialog(
          context: context, 
          builder: (context) {
            return CustomDialog(
              title: S.of(context).Warning,
              content: S.of(context).MsgChangePriority(prioTitle, newPrioTitle),
              buttonColor: CustomColor.colorSuccess,
              buttonFunc1: () {
                Navigator.of(context).pop(true);
              },
              buttonFunc2: () {
                Navigator.of(context).pop(false);
              },
            );
          }
        );
        if(confirm){
          item.prioID = previousItem.prioID;
        }
        else{
          return;
        }
      }
      selectedTDList.tdList?.removeAt(oldIndex);
      selectedTDList.tdList?.insert(newPosition, item);
      notifyListeners();
      encodeToDoList();
    }
  }
}
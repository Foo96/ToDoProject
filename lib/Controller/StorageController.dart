import 'package:shared_preferences/shared_preferences.dart';

class StorageController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //First Time open or open before
  grabUserStatus() async {
    final SharedPreferences prefs = await _prefs;
    final openBefore = prefs.getBool('openBefore') ?? false;
    return openBefore;
  }

  //Set First open status
  setUserStatus(bool status) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('openBefore', status);
  }

  //get todo list
  grabToDoList() async {
    final SharedPreferences prefs = await _prefs;
    final todoListString = prefs.getString('toDoList') ?? "";
    return todoListString;
  }

  //set todo list
  setToDoList(String toDoListString) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('toDoList', toDoListString);
  }
}
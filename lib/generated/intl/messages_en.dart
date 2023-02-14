// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(done, total) => "${done} / ${total} Completed";

  static String m1(previous, news) =>
      "Are you sure want to change your priority from ${previous} to ${news}?";

  static String m2(total) => "You\'ve got ${total} tasks today.";

  static String m3(code) => "${Intl.select(code, {
            'en': 'ENG',
            'zh': 'CHI',
            'ms': 'MAY',
            'other': 'LAIN-LAIN',
          })}";

  static String m4(code) => "${Intl.select(code, {
            'en': 'ENGLISH',
            'zh': '华语',
            'ms': 'BAHASA MELAYU',
            'other': 'OTHERS',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "About": MessageLookupByLibrary.simpleMessage("About"),
        "Apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "Cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "Category": MessageLookupByLibrary.simpleMessage("Category"),
        "Completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "CompletedQty": m0,
        "Confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "Confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
        "Continue": MessageLookupByLibrary.simpleMessage("Continue"),
        "CreatePlan": MessageLookupByLibrary.simpleMessage("Create Plan"),
        "DailyPlanFor": MessageLookupByLibrary.simpleMessage("Daily Plan for "),
        "Date": MessageLookupByLibrary.simpleMessage("Date"),
        "DeletePlan": MessageLookupByLibrary.simpleMessage("Delete Plan"),
        "Description": MessageLookupByLibrary.simpleMessage("Description"),
        "GetStart": MessageLookupByLibrary.simpleMessage("Get\'s Start"),
        "Home": MessageLookupByLibrary.simpleMessage("Home"),
        "InProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
        "LanguageSettings":
            MessageLookupByLibrary.simpleMessage("Language Settings"),
        "ModifyPlan": MessageLookupByLibrary.simpleMessage("Modify Plan"),
        "MsgChangePriority": m1,
        "MsgConfirmDeleteToDoItem": MessageLookupByLibrary.simpleMessage(
            "Are you sure want to delete this item?"),
        "MsgItemCreateSuccess":
            MessageLookupByLibrary.simpleMessage("Item successfully created"),
        "MsgItemDeleteSuccess":
            MessageLookupByLibrary.simpleMessage("Item successfully deleted"),
        "MsgItemModifySuccess":
            MessageLookupByLibrary.simpleMessage("Item successfully modified"),
        "MsgItemNoFound":
            MessageLookupByLibrary.simpleMessage("Item Not Found"),
        "MsgLaunchingApp": MessageLookupByLibrary.simpleMessage(
            "Please wait while, getting everything ready..."),
        "MsgProcessRequest": MessageLookupByLibrary.simpleMessage(
            "Plaese wait while, we are processing your request..."),
        "MsgValidErrorEmailInvalid": MessageLookupByLibrary.simpleMessage(
            "Please enter valid email address"),
        "MsgValidErrorNameInvalid": MessageLookupByLibrary.simpleMessage(
            "Please enter valid name with letter and spaces only"),
        "MsgValidErrorOTPEmpty": MessageLookupByLibrary.simpleMessage(
            "Please enter your OTP number"),
        "MsgValidErrorOTPInvalid": MessageLookupByLibrary.simpleMessage(
            "Please enter valid OTP number"),
        "MsgValidErrorPInNotSame":
            MessageLookupByLibrary.simpleMessage("Both PINs must be the same"),
        "MsgValidErrorPhoneInvalid": MessageLookupByLibrary.simpleMessage(
            "Please enter valid mobile number"),
        "MsgValidErrorVerifyCodeInvalid": MessageLookupByLibrary.simpleMessage(
            "Please enter valid verification code"),
        "MsgValidFieldRequired":
            MessageLookupByLibrary.simpleMessage(" is a required item."),
        "MsgValidProfileIncomplete": MessageLookupByLibrary.simpleMessage(
            "Your profile is incomplete. Kindly update!"),
        "MsgWelcome":
            MessageLookupByLibrary.simpleMessage("Hello, Welcom back!"),
        "MyPlan": MessageLookupByLibrary.simpleMessage("My Plan"),
        "Next": MessageLookupByLibrary.simpleMessage("Next"),
        "Ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "Overview": MessageLookupByLibrary.simpleMessage("Overview"),
        "Priority": MessageLookupByLibrary.simpleMessage("Priority"),
        "SeeAll": MessageLookupByLibrary.simpleMessage("See All"),
        "Skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "Status": MessageLookupByLibrary.simpleMessage("Status"),
        "Success": MessageLookupByLibrary.simpleMessage("Success"),
        "ThisField": MessageLookupByLibrary.simpleMessage("This field"),
        "Title": MessageLookupByLibrary.simpleMessage("Title"),
        "TodayTaskQty": m2,
        "Total": MessageLookupByLibrary.simpleMessage("Total"),
        "Warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "languageCode": m3,
        "languageName": m4
      };
}

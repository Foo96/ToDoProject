import 'package:flutter/services.dart';
import '../../generated/l10n.dart';


//===========================================================//
//                 Validation For Empty
//===========================================================//
validateTextField(dynamic value, [String label=""]) {
  final thisLabel = (label == "") ? S.current.ThisField : label;
  if (value == null || value == "") {
    // The form is empty
    return thisLabel + S.current.MsgValidFieldRequired;
  }
  return null;
}

//===========================================================//
//                Validation For Special Symbol
//===========================================================//
validateName(dynamic value, [String label=""]) {
  String patttern = r'^[a-zA-Z ]+[a-zA-Z]$';
  RegExp regExp = RegExp(patttern);
  final thisLabel = (label == "") ? S.current.ThisField : label;
  if (value == null || value == "") {
    // The form is empty
    return thisLabel + S.current.MsgValidFieldRequired;
  }
  else if(!(regExp.hasMatch(value))){
    return S.current.MsgValidErrorNameInvalid;
  }
  return null;
}


//===========================================================//
//               Validation For Phone Number
//===========================================================//
validatePhoneNumber(String value, [String label=""]) {
  String patttern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
  RegExp regExp = RegExp(patttern);
  final thisLabel = (label == "") ? S.current.ThisField : label;
  if ((value.isEmpty)) {
    return thisLabel + S.current.MsgValidFieldRequired;
  } 
  else if (!(regExp.hasMatch(value))){
    return S.current.MsgValidErrorPhoneInvalid;
  }
  else {
    return null;
  }
}


//===========================================================//
//               Validation For Email
//===========================================================//
validateEmail(String value, [String label=""]) {
  String patttern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(patttern);
  final thisLabel = (label == "") ? S.current.ThisField : label;
  if ((value.isEmpty)) {
    return thisLabel + S.current.MsgValidFieldRequired;
  } 
  else if (!(regExp.hasMatch(value))){
    return S.current.MsgValidErrorEmailInvalid;
  }
  else {
    return null;
  }
}










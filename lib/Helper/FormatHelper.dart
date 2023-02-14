import 'package:intl/intl.dart';

class FormatHelper{
  static grabDT2D(DateTime date){
    DateTime formatedDate = DateFormat("yyyy-MM-dd").parse(date.toString());
    return formatedDate;
  }

  static grabDT2DS(DateTime date){
    String formatedDateString = DateFormat("yyyy-MM-dd").format(date);
    return formatedDateString;
  }

  static grabDS2DT(String date){
    DateTime formatedDateTime = DateFormat("yyyy-MM-dd").parse(date);
    return formatedDateTime;
  }

  static grabDSToDS(String cDate){
    if(cDate == ""){
      return "";
    }
    var pDateTime = DateTime.parse(cDate);
    return DateFormat("yyyy-MM-dd").format(pDateTime);
  }
}
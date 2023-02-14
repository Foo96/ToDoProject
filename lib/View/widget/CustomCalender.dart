import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
import 'package:todoapp/View/widget/CustomText.dart';

// class CustomCalenderView extends StatelessWidget {
//   const CustomCalenderView({
//     Key? key,
//     required this.selected, required this.selectDayFunc,
//   }) : super(key: key);

//   final DateTime selected;
//   final Function selectDayFunc;

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar<ToDoDetails>(
//       firstDay: DateTime.now().add(Duration(days: -1000)),
//       lastDay: DateTime.now().add(Duration(days: 1000)),
//       focusedDay: selected,
//       selectedDayPredicate: (day) => isSameDay(selected, day),
//       calendarFormat: CalendarFormat.month,
//       startingDayOfWeek: StartingDayOfWeek.monday,
//       calendarStyle: CalendarStyle(
//         tableBorder: TableBorder(borderRadius: BorderRadius.circular(10))
//       ),
//       calendarBuilders: CalendarBuilders(
//         // ===================================//
//         //        Selected Day Design
//         // ===================================//
//         selectedBuilder: (context, day, focusedDay) {
//           return CustomDateContainer(
//             color: CustomColor.colorDOrange.withOpacity(0.8),
//             title: focusedDay.day.toString()
//           );
//         },
//         //===================================//
//         //        Today Day Design
//         //===================================//
//         todayBuilder: (context, day, focusedDay) {
//           return CustomDateContainer(
//             color: Colors.orange.withOpacity(0.3), 
//             textColor: CustomColor.colorBlack,
//             title: day.day.toString()
//           );
//         },
//         markerBuilder: (context, day, events) {
//           if(events.isEmpty){
//             return Align(
//               alignment: Alignment.bottomRight,
//               child: ToDoQtyContainer(title: events.length.toString()),
//             );
//           }
//         }
//       ),
//       //Select Day Function
//       onDaySelected: (selectedDay, focusedDay) {
//         selectDayFunc(selectedDay, focusedDay);
//       },
//     );
//   }
// }


//Date Container in Calender view
class CustomDateContainer extends StatelessWidget {
  const CustomDateContainer({
    Key? key, required this.color, required this.title, this.textColor=CustomColor.colorWhite,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  color
      ), //Change color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text:title, style: ThemeHelper.customTS(color: textColor)),
        ],
      ),
    );
  }
}

//ToDo Item Quantity Container in Calender view
class ToDoQtyContainer extends StatelessWidget {
  const ToDoQtyContainer({
    Key? key, required this.title, this.color=CustomColor.colorSuccess, this.textColor=CustomColor.colorWhite
  }) : super(key: key);

  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      constraints: BoxConstraints(maxWidth: 40),
      child: CustomText(
        text: title,
        maxLines: 1,
        style: ThemeHelper.customTS(
          color: textColor,
          size: CustomSize.DES
        )
      ),
    );
  }
}


class CustomCalenderView extends StatelessWidget {
  const CustomCalenderView({
    Key? key,
    required this.selected, required this.selectDayFunc, this.firstDay, this.lastDay, required this.eventLoaderFunc, required this.selectedFormat,
  }) : super(key: key);

  final DateTime selected;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final CalendarFormat selectedFormat;
  final List<ToDoDetails> Function(DateTime)? eventLoaderFunc;
  final Function selectDayFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom:20,right: 5, left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.colorDOrange.withOpacity(0.2),width: 2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TableCalendar<ToDoDetails>(
        firstDay: firstDay ?? DateTime(2000,1,1),
        lastDay: lastDay ?? DateTime(2050,12,31),
        focusedDay: selected,
        selectedDayPredicate: (day) => isSameDay(selected, day),
        calendarFormat: selectedFormat,
        //Days of week decoration
        daysOfWeekHeight: 35,
        rowHeight: 45,
        eventLoader: (day) =>eventLoaderFunc!(day),
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekStyle: DaysOfWeekStyle(decoration: BoxDecoration(color: CustomColor.colorDOrange, borderRadius: BorderRadius.circular(5)), weekdayStyle: ThemeHelper.customTS(color: CustomColor.colorWhite), weekendStyle: ThemeHelper.customTS(color: CustomColor.colorWhite)),
        //Hide format button
        headerStyle: const HeaderStyle(formatButtonVisible: false, headerPadding: EdgeInsets.only(top: 10)),
        calendarBuilders: CalendarBuilders(
          // ===================================//
          //        Selected Day Design
          // ===================================//
          selectedBuilder: (context, day, focusedDay) {
            return CustomDateContainer(
              color: CustomColor.colorOrange.withOpacity(0.9),
              title: focusedDay.day.toString()
            );
          },
          //===================================//
          //        Today Day Design
          //===================================//
          todayBuilder: (context, day, focusedDay) {
            return CustomDateContainer(
              color: CustomColor.colorOrange.withOpacity(0.2), 
              textColor: CustomColor.colorBlack,
              title: day.day.toString()
            );
          },
          markerBuilder: (context, day, events) {
            if(events.isNotEmpty){
              return Align(
                alignment: Alignment.bottomRight,
                child: ToDoQtyContainer(title: events.length.toString()),
              );
            }
          },
          
        ),
        //Select Day Function
        onDaySelected: (selectedDay, focusedDay) {
          selectDayFunc(selectedDay, focusedDay);
        },
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/Controller/ToDoController.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Helper/PageRouterhelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/DrawerPage.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomCalender.dart';
import 'package:todoapp/View/widget/CustomContainer.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';





class ToDoListPage extends StatefulWidget {
  static const ROUTE_NAME = 'ToDoListPage';

  const ToDoListPage({Key? key}) : super(key: key);

  @override
  ToDoListPageState createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage>{
  DateTime selected = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ToDoController>(context, listen: false).initialListCall();
    });
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ToDoController>(
      builder: (context, ToDoController tdController, child) {
        return Scaffold(  
          drawer: DrawerPage(),
          appBar: TransparentAppBar(
            title: "",
            actionWidget: [
              Container(
                margin: const EdgeInsets.all(5),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToDoAddPage(selectedDate: tdController.selectedDay)),
                    );
                  }, 
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(CustomColor.colorOrange),), 
                  child: CustomText(
                    text: S.of(context).CreatePlan, 
                    style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.N)
                  )
                )
              )
            ],
          ),
          backgroundColor: CustomColor.colorWhite,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children :[
                  CustomText(text: S.of(context).DailyPlanFor + FormatHelper.grabDT2DS(tdController.selectedDay), style: ThemeHelper.customTS(color: CustomColor.colorBlack, size: CustomSize.EL, weight: CustomWeight.DEB)),
                  const SizedBox(height: 15),
                  CustomCalenderView(
                    firstDay: tdController.firstDay,
                    lastDay: tdController.lastDay,
                    selected: tdController.selectedDay,
                    selectedFormat: MediaQuery.of(context).orientation == Orientation.portrait ? tdController.selectedFormat : CalendarFormat.week,
                    eventLoaderFunc: (day)=>tdController.grabToDoListByDate(day),
                    selectDayFunc: (selectedDay, focusedDay){
                      tdController.selectDay(selectedDay);
                    },
                  ),
                  const SizedBox(height: 30),
                  LayoutBuilder(
                    builder: (context, consts) {
                      var tdList = tdController.grabToDoListByDate(tdController.selectedDay);
                      if(tdList.isNotEmpty){
                        return ReorderableListView.builder(
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: tdList.length,
                          itemBuilder: ((context, index) {
                            var item = tdList[index];
                            return GestureDetector(
                              key: ValueKey(tdList[index].id),
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ToDoModifyPage(item: tdList[index])),
                                );
                              },
                              child: ToDoDetailsContainer(
                                prio: tdController.grabPriority(item.prioID),
                                cat: tdController.grabCategory(item.categoryID),
                                status: tdController.grabStatus(item.statusID),
                                item: item
                              )
                            );
                        }), onReorder: (int oldIndex, int newIndex) { 
                          tdController.reorderItem(context, oldIndex: oldIndex, newIndex: newIndex, selectedDay: tdController.selectedDay);
                         },
                        );
                      }
                      return ItemNotFoundContainer();
                    }
                  )
                ] 
                
              )
            )
          )
        );
      }
    );
  }
}


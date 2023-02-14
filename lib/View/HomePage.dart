import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:todoapp/Controller/SplashController.dart';
import 'package:todoapp/Controller/ToDoController.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Helper/PageRouterhelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
import 'package:todoapp/View/DrawerPage.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomContainer.dart';
import 'package:todoapp/View/widget/CustomProgressBar.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';






class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  final GlobalKey<State> homeKeyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ToDoController>(context, listen: false).initialHomeCall(context, homeKeyLoader);
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
          appBar: TransparentAppBar(),
          backgroundColor: CustomColor.colorWhite,
          floatingActionButton: Container(
            child: TextButton.icon(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToDoAddPage(selectedDate: tdController.selectedDay)),
                );
              }, 
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(CustomColor.colorOrange), padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0,horizontal: 10))), 
              icon: const Icon(Icons.add, color: CustomColor.colorWhite, size: 25),
              label: CustomText(
                text: S.of(context).CreatePlan, 
                style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.M, weight: CustomWeight.SB)
              )
            )
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20,0,20,30),
                  child: tdController.homeLoading
                  ? Center(child: ItemNotFoundContainer())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        //===================================================//
                        //                   Welcome Message
                        //===================================================//
                        CustomText(text: S.of(context).MsgWelcome, style: ThemeHelper.customTS(color: CustomColor.colorBlack, size: CustomSize.DEL, weight: CustomWeight.DEB)),
                        const SizedBox(height: 15),
                        //===================================================//
                        //                   Overview Today
                        //===================================================//

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                            color: CustomColor.colorOrange.withOpacity(0.65),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: S.of(context).Overview, style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.DEL, weight: CustomWeight.DEB)),
                              const SizedBox(height: 15),
                              CustomText(text: S.of(context).TodayTaskQty(tdController.todayTotalQty), style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.L, weight: CustomWeight.DEB)),
                              const SizedBox(height: 10),
                              CustomLinearProgressBar(progress: tdController.todayProgress),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(text: S.of(context).CompletedQty(tdController.todayCompletedQty, tdController.todayTotalQty), style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.N, weight: CustomWeight.EB)),
                                ]
                              ),
                              const SizedBox(height: 15)
                            ]
                          ),
                        ),
                        const SizedBox(height: 20),
                        //===================================================//
                        //                   List Title
                        //===================================================//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: S.of(context).MyPlan, style: ThemeHelper.customTS(color: CustomColor.colorBlack, size: CustomSize.DEL, weight: CustomWeight.DEB)),
                            TextButton(
                              style: ButtonStyle(overlayColor: MaterialStateProperty.all(CustomColor.colorDOrange.withOpacity(0.1))),
                              child: CustomText(text: S.of(context).SeeAll, style: ThemeHelper.customTS(color: CustomColor.colorDOrange, size: CustomSize.M, weight: CustomWeight.SB)),
                              onPressed: (){
                                Navigator.pushNamed(context, ToDoListPage.ROUTE_NAME);
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        //===================================================//
                        //                   Today Task List
                        //===================================================//
                        (tdController.todayList != null)
                        ?  ReorderableListView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: tdController.todayList!.tdList!.length,
                            itemBuilder: (context, index) {
                              var item = tdController.todayList!.tdList![index];
                              return GestureDetector(
                                key: ValueKey(item.id),
                                onTap: (){
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ToDoModifyPage(item: item)),
                                  );
                                },
                                child: ToDoDetailsContainer(
                                  prio: tdController.grabPriority(item.prioID),
                                  cat: tdController.grabCategory(item.categoryID),
                                  status: tdController.grabStatus(item.statusID),
                                  item: item,
                                ),
                              );
                            },
                            onReorder: (int oldIndex, int newIndex) { 
                              tdController.reorderItem(context, oldIndex: oldIndex, newIndex: newIndex, selectedDay: tdController.selectedDay);
                              },
                          )
                        : ItemNotFoundContainer()
                      ] 
                    )
                )
              );
            }
          )
        );
      }
    );
  }
}
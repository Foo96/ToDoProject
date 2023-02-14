import 'package:flutter/material.dart';
import 'package:todoapp/Controller/StorageController.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/PageRouterhelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/TutorialDetailsModel.dart';
import 'package:todoapp/View/HomePage.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/View/widget/CustomTutorialContent.dart';
import 'package:todoapp/generated/l10n.dart';

class TutorialPage extends StatefulWidget {
  static const ROUTE_NAME = 'TutorialPage';

  TutorialPageState createState() => TutorialPageState();
}

class TutorialPageState extends State<TutorialPage> {
  int currentPage = 0;
  PageController tpageController = PageController(initialPage: 0, viewportFraction: 1);
  ScrollController tdotController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  //===============================================================================================================================//
  //                                             Change Current Tutorial content
  //===============================================================================================================================//
  changeTutorialContent(int index, int max){
    if(mounted){
      setState(() { 
        currentPage = index;
        tpageController.animateToPage(index, duration: Duration(milliseconds: 100), curve: Curves.ease);
        tdotController.animateTo(index == 0 ? tdotController.position.minScrollExtent : index == max ? tdotController.position.maxScrollExtent : 20.0*(index), duration: Duration(milliseconds: 100), curve: Curves.ease);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    List<TutorialDetails> tutorialList = [
      TutorialDetails(imageUrl: ConfigHelper.IMAGE_T1, title: "Easily manage plans", description: "Categorize, and archive."),
      TutorialDetails(imageUrl: ConfigHelper.IMAGE_T2, title: "Calendar View", description: "Task of each day"),
      TutorialDetails(imageUrl: ConfigHelper.IMAGE_T3, title: "Add Daily Task", description: "Set your Everyday Tasks with simple steps."),
      TutorialDetails(imageUrl: ConfigHelper.IMAGE_T4, title: "Welcome to TODO", description: "Let's Start!")
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true, 
      backgroundColor: CustomColor.colorLOrange,
      appBar: TransparentAppBar(
        automaticallyImplyLeading: false,
        actionWidget: [
          //=================================================//
          //                    Skip Button
          //=================================================//
          currentPage != tutorialList.length-1
          ? Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  StorageController().setUserStatus(true);
                  Navigator.pushNamedAndRemoveUntil(context, HomePage.ROUTE_NAME, (route) => false);
                },
                child: CustomText(
                  text: S.of(context).Skip,
                  style: ThemeHelper.customTS(size: CustomSize.M, color: CustomColor.colorOrange, weight: CustomWeight.EB)
                )
              )
            )
          : const SizedBox()
        ]
      ),
      bottomNavigationBar: Container(
        height: 80,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //=================================================//
            //                   Page Dots
            //=================================================//
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: ListView.builder(
                  controller: tdotController,
                  itemCount: tutorialList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: currentPage == index ? CustomColor.colorOrange : CustomColor.colorGrey.withOpacity(0.5))
                    );
                  }
                )
              )
            ),
            //=================================================//
            //              Next or Continue Buttons 
            //=================================================//
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                  child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                        backgroundColor: MaterialStateProperty.all(currentPage == tutorialList.length-1 ? CustomColor.colorDOrange.withOpacity(0.8) : CustomColor.colorOrange.withOpacity(0.2))
                      ),
                      onPressed: () async {
                        if(currentPage == tutorialList.length-1){
                          StorageController().setUserStatus(true);
                          Navigator.pushNamedAndRemoveUntil(context, HomePage.ROUTE_NAME, (route) => false);
                        }
                        else{
                          changeTutorialContent(currentPage + 1, tutorialList.length-1);
                        }
                      },
                      child: CustomText(
                        text: currentPage == tutorialList.length-1 ? S.of(context).GetStart :  S.of(context).Next,
                        textAlign: TextAlign.end,
                        style: ThemeHelper.customTS(size: CustomSize.M, color: currentPage == tutorialList.length-1 ? CustomColor.colorWhite : CustomColor.colorOrange, weight: CustomWeight.EB)
                      )
                    )
              )
            )
          ]
        )
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  //=================================================//
                  //                 Splash Content
                  //=================================================//
                  SizedBox(
                    height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height - 180 : 500,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index){
                        changeTutorialContent(index, tutorialList.length-1);
                      },
                      controller: tpageController,
                      itemCount: tutorialList.length,
                      itemBuilder: (context, index){
                        var scale = 1.0;
                        return TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease,
                          tween: Tween(begin:scale, end: scale),
                          builder: (BuildContext context, double value, Widget? child) { 
                            return Transform.scale(scale: value, child: child);
                          },
                          child: CustomTutorialContent(tutorialList[index])
                        );
                      }
                    )
                  )
                ]
              )
            );
          }
        )
      )
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:todoapp/Controller/StorageController.dart';
import 'package:todoapp/View/TutorialPage.dart';
import 'package:todoapp/View/HomePage.dart';

class SplashController extends ChangeNotifier{
  bool widgetShowing = false;

  initialCall(BuildContext context){
    Future.delayed(const Duration(milliseconds: 300)).then((value) async {
      widgetShowing = true;
      notifyListeners();
      bool openBefore = await StorageController().grabUserStatus();
      Future.delayed(const Duration(seconds: 3)).then((value){
        if(openBefore){
          Navigator.pushNamedAndRemoveUntil(context, HomePage.ROUTE_NAME, (route) => false);
        }else{
          Navigator.pushNamedAndRemoveUntil(context, TutorialPage.ROUTE_NAME, (route) => false);
        }
      });
    });
  }

}
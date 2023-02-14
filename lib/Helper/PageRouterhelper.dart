import 'package:flutter/material.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
export 'package:todoapp/View/ToDo_AddPage.dart';
export 'package:todoapp/View/ToDo_EditDeletePage.dart';

import 'PageRouterhelper.dart';
export 'package:todoapp/View/TutorialPage.dart';
export 'package:todoapp/View/HomePage.dart';
export 'package:todoapp/View/SplashPage.dart';
export 'package:todoapp/View/ToDo_ListPage.dart';

class PageRouterHelper{
  PageRouterHelper._internal();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.ROUTE_NAME:
        return buildPageRoute(const SplashPage(), settings);
      case TutorialPage.ROUTE_NAME:
        return buildPageRoute(TutorialPage(), settings);
      case HomePage.ROUTE_NAME:
        return buildPageRoute(const HomePage(), settings);
      case ToDoListPage.ROUTE_NAME:
        return buildPageRoute(const ToDoListPage(), settings);
      case ToDoAddPage.ROUTE_NAME:
        return buildPageRoute(ToDoAddPage(selectedDate: FormatHelper.grabDT2D(DateTime.now())), settings);
      case ToDoModifyPage.ROUTE_NAME:
        return buildPageRoute(ToDoModifyPage(item: ToDoDetails(id: '', title: '', categoryID: 1, date: FormatHelper.grabDT2D(DateTime.now()), prioID: 1, statusID: 1)), settings);
      default:
        return buildPageRoute(const SplashPage(), settings);
    }
  }

  static PageRouteBuilder buildPageRoute(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)=>widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
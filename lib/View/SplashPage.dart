// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Controller/SplashController.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = 'SplashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashController>(context, listen: false).initialCall(context);
    });
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: const TransparentAppBar(),
      backgroundColor: CustomColor.colorLOrange,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Consumer<SplashController>(
            builder: (context, SplashController sController, child) {
              return SingleChildScrollView(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 2), 
                  child: !sController.widgetShowing
                  ? const SizedBox()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(ConfigHelper.IMAGE_LOGO, width: 250, fit: BoxFit.cover),
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                              child: Column(
                                children: [
                                  const SizedBox(height: 35, width: 35, child: CircularProgressIndicator(color: CustomColor.colorOrange)),
                                  const SizedBox(height: 20),
                                  CustomText(text: S.of(context).MsgLaunchingApp, textAlign: TextAlign.center,)
                                ]
                              )
                            ),
                          )
                        ]
                      )
                    )
                )
              );
            }
          );
        }
      )
    );
  }
}

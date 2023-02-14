//====================================================================//
//                       Custom Confirm Dialog 
//====================================================================//
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

class CustomDialog extends StatelessWidget {
  String? title;
  String? content;
  String? buttonTitle1;
  String? buttonTitle2;
  String? imageUrl;
  Color color;
  Color buttonColor;
  Color buttonColor2;
  Function()? buttonFunc1;
  Function()? buttonFunc2;


  CustomDialog({super.key, this.title, this.content, this.imageUrl, this.color = CustomColor.colorWhite, this.buttonColor = CustomColor.colorOrange, this.buttonColor2 = CustomColor.colorDGrey, this.buttonFunc1, this.buttonFunc2, this.buttonTitle1, this.buttonTitle2});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: CustomColor.colorDWhite2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.colorGrey.withOpacity(0.3),
                    blurRadius: 5,
                offset: const Offset(3, 3) // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageUrl != null 
                  ? Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 200,
                    child: Image.asset(imageUrl!, fit: BoxFit.fill),
                  ) 
                  :const SizedBox(),
                  CustomText(text: title??"", maxLines: 4, textAlign: TextAlign.center, style: ThemeHelper.customTS(size: CustomSize.M, weight: CustomWeight.EB)),
                  SizedBox(height: title == null ? 0 : 10),
                  CustomText(text: content??"", maxLines: 10, textAlign: TextAlign.center),
                  SizedBox(height: content == null ? 0 : 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(buttonColor.withOpacity(0.2))
                          ),
                          onPressed: buttonFunc1 ?? (){Navigator.of(context).pop(true);},
                          child: CustomText(text: buttonTitle1 ?? S.of(context).Ok, textAlign: TextAlign.center, style: ThemeHelper.customTS(color: buttonColor))
                        )
                      ),
                      const Expanded(flex:1, child: SizedBox()),
                      Expanded(
                        flex: 7,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(buttonColor2.withOpacity(0.1))
                          ),
                          onPressed: buttonFunc2 ?? (){Navigator.of(context).pop(false);},
                          child: CustomText(text: buttonTitle2 ?? S.of(context).Cancel, textAlign: TextAlign.center, style: ThemeHelper.customTS(color: buttonColor2))
                        )
                      )
                    ]
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}


class ConfirmDialog extends StatelessWidget {
  String? title;
  String? content;
  String? buttonTitle1;
  String? imageUrl;
  Color color;
  Color buttonColor;
  Function()? buttonFunc1;


  ConfirmDialog({super.key, this.title, this.content, this.imageUrl, this.color = CustomColor.colorWhite, this.buttonColor = CustomColor.colorOrange, this.buttonFunc1, this.buttonTitle1});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColor.colorWhite,
                border: Border.all(color: CustomColor.colorDWhite2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.colorGrey.withOpacity(0.3),
                    blurRadius: 5,
                offset: const Offset(3, 3) // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageUrl != null 
                  ? Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 200,
                    child: Image.asset(imageUrl!, fit: BoxFit.fill),
                  ) 
                  :const SizedBox(),
                  CustomText(text: title??"", maxLines: 4, textAlign: TextAlign.center, style: ThemeHelper.customTS(size: CustomSize.M, weight: CustomWeight.EB)),
                  SizedBox(height: title == null ? 0 : 10),
                  CustomText(text: content??"", maxLines: 10, textAlign: TextAlign.center),
                  SizedBox(height: content == null ? 0 : 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(buttonColor.withOpacity(0.2))
                          ),
                          onPressed: buttonFunc1 ?? (){Navigator.of(context).pop(true);},
                          child: CustomText(text: buttonTitle1 ?? S.of(context).Ok, textAlign: TextAlign.center, style: ThemeHelper.customTS(color: buttonColor))
                        )
                      )
                    ]
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}


//====================================================================//
//                         Loading Dialog
//====================================================================//
class LoadingDialogs {
  showLoadingDialog(BuildContext? context, GlobalKey? key) async {
    if(context != null && key != null){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              key: key,
              backgroundColor: Colors.white,
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      const CircularProgressIndicator(color: CustomColor.colorOrange),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(text: S.of(context).MsgProcessRequest, textAlign: TextAlign.center),
                      )
                    ]),
                  ),
                )
              ]
            )
          );
        },
        barrierDismissible: false,
      );
      return context;
    }
  }
  static closeLoadingDialog(BuildContext? context, GlobalKey? key) async {
    await Future.delayed(const Duration(milliseconds: 300)).then((value) async {
      if(context != null && key != null){
        if(key.currentContext != null){
          
            Navigator.of(key.currentContext!).pop(context);
          
        }
      }
    });
  }
}

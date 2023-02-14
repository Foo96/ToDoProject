// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Controller/ToDoController.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Helper/PageRouterhelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Helper/ValidationHelper.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomContainer.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

import 'widget/CustomAlertDialog.dart';

class ToDoModifyPage extends StatefulWidget {
  static const ROUTE_NAME = 'ToDoModifyPage';

  ToDoModifyPage({Key? key, required this.item}) : super(key: key);

  final ToDoDetails item;

  @override
  ToDoModifyPageState createState() => ToDoModifyPageState();
}

class ToDoModifyPageState extends State<ToDoModifyPage>{
  final TextEditingController textControllerMTitle = TextEditingController();
  final TextEditingController textControllerMDescription = TextEditingController();
  final TextEditingController textControllerMDate = TextEditingController();
  final todoModifyFormKey = GlobalKey<FormState>();
  int selectedPrio = 1;
  int selectedCategory = 1;
  int selectedStatus = 1; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(mounted){
        setState(() {
          textControllerMDate.text = FormatHelper.grabDT2DS(widget.item.date);
          textControllerMTitle.text = widget.item.title;
          textControllerMDescription.text = widget.item.description ?? "";
          selectedCategory = widget.item.categoryID;
          selectedPrio = widget.item.prioID;
          selectedStatus = widget.item.statusID;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IOSCloseKeyboardContainer(
      child: Scaffold(  
        appBar: TransparentAppBar(
          title: S.of(context).CreatePlan,
        ),
        backgroundColor: CustomColor.colorLOrange,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Consumer<ToDoController>(
              builder: (context, ToDoController tdController, child) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Form(
                      key: todoModifyFormKey,
                      child: Column(
                        children: [
                          //===================================================//
                          //                 Title TextField
                          //===================================================//
                          TextFormField(
                            controller: textControllerMTitle,
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.text,
                            style: ThemeHelper.customTS(),
                            decoration: ThemeHelper.textFieldDecoration(S.of(context).Title, showFilled: true),
                            validator: (value) {
                              return validateTextField(value.toString(), S.of(context).Title);
                            }
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Description TextField
                          //===================================================//
                          TextFormField(
                            maxLines: 6,
                            minLines: 6,
                            keyboardType: TextInputType.multiline,  
                            controller: textControllerMDescription,
                            autovalidateMode: AutovalidateMode.always,
                            style: ThemeHelper.customTS(),
                            decoration: ThemeHelper.textFieldDecoration(S.of(context).Description, showFilled: true)
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Date TextField
                          //===================================================//
                          TextFormField(
                            controller: textControllerMDate,
                            autovalidateMode: AutovalidateMode.always,
                            decoration: ThemeHelper.textFieldDecoration(S.of(context).Date, enabled: true, showFilled: true),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              await tdController.showCustomDatePicker(textControllerMDate, context);
                            },
                            validator: (value) {
                              return validateTextField(value.toString(), S.of(context).Date);
                            }
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Category TextField
                          //===================================================//
                          LabelDropDownTextField(
                            selected: selectedCategory, 
                            title: S.of(context).Category, 
                            labelList: tdController.categoryList,
                            selectFunc: (newValue){
                              if(mounted){
                                setState(() {
                                  selectedCategory = newValue!;
                                });
                              }
                            }
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Priorityn TextField
                          //===================================================//
                          LabelDropDownTextField(
                            selected: selectedPrio,
                            labelList: tdController.priorityList,
                            title: S.of(context).Priority,
                            selectFunc: (newValue){
                              if(mounted){
                                setState(() {
                                  selectedPrio = newValue!;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Status TextField
                          //===================================================//
                          LabelDropDownTextField(
                            selected: selectedStatus,
                            labelList: tdController.staList,
                            title: S.of(context).Status,
                            selectFunc: (newValue){
                              if(mounted){
                                setState(() {
                                  selectedStatus = newValue!;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          //===================================================//
                          //              Modify Button
                          //===================================================//
                          TextButton(
                            onPressed: (){
                              if(todoModifyFormKey.currentState!.validate() && selectedCategory != 0 && selectedPrio != 0 && selectedStatus != 0){
                                var processDate = FormatHelper.grabDS2DT(textControllerMDate.text);
                                var processItem = ToDoDetails(id: widget.item.id, title: textControllerMTitle.text,description: textControllerMDescription.text, date: processDate, prioID: selectedPrio, categoryID: selectedCategory, statusID: selectedStatus);
                                tdController.modifyItem(context, oldItem: widget.item, item: processItem);
                              }
                            }, 
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                              backgroundColor: MaterialStateProperty.all(CustomColor.colorOrange)
                            ), 
                            child: CustomText(
                              text: S.of(context).ModifyPlan, 
                              style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.M, weight: CustomWeight.SB)
                            )
                          ),
                          //===================================================//
                          //              Delete Button
                          //===================================================//
                          TextButton(
                            onPressed: () async {
                              bool confirm = await showDialog(
                                  context: context, 
                                  builder: ((context) {
                                    return CustomDialog(
                                      title: S.of(context).Warning,
                                      content: S.of(context).MsgConfirmDeleteToDoItem,
                                    );
                                  }
                                )) ?? false;
                                if(confirm){
                                  tdController.deleteItem(context, id: widget.item.id);
                                }
                            }, 
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                              //backgroundColor: MaterialStateProperty.all(CustomColor.colorOrange)
                            ), 
                            child: CustomText(
                              text: S.of(context).DeletePlan, 
                              style: ThemeHelper.customTS(color: CustomColor.colorLRed, size: CustomSize.M, weight: CustomWeight.SB, decoration: TextDecoration.underline)
                            )
                          )
                        ]
                      ),
                    ),
                    
                  )
                );
              }
            );
          }
        )
      ),
    );
  }
}





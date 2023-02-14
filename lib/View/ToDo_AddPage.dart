// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Controller/SplashController.dart';
import 'package:todoapp/Controller/ToDoController.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/FormatHelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Helper/ValidationHelper.dart';
import 'package:todoapp/Model/LabelDetailsModel.dart';
import 'package:todoapp/View/widget/CustomAppBar.dart';
import 'package:todoapp/View/widget/CustomContainer.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

class ToDoAddPage extends StatefulWidget {
  static const ROUTE_NAME = 'ToDoAddPage';

  ToDoAddPage({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;

  @override
  ToDoAddPageState createState() => ToDoAddPageState();
}

class ToDoAddPageState extends State<ToDoAddPage>{
  final TextEditingController textControllerTitle = TextEditingController();
  final TextEditingController textControllerDescription = TextEditingController();
  final TextEditingController textControllerDate = TextEditingController();
  final todoAddFormKey = GlobalKey<FormState>();
  int selectedPrio = 1;
  int selectedCategory = 1;
  int selectedStatus = 1; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(mounted){
        setState(() {
          textControllerDate.text = FormatHelper.grabDT2DS(widget.selectedDate);
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
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Form(
                      key: todoAddFormKey,
                      child: Column(
                        children: [
                          //===================================================//
                          //                 Title TextField
                          //===================================================//
                          TextFormField(
                            controller: textControllerTitle,
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
                            controller: textControllerDescription,
                            autovalidateMode: AutovalidateMode.always,
                            style: ThemeHelper.customTS(),
                            decoration: ThemeHelper.textFieldDecoration(S.of(context).Description, showFilled: true)
                          ),
                          const SizedBox(height: 15),
                          //===================================================//
                          //              Date TextField
                          //===================================================//
                          TextFormField(
                            controller: textControllerDate,
                            autovalidateMode: AutovalidateMode.always,
                            decoration: ThemeHelper.textFieldDecoration(S.of(context).Date, enabled: true, showFilled: true),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              await tdController.showCustomDatePicker(textControllerDate, context);
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
                          //              Create Button
                          //===================================================//
                          TextButton(
                            onPressed: (){
                              if(todoAddFormKey.currentState!.validate() && selectedCategory != 0 && selectedPrio != 0 && selectedStatus != 0){
                                tdController.addItem(context, title: textControllerTitle.text, description: textControllerDescription.text, date: textControllerDate.text, catID: selectedCategory, prioID: selectedPrio, staID: selectedStatus);
                              }
                            }, 
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                              backgroundColor: MaterialStateProperty.all(CustomColor.colorOrange)
                            ), 
                            child: CustomText(
                              text: S.of(context).CreatePlan, 
                              style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.M, weight: CustomWeight.SB)
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

class LabelDropDownTextField extends StatelessWidget {
  LabelDropDownTextField({
    Key? key,
    required this.selected, required this.title, required this.selectFunc, required this.labelList,

  }) : super(key: key);

  final int selected;
  final String title;
  final Function selectFunc;
  final List<LabelDetails> labelList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: DropdownButtonFormField<int>(
            value: selected,
            menuMaxHeight: 250,
            autovalidateMode: AutovalidateMode.always,
            isExpanded: true,
            dropdownColor: CustomColor.colorWhite,
            decoration: ThemeHelper.textFieldDecoration(title, showFilled: true),
            items: labelList.map((LabelDetails value) => DropdownMenuItem<int>(
              value: value.id, 
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Color(value.colorCode),
                    ),
                    const SizedBox(width: 20),
                    CustomText(
                      text: value.title, 
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1
                    ),
                  ],
                ),
              )
            )).toList(),
            onChanged: (int? newValue) {
              selectFunc(newValue!);
            },
            validator: (value){
              if(value! == 0 || value == null){
                value = null;
              }
              return validateTextField(value, title);
            }
          )
        )
      ]
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/LabelDetailsModel.dart';
import 'package:todoapp/Model/ToDoItemModel.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

//item not found
class ItemNotFoundContainer extends StatelessWidget {
  ItemNotFoundContainer({
    Key? key,
    this.title
  }) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(ConfigHelper.IMAGE_NOITEM)
          ),
          const SizedBox(height: 10),
          CustomText(text: title ?? S.of(context).MsgItemNoFound , style: ThemeHelper.customTS(size: CustomSize.M))
        ],
      ),
    );
  }
}

//Label Tag Container
class CustomLabelContainer extends StatelessWidget {
  const CustomLabelContainer({
    Key? key, required this.color, required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: CustomText(text: title,maxLines: 1,textAlign: TextAlign.center, style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.M)),
    );
  }
}

//ToDo Item Container
class ToDoDetailsContainer extends StatelessWidget {
  const ToDoDetailsContainer({
    Key? key, 
    required this.item, required this.cat, required this.prio, required this.status,
  }) : super(key: key);
  final ToDoDetails item;
  final LabelDetails cat;
  final LabelDetails prio;
  final LabelDetails status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 130,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
              color: Color(prio.colorCode)
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomLabelContainer(color: Color(status.colorCode), title: status.title.toString()),
                      const SizedBox(width: 10),
                      Expanded(child: CustomLabelContainer(color: Color(cat.colorCode), title: cat.title)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomText(text: item.title, style: ThemeHelper.customTS(color: CustomColor.colorBlack, size: CustomSize.L, weight: CustomWeight.B, decoration: status.id == 3 ? TextDecoration.lineThrough : null)  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class IOSCloseKeyboardContainer extends StatelessWidget{
  final Widget child;
  IOSCloseKeyboardContainer({required this.child});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child
    );
  }
}








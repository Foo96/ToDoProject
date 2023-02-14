import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/Model/TutorialDetailsModel.dart';
import 'package:todoapp/View/widget/CustomText.dart';


// ignore: must_be_immutable
class CustomTutorialContent extends StatelessWidget {
  CustomTutorialContent(this.item);
  TutorialDetails item;

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal :40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //=================================================================================================//
            //                                    Tutorial Content Title
            //=================================================================================================//
            CustomText(
              text: item.title,
              textAlign: TextAlign.left,
              style: ThemeHelper.customTS(size: CustomSize.DEL, color: CustomColor.colorOrange, weight: CustomWeight.B)
            ),
            const SizedBox(height: 10),
            //=================================================================================================//
            //                                 Tutorial Content Decription
            //=================================================================================================//
            CustomText(
              text: item.description,
              maxLines: 10,
              textAlign: TextAlign.left,
              style: ThemeHelper.customTS(size: CustomSize.L, color: CustomColor.colorBlack),
            ),
            const SizedBox(height: 50),
            //=================================================================================================//
            //                                    Tutorial Content Image
            //=================================================================================================//
            Image.asset(
              item.imageUrl,
              fit: BoxFit.fill,
              width:  500
            ),
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ConfigHelper.dart';
import 'package:todoapp/Helper/PageRouterhelper.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.colorDOrange,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(ConfigHelper.IMAGE_APPLOGO),
          ),
          const SizedBox(height: 30),
          CustomMenuButton(
            name: S.of(context).Home,
            icon: Icons.home,
            isSelected: ModalRoute.of(context)!.settings.name == HomePage.ROUTE_NAME,
            function: (){
              Navigator.pop(context);
              if(ModalRoute.of(context)!.settings.name != HomePage.ROUTE_NAME){
                Navigator.pushNamedAndRemoveUntil(context, HomePage.ROUTE_NAME, (route) => false);
              }
            },
          ),
          CustomMenuButton(
            name: S.of(context).MyPlan,
            icon: Icons.list,
            isSelected: ModalRoute.of(context)!.settings.name == ToDoListPage.ROUTE_NAME,
            function: (){
              Navigator.pop(context);
              if(ModalRoute.of(context)!.settings.name != ToDoListPage.ROUTE_NAME){
                Navigator.pushNamed(context, ToDoListPage.ROUTE_NAME);
              }
            },
          ),
          CustomMenuButton(
            name: S.of(context).About,
            icon: Icons.list,
            isSelected: ModalRoute.of(context)!.settings.name == TutorialPage.ROUTE_NAME,
            function: (){
              Navigator.pop(context);
              if(ModalRoute.of(context)!.settings.name != TutorialPage.ROUTE_NAME){
                Navigator.pushNamed(context, TutorialPage.ROUTE_NAME);
              }
            },
          ),
          const SizedBox(height: 50),
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_circle_left_rounded, color: CustomColor.colorBlack, size: 60)
          ),
        ],
      ),
    );
  }
}

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    Key? key, required this.name, this.function, required this.isSelected, required this.icon,
  }) : super(key: key);
  final String name;
  final IconData icon;
  final Function? function;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: isSelected
      ? Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              backgroundColor: MaterialStateProperty.all(CustomColor.colorTransparent) 
            ),
            onPressed: (){
              if(function != null){
                function!();
              }
              else{
                Navigator.pop(context);
              }
            }, 
            label: CustomText(
              text: name,
              style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.EL, weight: CustomWeight.EB),
            ),
            icon: const Icon(Icons.check_circle, size: 30, color: CustomColor.colorWhite),
          ),
        )
      : TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(5)),
            backgroundColor: MaterialStateProperty.all(CustomColor.colorTransparent) 
          ),
          onPressed: (){
            if(function != null){
              function!();
            }
            else{
              Navigator.pop(context);
            }
          }, 
          child: CustomText(
            text: name,
            style: ThemeHelper.customTS(color: CustomColor.colorWhite, size: CustomSize.EL, weight: CustomWeight.EB),
          )
        )
    );
  }
}


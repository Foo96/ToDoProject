import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/widget/CustomText.dart';

class TransparentAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const TransparentAppBar({
    Key? key,
    //required this.function,
    this.title,
    this.isCenter = false,
    this.automaticallyImplyLeading = true,
    this.actionWidget,
    this.leadingWidget,
    this.backgroundColor = Colors.transparent,
    this.systemOverlayStyle

  }) : super(key: key);

  //final Function function;
  final String? title;
  final bool isCenter;
  final bool automaticallyImplyLeading;
  final List<Widget>? actionWidget;
  final Widget? leadingWidget;
  final Color backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? CustomText(text: title, style: ThemeHelper.customTS(size: CustomSize.EL)) : null,
      centerTitle: isCenter,
      systemOverlayStyle: systemOverlayStyle ?? CustomStatusBar.defaultStatusBarStyle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: CustomColor.colorBlack, size: 25),
      actions: actionWidget,
      leading: leadingWidget
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
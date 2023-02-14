//**----------------------------------------------------------------------------------- */
//**                              Text with MediaQuery                                  */
//**----------------------------------------------------------------------------------- */
import 'package:flutter/material.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';

class CustomText extends StatelessWidget {
  String? text;
  TextStyle? style;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;

  CustomText({
    this.text = "",
    this.style,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Text(
        text ?? "",
        style: style ?? ThemeHelper.customTS(),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

enum FSize{
  DES, //9
  ES,  //11
  S,   //13
  N,   //15
  M,   //18
  L,   //20
  EL,  //25
  DEL, //30
  D2EL,//35
  D3EL //50
}

enum FWeight{
  L,   //Light w300
  R,   //Regular  normal
  SB,  //Semi Bold w600
  B,   //Bold w700 
  EB,  //Extra Bold w800
  DEB, //Double Extra Bold w900

}

enum Status{
  Done,
  Pending,
  Processing,
  Cancel
}

class CustomColor{
  static const colorOrange        = Color.fromARGB(255, 254, 122, 0);
  static const colorLOrange       = Color.fromRGBO(255, 239, 233, 1);
  static const colorDOrange       = Colors.deepOrange;

  static const colorDYellow       = Color.fromRGBO(236, 188, 17, 1);

  static const colorBrow          = Color.fromRGBO(150, 98, 50, 1);
  static const colorDBrow         = Color.fromRGBO(109, 60, 16, 1);
  static const colorDBrow2        = Color.fromRGBO(65, 35, 8, 1);

  static const colorLRed          = Color.fromRGBO(249, 90, 90, 1);

  static const colorLPurple       = Color.fromRGBO(165, 168, 253, 1);
  static const colorDPurple       = Color.fromRGBO(22, 16, 98, 1);
  static const colorLBlue         = Color.fromRGBO(80, 125, 240, 1);
  static const colorBlue          = Color.fromRGBO(60, 67, 244, 1);

  static const colorDGreen        = Color.fromRGBO(54, 145, 68, 1);
  static const colorDGreen2       = Color.fromRGBO(41, 91, 49, 1);
  static const colorSuccess       = Color.fromRGBO(50, 205, 151, 1);
  static const colorError         = Colors.red;

  static const colorWhite         = Colors.white;
  static const colorDWhite        = Color.fromRGBO(250,249,247,1);
  static const colorDWhite2       = Color.fromRGBO(245,245,245,1);

  static const colorGrey          = Colors.grey;
  static const colorDGrey         = Color.fromARGB(255, 95, 94, 94);

  static const colorBlack         = Color.fromARGB(255, 31, 30, 30);
  static const colorDBlack        = Color.fromARGB(255, 0, 0, 0); 

  static const colorTransparent   = Colors.transparent;
  
}

class CustomSize{
  static const DES          = 9.0;
  static const ES           = 11.0;
  static const S            = 13.0;
  static const N            = 15.0;
  static const M            = 18.0;
  static const L            = 20.0;
  static const EL           = 25.0;
  static const DEL          = 30.0;
  static const D2EL         = 35.0;
  static const D3EL         = 50.0;
}

class CustomWeight{
  static const L            = FontWeight.w300;
  static const R            = FontWeight.normal;
  static const SB           = FontWeight.w600;
  static const B            = FontWeight.w700;
  static const EB           = FontWeight.w800;
  static const DEB          = FontWeight.w900;
} 

class CustomTDecoration{
  static const U            = TextDecoration.underline;
  static const O            = TextDecoration.overline;
  static const LT           = TextDecoration.lineThrough;
}

class CustomTFBoder{

  static final OutlineInputBorder focusBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.colorDGrey, width: 2.0),
    borderRadius: BorderRadius.circular(10),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.colorError, width: 2.0),
    borderRadius: BorderRadius.circular(10),
  );

  static final OutlineInputBorder disableBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.colorGrey, width: 2.0),
    borderRadius: BorderRadius.circular(10),
  );

  static final OutlineInputBorder noneBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.colorTransparent, width: 0.0),
    borderRadius: BorderRadius.circular(10),
  );
}


class CustomStatusBar{
  static final SystemUiOverlayStyle defaultStatusBarStyle = SystemUiOverlayStyle(
      statusBarColor: CustomColor.colorBlack.withOpacity(0.35),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
}

class ThemeHelper{

  static TextStyle customTS({Color color = CustomColor.colorBlack, TextDecoration? decoration, double size = CustomSize.N , FontWeight weight = CustomWeight.R , double height = 1.2}){
    return GoogleFonts.k2d(
      textStyle: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        decoration: decoration,
        height: height
      )
    );
  }

  static InputDecoration textFieldDecoration(String tfName, {bool enabled = true, bool showLabel = true, bool showBorder = true, bool showFilled = false, bool isPassword = false, VoidCallback? function, showPass = false, bool showPrefix = false, Icon pIcon = const Icon(Icons.search, color: CustomColor.colorGrey), String? hintText}){
    return InputDecoration(
      enabled: enabled,
      prefixIcon: showPrefix
      ? pIcon
      : null,
      suffixIcon: isPassword
      ? IconButton(
          icon: Icon(
            showPass
            ? Icons.visibility
            : Icons.visibility_off,
            color:  CustomColor.colorGrey,
          ),
          onPressed: function
        )
      : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      errorMaxLines: 4,
      fillColor: CustomColor.colorDWhite2,
      filled: showFilled,
      focusedBorder: showBorder ? CustomTFBoder.focusBorder : CustomTFBoder.noneBorder,
      enabledBorder: showBorder ? CustomTFBoder.focusBorder : CustomTFBoder.noneBorder,
      focusedErrorBorder: showBorder ? CustomTFBoder.errorBorder : CustomTFBoder.noneBorder,
      errorBorder: showBorder ? CustomTFBoder.errorBorder : CustomTFBoder.noneBorder,
      disabledBorder: CustomTFBoder.disableBorder,
      hintStyle: customTS(color: CustomColor.colorGrey),
      labelStyle: customTS(),
      errorStyle: customTS(size: CustomSize.S, color: CustomColor.colorError),
      labelText: showLabel ? tfName : null,
      hintText: hintText ?? tfName
    );
  }
}
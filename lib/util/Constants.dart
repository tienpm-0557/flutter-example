import 'package:flutter/material.dart';
import 'package:demoflutter/generated/l10n.dart';
class DemoDecoration {
  static BoxDecoration backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 255, 146, 102),
      Color.fromARGB(255, 245, 53, 108),
    ],
  ));

  static InputDecoration getInputDecoration (String hintText, Color? color, double fontSize, Color hintTextColor, Color? borderColor) {
    return InputDecoration(
      hintText: hintText,
      fillColor: color ?? Colors.white,
      hintStyle: TextStyle(fontSize: fontSize, color: hintTextColor),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor?? Colors.white)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:  borderColor?? Colors.white)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:  borderColor?? Colors.white)),
      focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color:  borderColor?? Colors.white)),
      errorStyle: TextStyle(fontSize: 14.0, color: hintTextColor),
    );
  }

  static InputDecoration inputEmailDecoration =
      getInputDecoration(S.current.enterPassword, Colors.white, 16.0, const Color.fromRGBO(220, 220, 220, 1), null);

  static InputDecoration inputPasswordDecoration =
      getInputDecoration(S.current.enterPassword, Colors.white, 16, Color.fromRGBO(220, 220, 220, 1), null);
}

class DemoRegex {
  static RegExp email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}



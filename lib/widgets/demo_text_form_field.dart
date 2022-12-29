import 'package:flutter/material.dart';

class DemoDecoration {
  final InputDecoration inputEmailDecoration = const InputDecoration(
      hintText: "Enter Email",
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));

  final InputDecoration inputPasswordDecoration = const InputDecoration(
      hintText: "Password",
      fillColor: Colors.white,
      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

class DemeTextFormField extends StatelessWidget {
  const DemeTextFormField({
    Key? key,
    this.hintText,
    this.decoration,
    this.cursorColor,
    this.style,
  }) : super(key: key);

  final String? hintText;
  final InputDecoration? decoration;
  final Color? cursorColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      cursorColor: cursorColor ?? Colors.white,
      validator: (value) {
        if (value!.isEmpty) {
          return hintText ?? "";
        }
        return null;
      },
      style: style ?? const TextStyle(fontSize: 16.0, color: Colors.white),
    );
  }
}

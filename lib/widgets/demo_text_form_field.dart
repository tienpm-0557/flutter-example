import 'package:flutter/material.dart';
import 'package:demoflutter/util/constants.dart';

enum InputType { password, email, none }

class DemeTextFormField extends StatelessWidget {
  const DemeTextFormField(
      {Key? key,
      this.hintText,
      this.decoration,
      this.cursorColor,
      this.style,
      this.viewInset,
      this.onChange,
      this.inputType})
      : super(key: key);

  final String? hintText;
  final InputDecoration? decoration;
  final Color? cursorColor;
  final TextStyle? style;
  final EdgeInsets? viewInset;
  final InputType? inputType;

  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: viewInset ?? const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFormField(
          decoration: decoration,
          cursorColor: cursorColor ?? Colors.white,
            obscureText: inputType == InputType.password,
          validator: (value) {
            if (value!.isEmpty) {
              return hintText ?? "";
            }

            switch (inputType) {
              case InputType.email:
                if (!DemoRegex.email.hasMatch(value!)) return hintText ?? "";
                break;

              case InputType.password:
                if (value!.isEmpty || value.length < 8) {
                  return hintText ?? "";
                }
                break;

              default:
                return null;
            }
          },
          onChanged: onChange,
          style: style ?? const TextStyle(fontSize: 16.0, color: Colors.white),
        ));
  }
}

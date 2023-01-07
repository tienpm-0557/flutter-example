import 'package:flutter/material.dart';
import 'package:demoflutter/gen/assets.gen.dart';
import 'package:demoflutter/generated/l10n.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({
    Key? key,
    this.text,
    this.icon,
    this.size,
    this.mainAlign,
    this.style,
    this.onClick,
  }) : super(key: key);

  final String? text;
  final String? icon;
  final Size? size;
  final TextStyle? style;
  final MainAxisAlignment? mainAlign;

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? 50,
      height: size?.height ?? 50,
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          mainAxisAlignment: mainAlign ?? MainAxisAlignment.center,
          children: [
            Image.asset(icon ?? Assets.images.icPlaceholder.path, width: 23, height: 23),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                S.of(context).reviews,
                style: style ?? const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:demoflutter/gen/assets.gen.dart';
import 'package:demoflutter/generated/l10n.dart';

class DemoDialog extends StatelessWidget {
  const DemoDialog({
    Key? key,
    this.title,
    this.content,
    this.onClickOK,
    this.onClickCancel
  }) : super(key: key);

  final String? title;
  final String? content;

  final VoidCallback? onClickOK;
  final VoidCallback? onClickCancel;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    if (onClickOK != null) {
      actions.add(TextButton(
        child: const Text('OK'),
        onPressed: () {
          onClickOK!();
          Navigator.of(context).pop();
        },
      ));
    }
    if (onClickCancel != null) {
      TextButton(
        child: const Text('Cancel'),
        onPressed: () {
          onClickCancel!();
          Navigator.of(context).pop();
        },
      );
    }
    return AlertDialog(
      title: Text(title ?? ""),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(content ?? "")
          ],
        ),
      ),
      actions: actions,
    );
  }
}

import 'package:flutter/material.dart';

Future showDefaultAlert(
  BuildContext context, {
  required String title,
  required String content,
  required List<Widget> actions,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(content),
        ),
        actions: actions,
      );
    },
  );
}

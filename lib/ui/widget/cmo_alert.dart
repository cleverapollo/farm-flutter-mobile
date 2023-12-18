import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/components/cmo_will_pop_scope.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
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

void showUpdateDialog(
  BuildContext context, {
  bool isShow2Button = false,
  bool canPopWithBackButtonAndroid = true,
  VoidCallback? functionLeft,
  VoidCallback? functionRight,
}) {
  final titleWidget = Row(
    children: [
      Assets.icons.icAppLogo.svg(
        width: 32,
        height: 32,
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          appInfoService.appName ?? '',
          style: context.textStyles.bodyBold.blueDark2.copyWith(fontSize: 20),
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );

  final subtitleWidget = Text(
    'This app is ready for an update.',
    style: context.textStyles.bodyNormal.blueDark2,
  );

  final continueButtonTitle = Text(
    'Continue',
    style: context.textStyles.bodyBold.blue,
  );

  final updateButtonTitle = Text(
    'Update',
    style: context.textStyles.bodyBold.blue,
  );

  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CmoWillPopScope(
        isCanPop: canPopWithBackButtonAndroid,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: !isShow2Button
              ? AlertDialog(
                  title: titleWidget,
                  content: subtitleWidget,
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: updateButtonTitle,
                      onPressed: () => functionRight?.call(),
                    ),
                  ],
                )
              : AlertDialog(
                  title: titleWidget,
                  content: subtitleWidget,
                  actions: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoDialogAction(
                            child: continueButtonTitle,
                            onPressed: () => functionLeft?.call(),
                          ),
                        ),
                        Expanded(
                          child: CupertinoDialogAction(
                            isDefaultAction: true,
                            child: updateButtonTitle,
                            onPressed: () => functionRight?.call(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      );
    },
  );
}

void showDialogBase(
  String title,
  String value,
  BuildContext context, {
  bool isShow2Button = false,
  bool canPopWithBackButtonAndroid = true,
  String nameButtonLeft = '',
  String nameButtonRight = '',
  VoidCallback? functionLeft,
  VoidCallback? functionRight,
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CmoWillPopScope(
        isCanPop: canPopWithBackButtonAndroid,
        child: !isShow2Button
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Text(value),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(nameButtonRight),
                    onPressed: () => functionRight?.call(),
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Text(title),
                content: Text(value),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(nameButtonLeft),
                    onPressed: () => functionLeft?.call(),
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(nameButtonRight),
                    onPressed: () => functionRight?.call(),
                  ),
                ],
              ),
      );
    },
  );
}

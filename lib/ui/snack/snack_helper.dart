import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

import 'package:cmo/main.dart';

void showSnackSuccess({
  required String msg,
}) {
  final snackBar = SnackBar(
    content: Text(msg),
    showCloseIcon: true,
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 3),
  );
  snackbarKey.currentState?.clearSnackBars();
  snackbarKey.currentState?.showSnackBar(snackBar);
}

void showSnackError({
  required String msg,
}) {
  final snackBar = SnackBar(
    content: Text(msg),
    showCloseIcon: true,
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
  );
  snackbarKey.currentState?.clearSnackBars();
  snackbarKey.currentState?.showSnackBar(snackBar);
}

void showSnackPoorConnection(BuildContext context) {
  final snackBar = SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          LocaleKeys.poor_connection.tr(),
          style: context.textStyles.bodyBold.white,
        ),
        Text(
          LocaleKeys.try_moving_to_get_better_signal.tr(),
          style: context.textStyles.bodyNormal.white,
        ),
      ],
    ),
    showCloseIcon: true,
    closeIconColor: context.colors.white,
    backgroundColor: context.colors.black.withOpacity(0.7),
    duration: const Duration(seconds: 5),
  );

  snackbarKey.currentState?.clearSnackBars();
  snackbarKey.currentState?.showSnackBar(snackBar);
}

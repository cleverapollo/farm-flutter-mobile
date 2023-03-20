import 'package:cmo/main.dart';
import 'package:flutter/material.dart';

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

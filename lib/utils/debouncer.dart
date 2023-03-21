// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({
    this.milliseconds = 275, // "golden ratio" for typing
  });
  final int milliseconds;
  VoidCallback? action;
  Timer? timer;

  void run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), () {
      action();
    });
  }

  void dispose() {
    timer?.cancel();
  }
}

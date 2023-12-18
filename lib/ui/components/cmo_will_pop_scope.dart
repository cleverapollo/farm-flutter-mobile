import 'dart:io';

import 'package:flutter/material.dart';

class CmoWillPopScope extends StatelessWidget {
  const CmoWillPopScope({
    Key? key,
    this.isCanPop = true,
    this.onWillPop,
    required this.child,
  }) : super(key: key);

  final bool isCanPop;
  final VoidCallback? onWillPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isCanPop) {
      return WillPopScope(
        onWillPop: () async {
          onWillPop?.call();
          return false;
        },
        child: child,
      );
    }

    return Platform.isIOS
        ? child
        : WillPopScope(
            onWillPop: () async {
              onWillPop?.call();
              return true;
            },
            child: child,
          );
  }
}

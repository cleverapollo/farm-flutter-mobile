import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            backgroundColor: context.colors.grey,
            strokeWidth: 5,
          ),
        ),
      ),
    );
  }
}

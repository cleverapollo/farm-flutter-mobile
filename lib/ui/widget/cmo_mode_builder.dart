import 'package:flutter/material.dart';

import 'package:cmo/di.dart';

class CmoModeBuilder extends StatelessWidget {
  const CmoModeBuilder({
    super.key,
    required this.behaveBuilder,
    required this.resourceManagerBuilder,
    required this.farmerBuilder,
  });

  final WidgetBuilder behaveBuilder;
  final WidgetBuilder resourceManagerBuilder;
  final WidgetBuilder farmerBuilder;

  @override
  Widget build(BuildContext context) {
    behaveBuilder(context);
    return appInfoService.mode.join(
      (behave) => behaveBuilder(context),
      (resourceManager) => resourceManagerBuilder(context),
      (farmer) => farmerBuilder(context),
    );
  }
}

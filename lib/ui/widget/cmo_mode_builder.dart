import 'package:cmo/enum/enum.dart';
import 'package:flutter/material.dart';

import 'package:cmo/di.dart';

class CmoModeBuilder extends StatelessWidget {
  const CmoModeBuilder({
    super.key,
    required this.behaveBuilder,
    required this.resourceManagerBuilder,
    required this.farmerBuilder,
    required this.haveNoDataBuilder,
  });

  final WidgetBuilder behaveBuilder;
  final WidgetBuilder resourceManagerBuilder;
  final WidgetBuilder farmerBuilder;
  final WidgetBuilder haveNoDataBuilder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserRoleEnum?>(
      future: configService.getActiveUserRole(),
      builder: (_, snapshot) {
        switch (snapshot.data) {
          case UserRoleEnum.behave:
            return behaveBuilder(context);
          case UserRoleEnum.regionalManager:
            return resourceManagerBuilder(context);
          case UserRoleEnum.farmerMember:
            return farmerBuilder(context);
        }

        return haveNoDataBuilder(context);
      },
    );
  }
}

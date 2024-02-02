import 'package:cmo/di.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/utils/date_time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final String screenName;

  const BaseStatefulWidget({
    super.key,
    required this.screenName,
  });
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget> extends State<T> {

  DateTime? convertDateTimeToLunar(DateTime? dateTime) {
    final settingCubit = context.read<SettingsCubit>();
    if (settingCubit.shouldShowLunarCalendar()) {
      return DateTimeUtils.convertDateTimeToLunar(dateTime);
    } else {
      return dateTime;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      navigationBreadcrumbs.updateCurrentSectionName(widget.screenName);
    });
  }

  @override
  void dispose() {
    Future.delayed(Duration(microseconds: 500)).then((_) {
      if (widget.screenName.isNotEmpty) {
        navigationBreadcrumbs.updateCurrentSectionName(null);
      }
    });

    super.dispose();
  }
}

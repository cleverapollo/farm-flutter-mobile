import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/setting_config/setting_config.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:cmo/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
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

  double? convertAreaUnit(double? ha) {
    final settingConfig = context.read<SettingsCubit>().state.settingConfig;
    return settingConfig.areaUnitEnum.convertHaToDisplayAreaUnit(ha);
  }

  double? convertDistanceUnit(double? km) {
    final settingConfig = context.read<SettingsCubit>().state.settingConfig;
    return settingConfig.distanceUnitEnum.convertKmToDisplayDistanceUnit(km);
  }

  String? convertDateTimeFormat(DateTime? dateTime) {
    final settingConfig = context.read<SettingsCubit>().state.settingConfig;
    return settingConfig.dateFormatEnum.displayFormat(dateTime);
  }

  bool canPopWithoutWarningDialog = true;

  bool shouldCheckConnectionSpeed = false;

  Future<void> checkConnectionSpeed() async {
    final stopwatch = Stopwatch()..start();
    final response = await cmoPerformApiService.downloadCheckNetworkSpeedFile();

    if (response.statusCode == 200) {
      final elapsed = stopwatch.elapsedMilliseconds;
      final speedInKbps = ((4081 / 1024) / (elapsed / 1000)) * 8;
      if (speedInKbps < 15) {
        showSnackPoorConnection(context);
      }
    }
  }

  String get areaUnit => context.read<SettingsCubit>().state.settingConfig.areaUnitEnum.valueName;

  String get distanceUnit => context.read<SettingsCubit>().state.settingConfig.distanceUnitEnum.valueName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigationBreadcrumbs.updateCurrentSectionName(widget.screenName);
      if (shouldCheckConnectionSpeed) {
        await checkConnectionSpeed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.settingConfig != current.settingConfig,
      builder: (context, _) {
        return WillPopScope(
          child: GestureDetector(
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: buildContent(context),
          ),
          onWillPop: () async {
            if (canPopWithoutWarningDialog) {
              return true;
            } else {
              await onShowWarningDispose();
              return false;
            }
          },
        );
      },
    );
  }

  void onGoBack() {
    Navigator.of(context).pop();
  }

  Widget buildContent(BuildContext context);

  Future<void> onShowWarningDispose() async {
    if (canPopWithoutWarningDialog) {
      Navigator.of(context).pop();
      return;
    }

    await onShowWarningDialog(
      context,
      title: LocaleKeys.warning.tr(),
      subtitle: LocaleKeys.warning_pop_back_content.tr(),
      children: [
        InkWell(
          onTap: () async {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: context.colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.current_session.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            Navigator.of(context).pop();
            onGoBack();
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.go_back.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Future.delayed(Duration(microseconds: 500)).then((_) {
    //   if (widget.screenName.isNotEmpty) {
    //     navigationBreadcrumbs.updateCurrentSectionName(null);
    //   }
    // });
    super.dispose();
  }
}

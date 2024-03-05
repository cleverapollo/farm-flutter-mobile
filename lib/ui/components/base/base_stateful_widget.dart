import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/date_time_utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

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

  bool canPopWithoutWarningDialog = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      navigationBreadcrumbs.updateCurrentSectionName(widget.screenName);
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }

  void onGoBack() {
    Navigator.of(context).pop();
  }

  Widget buildContent(BuildContext context);

  Future<void> onShowWarningDispose() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                    ),
                    color: context.colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.warning.tr(),
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Icon(
                        IconsaxOutline.danger,
                        size: 30.0,
                        color: context.colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    LocaleKeys.warning_pop_back_content.tr(),
                    style: context.textStyles.bodyNormal.blueDark2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12,),
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
                            style: context.textStyles.bodyBold.copyWith(color: context.colors.white),
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
                            style: context.textStyles.bodyBold.copyWith(color: context.colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

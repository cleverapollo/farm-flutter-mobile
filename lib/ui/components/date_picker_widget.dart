import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:async';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/common_widgets.dart';

class DatePickerWidget extends StatefulWidget {

  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Widget? child;
  final String? title;
  final TextStyle? titleStyle;
  final void Function(DateTime) onConfirm;

  const DatePickerWidget({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onConfirm,
    this.child,
    this.title,
    this.titleStyle,
    this.initialDate,
  });

  @override
  _DatePickerWidget createState() => _DatePickerWidget();
}

class _DatePickerWidget extends State<DatePickerWidget> {

  TextEditingController textEditingController = TextEditingController();
  late SettingsCubit settingCubit;
  late DateFormatEnum dateFormatEnum;

  @override
  void initState() {
    super.initState();
    settingCubit = context.read<SettingsCubit>();
    dateFormatEnum = settingCubit.state.settingConfig.dateFormatEnum;
  }

  Future<void> onShowGregorianCalendar() async {
    Navigator.of(context).pop();
    final date = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      keyboardType: TextInputType.emailAddress,
    );

    if (date != null) {
      widget.onConfirm(date);
    }
  }

  String convertDateTimeToLunar(BuildContext context, DateTime? dateTime) {
    DateTime? result;
    if (settingCubit.shouldShowLunarCalendar()) {
      result = DateTimeUtils.convertDateTimeToLunar(dateTime);
    } else {
      result = dateTime;
    }

    return dateFormatEnum.displayFormat(result);
  }

  Future<void> onShowInputDateTimeDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var isShowError = false;
        textEditingController.clear();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              actions: [
                InkWell(
                  onTap: () {
                    final date = DateTimeUtils.validateDateTimeWithYYYYMMDDRegex(
                      textEditingController.value.text,
                      dateFormatEnum,
                    );
                    if (date != null && date.isAfter(widget.firstDate) && date.isBefore(widget.lastDate)) {
                      setState(() {
                        isShowError = false;
                      });
                      Navigator.of(context).pop();
                      widget.onConfirm(date);
                    } else {
                      setState(() {
                        isShowError = true;
                      });
                    }
                  },
                  child: Text(
                    LocaleKeys.ok.tr().toUpperCase(),
                    style: context.textStyles.bodyNormal.blueDark2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LocaleKeys.cancel.tr().toUpperCase(),
                    style: context.textStyles.bodyNormal.blueDark2,
                  ),
                ),
              ],
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                        ),
                        color: context.colors.blueDark2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.select_date.tr().toUpperCase(),
                            style: context.textStyles.bodyBold.copyWith(
                              color: context.colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                convertDateTimeToLunar(context, widget.initialDate),
                                style: context.textStyles.bodyBold.copyWith(
                                  color: context.colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              InkWell(
                              onTap: onShowGregorianCalendar,
                              child: Assets.icons.icCalendar.svgWhite,
                            ),
                          ],
                        ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 12,
                  ),
                  AttributeItem(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    isUnderErrorBorder: true,
                    isShowError: isShowError,
                    errorText: LocaleKeys.invalid.tr(),
                    child: TextField(
                      controller: textEditingController,
                      keyboardAppearance: Brightness.light,
                      textAlign: TextAlign.left,
                      style: context.textStyles.bodyNormal.blueDark2,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: dateFormatEnum.hintText(),
                        hintStyle: context.textStyles.bodyNormal.grey,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onShowInputDateTimeDialog,
      child: widget.child ??
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? '',
                      style: widget.titleStyle ?? context.textStyles.bodyBold.blueDark2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    if (widget.initialDate != null)
                      Text(
                        convertDateTimeToLunar(context, widget.initialDate),
                        maxLines: 3,
                        style: context.textStyles.bodyNormal.blueDark2,
                        textAlign: TextAlign.left,
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
                Assets.icons.icCalendar.svgBlack,
              ],
            ),
          ),
    );
  }
}

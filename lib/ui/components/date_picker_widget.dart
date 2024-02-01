import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/third_party/lunar_calendar/date_init.dart';
import 'package:cmo/third_party/lunar_calendar/flutter_lunar_datetime_picker.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Widget? child;
  final String? title;
  final void Function(DateTime) onChangeDate;

  const DatePickerWidget({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onChangeDate,
    this.child,
    this.title,
    this.initialDate,
  });

  Future<void> onShowGregorianCalendar(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      onChangeDate(date);
    }
  }

  Future<void> onShowLunarCalendar(BuildContext context) async {
    await LunarDatePicker.showDatePicker(
      context,
      showTime: false,
      dateInitTime: DateInitTime(
        currentTime: DateTime.now(),
        maxTime: lastDate,
        minTime: firstDate,
      ),
      onConfirm: (dateTime, dateTimeUtc) {
        onChangeDate(dateTimeUtc);
      },
      onChanged: (time, dateTimeUtc) {
        debugPrint('change:${dateTimeUtc.toString()}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(context.read<SettingsCubit>().shouldShowLunarCalendar()) {
          await onShowLunarCalendar(context);
        } else {
          await onShowGregorianCalendar(context);
        }
      },
      child: child ??
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
                      title ?? '',
                      style: context.textStyles.bodyBold.blueDark2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    if (initialDate != null)
                      Text(
                        initialDate.yMd(),
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

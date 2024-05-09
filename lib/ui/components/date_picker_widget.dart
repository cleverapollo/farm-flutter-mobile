import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/third_party/lunar_calendar/date_init.dart';
import 'package:cmo/third_party/lunar_calendar/flutter_lunar_datetime_picker.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/third_party/lunar_calendar/date_init.dart';
import 'package:cmo/third_party/lunar_calendar/flutter_lunar_datetime_picker.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class DatePickerWidget extends StatelessWidget {
//   final DateTime? initialDate;
//   final DateTime firstDate;
//   final DateTime lastDate;
//   final Widget? child;
//   final String? title;
//   final TextStyle? titleStyle;
//   final void Function(DateTime) onConfirm;
//
//   const DatePickerWidget({
//     super.key,
//     required this.firstDate,
//     required this.lastDate,
//     required this.onConfirm,
//     this.child,
//     this.title,
//     this.titleStyle,
//     this.initialDate,
//   });
//
//   Future<void> onShowGregorianCalendar(BuildContext context) async {
//     final date = await showDatePicker(
//       context: context,
//       initialDate: initialDate ?? DateTime.now(),
//       firstDate: firstDate,
//       lastDate: lastDate,
//       keyboardType: TextInputType.emailAddress,
//     );
//
//     if (date != null) {
//       onConfirm(date);
//     }
//   }
//
//   Future<void> onShowLunarCalendar(BuildContext context) async {
//     await LunarDatePicker.showDatePicker(
//       context,
//       showTime: false,
//       dateInitTime: DateInitTime(
//         currentTime: initialDate ?? DateTime.now(),
//         maxTime: lastDate,
//         minTime: firstDate,
//       ),
//       onConfirm: onConfirm,
//     );
//   }
//
//   String convertDateTimeToLunar(BuildContext context, DateTime? dateTime) {
//     final settingCubit = context.read<SettingsCubit>();
//     DateTime? result;
//     if (settingCubit.shouldShowLunarCalendar()) {
//       result = DateTimeUtils.convertDateTimeToLunar(dateTime);
//     } else {
//       result = dateTime;
//     }
//
//     return settingCubit.state.settingConfig.dateFormatEnum.displayFormat(result);
//   }
//
//   Future<void> onShowInputDateTimeDialog(
//       BuildContext context, {
//         required String title,
//         required String subtitle,
//         IconData? icon,
//         Color? barColor,
//         List<Widget> children = const <Widget>[],
//       }) async {
//     await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(12.0),
//             ),
//           ),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(12.0),
//                       topLeft: Radius.circular(12.0),
//                     ),
//                     color: barColor ?? context.colors.red,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title,
//                         style: context.textStyles.bodyBold.copyWith(
//                           color: context.colors.white,
//                           fontSize: 24,
//                         ),
//                       ),
//                       Icon(
//                         icon ?? IconsaxOutline.danger,
//                         size: 30.0,
//                         color: context.colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Text(
//                     subtitle,
//                     style: context.textStyles.bodyNormal.blueDark2,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 12,),
//                 ...children,
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         await onShowInputDateTimeDialog();
//         // if(context.read<SettingsCubit>().shouldShowLunarCalendar()) {
//         //   await onShowLunarCalendar(context);
//         // } else {
//         //   await onShowGregorianCalendar(context);
//         // }
//       },
//       child: child ??
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12.0,
//               vertical: 8,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title ?? '',
//                       style: titleStyle ?? context.textStyles.bodyBold.blueDark2,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                     if (initialDate != null)
//                       Text(
//                         convertDateTimeToLunar(context, initialDate),
//                         maxLines: 3,
//                         style: context.textStyles.bodyNormal.blueDark2,
//                         textAlign: TextAlign.left,
//                       )
//                     else
//                       const SizedBox.shrink(),
//                   ],
//                 ),
//                 Assets.icons.icCalendar.svgBlack,
//               ],
//             ),
//           ),
//     );
//   }
// }


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

  Timer? _debounceInputTimer;
  bool isShowError = false;
  late SettingsCubit settingCubit;
  late DateFormatEnum dateFormatEnum;

  @override
  void initState() {
    super.initState();
    settingCubit = context.read<SettingsCubit>();
    dateFormatEnum = settingCubit.state.settingConfig.dateFormatEnum;
  }

  Future<void> onShowGregorianCalendar() async {
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

  void onChangeDate(String? value) {
    _debounceInputTimer?.cancel();
    _debounceInputTimer = Timer(
      const Duration(milliseconds: 200),
          () {
        print(value);
        final date = DateTimeUtils.validateDateTimeWithYYYYMMDDRegex(value);
        if (date != null) {
          widget.onConfirm(date);
        } else {
          setState(() {
            isShowError = true;
          });
        }
      },
    );
  }


  Future<void> onShowInputDateTimeDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  controller: TextEditingController(text: convertDateTimeToLunar(context, widget.initialDate)),
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
                  onChanged: onChangeDate,
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
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onShowInputDateTimeDialog();
        // if(context.read<SettingsCubit>().shouldShowLunarCalendar()) {
        //   await onShowLunarCalendar(context);
        // } else {
        //   await onShowGregorianCalendar(context);
        // }
      },
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
    // return AttributeItem(
    //     isShowError: isShowError,
    //     errorText: LocaleKeys.invalid.tr(),
    //     isUnderErrorBorder: true,
    //     margin: const EdgeInsets.symmetric(horizontal: 24),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                 widget.title ?? '',
    //                 style: widget.titleStyle ?? context.textStyles.bodyBold.blueDark2,
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 1,
    //               ),
    //               TextField(
    //                 controller: textEditingController,
    //                 keyboardAppearance: Brightness.light,
    //                 textAlign: TextAlign.left,
    //                 style: context.textStyles.bodyNormal.blueDark2,
    //                 keyboardType: TextInputType.emailAddress,
    //                 decoration: InputDecoration(
    //                   hintText: 'YYYY/MM/DD',
    //                   hintStyle: context.textStyles.bodyNormal.grey,
    //                   border: InputBorder.none,
    //                   focusedBorder: InputBorder.none,
    //                 ),
    //                 onChanged: onChangeDate,
    //               ),
    //
    //               // if (widget.initialDate != null)
    //               //   Text(
    //               //     convertDateTimeToLunar(context, widget.initialDate),
    //               //     maxLines: 3,
    //               //     style: context.textStyles.bodyNormal.blueDark2,
    //               //     textAlign: TextAlign.left,
    //               //   )
    //               // else
    //               //   const SizedBox.shrink(),
    //             ],
    //           ),
    //         ),
    //         InkWell(
    //           onTap: () async {
    //             await onShowGregorianCalendar(context);
    //           },
    //           child: Assets.icons.icCalendar.svgBlack,),
    //       ],
    //     )
    // );
  }
}

// class DatePickerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         if(context.read<SettingsCubit>().shouldShowLunarCalendar()) {
//           await onShowLunarCalendar(context);
//         } else {
//           await onShowGregorianCalendar(context);
//         }
//       },
//       child: child ??
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12.0,
//               vertical: 8,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title ?? '',
//                       style: titleStyle ?? context.textStyles.bodyBold.blueDark2,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                     if (initialDate != null)
//                       Text(
//                         convertDateTimeToLunar(context, initialDate),
//                         maxLines: 3,
//                         style: context.textStyles.bodyNormal.blueDark2,
//                         textAlign: TextAlign.left,
//                       )
//                     else
//                       const SizedBox.shrink(),
//                   ],
//                 ),
//                 Assets.icons.icCalendar.svgBlack,
//               ],
//             ),
//           ),
//     );
//   }
// }

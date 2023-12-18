import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
        );

        if (date != null) {
          onChangeDate(date);
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

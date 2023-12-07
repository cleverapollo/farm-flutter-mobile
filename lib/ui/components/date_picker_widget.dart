import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Widget child;
  final void Function(DateTime) onChangeDate;

  const DatePickerWidget({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.onChangeDate,
    required this.child,
    this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: child,
    );
  }
}

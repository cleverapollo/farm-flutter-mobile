import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';

class CmoDatePicker extends StatelessWidget {
  const CmoDatePicker({
    super.key,
    required this.name,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.inputDecoration,
    this.initialValue,
    this.onChanged,
  });

  final String name;
  final String? hintText;
  final FormFieldValidator<DateTime?>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? inputDecoration;
  final DateTime? initialValue;
  final ValueChanged<DateTime?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      inputType: InputType.date,
      decoration: inputDecoration ?? InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
        prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
        suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
        suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
        isDense: true,
        hintText: hintText,
      ),
      style: context.textStyles.bodyNormal,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      validator: validator,
      format: DateFormat('yyyy-MM-dd'),
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}

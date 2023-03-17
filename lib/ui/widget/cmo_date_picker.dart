import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoDatePicker extends StatelessWidget {
  const CmoDatePicker({
    super.key,
    required this.name,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String name;
  final String? hintText;
  final FormFieldValidator<DateTime?>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      inputType: InputType.date,
      decoration: InputDecoration(
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
      format: DateFormat('dd/MM/yyyy'),
    );
  }
}

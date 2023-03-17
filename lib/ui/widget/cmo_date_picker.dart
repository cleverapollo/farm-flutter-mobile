import 'package:cmo/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoDatePicker extends StatelessWidget {
  const CmoDatePicker({
    super.key,
    required this.name,
    this.hintText,
    this.validator,
  });

  final String name;
  final String? hintText;
  final FormFieldValidator<DateTime?>? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      inputType: InputType.date,
      fieldHintText: hintText,
      validator: validator,
      format: DateFormat('dd/MM/yyyy'),
    );
  }
}

import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoSwitch extends StatelessWidget {
  const CmoSwitch({
    super.key,
    this.name = '',
    this.title = '',
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.inputDecoration,
    this.initialValue,
  });

  final String name;

  final String title;

  final bool? initialValue;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String? hintText;

  final bool enabled;

  final FormFieldValidator<bool?>? validator;

  final InputDecoration? inputDecoration;

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: name,
      title: Text(
        title,
        style: context.textStyles.bodyBold.black,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      validator: validator,
      decoration: inputDecoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
            prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
            suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
            suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
          ),
      enabled: enabled,
      initialValue: initialValue,
    );
  }
}

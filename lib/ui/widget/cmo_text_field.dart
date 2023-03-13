import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoTextField extends StatelessWidget {
  const CmoTextField({
    super.key,
    required this.name,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.autofillHints,
    this.onEditingComplete,
    this.textInputAction,
  });

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String name;

  final String? hintText;

  final Function(String?)? onChanged;

  final bool obscureText;

  final TextInputType? keyboardType;

  final List<String>? autofillHints;

  final Function()? onEditingComplete;

  final TextInputAction? textInputAction;

  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      style: context.textStyles.bodyNormal,
      onChanged: onChanged,
      cursorColor: context.colors.blue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      scrollPadding: const EdgeInsets.only(bottom: 100),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
        prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
        suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
        suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
        isDense: true,
        hintText: hintText,
      ),
    );
  }
}

import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoTextField extends StatelessWidget {
  const CmoTextField({
    super.key,
    this.name = '',
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.autofillHints,
    this.onEditingComplete,
    this.textInputAction,
    this.maxLines = 1,
    this.autofocus = false,
    this.focusNode,
    this.inputDecoration,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textAlign,
    this.hintStyle,
    this.initialValue,
    this.contentPadding,
  });

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String name;

  final String? hintText;

  final void Function(String?)? onChanged;

  final bool obscureText;

  final bool enabled;

  final TextInputType? keyboardType;

  final List<String>? autofillHints;

  final void Function()? onEditingComplete;

  final TextInputAction? textInputAction;

  final FormFieldValidator<String?>? validator;

  final int? maxLines;

  final bool autofocus;

  final FocusNode? focusNode;

  final InputDecoration? inputDecoration;

  final bool enableSuggestions;

  final bool autocorrect;

  final String? initialValue;

  final TextAlign? textAlign;

  final TextStyle? hintStyle;

  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      enabled: enabled,
      style: context.textStyles.bodyNormal,
      onChanged: onChanged,
      cursorColor: context.colors.blue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofillHints: autofillHints,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      scrollPadding: const EdgeInsets.only(bottom: 100),
      decoration: inputDecoration ??
          InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(8),
            prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
            prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
            suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
            suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
            isDense: true,
            hintText: hintText,
            hintStyle: hintStyle
          ),
      maxLines: maxLines,
      autofocus: autofocus,
      focusNode: focusNode,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      initialValue: initialValue,
    );
  }
}

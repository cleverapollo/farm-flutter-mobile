import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoTextField extends StatelessWidget {
  const CmoTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String? hintText;

  final Function(String)? onChanged;

  final bool obscureText;

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textStyles.bodyNormal,
      onChanged: onChanged,
      cursorColor: context.colors.blue,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
        prefixIcon: Center(child: prefixIcon),
        suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
        suffixIcon: Center(child: suffixIcon),
        isDense: true,
        hintText: hintText,
      ),
    );
  }
}

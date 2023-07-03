import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/utils/utils.dart';
import 'package:cmo/ui/ui.dart';

class InputTextFieldWithTitle extends StatelessWidget {
  const InputTextFieldWithTitle({
    super.key,
    required this.name,
    required this.title,
    this.firstSuffixIcon,
    this.secondSuffixIcon,
    this.validator,
    this.keyboardType,
    this.initialValue,
  });

  final String name;
  final String title;
  final Widget? firstSuffixIcon;
  final Widget? secondSuffixIcon;
  final FormFieldValidator<String?>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textStyles.bodyBold.black,
              ),
              CmoTextField(
                name: name,
                validator: validator,
                inputDecoration: _buildInputDecoration(context),
                keyboardType: keyboardType,
                initialValue: initialValue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      hintText: '${LocaleKeys.enter.tr()} ${title.toLowerCase()}',
      hintStyle: context.textStyles.bodyNormal.grey,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (secondSuffixIcon != null) ...[
            SizedBox(
              height: 25,
              width: 25,
              child: secondSuffixIcon,
            ),
            const SizedBox(
              width: 50,
            ),
          ],
          if (firstSuffixIcon != null)
            SizedBox(
              height: 25,
              width: 25,
              child: firstSuffixIcon,
            ),
        ],
      ),
      border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
    );
  }
}

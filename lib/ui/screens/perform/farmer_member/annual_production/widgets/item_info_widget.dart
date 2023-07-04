import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({
    super.key,
    required this.name,
    required this.title,
    required this.isEditing,
    this.title2,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.hasValidator = true,
    this.enabled = true,
  });

  final String name;
  final String title;
  final String? title2;
  final TextInputType? keyboardType;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final bool isEditing;
  final bool hasValidator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        RichText(
          maxLines: 2,
          text: TextSpan(
            text: title,
            style: context.textStyles.bodyNormal.black,
            children: <TextSpan>[
              if (title2 != null) ...[
                TextSpan(
                  text: ' $title2',
                  style: context.textStyles.bodyBold.red,
                ),
                const TextSpan(
                  text: '?',
                ),
              ],
            ],
          ),
        ),
        CmoTextField(
          name: name,
          validator: hasValidator ? requiredValidator : null,
          inputDecoration: _buildInputDecoration(context),
          keyboardType: keyboardType ??
              const TextInputType.numberWithOptions(decimal: true),
          onChanged: onChanged,
          initialValue: isEditing ? initialValue : null,
          enabled: enabled,
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.blue),
      ),
    );
  }
}

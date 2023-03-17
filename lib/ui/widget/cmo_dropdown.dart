import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoDropdownItem {
  CmoDropdownItem({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}

class CmoDropdown extends StatelessWidget {
  const CmoDropdown({
    super.key,
    required this.name,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.itemsData,
    this.validator,
  });

  final String name;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<CmoDropdownItem>? itemsData;
  final FormFieldValidator<int?>? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<int>(
      name: name,
      validator: validator,
      style: context.textStyles.bodyNormal,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
        prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
        suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
        suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
        isDense: true,
        hintText: hintText,
      ),
      focusColor: Theme.of(context).scaffoldBackgroundColor,
      items: (itemsData ?? <CmoDropdownItem>[])
          .map(
            (data) => DropdownMenuItem(
              value: data.id,
              child: Text(
                data.name,
                style: context.textStyles.bodyNormal,
              ),
            ),
          )
          .toList(),
    );
  }
}

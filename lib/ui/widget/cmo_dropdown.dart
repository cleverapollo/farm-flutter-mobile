import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:cmo/ui/theme/theme.dart';

class CmoDropdownItem<T> {
  CmoDropdownItem({
    required this.id,
    required this.name,
  });

  final T id;
  final String name;
}

class CmoDropdown<T> extends StatelessWidget {
  const CmoDropdown({
    super.key,
    required this.name,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.itemsData,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.inputDecoration,
    this.style,
    this.initialValue,
    this.shouldBorderItem = false,
  });

  final String name;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<CmoDropdownItem<T>>? itemsData;
  final FormFieldValidator<T?>? validator;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final InputDecoration? inputDecoration;
  final TextStyle? style;
  final T? initialValue;
  final bool shouldBorderItem;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: name,
      validator: validator,
      style: style ?? context.textStyles.bodyNormal,
      decoration: inputDecoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            prefixIconConstraints: BoxConstraints.tight(const Size(56, 38)),
            prefixIcon: prefixIcon != null ? Center(child: prefixIcon) : null,
            suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
            suffixIcon: suffixIcon != null ? Center(child: suffixIcon) : null,
            isDense: true,
            hintText: hintText,
          ),
      focusColor: Theme.of(context).scaffoldBackgroundColor,
      onChanged: onChanged,
      enabled: enabled,
      elevation: 0,
      initialValue: initialValue,
      selectedItemBuilder: (BuildContext context) {
        return (itemsData ?? <CmoDropdownItem<T>>[])
            .map(
              (data) => DropdownMenuItem(
                value: data.id,
                child: Text(
                  data.name,
                  style: style ?? context.textStyles.bodyNormal,
                ),
              ),
            )
            .toList();
      },
      items: (itemsData ?? <CmoDropdownItem<T>>[])
          .map(
            (data) => DropdownMenuItem(
              value: data.id,
              child: shouldBorderItem
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(8.0),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Text(
                        data.name,
                        style: context.textStyles.bodyNormal,
                      ),
                    )
                  : Text(
                      data.name,
                      style: context.textStyles.bodyNormal,
                    ),
            ),
          )
          .toList(),
    );
  }
}

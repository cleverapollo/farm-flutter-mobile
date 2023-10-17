
import 'dart:async';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class GeneralCommentWidget extends StatefulWidget {
  const GeneralCommentWidget({
    required this.hintText,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.hintTextStyle,
    this.textStyle,
    this.initialValue,
    super.key,
    this.enabled = true,
    this.shouldShowTitle = false,
    this.height = 250,
});

  final String? initialValue;
  final String hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool enabled;
  final bool shouldShowTitle;
  final double height;

  @override
  State<StatefulWidget> createState() => _AddGeneralCommentWidgetState();
}

class _AddGeneralCommentWidgetState extends State<GeneralCommentWidget> {

  Timer? _debounceInputTimer;

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      textCapitalization: TextCapitalization.sentences,
      keyboardAppearance: Brightness.light,
      textAlign: TextAlign.left,
      style: widget.textStyle ?? context.textStyles.bodyBold.black,
      enabled: widget.enabled,
      minLines: 1,
      initialValue: widget.initialValue,
      maxLines: widget.maxLines ?? 1000,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ?? context.textStyles.bodyNormal.blueDark2,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      onChanged: (text) {
        if (widget.onChanged != null) {
          _debounceInputTimer?.cancel();
          _debounceInputTimer = Timer(
            const Duration(milliseconds: 200),
            () => widget.onChanged!.call(text),
          );
        }
      },
    );

    if (widget.shouldShowTitle) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.colors.blueDark2,
              width: 2,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKeys.generalComments.tr(),
                  style: context.textStyles.bodyNormal.blueDark2,
                ),
              ),
            ),
            Expanded(child: textField),
          ],
        ),
      );
    }

    return textField;
  }
}

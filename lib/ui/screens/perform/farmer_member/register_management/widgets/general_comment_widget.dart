
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
});

  final String? initialValue;
  final String hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool enabled;

  @override
  State<StatefulWidget> createState() => _AddGeneralCommentWidgetState();
}

class _AddGeneralCommentWidgetState extends State<GeneralCommentWidget> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
            widget.onChanged!.call(text);
          }
        },
    );
  }
}

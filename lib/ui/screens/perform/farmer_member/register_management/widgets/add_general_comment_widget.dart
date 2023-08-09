
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class GeneralCommentWidget extends StatefulWidget {
  const GeneralCommentWidget({
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.hintTextStyle,
    this.initialValue,
    this.elevation = 4,
    super.key,
  });

  final String? initialValue;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintTextStyle;
  final double elevation;

  @override
  State<StatefulWidget> createState() => _AddGeneralCommentWidgetState();
}

class _AddGeneralCommentWidgetState extends State<GeneralCommentWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: widget.elevation,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardAppearance: Brightness.light,
        textAlign: TextAlign.left,
        style: context.textStyles.bodyBold.black,
        minLines: 1,
        maxLines: 1000,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: widget.hintText,
          hintStyle: context.textStyles.bodyBold.black,
          labelText: widget.initialValue == null ? null : widget.hintText,
          labelStyle: context.textStyles.bodyNormal.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!.call(text);
          }
        },
      ),
    );
  }
}

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CmoTextFieldV2 extends StatefulWidget {
  const CmoTextFieldV2({
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.hintTextStyle,
    this.validator,
    this.initialValue,
    this.contentPadding = const EdgeInsets.fromLTRB(14, 4, 14, 4),
    this.textStyle,
    this.labelText,
    this.labelTextStyle,
    this.isDense = false,
    this.textCapitalization,
    super.key,
    this.inputFormatters = const <TextInputFormatter>[],
    this.controller,
    this.scrollController,
    this.border,
    this.readOnly = false,
  });

  final String? hintText;
  final String? labelText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final bool? isDense;
  final EdgeInsetsGeometry contentPadding;
  final FormFieldValidator<String?>? validator;
  final String? initialValue;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final InputBorder? border;
  final bool readOnly;

  @override
  State<CmoTextFieldV2> createState() => _CmoTextFieldV2State();
}

class _CmoTextFieldV2State extends State<CmoTextFieldV2> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController();
    }

    _controller.text = widget.initialValue ?? '';
  }

  @override
  void didUpdateWidget(covariant CmoTextFieldV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      scrollController: widget.scrollController,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      minLines: 1,
      maxLines: widget.maxLines,
      controller: _controller,
      style: widget.textStyle ?? context.textStyles.bodyNormal.blueDark2,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator ??
          (value) {
            if (value.isBlank) {
              return widget.labelText ?? widget.hintText ?? '';
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
        border: widget.border ??
            const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ??
            context.textStyles.bodyNormal.copyWith(
              color: context.colors.grey,
            ),
        labelText: widget.labelText,
        labelStyle:
            widget.labelTextStyle ?? context.textStyles.bodyBold.blueDark2,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

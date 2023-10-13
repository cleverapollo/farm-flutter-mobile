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
    this.enable = true,
    this.shouldValidate = false,
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
  final bool enable;
  final bool shouldValidate;

  @override
  State<CmoTextFieldV2> createState() => _CmoTextFieldV2State();
}

class _CmoTextFieldV2State extends State<CmoTextFieldV2> {
  final _shouldValidateNotifier = ValueNotifier(false);

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

    _shouldValidateNotifier.value = widget.shouldValidate;
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
    return DecoratedBox(
      decoration: BoxDecoration(
          color:
              widget.enable ? Colors.transparent : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4)),
      child: ValueListenableBuilder(
        valueListenable: _shouldValidateNotifier,
        builder: (context, shouldValidate, _) {
          return TextFormField(
            readOnly: widget.readOnly,
            scrollController: widget.scrollController,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
            onChanged: (p0) {
              if(p0.isNotEmpty) {
                _shouldValidateNotifier.value = false;
              };
              widget.onChanged?.call(p0);
            },
            onFieldSubmitted: widget.onSubmitted,
            minLines: 1,
            maxLines: widget.maxLines,
            controller: _controller,
            style: widget.textStyle ?? context.textStyles.bodyNormal.blueDark2,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            validator: shouldValidate
                ? widget.validator ??
                    (value) {
                      if (value.isBlank) {
                        return widget.labelText ?? widget.hintText ?? '';
                      } else {
                        return null;
                      }
                    }
                : (_) => null,
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
              labelStyle: widget.labelTextStyle ??
                  context.textStyles.bodyBold.blueDark2,
              isDense: widget.isDense,
              contentPadding: widget.contentPadding,
              fillColor: Colors.white,
              focusedBorder: _bindFocusOutline(),
              errorBorder:
                  shouldValidate ? _bindErrorOutline() : _bindFocusOutline(),
              focusedErrorBorder:
                  shouldValidate ? _bindErrorOutline() : _bindFocusOutline(),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder  _bindFocusOutline() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }

  OutlineInputBorder  _bindErrorOutline() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
  }
}

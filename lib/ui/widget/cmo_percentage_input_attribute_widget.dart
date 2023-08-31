import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PercentageInputAttributeItem extends StatefulWidget {
  const PercentageInputAttributeItem(
      {super.key,
      this.textStyle,
      this.labelTextStyle,
      this.initialValue,
      this.onChanged,
      this.labelText,
      this.hintText});

  final String? labelText;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final String? initialValue;
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  State<PercentageInputAttributeItem> createState() =>
      _PercentageInputAttributeItemState();
}

class _PercentageInputAttributeItemState
    extends State<PercentageInputAttributeItem> {
  late final TextEditingController controller;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    scrollController = ScrollController();

    if(widget.initialValue.isNullOrEmpty == false){
      controller.text = widget.initialValue ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputAttributeItem(
      scrollController: scrollController,
      controller: controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      labelTextStyle: widget.labelTextStyle,
      textStyle: widget.textStyle,
      keyboardType: TextInputType.number,
      initialValue: widget.initialValue,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      onChanged: (p0) {
        final percentage = double.tryParse(p0) ?? 0;

        if (percentage >= 100) {
          controller.text = '100';
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length));
        }

        widget.onChanged?.call(controller.text);
      },
    );
  }
}

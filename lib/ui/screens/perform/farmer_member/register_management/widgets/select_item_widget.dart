import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectItemWidget extends StatefulWidget {
  const SelectItemWidget({
    super.key,
    required this.title,
    required this.onSelect,
    this.initValue = false,
  });

  final String title;
  final bool initValue;
  final void Function(bool) onSelect;

  @override
  State<StatefulWidget> createState() => _SelectItemWidgetState();
}

class _SelectItemWidgetState extends State<SelectItemWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        widget.onSelect(isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: context.textStyles.bodyBold.black,
              ),
            ),
            if (isSelected) _buildSelectedIcon() else Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIcon() {
    return Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        Positioned.fill(
          child: Align(
            child: Assets.icons.icCheck.svg(),
          ),
        ),
      ],
    );
  }
}

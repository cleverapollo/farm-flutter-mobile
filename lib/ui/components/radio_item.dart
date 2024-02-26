import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final String? title;
  final bool isSelected;
  final bool isDisplayIconFirst;
  final void Function() onTap;
  final EdgeInsets padding;

  RadioItem({
    this.title,
    required this.onTap,
    this.isSelected = false,
    this.isDisplayIconFirst = false,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final titleWidget = Expanded(
      child: Text(
        title ?? '',
        style: context.textStyles.bodyNormal.black,
      ),
    );

    final tickIcon = Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        if (isSelected)
          Positioned.fill(
            child: Align(
              child: Assets.icons.icCheck.svg(),
            ),
          ),
      ],
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          children: isDisplayIconFirst
              ? [tickIcon, const SizedBox(width: 12), titleWidget]
              : [titleWidget, tickIcon],
        ),
      ),
    );
  }
}

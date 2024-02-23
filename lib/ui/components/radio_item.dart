import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final String? title;
  final bool isSelected;
  final bool isDisplayIconFirst;
  final void Function() onTap;

  RadioItem({
    this.title,
    required this.onTap,
    this.isSelected = false,
    this.isDisplayIconFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            Stack(
              children: [
                Assets.icons.icCheckCircle.svg(),
                if (isSelected)
                  Positioned.fill(
                    child: Align(
                      child: Assets.icons.icCheck.svg(),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class AdditionalMultipleSelectionItem extends StatelessWidget {
  final void Function() onTap;
  final String? title;
  final bool isSelected;

  AdditionalMultipleSelectionItem({
    required this.onTap,
    required this.title,
    this.isSelected = false,
  });

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

  @override
  Widget build(BuildContext context) {
    if (title.isBlank) return const SizedBox.shrink();
    return InkWell(
      onTap: onTap,
      child: AttributeItem(
        padding: const EdgeInsets.symmetric(vertical: 10,),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                style: context.textStyles.bodyNormal.blueDark2,
              ),
            ),
            if (isSelected)
              _buildSelectedIcon()
            else
              Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }
}

import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
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

  Widget nonSelectedIcon() => Assets.icons.icNonSelected.svg();

  Widget selectedIcon() => Assets.icons.icSelected.svg();

  Widget buildSelectedIcon() {
    return isSelected ? selectedIcon() : nonSelectedIcon();
  }

  @override
  Widget build(BuildContext context) {
    if (title.isBlank) return const SizedBox.shrink();
    final backgroundColor = isSelected ? context.colors.blue.withOpacity(0.5) : Colors.transparent;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0,),
        color: backgroundColor,
        child: Row(
          children: [
            buildSelectedIcon(),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title ?? '',
                style: context.textStyles.bodyBold.blueDark2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

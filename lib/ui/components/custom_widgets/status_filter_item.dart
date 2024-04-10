import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class StatusFilterItem extends StatelessWidget {
  const StatusFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.subtitle,
  });

  final void Function() onTap;
  final bool isSelected;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? context.colors.white : context.colors.blueDark2;
    final backgroundColor = isSelected ? context.colors.blue : context.colors.white;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textStyles.bodyBold.copyWith(
                color: textColor,
              ),
            ),
            Text(
              '($subtitle)',
              style: context.textStyles.bodyNormal.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

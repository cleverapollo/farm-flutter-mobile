import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoCircleItem extends StatelessWidget {
  const CmoCircleItem({
    super.key,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.hasBorder = false,
    required this.letters,
    this.size = const Size(70, 70),
    this.onTap,
  });

  factory CmoCircleItem.yesNo({bool isYes = false}) {
    return CmoCircleItem(
      letters: isYes ? 'Yes' : 'No',
      color: isYes ? Colors.blue : Colors.white,
      textColor: isYes ? Colors.white : Colors.black,
    );
  }

  final Color color;
  final Color textColor;
  final bool hasBorder;
  final String letters;
  final Size size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(width: 2),
        ),
        child: Text(letters,
            style: context.textStyles.bodyNormal.copyWith(color: textColor)),
      ),
    );
  }
}

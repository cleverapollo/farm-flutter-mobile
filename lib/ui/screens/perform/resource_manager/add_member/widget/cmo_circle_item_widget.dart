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
  });

  factory CmoCircleItem.yes({bool isActive = false}) {
    return CmoCircleItem(
      letters: 'Yes',
      color: isActive ? Colors.blue : Colors.white,
      textColor: isActive ? Colors.white : Colors.black,
    );
  }
  factory CmoCircleItem.no({bool isActive = false}) {
    return CmoCircleItem(
      letters: 'No',
      color: isActive ? Colors.blue : Colors.white,
      textColor: isActive ? Colors.white : Colors.black,
    );
  }

  final Color color;
  final Color textColor;
  final bool hasBorder;
  final String letters;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

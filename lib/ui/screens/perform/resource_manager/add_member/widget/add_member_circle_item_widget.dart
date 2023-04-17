import 'package:flutter/material.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({
    super.key,
    this.color = Colors.white,
    this.hasBorder = false,
    required this.letters,
    this.size = const Size(70, 70),
  });

  final Color color;
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
      child: Text(letters),
    );
  }
}

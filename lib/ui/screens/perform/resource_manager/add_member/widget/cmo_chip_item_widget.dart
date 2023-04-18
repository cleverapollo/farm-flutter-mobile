import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoChipItemWidget extends StatelessWidget {
  const CmoChipItemWidget(
      {super.key, required this.title, this.isActive = false});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: context.colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

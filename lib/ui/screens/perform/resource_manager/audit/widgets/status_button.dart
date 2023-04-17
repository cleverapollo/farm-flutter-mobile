import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {

  const StatusButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isDisable = true,
  });

  final String title;
  final bool isDisable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDisable ? context.colors.white : context.colors.blue,
          border: Border.all(color: context.colors.grey),
        ),
        child: Text(
          title,
          style: (isDisable ? context.textStyles.bodyBold.black : context.textStyles.bodyBold.white).copyWith(fontSize: 12),
        ),
      ),
    );
  }
}

import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoTappable extends StatelessWidget {
  const CmoTappable({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}

class CmoFilledButton extends StatelessWidget {
  const CmoFilledButton({
    super.key,
    this.onTap,
    required this.title,
  });

  final VoidCallback? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(140, 39),
        backgroundColor: context.colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: context.textStyles.bodyBold.white,
          ),
        ),
      ),
    );
  }
}

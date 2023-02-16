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
      child: child,
      onTap: onTap,
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
    return Ink(
      decoration: BoxDecoration(
        color: context.colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 39,
            minWidth: 140,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:cmo/ui/theme/theme.dart';

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
    this.loading = false,
    this.disable = false,
    required this.title,
    this.titleStyle,
  });

  final VoidCallback? onTap;

  final String title;
  final bool loading;
  final bool disable;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(140, 39),
        backgroundColor: disable ? context.colors.grey : context.colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        disabledBackgroundColor: context.colors.grey,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: loading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colors.white,
                  ),
                )
              : Text(
                  title,
                  style: titleStyle ?? context.textStyles.bodyBold.white,
                ),
        ),
      ),
    );
  }
}

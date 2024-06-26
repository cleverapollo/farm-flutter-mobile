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
    this.canChangeDisableStatus = false,
    required this.title,
    this.titleStyle,
    this.leading,
    this.radius,
    this.size,
  });

  final VoidCallback? onTap;

  final String title;
  final bool loading;
  final bool disable;
  final bool canChangeDisableStatus;
  final TextStyle? titleStyle;
  final Widget? leading;
  final double? radius;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: size ?? const Size(140, 39),
        backgroundColor: disable ? context.colors.grey : context.colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        disabledBackgroundColor: context.colors.grey,
      ),
      onPressed: disable
          ? () {
              if (canChangeDisableStatus) {
                onTap?.call();
              }
            }
          : onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            Flexible(
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
          ],
        ),
      ),
    );
  }
}

class CmoCircelButton extends StatelessWidget {
  const CmoCircelButton({
    super.key,
    required this.title,
    this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.grey),
        shape: BoxShape.circle,
        color: color,
      ),
      width: 45,
      height: 45,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title, style: context.textStyles.bodyNormal),
          ),
        ),
      ),
    );
  }
}

class CmoCircelIconButton extends StatelessWidget {
  const CmoCircelIconButton({
    super.key,
    required this.icon,
    this.color,
  });

  final Widget icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.grey),
        shape: BoxShape.circle,
        color: color,
      ),
      width: 30,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: icon,
          ),
        ),
      ),
    );
  }
}
